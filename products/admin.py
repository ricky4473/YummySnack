from django.contrib import admin
from products.models import *
# Register your models here.


class productimage(admin.TabularInline):
    model = ProductImage


class stock(admin.TabularInline):
    model = Stock


class ProductAdmin(admin.ModelAdmin):
    inlines = [
        productimage, stock
        # ,sale,voucher
    ]
    list_display=('name','price','brand','weight','updated_at','get_category','product_class','sale_rank','active')
    def get_category(self,obj):
        return "\n".join(item.name for item in obj.category.all())

class ProductClassAdmin(admin.ModelAdmin):
    list_display = ('name', 'sale')


class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'level', 'description', 'is_show')

class PromotionListAdmin(admin.ModelAdmin):
    list_display=('title','category','product_class','brand','priority')

class StockAdmin(admin.ModelAdmin):
    list_display=('product','quanity','cost_price','location')

class SaleAdmin(admin.ModelAdmin):
    list_display=('name','type','value')

admin.site.register(Product, ProductAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(ProductClass, ProductClassAdmin)
admin.site.register(PromotionList,PromotionListAdmin)
admin.site.register(Brand)
admin.site.register(StockLocation)
admin.site.register(Stock,StockAdmin)
admin.site.register(Sale)
