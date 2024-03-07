# Generated by Django 3.2.21 on 2023-12-03 08:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0019_auto_20231203_1614'),
    ]

    operations = [
        migrations.AlterField(
            model_name='voucher',
            name='usage_limit',
            field=models.IntegerField(verbose_name='usage limit'),
        ),
        migrations.AlterField(
            model_name='voucher',
            name='used',
            field=models.IntegerField(blank=True, default=0, verbose_name='used'),
        ),
    ]
