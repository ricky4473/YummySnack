# Generated by Django 3.2.21 on 2024-03-20 08:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0002_auto_20240320_1555'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='productclass',
            name='has_variant',
        ),
        migrations.AlterField(
            model_name='category',
            name='is_show',
            field=models.BooleanField(default=True, verbose_name='is_show'),
        ),
    ]