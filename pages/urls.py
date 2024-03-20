from django.urls import path, include

from . import views


urlpatterns = [
    # pages
    path('', views.index, name='index'),
    path('about', views.about, name="about"),


    ######
    path('shipping', views.shipping, name='shipping'),
    path('refund', views.refund, name='refund'),
    path('post_fee', views.post_fee, name='post_fee'),
    path('feedback', views.feedback, name='feedback'),
    path('accessibility', views.accessibility, name='accessibility'),
    path('service', views.service, name='service'),
    path('orderprocess', views.orderprocess, name='orderprocess'),


   

   


    # cart
    path('cart/', views.cart, name="cart"),
    path('updateitem/', views.updateitem, name="updateitem"),
    path('checkout/', views.checkout, name="checkout"),
    path('processorder/', views.processorder, name="processorder"),
    path('checkout/address/edit/<int:nid>',
         views.checkout_address_edit, name="checkout_address_edit"),

     #payment
     path('payment/success',views.payment_success,name='payment_success'),
     path('payment/fail',views.payment_fail,name='payment_fail'),
    
    # management
    path('management', views.management, name="management"),
    path('management/delete_order/<int:nid>',
         views.delete_order, name='delete_order'),
     path('management_livevisitor',views.management_livevisitor)





]
