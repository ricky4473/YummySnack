import random
import threading
import json
import stripe
import datetime


from django.contrib.auth.decorators import login_required
from django.core import serializers
from django.conf import settings
from django.shortcuts import render, redirect
from django.http import JsonResponse, HttpResponse, HttpResponseBadRequest
from django.views.decorators.csrf import csrf_exempt
from django.utils import timezone
from django.db.models import Q

from . import models
from yummyyummy.utils.cookiecart import cookiecart
from yummyyummy.middleware.online_count import iplist
from yummyyummy.utils.viewstools import *
from yummyyummy.utils.viewsclass import *

from products.models import Product, PromotionList
from orders.models import Order, OrderedItem, Voucher
from accounts.models import User, Address
# Global Variable
render = cookiecartdecorator(render)


# threading.Timer(24*60*60, totalsoldlist)
# totalsoldlist()
# Main View


@csrf_exempt
def index(request):

    if request.method == 'POST':
        obj = json.loads(request.body.decode('utf-8'))
        data = Product.objects.filter(
            name__icontains=obj.get('keywords')).order_by("sale_rank")[0:10]
        sdata = serializers.serialize('json', data)
        return JsonResponse(sdata, safe=False)

    littleloopdict = {}
    for item in PromotionList.objects.all().order_by('-priority'):
        filterdict = dict()
        if item.category:
            filterdict["category__id"] = item.category.id
        if item.product_class:
            filterdict['product_class__id'] = item.product_class.id
        if item.brand:
            filterdict['brand__id'] = item.brand.id
        if item.product.all():
            # manytomany item.product is == Product.objects
            filterdict['id__in'] = [item.id for item in item.product.all()]
        if not filterdict and not item.product.all():
            filterdict = {"id": 0}

        littleloopdict[item.title] = productslist(
            Product.objects.filter(**filterdict).order_by('sale_rank')), filterdict
    # print(models.Banner.objects.filter(is_show=True))
    context = {"littleloopdict": littleloopdict,'bannerlist':models.Banner.objects.filter(is_show=True)}
    return render(request, 'pages/index.html', context)


def about(request):
    totalsoldlist()

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
        for item in Product.objects.filter():
            if item.productimage_set.first().image in ["product/螢幕擷取畫面_2023-11-14_205250_u6JJqJ4.png", "product/NongshimShinRamyunRamen4.2oz_front.webp", "product/LuciaYoungCoconutStrippedInSyrup20oz_front.webp", "product/YBCLevainChocoSandwichCrackers4.57oz_129.6g__front.webp"]:
                tmp = item.productimage_set.first()
                tmpnum = random.randrange(0, 4)
                tmp.image = randompic[tmpnum]
                tmp.save()
                item.name = randomname[tmpnum]
                item.save()
    # myyfun()
    return render(request, 'pages/about.html')


def payment_success(request):
    return render(request, 'payment/payment_success.html')


def payment_fail(request,):
    return render(request, 'payment/payment_fail.html')


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
        for obj in Order.objects.filter(paid_time__date=timediff, cartcomplete=True,):
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
    for obj in Order.objects.filter(paid_time__year=2024, cartcomplete=True):
        totalyearsale += float(obj.total or 0)
    totalyearsale = round(totalyearsale, 2)
    orderoverviewdict = {"label": ["處理中", "已發貨", "已完成"], "data": [0, 0, 0]}
    for obj in Order.objects.filter(cartcomplete=True):
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
        for obj in Order.objects.filter(Q(paid_time__year=2024) & Q(paid_time__month=n)):
            monthsale += float(obj.total or 0)
        monthsale = round(monthsale, 2)
        monthsaledict['data'].append(monthsale)

    orders = Order.objects.filter(
        cartcomplete=True).order_by('status', '-paid_time')
    users = User.objects.all().order_by('-date_joined')
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
    Order.objects.get(id=nid).delete()
    return redirect('management')


@login_required
def cart(request):
    if request.method == "POST":
        vouchercode = request.POST.get('vouchercode', '')
        voucherfilter = Voucher.objects.filter(
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

    context = {'ismember': request.user.membership, }
    return render(request, 'cart/cart.html', context)


def updateitem(request):
    data = json.loads(request.body)
    productid = data["productid"]
    action = data["action"]
    qty = data["qty"]
    user = request.user
    product = Product.objects.get(id=productid)
    order = Order.objects.get(
        user=user, cartcomplete=False)  # !back latter cookie cart
    orderitem, created = OrderedItem.objects.get_or_create(
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
        row_object = User.objects.get(
            id=request.user.id).address_set.get(type=1, priority=1)
        form = AddressModelForm(instance=row_object)
        shippingdict = addressdict(Address.objects.filter(
            type=1, user=request.user).order_by('priority'))
        billingdict = addressdict(Address.objects.filter(
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
    row_obj = Address.objects.get(id=nid)
    row_obj_dict = addressdict([row_obj])[0]
    if request.method == "POST":
        row_obj = Address.objects.get(id=nid)
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
        order = Order.objects.get(user=user, cartcomplete=False)
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
                    "success_url":f'http://{request.get_host()}/payment/success',
            "cancel_url":f'http://{request.get_host()}/payment/fail',
        
                   }

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


def orderprocess(request):
    return render(request, "pages/orderprocess.html")


def shipping(request):
    return render(request, "pages/shipping.html")


def refund(request):
    return render(request, "pages/refund.html")


def post_fee(request):
    return render(request, "pages/post_fee.html")


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
