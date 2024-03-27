from django.db import models
from django.utils.translation import ugettext as _
from orders.models import Order

class Banner(models.Model):
    name=models.CharField(_("name"), max_length=50)
    image=models.ImageField(_("image"))
    is_show=models.BooleanField(_("is_show"),default=True)

class VisitorIP(models.Model):
    ip = models.CharField(max_length=30, verbose_name='IP Address')
    location = models.CharField(max_length=30)
    count = models.IntegerField(default=0)
    created = models.DateField(auto_now_add=True)
    visitday = models.DateField(auto_now=True)

    def __str__(self):
        return self.ip


class VisitTotalCount(models.Model):
    count = models.IntegerField(default=0)

    def __str__(self):
        return f'{self.count}'


class DayNumber(models.Model):
    day = models.DateField()
    count = models.IntegerField(default=0)
    newvistor = models.IntegerField(default=0)
    oldvistor = models.IntegerField(default=0)

    def __str__(self):
        return f'{self.count}'


class Feedback(models.Model):
    name = models.CharField(max_length=20, null=True, verbose_name='姓名 Name')
    email = models.EmailField(null=True, verbose_name='聯絡電郵 Contact Email')
    gender_choices = ((1, 'Male'), (2, 'Female'))
    gender = models.IntegerField(
        _("性別 gender"), choices=gender_choices, blank=True, null=True)
    title = models.CharField(max_length=30, null=True, verbose_name="標題 Title")
    feedback = models.CharField(
        max_length=200, blank=True, null=True, verbose_name="留言 Feedback")

    def __str__(self):
        return f'{self.title}'


class Notification(models.Model):
    time = models.DateTimeField(auto_now_add=True)
    order = models.ForeignKey(Order, on_delete=models.DO_NOTHING)
    read_status = models.BooleanField(default=False)
