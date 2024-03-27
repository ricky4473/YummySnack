import json
import stripe
from django.conf import settings
from django.core.mail import EmailMessage

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password, check_password
from django.contrib.auth import authenticate, login, logout
from django.utils import timezone
from django.http.response import JsonResponse, HttpResponseBadRequest
from django.forms import modelformset_factory
from orders.models import *
from yummyyummy.utils.viewsclass import *


@login_required
def accounts(request):
    tmppass = request.user.password
    if request.method == "POST":
        form = UserEditModelForm(
            request.POST, request.FILES, instance=request.user)

        if form.is_valid():

            forminstance = form.save(commit=False)
            if form.cleaned_data.get('password', '') != '' :
                forminstance.password = make_password(
                    form.cleaned_data.get('newpassword'))
            else:
                forminstance.password = tmppass
            forminstance.save()
            context = {"form": form, "data_dict": {"status": 1, "msg": "更新成功"}}
            return render(request, 'accounts/index.html', context)
        context = {"form": form, "data_dict": {"status": 0, "msg": "驗證失敗"}}
        return render(request, 'accounts/index.html', context)
    form = UserEditModelForm(instance=request.user)
    context = {'form': form}
    return render(request, 'accounts/index.html', context)


@login_required
def accounts_address(request):
    addressshipping = request.user.address_set.filter(type=1)
    addressbilling = request.user.address_set.filter(type=2)

    context = {'addressshipping': addressshipping,
               "addressbilling": addressbilling}
    return render(request, 'accounts/address.html', context)


@login_required
def accounts_address_add(request, typenum):
    # type = type
    if request.method == "POST":
        if Address.objects.filter(user=request.user, type=typenum).exists():
            lastprioritynum = Address.objects.filter(
                user=request.user, type=typenum).order_by('-priority')[0].priority
        else:
            lastprioritynum = 0
        form = AddressModelForm(data=request.POST)
        if form.is_valid():
            form.save()
            form.instance.priority = lastprioritynum+1
            form.instance.user = request.user
            form.instance.type = typenum
            form.instance.save()
            context = {"form": form, "typenum": typenum,
                       "data_dict": {"status": 1, "msg": "增加成功"}}
            return render(request, 'accounts/address_add.html', context)
        context = {"form": form, "typenum": typenum,
                   "data_dict": {"status": 0, "msg": "驗證失敗"}}
        return render(request, 'accounts/address_add.html', context)
    form = AddressModelForm()
    return render(request, 'accounts/address_add.html', {"form": form, "typenum": typenum})


@login_required
def accounts_address_edit(request, nid):
    row_object = Address.objects.get(id=nid)
    if request.method == "POST":
        form = AddressModelForm(instance=row_object, data=request.POST)
        if form.is_valid():
            form.save()
            context = {"form": form, "data_dict": {"status": 1, "msg": "更改成功"}}
            return render(request, 'accounts/address_edit.html', context)

        context = {"form": form, "data_dict": {"status": 0, "msg": "驗證失敗"}}
        return render(request, 'accounts/address_edit.html', context)

    form = AddressModelForm(instance=row_object)
    context = {"form": form}
    return render(request, 'accounts/address_edit.html', context)


@login_required
def accounts_address_delete(request, nid):
    Address.objects.get(id=nid).delete()
    return redirect('address')


def accounts_login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        # validation
        form = UserloginForm(request.POST)
        user = authenticate(request, email=email, password=password)
        if form.is_valid():
            if user:
                login(request, user)
                request.user.last_login = timezone.now()
                request.user.save()
                cart = json.loads(request.COOKIES['cart'])
                user = request.user
                billing_address = user.address_set.get(type=1, priority=1)
                shipping_address = user.address_set.get(type=2, priority=1)
                order, created = Order.objects.get_or_create(
                    user=request.user, billing_address=billing_address, shipping_address=shipping_address, cartcomplete=False)
                for id in cart:
                    ordereditem, created = OrderedItem.objects.get_or_create(
                        order=order, product_id=id)
                    ordereditem.quantity += cart[id]["quantity"]
                    ordereditem.save()

                data_dict = {"status": True, "msg": "登入成功"}
                return JsonResponse(data_dict)
            else:
                data_dict = {"status": False, "msg": "電郵或密碼錯誤"}
                return JsonResponse(data_dict)
        else:
            data_dict = {'status': False, "msg": form.errors}
            return HttpResponseBadRequest(json.dumps(data_dict))
    form = UserloginForm()
    return render(request, 'accounts/login.html', {'form': form})


def accounts_register(request):
    AddressFromSet = modelformset_factory(Address, exclude=[
        "user", "priority", "type"], extra=2, form=BootStrapModelForm, formset=MyFormSet)
    if request.method == "POST":

        form = UserModelForm(data=request.POST)

        formset = AddressFromSet(request.POST, request.FILES)
        if form.is_valid() and formset.is_valid():
            email = request.POST.get('email')
            if User.objects.filter(email=email).exists():
                context = {'form': form, "formset": formset,
                           'data_dict': {'status': 0, 'errors_msg': "電郵已註冊"}}
                return render(request, 'accounts/register.html', context)
            else:

                userdatadict = {}
                for item in UserModelForm().fields.keys():
                    if item == 'password2':
                        pass
                    else:
                        userdatadict[item] = request.POST.get(item)
                    if item == "avatar":
                        userdatadict[item] = request.FILES.get(
                            item, "avatars/defaulticon.jpeg")
                temuser = User.objects.create_user(**userdatadict)

                instances = formset.save(commit=False)
                for count, instance in enumerate(instances):
                    instance.type = count+1
                    instance.priority = 1
                    instance.user = temuser
                    instance.save()

                # data_dict={"status":True,"msg":"註冊成功"}
                # return JsonResponse(data_dict)
                context = {'form': form, "formset": formset,
                           'data_dict': {"status": 1, "msg": "註冊成功"}}
                return render(request, 'accounts/register.html', context)
        # data_dict={'status':False,"msg":form.errors,"formsetmsg":formset.errors,'form':form,"formset":formset}
        # return HttpResponseBadRequest(json.dumps(data_dict))
        context = {'form': form, "formset": formset,
                   'data_dict': {'status': 0, 'msg': '驗證失敗，請重新輸入。'}}
        return render(request, 'accounts/register.html', context)
    form = UserModelForm()
    formset = AddressFromSet(queryset=Address.objects.none())
    context = {'form': form, "formset": formset}
    return render(request, 'accounts/register.html', context)


def accounts_logout(request):
    logout(request)
    data_dict = {'status': True, 'msg': '登出成功'}
    return JsonResponse(data_dict)


def accounts_reset(request):

    if 1:
        email = EmailMessage('halo', 'hahahhahahahahhaa', settings.EMAIL_HOST_USER, [
                             settings.EMAIL_HOST_USER, 'lee670z@gmail.com'])
        email.fail_silently = False
        email.send()

    context = {}
    return render(request, 'accounts/reset.html', context)

@login_required
def accounts_membership(request):
    # stripe part
    if request.method == "POST":
        items = [{

            'price_data': {
                'currency': 'hkd',
                'product_data': {
                    'name': '會員申請',
                }, 'unit_amount': '10000',  # 100.00

            },
            'quantity': '1',
        }]
        stripe.api_key = settings.STRIPE_SECRET_KEY
        session = stripe.checkout.Session.create(
            payment_method_types=['card'],
            line_items=items,
            mode='payment',
            success_url=f'http://{request.get_host()}/payment/success',
            cancel_url=f'http://{request.get_host()}/payment/fail',
        )
        payment_intent = session.payment_intent
        user = request.user
        user.membership = True
        user.save()

        return JsonResponse({'session': session, 'payment_intent': payment_intent})

    context = {"pub_key": settings.STRIPE_PUBLIC_KEY, }
    return render(request, 'accounts/membership.html', context)
