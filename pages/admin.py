from django.contrib import admin
from . import models
from django.apps import apps


app=apps.get_app_config('pages')

class NotificationAdmin(admin.ModelAdmin):
    list_display=('',)

for name,value in app.models.items():
    if name in ["order",'deliverygroup','product']:
        pass
    else:
        admin.site.register(value)

        

