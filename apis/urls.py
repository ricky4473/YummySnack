from django.urls import path,include
from . import views
from rest_framework import routers

# router=routers.DefaultRouter()
# router.register(r'users',views.UserList,'user')
# router.register(r'orders',views.OrderList,'orders')
# urlpatterns = [
#     path('apis/',include(router.urls)),
# ]



urlpatterns=[
    path('apis/users/<int:userid>',views.usersedit),
    path('apis/users/',views.users),
    path('apis/orders/',views.orders),


]
