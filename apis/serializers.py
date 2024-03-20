from rest_framework import serializers
from pages.models import *
from orders.models import Order
from accounts.models import User
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields='__all__'
class UserEditSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields='__all__'

class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model=Order
        fields='__all__'