# Generated by Django 3.2.21 on 2024-03-20 07:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address',
            name='priority',
            field=models.IntegerField(blank=True, null=True, verbose_name='優先次序'),
        ),
        migrations.AlterField(
            model_name='address',
            name='type',
            field=models.IntegerField(blank=True, choices=[(1, 'shipping'), (2, 'billing')], null=True, verbose_name='類別'),
        ),
    ]
