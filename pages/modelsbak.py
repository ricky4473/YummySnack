from __future__ import unicode_literals
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.core.mail import send_mail
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.base_user import BaseUserManager,AbstractBaseUser

class CustomUserManager(BaseUserManager):
    use_in_migrations=True

    def _create_user(self,email,password,**extra_fields):
        if not email:
            raise ValueError('The given email must be set')
        email=self.normalize_email(email)
        user=self.model(email=email,**extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user
    
    def create_user(self,email,password=None,**extra_fields):
        extra_fields.setdefault('is_superuser',False)
        return self._create_user(email,password,**extra_fields)
    
    def create_superuser(self,email,password,**extra_fields):
        extra_fields.setdefault('is_superuser',True)
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        return self.create_superuser(email,password,**extra_fields)

    




class User(AbstractBaseUser,PermissionsMixin):
    email=models.EmailField(_("email address"),unique=True)
    first_name=models.CharField(_("first name"), max_length=30,blank=True)
    last_name=models.CharField(_("last name"), max_length=30,blank=True)
    date_joined=models.DateTimeField(_("date joined"),auto_now_add=True)
    is_active=models.BooleanField(_("active"),default=True)
    avatar=models.ImageField(upload_to='avatars/', null=True,blank=True)


    objects=CustomUserManager()
    USERNAME_FIELD='email'
    REQUIRED_FIELDS=[]

    class Meta:
        verbose_name=_('user')
        verbose_name_plural=_('users')

    def get_full_name(self):
        full_name='%s %s' % (self.first_name,self.last_name)
        return full_name.strip()
    
    def get_short_name(self):
        return self.first_name

    def email_user(self,subject,messgae,form_email=None,**kwargs):
        send_mail(subject,messgae,form_email,[self.email],**kwargs)
        










# Create your models here.
class Category(models.Model):
    name=models.CharField(max_length=100)
    desc=models.TextField(max_length=1000)
    def __str__(self):
        return self.name
    
class Inventory(models.Model):
    quantity=models.IntegerField()
    def __str__(self):
        return f"{self.quantity}"

class Discount(models.Model):
    name=models.CharField(max_length=100)
    desc=models.TextField()
    discount_percent=models.DecimalField(max_digits=10,decimal_places=2)
    active=models.BooleanField()
    def __str__(self):
        return self.name

class Product(models.Model):
    name=models.CharField(max_length=200)
    desc=models.TextField(max_length=1000)
    price=models.DecimalField(max_digits=10,decimal_places=2)
    category=models.ForeignKey(Category,on_delete=models.DO_NOTHING)
    inventory=models.OneToOneField(Inventory,on_delete=models.DO_NOTHING)
    discount=models.ForeignKey(Discount,on_delete=models.DO_NOTHING)
    def __str__(self):
        return self.name


class Order(models.Model):
    order_number=models.IntegerField()
    total=models.DecimalField(max_digits=10,decimal_places=2)
    user=models.ForeignKey(User,on_delete=models.DO_NOTHING)
    def __str__(self):
        return f'{self.order_number}'

class Order_items(models.Model):
    quanity=models.IntegerField()
    order=models.ForeignKey(Order, on_delete=models.DO_NOTHING)
    product=models.ForeignKey(Product,on_delete=models.DO_NOTHING)
    def __str__(self):
        return f'{self.order} : {self.product}'
    
class Order_items_comment(models.Model):
    comment=models.TextField()
    order_items=models.ForeignKey(Order_items,on_delete=models.DO_NOTHING)
    def __str__(self):
        return f'Order_items_comment_id:{self.id} ,Order items : {self.order_items} '



