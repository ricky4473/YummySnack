from django.urls import path, include
from django.contrib.auth.views import PasswordResetView,PasswordResetDoneView,PasswordResetConfirmView,PasswordResetCompleteView

from . import views


urlpatterns = [
    # index
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
    # path('contact', views.contact,name='contact'),


    # products
    path('products', views.products, name="products"),
    path('products/<int:nid>', views.products_product, name='product'),

    # accounts
    path('accounts', views.accounts, name='accounts'),
    path('accounts/orders', views.accounts_orders, name='orders'),
    path('accounts/orders/<int:nid>', views.accounts_order, name='order'),
    # orderitemscomment part
    path('accounts/orders/items/comments/<int:nid>',
         views.accounts_orderitemcomments, name='accounts_orderitemcomments'),
    path('accounts/orders/items/comments/add/<int:nid>',
         views.accounts_orderitemcommentadd, name='accounts_orderitemcommentadd'),
    path('accounts/orders/items/comments/edit/<int:nid>',
         views.accounts_orderitemcommentedit, name='accounts_orderitemcommentedit'),
    path('accounts/orders/items/comments/delete/<int:nid>',
         views.accounts_orderitemcommentdelete, name='accounts_orderitemcommentdelete'),

     #address
    path('accounts/address', views.accounts_address, name='address'),
    path('accounts/accounts/address/add/<int:typenum>',
         views.accounts_address_add, name='address_add'),
    path('accounts/accounts/address/edit/<int:nid>',
         views.accounts_address_edit, name='address_edit'),
    path('accounts/accounts/address/delete/<int:nid>',
         views.accounts_address_delete, name='address_delete'),
     #login
    path('accounts/register', views.accounts_register, name='register'),
    path('accounts/login', views.accounts_login, name='login'),
    path('accounts/logout', views.accounts_logout, name='logout'),
    path('accounts/reset', views.accounts_reset, name='reset'),


     path('accounts/password_reset/', PasswordResetView.as_view(), name='password_reset'),
    path('accounts/password_reset/done/', PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('accounts/reset/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('accounts/reset/done/', PasswordResetCompleteView.as_view(), name='password_reset_complete'),



     #membership
     path('accounts/membership',views.accounts_membership,name='membership'),
    


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
# urlpatterns+=[path("__reload__/", include("django_browser_reload.urls"))]
