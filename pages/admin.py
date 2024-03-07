from django.contrib import admin
from . import models
from django.apps import apps
# Register your models here.

# class PagesAdmin(admin.ModelAdmin):
#     list_display='id','name','email','hire_date',
#     list_display_links='id','name',
#     search_fields='name',
#     list_per_page=25

# for item in :
#     admin.site.register(item)

app=apps.get_app_config('pages')

for name,value in app.models.items():
    if name in ["order",'deliverygroup','product']:
        pass
    else:
        admin.site.register(value)

        
class deliveryInline(admin.TabularInline):
    model=models.DeliveryGroup

class ordereditemInline(admin.TabularInline):
    model=models.OrderedItem

class productimage(admin.TabularInline):
    model=models.ProductImage
class stock(admin.TabularInline):
    model=models.Stock
class sale(admin.TabularInline):
    model=models.Sale
class voucher(admin.TabularInline):
    model=models.Voucher



class OrderAdmin(admin.ModelAdmin):
    inlines=[
        deliveryInline,
        ordereditemInline,
    ]

class ProductAdmin(admin.ModelAdmin):
    inlines=[
        productimage,stock
        # ,sale,voucher
    ]

admin.site.register(models.Product,ProductAdmin)
admin.site.register(models.Order,OrderAdmin)
admin.site.register(models.DeliveryGroup)
# admin.site.register(models.DeliveryGroup)
# admin.site.register(models.User)

