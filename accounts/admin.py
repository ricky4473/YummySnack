from django.contrib import admin
from .models import *
# Register your models here.


class AddressAdmin(admin.ModelAdmin):
    list_display = ('user', 'priority', 'type', 'phone',
                    'country_or_area', 'street_address_1', 'street_address_2')


class UserAdmin(admin.ModelAdmin):
    list_display = ('email', 'first_name', 'last_name', 'gender',
                    'age', 'phone', 'membership', 'is_active', 'is_superuser')


admin.site.register(Address, AddressAdmin)
admin.site.register(User, UserAdmin)
