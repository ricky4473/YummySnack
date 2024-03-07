from django.db.models import Sum, Avg
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from django.utils.translation import ugettext as _
from django.core.mail import send_mail
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.contrib.postgres.fields import HStoreField
from django.core.validators import RegexValidator


# Custom User Model
class CustomUserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError('The given email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        return self._create_user(email, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(_("email address"), unique=True)
    first_name = models.CharField(_("first name"), max_length=30)
    last_name = models.CharField(_("last name"), max_length=30)
    
    date_joined = models.DateTimeField(_("date joined"), auto_now_add=True)
    is_active = models.BooleanField(_("active"), default=True)
    avatar = models.ImageField(
        upload_to='avatars/', null=True, blank=True, default="avatars/defaulticon.jpeg")
    is_staff = models.BooleanField(_("is staff"), default=False)
    gender_choices = ((1, 'Male'), (2, 'Female'))
    gender = models.IntegerField(
        _("gender"), choices=gender_choices, null=True)
    age = models.IntegerField(validators=[MaxValueValidator(
        100), MinValueValidator(15)], blank=True, null=True)
    membership = models.BooleanField(default=False)
    email_verified = models.BooleanField(default=True)
    phone = models.CharField(max_length=10, null=True,validators=[
                             RegexValidator('^\d+$', '請輸入數字')])

    objects = CustomUserManager()
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')

    def get_full_name(self):
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        return self.first_name

    def email_user(self, subject, messgae, form_email=None, **kwargs):
        send_mail(subject, messgae, form_email, [self.email], **kwargs)

    def ordercount(self):
        allordertotal = 0
        for obj in self.order_set.filter(cartcomplete=True):
            allordertotal += float(obj.total or 0)

        # ,self.order_set.filter(cartcomplete=True).aggregate(Sum("total"))
        return self.order_set.filter(cartcomplete=True).count(), allordertotal

# "'屋苑或大廈/座數/樓層/單位?b=區域/地區/街道名稱及號碼'"


class Address(models.Model):
    first_name = models.CharField(_("first_name"), max_length=50, null=True)
    last_name = models.CharField(_("last_name"), max_length=50, null=True)
    phone = models.CharField(_("phone"), max_length=50, validators=[
                             RegexValidator('^\d+$', '請輸入數字')])
    country_or_area = models.CharField(_("國家/地區"), max_length=50)
    street_address_1 = models.CharField(_("區域/地區/街道名稱及號碼"), max_length=50)
    street_address_2 = models.CharField(_("屋苑或大廈/座數/樓層/單位"), max_length=50)
    company_name = models.CharField(
        _("company_name"), max_length=50, null=True, blank=True)
    type_choices = (1, "shipping"), (2, "billing")
    type = models.IntegerField(choices=type_choices, null=True, blank=True)
    priority = models.IntegerField(blank=True, null=True)
    user = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return f': {self.get_type_display()} ,priority:{self.priority} '


# Product
class Category(models.Model):
    desc = models.TextField(_("description"))
    hidden = models.BooleanField(_("hidden"))
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
    has_variant = models.BooleanField(_("has variant"))
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
    attributes = HStoreField(blank=True, null=True)
    available_on = models.DateField()
    desc = models.TextField()
    name = models.CharField(_("name"), max_length=1000)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    updated_at = models.DateField(blank=True, null=True)
    weight = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.ManyToManyField(Category, verbose_name=_("category"))
    product_class = models.ForeignKey(ProductClass, verbose_name=_(
        "product class"), on_delete=models.DO_NOTHING)
    sale = models.ManyToManyField(Sale, verbose_name=_("sale"), blank=True)
    brand = models.ForeignKey(Brand, verbose_name=_(
        "brand"), on_delete=models.DO_NOTHING)
    active = models.BooleanField(verbose_name='狀態', default=True)
    sale_rank = models.IntegerField(null=True, blank=True, default=0)

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

    def totalsold(self):
        totalqty = 0
        for item in Order.objects.filter(cartcomplete=True, status=0):
            for inneritem in item.ordereditem_set:
                if self.id == inneritem.product.id:
                    totalqty += inneritem.quantity
        return totalqty


class ProductImage(models.Model):
    product = models.ForeignKey(Product, verbose_name=_(
        "product"), on_delete=models.DO_NOTHING)
    alt = models.CharField(_("alt"), max_length=50, blank=True)
    image = models.ImageField(_("image"), upload_to='product/',
                              height_field=None, width_field=None, max_length=None)

    def __str__(u):
        return f'{u.image}'

# class ProductVariant(models.Model):
#     attributes=HStoreField()
#     available_on=models.DateField()
#     name=models.CharField(_("name"), max_length=50)
#     price_overide=models.DecimalField(max_digits=10,decimal_places=2)
#     weight_overide=models.DecimalField(max_digits=10,decimal_places=2)
#     product=models.ForeignKey(Product, verbose_name=_("product"), on_delete=models.DO_NOTHING)
#     def __str__(self):
#         return f'{self.name}'

# class VariantImage(models.Model):
#     image=models.ForeignKey(ProductImage, verbose_name=_("image"), on_delete=models.DO_NOTHING)
#     variant=models.ForeignKey(ProductVariant, verbose_name=_("variant"), on_delete=models.DO_NOTHING)
#     def __str__(self):
#         return f'{self.image}'


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

# discount


class Voucher(models.Model):
    apply_to = models.CharField(_("apply to"), max_length=50)
    code = models.CharField(_("code"), max_length=50)
    discount_value = models.DecimalField(
        _("discount_value"), max_digits=5, decimal_places=2)
    discount_value_type = models.CharField(
        _("discount_value_type"), max_length=50)
    end_date = models.DateField(
        _("end_date"), auto_now=False, auto_now_add=False)
    # limit=models.DecimalField(_("limit"), max_digits=5, decimal_places=2)
    name = models.CharField(_("name"), max_length=50)
    start_date = models.DateField(
        _("start date"), auto_now=False, auto_now_add=False)
    type = models.CharField(_("type"), max_length=50)
    usage_limit = models.IntegerField(_("usage limit"))
    used = models.IntegerField(_("used"), default=0)

    def __str__(self):
        return f'{self.name}'


orderstatus_choices = (1, "處理中"), (2, "已發貨"), (3, "已完成")
# Order


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

    @property  # ! back latter
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


class OrderItemsComment(models.Model):
    comment = models.TextField()
    rating = models.IntegerField()
    comment_day = models.DateTimeField(auto_now=True)
    order_items = models.ForeignKey(OrderedItem, on_delete=models.DO_NOTHING,null=True)

    def __str__(self):
        return f'Order_items_comment_id:{self.id} ,Order items : {self.order_items} '


class LittleLoopPicker(models.Model):
    title = models.CharField(_('title'), max_length=100)
    category = models.ForeignKey(Category, verbose_name=_(
        "category"), null=True, blank=True, on_delete=models.DO_NOTHING)
    product_class = models.ForeignKey(ProductClass, verbose_name=_(
        "product class"), on_delete=models.DO_NOTHING, null=True, blank=True)
    brand = models.ForeignKey(Brand, verbose_name=_(
        "brand"), on_delete=models.DO_NOTHING, null=True, blank=True)
    product = models.ManyToManyField(
        Product, verbose_name=_("product"), blank=True)
    priority=models.IntegerField(default=0,null=True,blank=True)

    def __str__(self):
        return f'{self.title}'


class VisitorIP(models.Model):
    ip = models.CharField(max_length=30, verbose_name='IP Address')
    location = models.CharField(max_length=30)
    count = models.IntegerField(default=0)
    created = models.DateField(auto_now_add=True)
    visitday = models.DateField(auto_now=True)

    def __str__(self):
        return self.ip


class VisitTotalCount(models.Model):
    count = models.IntegerField(default=0)

    def __str__(self):
        return f'{self.count}'


class DayNumber(models.Model):
    day = models.DateField()
    count = models.IntegerField(default=0)
    newvistor = models.IntegerField(default=0)
    oldvistor = models.IntegerField(default=0)

    def __str__(self):
        return f'{self.count}'


class Feedback(models.Model):
    name = models.CharField(max_length=20, null=True, verbose_name='姓名 Name')
    email = models.EmailField(null=True, verbose_name='聯絡電郵 Contact Email')
    gender_choices = ((1, 'Male'), (2, 'Female'))
    gender = models.IntegerField(
        _("性別 gender"), choices=gender_choices, blank=True, null=True)
    title = models.CharField(max_length=30, null=True, verbose_name="標題 Title")
    feedback = models.CharField(
        max_length=200, blank=True, null=True, verbose_name="留言 Feedback")

    def __str__(self):
        return f'{self.title}'
