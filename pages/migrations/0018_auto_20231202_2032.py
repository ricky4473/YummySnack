# Generated by Django 3.2.21 on 2023-12-02 12:32

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0017_daynumber_visitorip_visittotalcount'),
    ]

    operations = [
        migrations.AddField(
            model_name='daynumber',
            name='newvistor',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='daynumber',
            name='oldvistor',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='visitorip',
            name='created',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='visitorip',
            name='visitday',
            field=models.DateField(auto_now=True),
        ),
    ]