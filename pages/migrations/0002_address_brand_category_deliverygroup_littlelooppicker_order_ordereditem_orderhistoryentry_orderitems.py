# Generated by Django 3.2.21 on 2023-11-22 14:56

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import pages.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        ('pages', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=50, verbose_name='first_name')),
                ('last_name', models.CharField(max_length=50, verbose_name='last_name')),
                ('phone', models.CharField(max_length=50, verbose_name='phone')),
                ('country', models.CharField(max_length=50, verbose_name='Country')),
                ('country_area', models.CharField(max_length=50, verbose_name='country_area')),
                ('city', models.CharField(max_length=50, verbose_name='city')),
                ('city_area', models.CharField(max_length=50, verbose_name='city_area')),
                ('street_address_1', models.CharField(max_length=50, verbose_name='street_address_1')),
                ('street_address_2', models.CharField(max_length=50, verbose_name='street_address_2')),
                ('company_name', models.CharField(max_length=50, verbose_name='company_name')),
                ('type', models.IntegerField(choices=[(1, 'shipping'), (2, 'billing')])),
                ('priority', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('desc', models.TextField(verbose_name='description')),
                ('hidden', models.BooleanField(verbose_name='hidden')),
                ('level', models.PositiveIntegerField(verbose_name='level')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
            ],
        ),
        migrations.CreateModel(
            name='LittleLoopPicker',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, verbose_name='title')),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(verbose_name='created')),
                ('discount_amount', models.DecimalField(blank=True, decimal_places=2, max_digits=5, null=True, verbose_name='discount_amount')),
                ('discount_name', models.CharField(blank=True, max_length=50, verbose_name='discount_name')),
                ('last_status_change', models.DateField(blank=True, null=True, verbose_name='last_status_change')),
                ('status', models.IntegerField(choices=[(1, '處理中'), (2, '已發貨'), (0, '已完成')], max_length=50, verbose_name='status')),
                ('transaction_id', models.CharField(blank=True, max_length=50, verbose_name='transaction_id')),
                ('total', models.CharField(max_length=50, verbose_name='tatol')),
            ],
        ),
        migrations.CreateModel(
            name='OrderedItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=50, verbose_name='product_name')),
                ('quantity', models.IntegerField(verbose_name='quantity')),
                ('stock_location', models.CharField(max_length=50, null=True, verbose_name='stock_location')),
                ('unit_price_gross', models.DecimalField(decimal_places=2, max_digits=5, null=True, verbose_name='unit_price_gross')),
                ('unit_price_net', models.DecimalField(decimal_places=2, max_digits=5, null=True, verbose_name='unit_price_net')),
            ],
        ),
        migrations.CreateModel(
            name='OrderHistoryEntry',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.CharField(max_length=50, verbose_name='comment')),
                ('date', models.DateTimeField(verbose_name='date')),
                ('status', models.CharField(max_length=50, verbose_name='status')),
            ],
        ),
        migrations.CreateModel(
            name='OrderItemsComment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment', models.TextField()),
                ('rating', models.IntegerField()),
                ('comment_day', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='OrderNote',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.CharField(max_length=50, verbose_name='content')),
                ('date', models.DateTimeField(verbose_name='date')),
            ],
        ),
        migrations.CreateModel(
            name='ProductClass',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('has_variant', models.BooleanField(verbose_name='has variant')),
                ('is_shipping_required', models.BooleanField(verbose_name='is shipping required')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
            ],
        ),
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('alt', models.CharField(blank=True, max_length=50, verbose_name='alt')),
                ('image', models.ImageField(upload_to='product/', verbose_name='image')),
            ],
        ),
        migrations.CreateModel(
            name='Sale',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('type', models.CharField(max_length=50, verbose_name='type')),
                ('value', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='value')),
            ],
        ),
        migrations.CreateModel(
            name='Stock',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cost_price', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='cost price')),
                ('quanity', models.IntegerField(verbose_name='quanity')),
            ],
        ),
        migrations.CreateModel(
            name='StockLocation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
            ],
        ),
        migrations.CreateModel(
            name='Voucher',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('apply_to', models.CharField(max_length=50, verbose_name='apply to')),
                ('code', models.CharField(max_length=50, verbose_name='code')),
                ('discount_value', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='discount_value')),
                ('discount_value_type', models.CharField(max_length=50, verbose_name='discount_value_type')),
                ('end_date', models.DateField(verbose_name='end_date')),
                ('limit', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='limit')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('start_date', models.DateField(verbose_name='start date')),
                ('type', models.CharField(max_length=50, verbose_name='type')),
                ('usage_limit', models.PositiveIntegerField(verbose_name='usage limit')),
                ('used', models.PositiveIntegerField(verbose_name='used')),
            ],
        ),
        migrations.CreateModel(
            name='DeliveryGroup',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_updated', models.DateTimeField(verbose_name='last_updated')),
                ('shipping_method_name', models.CharField(max_length=50, verbose_name='shipping_method_name')),
                ('shipping_price', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='shipping_price')),
                ('status', models.CharField(max_length=50, verbose_name='status')),
                ('tracking_number', models.CharField(max_length=50, verbose_name='tracking_number')),
                ('order', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to='pages.order', verbose_name='order')),
            ],
        ),
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
                ('phone', models.IntegerField(default=True, max_length=8, null=True)),
                ('date_joined', models.DateTimeField(auto_now_add=True, verbose_name='date joined')),
                ('is_active', models.BooleanField(default=True, verbose_name='active')),
                ('avatar', models.ImageField(blank=True, null=True, upload_to='avatars/')),
                ('is_staff', models.BooleanField(default=False, verbose_name='is staff')),
                ('gender', models.CharField(blank=True, choices=[(1, 'Male'), (2, 'Female')], max_length=50, null=True, verbose_name='gender')),
                ('age', models.IntegerField(blank=True, null=True, validators=[django.core.validators.MaxValueValidator(100), django.core.validators.MinValueValidator(15)])),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
            },
            managers=[
                ('objects', pages.models.CustomUserManager()),
            ],
        ),
    ]