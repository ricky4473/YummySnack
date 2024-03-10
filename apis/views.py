from django.shortcuts import render
from django.http import JsonResponse
from rest_framework import viewsets
from .serializers import *
from pages.models import *

import json
# Create your views here.

def users(request):
    UserList=User.objects.filter()
    outterlist=[]
    for item in UserList:
        inner={}
        for key in item.__dict__:
            if key == '_state':
                pass
            elif key == 'avatar':
                inner[key]=item.avatar.url
            else:
                inner[key]=getattr(item,key)
            # print(f'{key}: {getattr(item,key)}')
        outterlist.append(inner)

    return JsonResponse(outterlist,safe=False)

def usersedit(request,userid):
    querydict={}
    if userid:
        querydict['id']=userid
    if request.method == 'GET':
        
        UserList=User.objects.filter(**querydict)
        outterlist=[]
        for item in UserList:
            inner={}
            for key in item.__dict__:
                if key == '_state':
                    pass
                elif key == 'avatar':
                    inner[key]=item.avatar.url
                else:
                    inner[key]=getattr(item,key)
                # print(f'{key}: {getattr(item,key)}')
            outterlist.append(inner)
        print(outterlist)
        return JsonResponse(outterlist,safe=False)

    if request.method == 'POST':
        return JsonResponse({2:2})


def orders(request):
    return JsonResponse({"data":10})

class UserList(viewsets.ModelViewSet):
    serializer_class=UserSerializer
    queryset=User.objects.all()

class UserEditList(viewsets.ModelViewSet):
    serializer_class=UserEditSerializer
    queryset=User.objects.all()


class OrderList(viewsets.ModelViewSet):
    serializer_class=OrderSerializer
    queryset=Order.objects.all()

