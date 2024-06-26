# Generated by Django 3.2.21 on 2024-03-20 07:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='category',
            old_name='desc',
            new_name='description',
        ),
        migrations.RemoveField(
            model_name='category',
            name='hidden',
        ),
        migrations.AddField(
            model_name='category',
            name='is_show',
            field=models.BooleanField(default=True, verbose_name='is_show'),
            preserve_default=False,
        ),
    ]
