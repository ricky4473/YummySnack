import math
from functools import reduce
import datetime
from .cookiecart import cookiecart
from operator import attrgetter, itemgetter
from products.models import Product,PromotionList,Category,ProductClass
from orders.models import Order,OrderItemsComment
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
        today = datetime.date.today()
        return {"image": item.productimage_set.first().image.url,
                "title": item.name,
                "price": item.price,
                "desc": item.desc,
                "brand":item.brand.name,
                "cates": item.category.all(),
                "class": item.product_class,
                "sale": salepricedict,
                'saleprice': saleprice,
                "id": item.id,
                "rating": math.ceil(reduce(lambda x, y: x+y.rating,
                                            OrderItemsComment.objects.filter(order_items__product__id=item.id), 0)/(len(OrderItemsComment.objects.filter(order_items__product__id=item.id)) or 1)), 
                                            'new': (today-item.available_on) < datetime.timedelta(days=7), 
                                            "stock": item.stock_set.first().quanity, 
                                            'status': item.active
                }
    return list(map(inner, modelqueryset))


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

    return {"littleloopdict": littleloopdict}


def cookiecartdecorator(func):
    topca=Category.objects.filter().order_by('id')
    topcl=ProductClass.objects.filter().order_by('id')
    obj={"topca":topca,"topcl":topcl}

    def wrapper(*x, **y):
        changex = list(x)
        if len(changex) > 2:
            changex[2] = {**x[2], **cookiecart(x[0]),**obj}
        else:
            changex.append({**cookiecart(x[0]),**obj})
        x = tuple(changex)
        value = func(*x, **y)
        return value
    return wrapper


def totalsoldlist(filterdict={}):

    totallist = list()
    for product in Product.objects.filter(**filterdict):
        totalqty = 0
        for item in Order.objects.filter(cartcomplete=True, status=3):
            for inneritem in item.ordereditem_set.all():
                if product.id == inneritem.product.id:
                    totalqty += inneritem.quantity
        totallist.append((product.id, totalqty))
    res = []
    for index, item in enumerate(sorted(totallist, key=itemgetter(1, 0), reverse=True)):
        tmp = Product.objects.get(id=item[0])
        tmp.sale_rank = index
        tmp.save()

    return
