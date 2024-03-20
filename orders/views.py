from django.shortcuts import render,redirect
from django.contrib.auth.decorators import login_required
from django.utils import timezone


from .models import Order,OrderItemsComment
from yummyyummy.utils.viewsclass import Orderitemcommenteditform
# Create your views here.


@login_required
def accounts_orders(request):
    proces_orders = request.user.order_set.filter(
        status__in=[1, 2], cartcomplete=True)
    old_orders = request.user.order_set.filter(status=3)
    context = {'proces_orders': proces_orders, 'old_orders': old_orders}
    return render(request, 'orders/orders.html', context)


@login_required
def accounts_order(request, nid):
    order = Order.objects.filter(id=nid).first()
    context = {'accounts_order': order}
    return render(request, 'orders/order.html', context)


@login_required
def accounts_orderitemcomments(request, nid):
    # nid = ordereditem id

    queryset = OrderItemsComment.objects.filter(order_items=nid)
    context = {'queryset': queryset, "nid": nid}
    return render(request, 'accounts/accounts_orderitemcomments.html', context)


@login_required
def accounts_orderitemcommentadd(request, nid):
    # nid = ordereditem id
    if request.method == "POST":
        form = Orderitemcommenteditform(data=request.POST)
        if form.is_valid():
            # row_object=OrderItemsComment(order_items_id=nid,comment_day=timezone.now(),rating=request.POST.get("rating"),comment=request.POST.get('comment'))
            # row_object.save()
            form.save()
            form.instance.order_items_id = nid
            form.instance.comment_day = timezone.now()
            form.instance.save()
            context = {"form": form, "nid": nid,
                       "data_dict": {"status": 1, "msg": "新增評論成功"}}
            return render(request, 'accounts/accounts_orderitemcommentadd.html', context)

        context = {"form": form, "nid": nid,
                   "data_dict": {"status": 0, "msg": "驗證失敗"}}
        return render(request, 'accounts/accounts_orderitemcommentadd.html', context)
    form = Orderitemcommenteditform()
    return render(request, 'accounts/accounts_orderitemcommentadd.html', {"form": form})


@login_required
def accounts_orderitemcommentedit(request, nid):

    # nid = .OrderItemsComment id
    row_object = OrderItemsComment.objects.get(id=nid)
    order_items_id = row_object.order_items.id
    if request.method == "POST":
        form = Orderitemcommenteditform(instance=row_object, data=request.POST)
        if form.is_valid():
            form.save()
            # return redirect('accounts_orderitemcomments',order_items_id)
            context = {"form": form, "nid": order_items_id,
                       "data_dict": {"status": 1, "msg": "更改成功"}}
            return render(request, 'accounts/accounts_orderitemcommentedit.html', context)

        context = {"form": form, "nid": order_items_id,
                   "data_dict": {"status": 0, "msg": "驗證失敗"}}
        return render(request, 'accounts/accounts_orderitemcommentedit.html', context)

    form = Orderitemcommenteditform(instance=row_object)
    return render(request, 'accounts/accounts_orderitemcommentedit.html', {"form": form})


@login_required
def accounts_orderitemcommentdelete(request, nid):
    # nid = .OrderItemsComment id
    order_items_id = OrderItemsComment.objects.get(
        id=nid).order_items.id
    OrderItemsComment.objects.get(id=nid).delete()
    return redirect('accounts_orderitemcomments', order_items_id)

