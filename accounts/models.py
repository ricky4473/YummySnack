from django.db import models
from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.utils.translation import ugettext as _
from django.contrib.auth.models import PermissionsMixin
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.validators import RegexValidator
from django.core.mail import send_mail

# Create your models here.


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
    phone = models.CharField(max_length=10, null=True, validators=[
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
    type = models.IntegerField(
        _('類別'), choices=type_choices, null=True, blank=True)
    priority = models.IntegerField(_('優先次序'), blank=True, null=True,)
    user = models.ForeignKey(
        User, on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return f': {self.get_type_display()} ,priority:{self.priority} '
