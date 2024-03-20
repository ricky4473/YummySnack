import json
from pages.models import *
from products.models import Product
from orders.models import Order
def cookiecart(request):
    if request.user.is_authenticated:
        user = request.user
        billing_address = user.address_set.get(type=1, priority=1)
        shipping_address = user.address_set.get(type=2, priority=1)
        order, created = Order.objects.get_or_create(
            user=request.user, billing_address=billing_address, shipping_address=shipping_address, cartcomplete=False)
        items = order.ordereditem_set.all()
        cartitems = order.get_cart_quantity
    else:
        try:
            cart = json.loads(request.COOKIES['cart'])
        except:
            cart = {}

        items = []
        order = {"get_cart_total": 0, "get_cart_quantity": 0}
        cartitems = 0

        for i in cart:
            try:
                cartitems += cart[i]['quantity']
                product = Product.objects.get(id=i)

                salepricedict = {}
                for obj in product.sale.all():
                    salepricedict[obj.name] = obj.value
                if product.product_class.sale:
                    salepricedict[product.product_class.sale.name] = product.product_class.sale.value
                saleprice = product.price
                for key, value in salepricedict.items():
                    saleprice *= (1-value/100)
                saleprice = round(saleprice, 2)

                total = saleprice * cart[i]['quantity']
                order['get_cart_total'] += total
                order['get_cart_quantity'] += cart[i]['quantity']

                item = {
                    'product': {
                        'id': product.id,
                        'name': product.name,
                        'price': product.price,
                        "saledict": salepricedict,
                        'saleprice': saleprice,
                        'imageURL': product.productimage_set.first().image.url,
                    },
                    'quantity': cart[i]['quantity'],
                    'get_total': total,
                }
                items.append(item)
            except:
                pass
    return {"cartitems": cartitems, "order": order, "items": items}
