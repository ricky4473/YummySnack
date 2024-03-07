# Generated by Django 3.2.21 on 2023-11-29 13:01

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0014_auto_20231129_2031'),
    ]

    operations = [
        migrations.RenameField(
            model_name='address',
            old_name='country_area',
            new_name='country_or_area',
        ),
        migrations.RemoveField(
            model_name='address',
            name='city',
        ),
        migrations.RemoveField(
            model_name='address',
            name='city_area',
        ),
        migrations.RemoveField(
            model_name='address',
            name='country',
        ),
        migrations.AlterField(
            model_name='address',
            name='phone',
            field=models.CharField(max_length=50, validators=[django.core.validators.RegexValidator('^\\d+$', '請輸入數字')], verbose_name='phone'),
        ),
        migrations.AlterField(
            model_name='user',
            name='gender',
            field=models.IntegerField(choices=[(1, 'Male'), (2, 'Female')], null=True, verbose_name='gender'),
        ),
    ]