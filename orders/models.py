from django.db import models
from django.utils.translation import ugettext as _
from accounts.models import User,Address
from products.models import Product
orderstatus_choices = (1, "處理中"), (2, "已發貨"), (3, "已完成")


class Voucher(models.Model):
    name = models.CharField(_("name"), max_length=50)
    code = models.CharField(_("code"), max_length=50)
    discount_value = models.DecimalField(
        _("discount_value"), max_digits=5, decimal_places=2)
    discount_value_type = models.CharField(
        _("discount_value_type"), max_length=50)
    apply_to = models.CharField(_("apply to"), max_length=50)
    end_date = models.DateField(
        _("end_date"), auto_now=False, auto_now_add=False)
    # limit=models.DecimalField(_("limit"), max_digits=5, decimal_places=2)
    start_date = models.DateField(
        _("start date"), auto_now=False, auto_now_add=False)
    usage_limit = models.IntegerField(_("usage limit"))
    used = models.IntegerField(_("used"), default=0)

    def __str__(self):
        return f'{self.name}'



class Order(models.Model):
    user = models.ForeignKey(User, verbose_name=_(
        "user"), on_delete=models.DO_NOTHING)
    created = models.DateTimeField(
        _("created"), auto_now=False, auto_now_add=True)
    last_status_change = models.DateTimeField(
        _("last_status_change"), auto_now=True, auto_now_add=False, blank=True, null=True)
    status = models.IntegerField(
        _("status"), choices=orderstatus_choices, default=1)
    total = models.CharField(_("tatol"), max_length=500,
                             blank=True, null=True, default="0")
    billing_address = models.ForeignKey(Address, null=True, blank=True, related_name='orderbillingaddress', verbose_name=_(
        "billing_address"), on_delete=models.DO_NOTHING)
    shipping_address = models.ForeignKey(Address, related_name='ordershippingaddress', verbose_name=_(
        "shipping_address"), on_delete=models.DO_NOTHING, null=True, blank=True)
    discount_amount = models.DecimalField(
        _("discount_amount"), max_digits=5, decimal_places=2, blank=True, null=True)
    discount_name = models.CharField(
        _("discount_name"), max_length=50, blank=True)
    voucher = models.ForeignKey(Voucher, verbose_name=_(
        "voucher"), on_delete=models.DO_NOTHING, blank=True, null=True)
    transaction_id = models.CharField(
        _("transaction_id"), max_length=50, blank=True)
    paid_time = models.DateTimeField(null=True, blank=True)
    cartcomplete = models.BooleanField(default=False)

    def __str__(self):
        return f'User: {self.user.email} , Order Number:{self.id} ,isCart : {not self.cartcomplete}'

    @property
    def get_cart_total(self):
        orderitems = self.ordereditem_set.all()
        total = sum([item.get_total for item in orderitems])
        if self.user.membership:
            total = round(total*90/100, 2)

        if self.voucher:
            discount_value = self.voucher.discount_value
            total = total*(1-discount_value/100)
            total = round(total, 2)

        return total

    def get_cart_total_oringin(self):
        orderitems = self.ordereditem_set.all()
        total = sum([item.get_total for item in orderitems])
        return total

    @property
    def get_cart_quantity(self):
        orderitems = self.ordereditem_set.all()
        quantity = sum([item.quantity for item in orderitems])
        return quantity

class DeliveryGroup(models.Model):
    order = models.OneToOneField(Order, verbose_name=_(
        "order"), on_delete=models.DO_NOTHING)
    last_updated = models.DateTimeField(
        _("last_updated"), auto_now=False, auto_now_add=False)
    shipping_method_name = models.CharField(
        _("shipping_method_name"), max_length=50)
    shipping_price = models.DecimalField(
        _("shipping_price"), max_digits=5, decimal_places=2)
    status = models.CharField(_("status"), max_length=50)
    tracking_number = models.CharField(_("tracking_number"), max_length=50)

    def __str__(self):
        return f'{self.tracking_number}'

class OrderedItem(models.Model):
    product = models.ForeignKey(Product, verbose_name=_(
        "product"), on_delete=models.DO_NOTHING)
    quantity = models.IntegerField(_("quantity"), default=0)
    product_name = models.CharField(
        _("product_name"), max_length=50, null=True, blank=True)
    stock_location = models.CharField(
        _("stock_location"), max_length=50, null=True, blank=True)
    unit_price_gross = models.DecimalField(
        _("unit_price_gross"), max_digits=5, decimal_places=2, null=True, blank=True)
    unit_price_net = models.DecimalField(
        _("unit_price_net"), max_digits=5, decimal_places=2, null=True, blank=True)
    order = models.ForeignKey(Order, verbose_name=_(
        "order"), on_delete=models.DO_NOTHING)
    # stock=models.ForeignKey(Stock, verbose_name=_("stock"), on_delete=models.DO_NOTHING)

    def __str__(self):
        return f'{self.id}'

    @property 
    def get_total(self):
        if self.product.sale.all():
            salepricedict = {}
            for obj in self.product.sale.all():
                salepricedict[obj.name] = obj.value
            if self.product.product_class.sale:
                salepricedict[self.product.product_class.sale.name] = self.product.product_class.sale.value
            saleprice = self.product.price
            for key, value in salepricedict.items():
                saleprice *= (1-value/100)
            saleprice = round(saleprice, 2)
            total = self.quantity * saleprice
        else:
            total = self.quantity * self.product.price
        return total

    def get_one_price(self):
        if self.product.sale.all():
            salepricedict = {}
            for obj in self.product.sale.all():
                salepricedict[obj.name] = obj.value
            if self.product.product_class.sale:
                salepricedict[self.product.product_class.sale.name] = self.product.product_class.sale.value
            saleprice = self.product.price
            for key, value in salepricedict.items():
                saleprice *= (1-value/100)
            saleprice = round(saleprice, 2)
            total = saleprice
        else:
            total = self.product.price
        return total

class OrderHistoryEntry(models.Model):
    comment = models.CharField(_("comment"), max_length=50)
    date = models.DateTimeField(_("date"), auto_now=False, auto_now_add=False)
    status = models.CharField(_("status"), max_length=50)
    order = models.ForeignKey(Order, verbose_name=_(
        "order"), on_delete=models.DO_NOTHING)
    user = models.ForeignKey(User, verbose_name=_(
        "user"), on_delete=models.DO_NOTHING)

class OrderNote(models.Model):
    content = models.CharField(_("content"), max_length=50)
    date = models.DateTimeField(_("date"), auto_now=False, auto_now_add=False)
    order = models.ForeignKey(Order, verbose_name=_(
        "order"), on_delete=models.DO_NOTHING)
    user = models.ForeignKey(User, verbose_name=_(
        "user"), on_delete=models.DO_NOTHING)

rating_choices=(1,1),(2,2),(3,3),(4,4),(5,5)
class OrderItemsComment(models.Model):
    comment = models.TextField()
    rating = models.IntegerField(choices=rating_choices)
    comment_day = models.DateTimeField(auto_now=True)
    order_items = models.ForeignKey(
        OrderedItem, on_delete=models.DO_NOTHING, null=True)

    def __str__(self):
        return f'Order_items_comment_id:{self.id} ,Order items : {self.order_items} '
