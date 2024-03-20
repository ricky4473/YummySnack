from django.urls import path
from . import views
from django.contrib.auth.views import PasswordResetView,PasswordResetDoneView,PasswordResetConfirmView,PasswordResetCompleteView


urlpatterns = [

     # accounts
    path('accounts', views.accounts, name='accounts'),
    
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
    
]
