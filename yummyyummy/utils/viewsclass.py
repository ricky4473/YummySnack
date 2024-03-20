from django import forms
from .bootstrap import *
from pages import models
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
from django.contrib.auth.hashers import make_password, check_password
from django.forms import BaseModelFormSet
from orders.models import Order,OrderItemsComment
from accounts.models import User,Address
class Orderitemcommenteditform(BootStrapModelForm):
    class Meta:
        model = OrderItemsComment
        fields = ["comment", 'rating']


class UserloginForm(BootStrapForm):
    email = forms.EmailField(widget=forms.EmailInput, required=True)
    password = forms.CharField(widget=forms.PasswordInput, required=True)


class UserModelForm(BootStrapModelForm):
    password = forms.CharField(widget=forms.PasswordInput(), validators=[RegexValidator(
        '^.*(?=.{6,10})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$', 'plz input 6-20 characters, at least one lowercase ,uppercase,digits for 0-9')])
    password2 = forms.CharField(
        label='Confirm Password', widget=forms.PasswordInput())

    class Meta:
        model = User
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
        model = User
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
        model = Address
        exclude = ["user", 'priority', 'type']


class AddressOriginalForm(BootStrapModelForm):
    class Meta:
        model = Address
        exclude = ["user", 'priority', 'type']


class AddressShippingForm(BootStrapModelForm):
    class Meta:
        model = Address
        # 'first_name','last_name','phone'
        exclude = ["user", 'priority', 'type',]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for item in list(self.fields.keys()):
            self.fields["shipping_"+item] = self.fields.pop(item)


class AddressBillingForm(BootStrapModelForm):
    class Meta:
        model = Address
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


class feedbackmodelform(BootStrapModelForm):
    class Meta:
        model = models.Feedback
        fields = '__all__'
        widgets = {"feedback": forms.Textarea(attrs={"rows": 3})}
