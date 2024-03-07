# Generated by Django 3.2.21 on 2023-12-01 07:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0015_auto_20231129_2101'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='sale_rank',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='address',
            name='country_or_area',
            field=models.CharField(max_length=50, verbose_name='國家/地區'),
        ),
        migrations.AlterField(
            model_name='address',
            name='street_address_1',
            field=models.CharField(max_length=50, verbose_name="區域/地區/街道名稱及號碼'"),
        ),
        migrations.AlterField(
            model_name='address',
            name='street_address_2',
            field=models.CharField(max_length=50, verbose_name='屋苑或大廈/座數/樓層/單位'),
        ),
        migrations.AlterField(
            model_name='orderitemscomment',
            name='comment_day',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
