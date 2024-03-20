from django.urls import path,include
from . import views


urlpatterns = [
 # products
    path('products', views.products, name="products"),
    path('products/<int:nid>', views.products_product, name='product'),


]
