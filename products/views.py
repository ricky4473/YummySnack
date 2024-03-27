from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from pages import models
from yummyyummy.utils.viewstools import *
from yummyyummy.utils.pagination import Pagenation
from .models import ProductClass, Brand, Product
from orders.models import Order, OrderItemsComment

# Create your views here.


@csrf_exempt
def products(request):
    littleloopdict = littleloopdictfn()

    productorderdict = {"best-selling": ("sale_rank", "Best selling"), "title-ascending": ("name", "Alphabetically, A-Z"), "title-descending": ("-name", " Alphabetically, Z-A"), "price-ascending": (
        "price", "Price, low to high"), "price-descending": ("-price", "Price, high to low"), "created-ascending": ("id", "Date, old to new"), "created-descending": ("-id", " Date, new to old")}
    if request.method == "POST":
        cid = request.POST.get('cid', 0)
        bid = request.POST.getlist('bid')  # list
        pricerange = request.POST.get('pricerange', 0)
        productorder = productorderdict[request.POST.get(
            "productorder", "best-selling")][0]
        productclass = ProductClass.objects.all().order_by('name')
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
        pagecode = Pagenation(request, Product.objects.filter(
            **productfilterdict).order_by(productorder), page_size=show)
        

        #{"brand__id__in":[1,2],"product_class__id":"id_cate_3"}
        
        #.filter(**{"brand__id__in":[1,2],"product_class__id":"id_cate_3"})

        # .filter(brand__id__in    .filter(brand__id__in=previousbrand)    .filter(brand__id=bid)
        filteredpl = productslist(pagecode.page_queryset)
        bl = Brand.objects.all()
        context = {"products": filteredpl, 'productslength': len(filteredpl), 'class': productclass, 'brands': bl, 'previousbrand': previousbrand, 'previouscate': previouscate,
                   'pricerange': pricerange, 'pricerangetag': pricerangetag, "productorder": productorder, "productorderdict": productorderdict, "pagecode": pagecode.html(), "page": page,
                   "show": show,**littleloopdict}
        return render(request, 'products/index.html', context)

    pagecode = Pagenation(
        request, Product.objects.all().order_by('sale_rank'), page_size=20)
    productclass = ProductClass.objects.all().order_by('name')
    pl = productslist(pagecode.page_queryset)
    bl = Brand.objects.all()
    context = {"products": pl, 'productslength': len(pl), 'class': productclass, 'brands': bl,
               "productorderdict": productorderdict, 'pagecode': pagecode.html(),**littleloopdict}
    return render(request, 'products/index.html', context)


def products_product(request, nid):
    littleloopdict = littleloopdictfn()
    products = productslist(Product.objects.filter(id=nid))
    productslength = len(
        list(productslist(Product.objects.filter(id=nid))))
    comments = commentslist(
        OrderItemsComment.objects.filter(order_items__product__id=nid).order_by('comment_day'))
    context = {'products': products, 'comments': comments,
               "productslength": productslength, **littleloopdict}
    return render(request, 'products/product.html', context)
