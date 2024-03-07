from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import HttpResponse,redirect
from django.http import HttpResponseNotAllowed

class AuthMiddleware(MiddlewareMixin):
    def process_request(self,request):
        if request.user == "AnonymousUser":
            if "/accounts" in request.path_info :
                if request.path_info in ["accounts/register/",'/accounts/login/',"/accounts/reset/"]:
                    return
                return HttpResponseNotAllowed()
            if "management" in request.path_info:
                return HttpResponseNotAllowed()
            

# class AuthMiddleware(MiddlewareMixin):
#     def process_request(self,request):
#         if request.path_info in ['/login/','/image/code/']:
#             return
#         info_dict=request.session.get('info')
#         if info_dict:
#             return
#         return redirect('/login/')