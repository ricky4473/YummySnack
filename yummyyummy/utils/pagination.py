import copy
from django.utils.safestring import mark_safe
class Pagenation(object):
    def __init__(self,request,queryset,page_size=10,page_param='page',plus=5): #input needs queryset,page_size,

        """
        :param request: 請求的對象
        :param queryset:已篩選的對象
        :param page_size:毎頁顯示的數量
        :param page_param: 獲得url GET 的參數
        :param plus: 左右+的數目
        
        2.在views.py new class

        def user_list(request):
        queryset = models.UserInfo.objects.all()
        pagecode=Pagenation(request,queryset)
        context= {'queryset': pagecode.page_queryset,
                'pagecode':pagecode.html()
                }
        return render(request, 'user_list.html',context)

        3.在html 

        {%for obj in queryset%}
              <td>{{obj.price}}</td>
           {%endfor%}

        <ul class='pagination'>
        {{pagecode}}
        </ul>
        
        
        """
        page=request.POST.get(page_param,'1')   #當前頁面 default=1 為了沒輸入?=page=xxx都是第一頁
        if page.isdecimal():
            page=int(page)
        else:
            page=1                             #有輸入但不是數字也是第一頁
        self.page=page
        self.page_size=page_size
        self.start=(page-1)*page_size
        self.end=page*page_size
        self.page_queryset=queryset[self.start:self.end]
        total_count=queryset.count()
        totalpage,div=divmod(total_count,page_size)
        if div:
            totalpage+=1
        self.totalpage=totalpage
        self.plus=plus

        querydict=copy.deepcopy(request.POST)
        querydict._mutable=True
        self.querydict=querydict
        self.page_param=page_param



    def html(self):

        if self.totalpage<=2*self.plus+1:
            start_page=1
            end_page=self.totalpage
        else :
            if self.page<=self.plus:
                start_page=1
                end_page=2*self.plus+1
            else:
                if (self.page+self.plus)>self.totalpage:
                    start_page=self.totalpage-2*self.plus
                    end_page=self.totalpage
                else:
                    start_page=self.page-self.plus
                    end_page=self.page+self.plus
                
   


        pagecode_list=[]
        self.querydict.setlist(self.page_param,[1])
        pagecode_list.append(' <input type="radio" name="page" value="{}" id="firstpage" class="triggerform"/><label for="firstpage" >首頁</label>'.format(1))
        if self.page>1:
                # self.querydict.setlist(self.page_param,[self.page-1])
                # prev='<li><a href="?{}">前一頁</a></li>'.format(self.querydict.urlencode())
                prev='<input type="radio" name="page" value="{}" id="prevpage" class="triggerform"/><label for="prevpage" >前一頁</label>'.format(self.page-1)
        else: 
            # self.querydict.setlist(self.page_param,[1])
            # prev='<li><a href="?{}">前一頁</a></li>'.format(self.querydict.urlencode())
            prev='<input type="radio" name="page" value="{}" id="prevpage" class="triggerform"/><label for="prevpage" >前一頁</label>'.format(1)
        

        pagecode_list.append(prev)

    
        for i in range(start_page,end_page+1):
            # self.querydict.setlist(self.page_param,[i])
            if i == self.page:
                # code='<li class="active"><a href="?{}">{}</a></li>'.format(self.querydict.urlencode(),i)
                code='<input type="radio" name="page" value="{}" id="nowpage" class="triggerform"/><label for="nowpage" >{}</label>'.format(i,i)
            else:
                code='<input type="radio" name="page" value="{}" id="page_{}" class="triggerform"/><label  for="page_{}" >{}</label>'.format(i,i,i,i)

            pagecode_list.append(code)
    
        
        if self.page>=self.totalpage:
            # self.querydict.setlist(self.page_param,[self.totalpage])
            next='<input type="radio" name="page" value="{}" id="nextpage" class="triggerform"/><label  for="nextpage" >下一頁</label>'.format(self.totalpage)
            # next='<li><a href="?{}">下一頁</a></li>'.format(self.querydict.urlencode())
        else: 
            # self.querydict.setlist(self.page_param,[self.page+1])
            next='<input type="radio" name="page" value="{}" id="nextpage" class="triggerform"/><label  for="nextpage" >下一頁</label>'.format(self.page+1)
            # next='<li><a href="?{}">下一頁</a></li>'.format(self.querydict.urlencode())

        pagecode_list.append(next)
        # self.querydict.setlist(self.page_param,[self.totalpage])
        pagecode_list.append('<input type="radio" name="page" value="{}" id="endpage" class="triggerform"/><label  for="endpage" >尾頁</label>'.format(self.totalpage))
        # pagecode_list.append('<li><a href="?{}">尾頁</a></li>'.format(self.querydict.urlencode()))
       
        pagecode=mark_safe(''.join(pagecode_list))
        return pagecode
