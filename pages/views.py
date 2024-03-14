from django.forms import BaseModelFormSet
from django.contrib.auth.hashers import make_password, check_password
from django.core.mail import EmailMessage
from django.core.exceptions import ValidationError
from operator import attrgetter, itemgetter
import random
from django.http import QueryDict
from django.forms import modelformset_factory
import threading
from yummyyummy.utils.pagination import Pagenation
import json
import stripe
from django.conf import settings
from . import models
from django import forms
from django.shortcuts import render, redirect
from django.core import serializers
from django.core.cache import cache
from django.http import JsonResponse, HttpResponse, HttpResponseBadRequest
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login, logout
from django.core.validators import RegexValidator
from django.utils import timezone
from django.db.models import Q
from django.contrib.auth.decorators import login_required

from yummyyummy.utils.bootstrap import BootStrap, BootStrapForm, BootStrapModelForm
from yummyyummy.utils.cookiecart import cookiecart
from yummyyummy.middleware.online_count import iplist

import math
import datetime
from functools import reduce
today = datetime.date.today()


def productslist(modelqueryset):
    def inner(item):
        salepricedict = {}
        for obj in item.sale.all():
            salepricedict[obj.name] = obj.value
        if item.product_class.sale:
            salepricedict[item.product_class.sale.name] = item.product_class.sale.value
        saleprice = item.price
        for key, value in salepricedict.items():
            saleprice *= (1-value/100)
        saleprice = round(saleprice, 2)
        return {"image": item.productimage_set.first().image.url,
                "title": item.name,
                "price": item.price,
                "desc": item.desc,
                "attrs": item.attributes,
                "cates": item.category.all(),
                "class": item.product_class,
                "sale": salepricedict,
                'saleprice': saleprice,
                "id": item.id,
                "rating": math.ceil(reduce(lambda x, y: x+y.rating, models.OrderItemsComment.objects.filter(order_items__product__id=item.id), 0)/(len(models.OrderItemsComment.objects.filter(order_items__product__id=item.id)) or 1)), 'new': (today-item.available_on) < datetime.timedelta(days=7), "stock": item.stock_set.first().quanity, 'status': item.active
                }
    return map(inner, modelqueryset)


def commentslist(modelqueryset):
    return list(map(lambda item: {
        'name': item.order_items.order.user.first_name,
        "usericon": item.order_items.order.user.avatar.url,
        "day": item.comment_day.strftime('%m/%d/%Y'),
        "rating": item.rating,
        "comment": item.comment,
    }, modelqueryset))


def littleloopdictfn():
    littleloopdict = {}
    for item in models.LittleLoopPicker.objects.all().order_by('-priority'):
        filterdict = dict()
        if item.category:
            filterdict["category__id"] = item.category.id
        if item.product_class:
            filterdict['product_class__id'] = item.product_class.id
        if item.brand:
            filterdict['brand__id'] = item.brand.id
        if item.product.all():
            # manytomany item.product is == models.Product.objects
            filterdict['id__in'] = [item.id for item in item.product.all()]
        if not filterdict and not item.product.all():
            filterdict = {"id": 0}

        littleloopdict[item.title] = productslist(
            models.Product.objects.filter(**filterdict).order_by('sale_rank')), filterdict

    return {"littleloopdict": littleloopdict}


def cookiecartdecorator(func):
    def wrapper(*x, **y):
        changex = list(x)
        # catelist={'Chinese': {'category__id':4},'Philippines': {'category__id':5},'Japanese':{'category__id':1} , 'Southeast Asian':{'category__id':2},'Korean':{'category__id':3}}
        if len(changex) > 2:
            changex[2] = {**x[2], **cookiecart(x[0])}
        else:
            changex.append(cookiecart(x[0]))
        x = tuple(changex)
        value = func(*x, **y)
        return value
    return wrapper


render = cookiecartdecorator(render)


@csrf_exempt
def index(request):

    for item in models.Product.objects.filter(product_class__id=10):
        cookiecartdict = cookiecart(request)
    if request.method == 'POST':
        obj = json.loads(request.body.decode('utf-8'))
        data = models.Product.objects.filter(
            name__icontains=obj.get('keywords')).order_by("sale_rank")[0:10]
        sdata = serializers.serialize('json', data)
        return JsonResponse(sdata, safe=False)

    littleloopdict = {}
    for item in models.LittleLoopPicker.objects.all().order_by('-priority'):
        filterdict = dict()
        if item.category:
            filterdict["category__id"] = item.category.id
        if item.product_class:
            filterdict['product_class__id'] = item.product_class.id
        if item.brand:
            filterdict['brand__id'] = item.brand.id
        if item.product.all():
            # manytomany item.product is == models.Product.objects
            filterdict['id__in'] = [item.id for item in item.product.all()]
        if not filterdict and not item.product.all():
            filterdict = {"id": 0}

        littleloopdict[item.title] = productslist(
            models.Product.objects.filter(**filterdict).order_by('sale_rank')), filterdict

    context = {"littleloopdict": littleloopdict, **cookiecartdict}
    return render(request, 'pages/index.html', context)


def about(request):
    def myyfun():
        randompic = ["product/D-PlusSweetBread-BlueberryFlavor2.82oz_80g__front.webp",
                     "product/D-PlusSweetBread-StrawberryFlavor2.82oz_80g__front.webp",
                     "product/TaiyoBakedWheatCake-StrawberryBaumkuchen2.64oz_75g__front.webp",
                     "product/KubotaJapaneseRiceCake-PeachFlavor7.05oz_200g__front.webp",
                     ]
        randomname = ["D-Plus Sweet Bread - Blueberry Flavor 2.82oz (80g)",
                      'D-Plus Sweet Bread - Strawberry Flavor 2.82oz (80g)',
                      'Taiyo Baked Wheat Cake - Strawberry Baumkuchen 2.64oz (75g)',
                      'Kubota Japanese Rice Cake - Peach Flavor 7.05oz (200g)',]
        for item in models.Product.objects.filter():
            if item.productimage_set.first().image in ["product/螢幕擷取畫面_2023-11-14_205250_u6JJqJ4.png", "product/NongshimShinRamyunRamen4.2oz_front.webp", "product/LuciaYoungCoconutStrippedInSyrup20oz_front.webp", "product/YBCLevainChocoSandwichCrackers4.57oz_129.6g__front.webp"]:
                tmp = item.productimage_set.first()
                tmpnum = random.randrange(0, 4)
                tmp.image = randompic[tmpnum]
                tmp.save()
                item.name = randomname[tmpnum]
                item.save()
    # myyfun()
    return render(request, 'pages/about.html')


def totalsoldlist(filterdict={}):

    totallist = list()
    for product in models.Product.objects.filter(**filterdict):
        totalqty = 0
        for item in models.Order.objects.filter(cartcomplete=True, status=3):
            for inneritem in item.ordereditem_set.all():
                if product.id == inneritem.product.id:
                    totalqty += inneritem.quantity
        totallist.append((product.id, totalqty))
    res = []
    for index, item in enumerate(sorted(totallist, key=itemgetter(1, 0), reverse=True)):
        tmp = models.Product.objects.get(id=item[0])
        tmp.sale_rank = index
        tmp.save()

    return


threading.Timer(24*60*60, totalsoldlist)


@csrf_exempt
def products(request):

    productorderdict = {"best-selling": ("sale_rank", "Best selling"), "title-ascending": ("name", "Alphabetically, A-Z"), "title-descending": ("-name", " Alphabetically, Z-A"), "price-ascending": (
        "price", "Price, low to high"), "price-descending": ("-price", "Price, high to low"), "created-ascending": ("id", "Date, old to new"), "created-descending": ("-id", " Date, new to old")}
    if request.method == "POST":
        cid = request.POST.get('cid', 0)
        bid = request.POST.getlist('bid')  # list
        pricerange = request.POST.get('pricerange', 0)
        productorder = productorderdict[request.POST.get(
            "productorder", "best-selling")][0]
        productclass = models.ProductClass.objects.all().order_by('name')
        show = int(request.POST.get('show', 20))
        previousbrand = []
        for item in bid:
            previousbrand.append(int(item))
        previouscate = int(cid)
        productfilterdict = {}
        if previousbrand:
            productfilterdict['brand__id__in'] = previousbrand
        if previouscate:
            productfilterdict['product_class__id'] = previouscate
        pricerange = int(pricerange)

        while pricerange == 0:
            pricerangetag = "Any"
            break
        while pricerange == 1:
            pricerangetag = "$0 - $10"
            productfilterdict['price__gte'] = 0
            productfilterdict['price__lte'] = 10
            break
        while pricerange == 2:
            pricerangetag = "$10 - $20"
            productfilterdict['price__gte'] = 10
            productfilterdict['price__lte'] = 20
            break
        while pricerange == 3:
            pricerangetag = "$20 - $30"
            productfilterdict['price__gte'] = 20
            productfilterdict['price__lte'] = 30
            break
        while pricerange == 4:
            pricerangetag = "$30 - $40"
            productfilterdict['price__gte'] = 30
            productfilterdict['price__lte'] = 40
            break
        while pricerange == 5:
            pricerangetag = "$40 - $50"
            productfilterdict['price__gte'] = 40
            productfilterdict['price__lte'] = 50
            break
        while pricerange == 6:
            pricerangetag = "$50 - $100"
            productfilterdict['price__gte'] = 50
            productfilterdict['price__lte'] = 100
            break
        while pricerange == 7:
            pricerangetag = "$100 or more"
            productfilterdict['price__gte'] = 100
            break
        if request.POST.get('filterdict'):
            productfilterdict = {}
            productfilterdict = eval(request.POST.get('filterdict'))
        if request.POST.get('filterdictfortype'):
            productfilterdict = {}
            productfilterdict = {
                "name__icontains": request.POST.get('filterdictfortype')}
        page = request.POST.get('page', 1)
        pagecode = Pagenation(request, models.Product.objects.filter(
            **productfilterdict).order_by(productorder), page_size=show)
        # print(pagecode.html())

        # .filter(brand__id__in=[1,2]    .filter(brand__id__in=previousbrand)    .filter(brand__id=bid)
        filteredpl = productslist(pagecode.page_queryset)
        bl = models.Brand.objects.all()
        context = {"products": filteredpl, 'class': productclass, 'brands': bl, 'previousbrand': previousbrand, 'previouscate': previouscate,
                   'pricerange': pricerange, 'pricerangetag': pricerangetag, "productorder": productorder, "productorderdict": productorderdict, "pagecode": pagecode.html(), "page": page,
                   "show": show}
        return render(request, 'products/index.html', context)
        # 'queryset': pagecode.page_queryset,
        #         'pagecode':pagecode.html()

    pagecode = Pagenation(
        request, models.Product.objects.all().order_by('sale_rank'), page_size=20)
    productclass = models.ProductClass.objects.all().order_by('name')
    pl = productslist(pagecode.page_queryset)
    bl = models.Brand.objects.all()

    context = {"products": pl, 'class': productclass, 'brands': bl,
               "productorderdict": productorderdict, 'pagecode': pagecode.html()}
    return render(request, 'products/index.html', context)


def products_product(request, nid):
    littleloopdict = littleloopdictfn()
    products = productslist(models.Product.objects.filter(id=nid))
    productslength = len(
        list(productslist(models.Product.objects.filter(id=nid))))
    comments = commentslist(
        models.OrderItemsComment.objects.filter(order_items__product__id=nid).order_by('comment_day'))
    context = {'products': products, 'comments': comments,
               "productslength": productslength, **littleloopdict}
    return render(request, 'products/product.html', context)


@login_required
def accounts(request):
    tmppass = request.user.password
    if request.method == "POST":
        form = UserEditModelForm(
            request.POST, request.FILES, instance=request.user)

        if form.is_valid():

            forminstance = form.save(commit=False)
            if form.cleaned_data.get('password', 0):
                forminstance.password = make_password(
                    form.cleaned_data.get('newpassword', 0))
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
        if models.Address.objects.filter(user=request.user, type=typenum).exists():
            lastprioritynum = models.Address.objects.filter(
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
    row_object = models.Address.objects.get(id=nid)
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
    models.Address.objects.get(id=nid).delete()
    return redirect('address')


# orderstatus_choices=(1,"處理中"),(2,"已發貨"),(0,"已完成")

@login_required
def accounts_orders(request):
    proces_orders = request.user.order_set.filter(
        status__in=[1, 2], cartcomplete=True)
    old_orders = request.user.order_set.filter(status=3)
    context = {'proces_orders': proces_orders, 'old_orders': old_orders}
    return render(request, 'accounts/orders.html', context)


@login_required
def accounts_order(request, nid):
    order = models.Order.objects.filter(id=nid).first()
    context = {'accounts_order': order}
    return render(request, 'accounts/order.html', context)


@login_required
def accounts_orderitemcomments(request, nid):
    # nid = ordereditem id

    queryset = models.OrderItemsComment.objects.filter(order_items=nid)
    context = {'queryset': queryset, "nid": nid}
    return render(request, 'accounts/accounts_orderitemcomments.html', context)


@login_required
def accounts_orderitemcommentadd(request, nid):
    # nid = ordereditem id
    if request.method == "POST":
        form = Orderitemcommenteditform(data=request.POST)
        if form.is_valid():
            # row_object=models.OrderItemsComment(order_items_id=nid,comment_day=timezone.now(),rating=request.POST.get("rating"),comment=request.POST.get('comment'))
            # row_object.save()
            form.save()
            form.instance.order_items_id = nid
            form.instance.comment_day = timezone.now()
            form.instance.save()
            context = {"form": form, "nid": nid,
                       "data_dict": {"status": 1, "msg": "新增評論成功"}}
            return render(request, 'accounts/accounts_orderitemcommentadd.html', context)

        context = {"form": form, "nid": nid,
                   "data_dict": {"status": 0, "msg": "驗證失敗"}}
        return render(request, 'accounts/accounts_orderitemcommentadd.html', context)
    form = Orderitemcommenteditform()
    return render(request, 'accounts/accounts_orderitemcommentadd.html', {"form": form})


class Orderitemcommenteditform(BootStrapModelForm):
    class Meta:
        model = models.OrderItemsComment
        fields = ["comment", 'rating']


@login_required
def accounts_orderitemcommentedit(request, nid):

    # nid = .OrderItemsComment id
    row_object = models.OrderItemsComment.objects.get(id=nid)
    order_items_id = row_object.order_items.id
    if request.method == "POST":
        form = Orderitemcommenteditform(instance=row_object, data=request.POST)
        if form.is_valid():
            form.save()
            # return redirect('accounts_orderitemcomments',order_items_id)
            context = {"form": form, "nid": order_items_id,
                       "data_dict": {"status": 1, "msg": "更改成功"}}
            return render(request, 'accounts/accounts_orderitemcommentedit.html', context)

        context = {"form": form, "nid": order_items_id,
                   "data_dict": {"status": 0, "msg": "驗證失敗"}}
        return render(request, 'accounts/accounts_orderitemcommentedit.html', context)

    form = Orderitemcommenteditform(instance=row_object)
    return render(request, 'accounts/accounts_orderitemcommentedit.html', {"form": form})


@login_required
def accounts_orderitemcommentdelete(request, nid):
    # nid = .OrderItemsComment id
    order_items_id = models.OrderItemsComment.objects.get(
        id=nid).order_items.id
    models.OrderItemsComment.objects.get(id=nid).delete()
    return redirect('accounts_orderitemcomments', order_items_id)


class UserloginForm(BootStrapForm):
    email = forms.EmailField(widget=forms.EmailInput, required=True)
    password = forms.CharField(widget=forms.PasswordInput, required=True)


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
                order, created = models.Order.objects.get_or_create(
                    user=request.user, billing_address=billing_address, shipping_address=shipping_address, cartcomplete=False)
                for id in cart:
                    ordereditem, created = models.OrderedItem.objects.get_or_create(
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


class UserModelForm(BootStrapModelForm):
    password = forms.CharField(widget=forms.PasswordInput(), validators=[RegexValidator(
        '^.*(?=.{6,10})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$', 'plz input 6-20 characters, at least one lowercase ,uppercase,digits for 0-9')])
    password2 = forms.CharField(
        label='Confirm Password', widget=forms.PasswordInput())

    class Meta:
        model = models.User
        fields = ['avatar', 'first_name', 'last_name', "gender", "age", "email", 'phone', 'password', "password2"
                  ]

    def clean_password2(self):
        password2 = self.cleaned_data['password2']
        password = self.cleaned_data.get('password', False)
        if password and (password != password2):
            raise ValidationError('密碼不一致')
        return password2


class UserEditModelForm(BootStrapModelForm):
    password = forms.CharField(
        label='Please Type Old Password', widget=forms.PasswordInput(), required=False)
    newpassword = forms.CharField(label='New Password', widget=forms.PasswordInput(), validators=[RegexValidator(
        '^.*(?=.{6,10})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$', 'plz input 6-20 characters, at least one lowercase ,uppercase,digits for 0-9')], required=False)
    newpasswordconfirm = forms.CharField(
        label='Confirm New Password', widget=forms.PasswordInput(), required=False)

    class Meta:
        model = models.User
        fields = ['avatar', 'first_name', 'last_name', "gender", "age", "email", 'phone', 'password', "newpassword", "newpasswordconfirm"
                  ]

    def clean_password(self):
        password = self.cleaned_data.get('password', False)
        if password and not check_password(password, self.instance.password):
            raise ValidationError('請輸入正確舊密碼')
        return password

    def clean_newpasswordconfirm(self):
        newpasswordconfirm = self.cleaned_data['newpasswordconfirm']
        newpassword = self.cleaned_data.get('newpassword', False)
        if newpassword and (newpassword != newpasswordconfirm):
            raise ValidationError('密碼不一致')
        return newpasswordconfirm


class AddressModelForm(BootStrapModelForm):
    class Meta:
        model = models.Address
        exclude = ["user", 'priority', 'type']


class AddressOriginalForm(BootStrapModelForm):
    class Meta:
        model = models.Address
        exclude = ["user", 'priority', 'type']


class AddressShippingForm(BootStrapModelForm):
    class Meta:
        model = models.Address
        # 'first_name','last_name','phone'
        exclude = ["user", 'priority', 'type',]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for item in list(self.fields.keys()):
            self.fields["shipping_"+item] = self.fields.pop(item)


class AddressBillingForm(BootStrapModelForm):
    class Meta:
        model = models.Address
        # 'first_name','last_name','phone'
        exclude = ["user", 'priority', 'type',]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for item in list(self.fields.keys()):
            self.fields["billing_"+item] = self.fields.pop(item)


class MyFormSet(BaseModelFormSet):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for form in self.forms:
            form.empty_permitted = False


AddressFromSet = modelformset_factory(models.Address, exclude=[
                                      "user", "priority", "type"], extra=2, form=BootStrapModelForm, formset=MyFormSet)


def accounts_register(request):
    if request.method == "POST":

        form = UserModelForm(data=request.POST)
        formset = AddressFromSet(request.POST, request.FILES)
        if form.is_valid() and formset.is_valid():
            email = request.POST.get('email')
            if models.User.objects.filter(email=email).exists():
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
                temuser = models.User.objects.create_user(**userdatadict)

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
    formset = AddressFromSet(queryset=models.Address.objects.none())
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


# membership
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
            success_url='http://167.172.68.96/payment/success',
            cancel_url='http://167.172.68.96/payment/fail',
        )
        payment_intent = session.payment_intent
        user = request.user
        user.membership = True
        user.save()

        return JsonResponse({'session': session, 'payment_intent': payment_intent})

    context = {"pub_key": settings.STRIPE_PUBLIC_KEY, }
    return render(request, 'accounts/membership.html', context)


def payment_success(request):
    return render(request, 'payment/payment_success.html')


def payment_fail(request,):
    return render(request, 'payment/payment_fail.html')


# from datetime import datetime,timedelta


@login_required
def management(request):
    labeldatadict = {"label": [], "data": [], 'newuserorder': [],
                     "olduserorder": [], 'weeklytotalorder': 0}
    newvistordict = {"label": [], "oldvistor": [], "newvistor": []}
    monthsaledict = {'label': [], 'data': []}
    weeklytotalorder = 0
    for n in reversed(range(7)):
        # timediff=(timezone.now()-n*timezone.timedelta(days=1))
        timediff = (datetime.datetime.today()-n*datetime.timedelta(days=1))
        labeldatadict['label'].append(timediff.strftime("%d/%m"))
        todaytotal = 0
        newuserorder = 0
        olduserorder = 0
        for obj in models.Order.objects.filter(paid_time__date=timediff, cartcomplete=True,):
            todaytotal += float(obj.total or 0)
            todaytotal = round(todaytotal, 2)
            # print(obj.user.email)
            # print(obj.id)
            # print(obj.user.date_joined.date())
            # print(timediff.date())
            # print((timediff.date()==timezone.localdate(obj.user.date_joined)))
            if (timediff.date() == timezone.localdate(obj.user.date_joined)):
                # if (timediff.date()==obj.user.date_joined.date()):
                newuserorder += 1
            else:
                olduserorder += 1

        weeklytotalorder += newuserorder+olduserorder
        labeldatadict['data'].append(todaytotal)
        labeldatadict['newuserorder'].append(newuserorder)
        labeldatadict['olduserorder'].append(olduserorder)
    labeldatadict['weeklytotalorder'] = weeklytotalorder

    for n in reversed(range(7)):
        # timediff=(timezone.now()-n*timezone.timedelta(days=1))
        timediff = (datetime.date.today()-n*datetime.timedelta(days=1))
        newvistordict['label'].append(timediff.strftime("%d/%m"))
        newvistor, oldvistor = 0, 0
        for obj in models.DayNumber.objects.filter(day=timediff):
            newvistor += obj.newvistor
            oldvistor += obj.oldvistor
        newvistordict['oldvistor'].append(oldvistor)
        newvistordict['newvistor'].append(newvistor)

    # total sale
    totalyearsale = 0
    for obj in models.Order.objects.filter(paid_time__year=2023, cartcomplete=True):
        totalyearsale += float(obj.total or 0)
    totalyearsale = round(totalyearsale, 2)
    orderoverviewdict = {"label": ["處理中", "已發貨", "已完成"], "data": [0, 0, 0]}
    for obj in models.Order.objects.filter(cartcomplete=True):
        if obj.status == 1:
            orderoverviewdict['data'][0] += 1
        if obj.status == 2:
            orderoverviewdict['data'][1] += 1
        if obj.status == 3:
            orderoverviewdict['data'][2] += 1

    for n in range(12):
        n += 1
        month = n
        monthsaledict['label'].append(n)
        monthsale = 0
        for obj in models.Order.objects.filter(Q(paid_time__year=2023) & Q(paid_time__month=n)):
            monthsale += float(obj.total or 0)
        monthsale = round(monthsale, 2)
        monthsaledict['data'].append(monthsale)

    orders = models.Order.objects.filter(
        cartcomplete=True).order_by('status', '-paid_time')
    users = models.User.objects.all().order_by('-date_joined')
    context = {"labeldatadict": labeldatadict, "orderoverviewdict": orderoverviewdict,
               "totalorder": sum(orderoverviewdict.get('data')),
               "orders": orders, "users": users, "newvistordict": newvistordict,
               "totalyearsale": totalyearsale, "monthsaledict": monthsaledict}
    return render(request, 'management/index.html', context)


@login_required
@csrf_exempt
def management_livevisitor(request):
    if request.method == "POST":
        livenumber = len(iplist())
        return JsonResponse({"livenumber": livenumber})


@login_required
def delete_order(request, nid):
    models.Order.objects.get(id=nid).delete()
    return redirect('management')


@login_required
def cart(request):
    if request.method == "POST":
        vouchercode = request.POST.get('vouchercode', '')
        voucherfilter = models.Voucher.objects.filter(
            code=vouchercode, end_date__gte=datetime.datetime.now().date())
        if voucherfilter.exists():
            vouchercode = voucherfilter.first()
            if vouchercode.usage_limit > vouchercode.used:
                ordercart = request.user.order_set.filter(
                    cartcomplete=False).first()
                ordercart.voucher_id = vouchercode.id
                ordercart.save()
                vouchercode.used += 1
                vouchercode.save()
                return JsonResponse({"status": 1, 'msg': "成功換領優惠"})
            else:
                return JsonResponse({"status": 0, 'msg': "優惠代碼限額已用完"})
        else:
            return JsonResponse({"status": 0, 'msg': "優惠代碼無效"})

            vouchercode = models.Voucher.objects.filter(
                code=vouchercode).first()
        return JsonResponse({})
    context = {'ismember': request.user.membership, }
    return render(request, 'cart/cart.html', context)


def updateitem(request):
    data = json.loads(request.body)
    productid = data["productid"]
    action = data["action"]
    qty = data["qty"]
    user = request.user
    product = models.Product.objects.get(id=productid)
    order = models.Order.objects.get(
        user=user, cartcomplete=False)  # !back latter cookie cart
    orderitem, created = models.OrderedItem.objects.get_or_create(
        order=order, product=product)
    if action == "add":
        orderitem.quantity = (orderitem.quantity+1)
    elif action == "remove":
        orderitem.quantity = (orderitem.quantity-1)
    elif action == "addmany":
        orderitem.quantity = orderitem.quantity+qty
    orderitem.save()

    if action == "delete":
        orderitem.delete()

    if orderitem.quantity <= 0:
        orderitem.delete()
    return JsonResponse("Json", safe=False)


def addressdict(queryset):
    def inner(item):
        return {"id": item.id,
                "type": item.get_type_display(),
                'priority': item.priority,
                "title": f"No.{item.priority},姓名:{item.first_name} {item.last_name} ,聯絡電話:{item.phone},地址:{item.street_address_1} {item.street_address_2}",
                }
    return list(map(inner, queryset))


@login_required
def checkout(request):

    if request.user.is_authenticated:
        row_object = models.User.objects.get(
            id=request.user.id).address_set.get(type=1, priority=1)
        form = AddressModelForm(instance=row_object)
        shippingdict = addressdict(models.Address.objects.filter(
            type=1, user=request.user).order_by('priority'))
        billingdict = addressdict(models.Address.objects.filter(
            type=2, user=request.user).order_by('priority'))

    else:
        form = AddressModelForm()

    context = {"form": form, "shippingdict": shippingdict,
               "billingdict": billingdict,
               "row_object": addressdict([row_object])[0],
               "pub_key": settings.STRIPE_PUBLIC_KEY,
               'ismember': request.user.membership,

               }
    return render(request, "cart/checkout.html", context)


@login_required
@csrf_exempt
def checkout_address_edit(request, nid):
    row_obj = models.Address.objects.get(id=nid)
    row_obj_dict = addressdict([row_obj])[0]
    if request.method == "POST":
        row_obj = models.Address.objects.get(id=nid)
        form = AddressModelForm(instance=row_obj, data=request.POST)
        if form.is_valid():
            form.save()
            # return redirect("checkout")
        return JsonResponse({"form": form.as_p(), "row_obj_dict": row_obj_dict})

    form = AddressModelForm(instance=row_obj)
    return JsonResponse({"form": form.as_p(), "row_obj_dict": row_obj_dict})

    # htmlStr="<p>"+row_obj_dict[0]["type"]+row_obj_dict[0]["title"]+"</p>"+form.as_p()+'<input type="submit" id="form-button" style="background-color: #2e9900;" class="text-white btn btn-block" value="Continue">'
    # return HttpResponse(htmlStr)


@login_required
def processorder(request):
    # data = json.loads(request.body)
    # print(request.body)
    transaction_id = datetime.datetime.now().timestamp()
    if request.user.is_authenticated:
        user = request.user
        order = models.Order.objects.get(user=user, cartcomplete=False)
        shipping_address_id = request.POST.get('shipping')
        billing_address_id = request.POST.get('billing')
        order.billing_address.id = billing_address_id
        order.shipping_address.id = shipping_address_id
    else:
        return JsonResponse({"status": False, "msg": 'please login or register account'})
        

    if request.method == "POST":
        # stripe part
        checkoutcookie = cookiecart(request)
        finalitems = []
        for obj in checkoutcookie.get('items', []):
            item = {

                'price_data': {
                    'currency': 'hkd',
                    'product_data': {
                        'name': '',
                    }, 'unit_amount': '',  # 32.00

                },
                'quantity': '',
            }
            item['price_data']['product_data']['name'] = obj.product.name
            item['price_data']['unit_amount'] = round(obj.get_one_price()*100)
            item["quantity"] = str(obj.quantity)

            finalitems.append(item)
        percent_off = {}
        if request.user.membership:
            percent_off['percent_off'] = 10
        if order.voucher:
            discount_value = order.voucher.discount_value
            percent_off['percent_off'] = (
                100-percent_off.get('percent_off', 0))*(100-discount_value)
            percent_off['percent_off'] = round(
                100-percent_off['percent_off']/100)

        tmpdict = {"payment_method_types": ['card'],
                   "line_items": finalitems,
                   "mode": 'payment',
                   "success_url": 'http://167.172.68.96/payment/success',
                   "cancel_url": 'http://167.172.68.96/payment/fail', }

        stripe.api_key = settings.STRIPE_SECRET_KEY
        if percent_off.get('percent_off'):
            coupon = stripe.Coupon.create(**percent_off)
            tmpdict["discounts"] = [{"coupon": coupon.get('id')}]
        session = stripe.checkout.Session.create(**tmpdict)
        payment_intent = session.payment_intent

        total = float(request.POST.get('total'))
        order.transaction_id = transaction_id
        order.total = order.get_cart_total
        order.paid_time = timezone.now()
        vtotal = float(order.get_cart_total)
        order.cartcomplete = True
        order.save()
        models.Notification.objects.create(order_id=order.id)

        return JsonResponse({'session': session, 'payment_intent': payment_intent})

    total = float(request.POST.get('total'))
    order.transaction_id = transaction_id
    order.total = order.get_cart_total
    order.paid_time = timezone.now()
    vtotal = float(order.get_cart_total)
    if total == vtotal:
        order.cartcomplete = True
    order.save()
    return JsonResponse({"status": True, "msg": '提交成功'})


#####################################################################
def orderprocess(request):
    return render(request, "pages/orderprocess.html")


def shipping(request):
    return render(request, "pages/shipping.html")


def refund(request):
    return render(request, "pages/refund.html")


def post_fee(request):
    return render(request, "pages/post_fee.html")


class feedbackmodelform(BootStrapModelForm):
    class Meta:
        model = models.Feedback
        fields = '__all__'
        widgets = {"feedback": forms.Textarea(attrs={"rows": 3})}


def feedback(request):
    if request.method == "POST":
        form = feedbackmodelform(data=request.POST)
        if form.is_valid():
            form.save()
            return redirect('/')
        return render(request, "pages/feedback.html", {"form": form})

    form = feedbackmodelform()
    return render(request, "pages/feedback.html", {"form": form})


def accessibility(request):
    return render(request, "pages/accessibility.html")


def service(request):
    return render(request, "pages/service.html")
