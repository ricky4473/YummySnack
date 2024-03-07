# Generated by Django 3.2.21 on 2023-11-29 12:31

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0013_auto_20231127_1129'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address',
            name='first_name',
            field=models.CharField(max_length=50, null=True, verbose_name='first_name'),
        ),
        migrations.AlterField(
            model_name='address',
            name='last_name',
            field=models.CharField(max_length=50, null=True, verbose_name='last_name'),
        ),
        migrations.AlterField(
            model_name='address',
            name='phone',
            field=models.CharField(max_length=50, validators=[django.core.validators.RegexValidator('^\\d{8}$', '請輸入8位電話號碼')], verbose_name='phone'),
        ),
        migrations.AlterField(
            model_name='order',
            name='total',
            field=models.CharField(blank=True, default='0', max_length=500, null=True, verbose_name='tatol'),
        ),
        migrations.AlterField(
            model_name='user',
            name='avatar',
            field=models.ImageField(blank=True, default='avatars/defaulticon.jpeg', null=True, upload_to='avatars/'),
        ),
        migrations.AlterField(
            model_name='user',
            name='gender',
            field=models.IntegerField(blank=True, choices=[(1, 'Male'), (2, 'Female')], max_length=50, null=True, verbose_name='gender'),
        ),
        migrations.AlterField(
            model_name='user',
            name='phone',
            field=models.CharField(max_length=10, null=True),
        ),
    ]