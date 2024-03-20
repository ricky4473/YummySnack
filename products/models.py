from django.db import models
from django.utils.translation import ugettext as _
# from pages.models import Order
# Create your models here.


class Category(models.Model):
    description = models.TextField(_("description"))
    is_show = models.BooleanField(_("is_show"), default=True)
    level = models.PositiveIntegerField(_("level"))
    name = models.CharField(_("name"), max_length=50)

    def __str__(self):
        return f'{self.name}'


class Sale(models.Model):
    name = models.CharField(_("name"), max_length=50)
    type = models.CharField(_("type"), max_length=50)
    value = models.DecimalField(_("value"), max_digits=5, decimal_places=2)

    def __str__(self):
        return f'{self.name}'


class ProductClass(models.Model):
    is_shipping_required = models.BooleanField(_("is shipping required"))
    name = models.CharField(_("name"), max_length=50)
    sale = models.ForeignKey(Sale, verbose_name=_(
        "sale"), blank=True, null=True, on_delete=models.DO_NOTHING)

    def __str__(self):
        return f'{self.name}'


class Brand(models.Model):
    name = models.CharField(_("name"), max_length=50)

    def __str__(self):
        return f'{self.name}'


class Product(models.Model):
    brand = models.ForeignKey(Brand, verbose_name=_(
        "brand"), on_delete=models.DO_NOTHING)
    name = models.CharField(_("name"), max_length=1000)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    weight = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ManyToManyField(Category, verbose_name=_("category"))
    product_class = models.ForeignKey(ProductClass, verbose_name=_(
        "product class"), on_delete=models.DO_NOTHING)
    available_on = models.DateField()
    desc = models.TextField()
    updated_at = models.DateField(blank=True, null=True)
    sale = models.ManyToManyField(Sale, verbose_name=_("sale"), blank=True)
    sale_rank = models.IntegerField(null=True, blank=True, default=0)
    active = models.BooleanField(verbose_name='狀態', default=True)

    def __str__(self):
        return f'Id:{self.id} name:{self.name}'

    @property
    def imageURL(self):
        return self.productimage_set.first().image.url

    # "saledict":salepricedict,
    # 'saleprice':saleprice,
    def saledictorsaleprice(self):
        salepricedict = {}
        for obj in self.sale.all():
            salepricedict[obj.name] = obj.value
        if self.product_class.sale:
            salepricedict[self.product_class.sale.name] = self.product_class.sale.value
        saleprice = self.price
        for key, value in salepricedict.items():
            saleprice *= (1-value/100)
        saleprice = round(saleprice, 2)

    @property
    def saledict(self):
        salepricedict = {}
        for obj in self.sale.all():
            salepricedict[obj.name] = obj.value
        if self.product_class.sale:
            salepricedict[self.product_class.sale.name] = self.product_class.sale.value
        return salepricedict

    @property
    def saleprice(self):
        salepricedict = {}
        for obj in self.sale.all():
            salepricedict[obj.name] = obj.value
        if self.product_class.sale:
            salepricedict[self.product_class.sale.name] = self.product_class.sale.value
        saleprice = self.price
        for key, value in salepricedict.items():
            saleprice *= (1-value/100)
        saleprice = round(saleprice, 2)
        return saleprice
#! back

    def totalsold(self):
        totalqty = 0
        # for item in Order.objects.filter(cartcomplete=True, status=0):
        #     for inneritem in item.ordereditem_set:
        #         if self.id == inneritem.product.id:
        #             totalqty += inneritem.quantity
        return totalqty


class ProductImage(models.Model):
    product = models.ForeignKey(Product, verbose_name=_(
        "product"), on_delete=models.DO_NOTHING)
    alt = models.CharField(_("alt"), max_length=50, blank=True)
    image = models.ImageField(_("image"), upload_to='product/',
                              height_field=None, width_field=None, max_length=None)

    def __str__(u):
        return f'{u.image}'


class StockLocation(models.Model):
    name = models.CharField(_("name"), max_length=50)

    def __str__(self):
        return f'{self.name}'


class Stock(models.Model):
    location = models.ForeignKey(StockLocation, verbose_name=_(
        "location"), on_delete=models.DO_NOTHING)
    product = models.ForeignKey(Product, verbose_name=_(
        "product"), on_delete=models.DO_NOTHING, blank=True, null=True)
    cost_price = models.DecimalField(
        _("cost price"), max_digits=5, decimal_places=2)
    quanity = models.IntegerField(_("quanity"))

    def __str__(self):
        return f'{self.id}'


class PromotionList(models.Model):
    title = models.CharField(_('title'), max_length=100)
    category = models.ForeignKey(Category, verbose_name=_(
        "category"), null=True, blank=True, on_delete=models.DO_NOTHING)
    product_class = models.ForeignKey(ProductClass, verbose_name=_(
        "product class"), on_delete=models.DO_NOTHING, null=True, blank=True)
    brand = models.ForeignKey(Brand, verbose_name=_(
        "brand"), on_delete=models.DO_NOTHING, null=True, blank=True)
    product = models.ManyToManyField(
        Product, verbose_name=_("product"), blank=True)
    priority = models.IntegerField(default=0, null=True, blank=True)

    def __str__(self):
        return f'{self.title}'
