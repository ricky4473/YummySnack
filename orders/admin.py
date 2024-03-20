from django.contrib import admin
from .models import *


class deliveryInline(admin.TabularInline):
    model=DeliveryGroup

class ordereditemInline(admin.TabularInline):
    model=OrderedItem


class voucherInline(admin.TabularInline):
    model=Voucher

class VoucherAdmin(admin.ModelAdmin):
    list_display=('name','code','discount_value','discount_value_type','end_date','start_date','usage_limit','used')

class OrderAdmin(admin.ModelAdmin):
    inlines=[
        deliveryInline,
        ordereditemInline,
    ]
    list_display=('user','created','status','total','voucher','paid_time','cartcomplete')



admin.site.register(Order,OrderAdmin)
admin.site.register(DeliveryGroup)
admin.site.register(Voucher,VoucherAdmin)
