import time
from datetime import timedelta,datetime
from django.core.cache import cache
from django.utils.deprecation import MiddlewareMixin
from django.core.cache import caches
from pages.models import *
from yummyyummy.utils.iptoaddress import iptoaddress
from django.utils import timezone


class OnlineCountMiddleware(MiddlewareMixin):
    
    def process_request(self,request):
        if 'HTTP_X_FORWARDED_FOR' in request.META:
            ip=request.META['HTTP_X_FORWARDED_FOR'].split(',')[0]
        else:
            ip=request.META['REMOTE_ADDR']
        onlineiplist=cache.get('onlineiplist',[])

        if onlineiplist:
            onlineiplist=list(cache.get_many(onlineiplist).keys())
        
        cache.set(ip,0,5*60)

        if ip not in onlineiplist:
            onlineiplist.append(ip)
        cache.set('onlineiplist',onlineiplist)
        return

#[{},{},{},...]
#[{"192.168.0.1":0},{"onlineiplist":["192.168.0.1"]}]
def iplist():
    onlineiplist=cache.get('onlineiplist',[])

    if onlineiplist:
        onlineiplist=list(cache.get_many(onlineiplist).keys())

    return onlineiplist
    



class IPtoDBMiddleware(MiddlewareMixin):
    
    def process_request(self,request):
        if 'HTTP_X_FORWARDED_FOR' in request.META:
            ip=request.META['HTTP_X_FORWARDED_FOR'].split(',')[0]
        else:
            ip=request.META['REMOTE_ADDR']
        vistor,bool1=VisitorIP.objects.get_or_create(ip=ip)
        vistor.location=f'{iptoaddress(ip)["country"]},{iptoaddress(ip)["city"]}'
        vistor.save()
        def inner():
            vistor.count+=1
            vistor.save()

            vistortotalcount,bool2=VisitTotalCount.objects.get_or_create(id=1)
            vistortotalcount.count+=1
            vistortotalcount.save()

            daynumber,bool3=DayNumber.objects.get_or_create(day=timezone.now().date())
            daynumber.count+=1
            daynumber.newvistor
            if bool1:
                daynumber.newvistor+=1
            else:
                daynumber.oldvistor+=1
            daynumber.save()
            return
        # inner()
        throttlelistdict=cache.get('throttlelistdict',[])
        if throttlelistdict:
            pass
        else:
            throttlelistdict=[]
        now=datetime.timestamp(datetime.now())
        if throttlelistdict:
            tmplist=[]
            for index,item in enumerate(throttlelistdict):
                if  vistor.ip in item.keys():
                    startTime=item[vistor.ip]
                    if now-startTime >60*60:  #unit =s
                        inner()
                        throttlelistdict[index][vistor.ip]=now
                tmplist.append(list(item.keys())[0])
            if vistor.ip not in tmplist:
                throttlelistdict.append({vistor.ip:0})
                if bool1:
                    inner()
        else:
            throttlelistdict.append({vistor.ip:0})
            if bool1:
                inner()
        cache.set('throttlelistdict',throttlelistdict,60*60)
        return
       
       
    
     
    

def throttle(fn,t):
    stratTime=0
    def inner():
        now=datetime.now()
        if (now-stratTime >= t):
            fn()
            stratTime=now

    return inner
