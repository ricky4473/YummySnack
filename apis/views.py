from django.shortcuts import render
from django.http import JsonResponse
from rest_framework import viewsets
from .serializers import *
from pages.models import *
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.hashers import make_password
from orders.models import Order
from accounts.models import User
import json
# Create your views here.


@csrf_exempt
def users(request, userid=''):
    querydict = {}
    if (userid):
        querydict['id']=userid
    

    if request.method == 'GET':
        UserList = User.objects.filter(**querydict)
        outterlist = []
        for item in UserList:
            inner = {}
            for key in item.__dict__:
                if key == '_state':
                    pass
                elif key == 'avatar':
                    inner[key] = item.avatar.url
                else:
                    inner[key] = getattr(item, key)
            outterlist.append(inner)
        return JsonResponse(outterlist, safe=False)

    if request.method == 'POST':

        data = json.loads(request.body)
        print(data)
        first_name=data['first_name']
        last_name=data['last_name']
        email=data['email']
        password=data['password']
        user=User.objects.get(id=userid)
        user.first_name=first_name
        user.last_name=last_name
        user.email=email
        user.password=make_password(password)
        user.save()
        return JsonResponse({2: 2})

@csrf_exempt
def orders(request, orderid=''):
    querydict = {}
    if (orderid):
        querydict['id']=orderid
    

    if request.method == 'GET':
        OrderList = Order.objects.filter(**querydict)
        outterlist = []
        for item in OrderList:
            inner = {}
            for key in item.__dict__:
                if key == '_state':
                    pass
                elif key == 'avatar':
                    inner[key] = item.avatar.url
                else:
                    inner[key] = getattr(item, key)
            for obj in item.ordereditem_set.all():
                print(obj )
            outterlist.append(inner)

        return JsonResponse(outterlist, safe=False)

    if request.method == 'POST':

        data = json.loads(request.body)
        print(data)
        # first_name=data['first_name']
        # last_name=data['last_name']
        # email=data['email']
        # password=data['password']
        # user=User.objects.get(id=orderid)
        # user.first_name=first_name
        # user.last_name=last_name
        # user.email=email
        # user.password=make_password(password)
        # user.save()
        return JsonResponse({2: 2})

@csrf_exempt
def products(request, productid=''):
    querydict = {}
    if (productid):
        querydict['id']=productid
    

    if request.method == 'GET':
        UserList = User.objects.filter(**querydict)
        outterlist = []
        for item in UserList:
            inner = {}
            for key in item.__dict__:
                if key == '_state':
                    pass
                elif key == 'avatar':
                    inner[key] = item.avatar.url
                else:
                    inner[key] = getattr(item, key)
            outterlist.append(inner)
        return JsonResponse(outterlist, safe=False)

    if request.method == 'POST':

        data = json.loads(request.body)
        print(data)
        first_name=data['first_name']
        last_name=data['last_name']
        email=data['email']
        password=data['password']
        user=User.objects.get(id=productid)
        user.first_name=first_name
        user.last_name=last_name
        user.email=email
        user.password=make_password(password)
        user.save()
        return JsonResponse({2: 2})



class UserList(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    queryset = User.objects.all()


class UserEditList(viewsets.ModelViewSet):
    serializer_class = UserEditSerializer
    queryset = User.objects.all()


class OrderList(viewsets.ModelViewSet):
    serializer_class = OrderSerializer
    queryset = Order.objects.all()
