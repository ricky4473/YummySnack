# Generated by Django 3.2.21 on 2024-03-20 06:38

import accounts.models
from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='email address')),
                ('first_name', models.CharField(max_length=30, verbose_name='first name')),
                ('last_name', models.CharField(max_length=30, verbose_name='last name')),
                ('date_joined', models.DateTimeField(auto_now_add=True, verbose_name='date joined')),
                ('is_active', models.BooleanField(default=True, verbose_name='active')),
                ('avatar', models.ImageField(blank=True, default='avatars/defaulticon.jpeg', null=True, upload_to='avatars/')),
                ('is_staff', models.BooleanField(default=False, verbose_name='is staff')),
                ('gender', models.IntegerField(choices=[(1, 'Male'), (2, 'Female')], null=True, verbose_name='gender')),
                ('age', models.IntegerField(blank=True, null=True, validators=[django.core.validators.MaxValueValidator(100), django.core.validators.MinValueValidator(15)])),
                ('membership', models.BooleanField(default=False)),
                ('email_verified', models.BooleanField(default=True)),
                ('phone', models.CharField(max_length=10, null=True, validators=[django.core.validators.RegexValidator('^\\d+$', '請輸入數字')])),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
            },
            managers=[
                ('objects', accounts.models.CustomUserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=50, null=True, verbose_name='first_name')),
                ('last_name', models.CharField(max_length=50, null=True, verbose_name='last_name')),
                ('phone', models.CharField(max_length=50, validators=[django.core.validators.RegexValidator('^\\d+$', '請輸入數字')], verbose_name='phone')),
                ('country_or_area', models.CharField(max_length=50, verbose_name='國家/地區')),
                ('street_address_1', models.CharField(max_length=50, verbose_name='區域/地區/街道名稱及號碼')),
                ('street_address_2', models.CharField(max_length=50, verbose_name='屋苑或大廈/座數/樓層/單位')),
                ('company_name', models.CharField(blank=True, max_length=50, null=True, verbose_name='company_name')),
                ('type', models.IntegerField(blank=True, choices=[(1, 'shipping'), (2, 'billing')], null=True)),
                ('priority', models.IntegerField(blank=True, null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
