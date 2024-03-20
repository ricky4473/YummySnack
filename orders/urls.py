from django.urls import path
from . import views

urlpatterns = [
    #order
    path('orders', views.accounts_orders, name='orders'),
    path('orders/<int:nid>', views.accounts_order, name='order'),
    
    # orderitemscomment part
    path('orders/items/comments/<int:nid>',
         views.accounts_orderitemcomments, name='accounts_orderitemcomments'),
    path('orders/items/comments/add/<int:nid>',
         views.accounts_orderitemcommentadd, name='accounts_orderitemcommentadd'),
    path('orders/items/comments/edit/<int:nid>',
         views.accounts_orderitemcommentedit, name='accounts_orderitemcommentedit'),
    path('orders/items/comments/delete/<int:nid>',
         views.accounts_orderitemcommentdelete, name='accounts_orderitemcommentdelete'),

]
