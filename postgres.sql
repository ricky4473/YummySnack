PGDMP  ;                    |         
   yummysnack    16.0    16.0 V   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    44907 
   yummysnack    DATABASE     �   CREATE DATABASE yummysnack WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE yummysnack;
                postgres    false            �            1259    45001    accounts_address    TABLE     �  CREATE TABLE public.accounts_address (
    id bigint NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    phone character varying(50) NOT NULL,
    country_or_area character varying(50) NOT NULL,
    street_address_1 character varying(50) NOT NULL,
    street_address_2 character varying(50) NOT NULL,
    company_name character varying(50),
    type integer,
    priority integer,
    user_id bigint
);
 $   DROP TABLE public.accounts_address;
       public         heap    postgres    false            �            1259    45000    accounts_address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_address_id_seq;
       public          postgres    false    232            �           0    0    accounts_address_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_address_id_seq OWNED BY public.accounts_address.id;
          public          postgres    false    231            �            1259    44976    accounts_user    TABLE     a  CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    avatar character varying(100),
    is_staff boolean NOT NULL,
    gender integer,
    age integer,
    membership boolean NOT NULL,
    email_verified boolean NOT NULL,
    phone character varying(10)
);
 !   DROP TABLE public.accounts_user;
       public         heap    postgres    false            �            1259    44987    accounts_user_groups    TABLE     �   CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 (   DROP TABLE public.accounts_user_groups;
       public         heap    postgres    false            �            1259    44986    accounts_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_user_groups_id_seq;
       public          postgres    false    228            �           0    0    accounts_user_groups_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;
          public          postgres    false    227            �            1259    44975    accounts_user_id_seq    SEQUENCE     }   CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_user_id_seq;
       public          postgres    false    226            �           0    0    accounts_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;
          public          postgres    false    225            �            1259    44994    accounts_user_user_permissions    TABLE     �   CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 2   DROP TABLE public.accounts_user_user_permissions;
       public         heap    postgres    false            �            1259    44993 %   accounts_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.accounts_user_user_permissions_id_seq;
       public          postgres    false    230            �           0    0 %   accounts_user_user_permissions_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;
          public          postgres    false    229            �            1259    44934 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    44933    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    222            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    221            �            1259    44943    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    44942    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    224            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    223            �            1259    44927    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    44926    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    220            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    219            �            1259    45043    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    45042    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    234            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    233            �            1259    44918    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    44917    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    217            �            1259    44909    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    44908    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    216            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    215                       1259    45375    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       1259    45301    orders_deliverygroup    TABLE     Y  CREATE TABLE public.orders_deliverygroup (
    id bigint NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    shipping_method_name character varying(50) NOT NULL,
    shipping_price numeric(5,2) NOT NULL,
    status character varying(50) NOT NULL,
    tracking_number character varying(50) NOT NULL,
    order_id bigint NOT NULL
);
 (   DROP TABLE public.orders_deliverygroup;
       public         heap    postgres    false                       1259    45300    orders_deliverygroup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_deliverygroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.orders_deliverygroup_id_seq;
       public          postgres    false    272            �           0    0    orders_deliverygroup_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.orders_deliverygroup_id_seq OWNED BY public.orders_deliverygroup.id;
          public          postgres    false    271                       1259    45250    orders_order    TABLE     !  CREATE TABLE public.orders_order (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    last_status_change timestamp with time zone,
    status integer NOT NULL,
    total character varying(500),
    discount_amount numeric(5,2),
    discount_name character varying(50) NOT NULL,
    transaction_id character varying(50) NOT NULL,
    paid_time timestamp with time zone,
    cartcomplete boolean NOT NULL,
    billing_address_id bigint,
    shipping_address_id bigint,
    user_id bigint NOT NULL,
    voucher_id bigint
);
     DROP TABLE public.orders_order;
       public         heap    postgres    false                       1259    45249    orders_order_id_seq    SEQUENCE     |   CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    260            �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;
          public          postgres    false    259                       1259    45259    orders_ordereditem    TABLE     6  CREATE TABLE public.orders_ordereditem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    product_name character varying(50),
    stock_location character varying(50),
    unit_price_gross numeric(5,2),
    unit_price_net numeric(5,2),
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);
 &   DROP TABLE public.orders_ordereditem;
       public         heap    postgres    false                       1259    45258    orders_ordereditem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_ordereditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.orders_ordereditem_id_seq;
       public          postgres    false    262            �           0    0    orders_ordereditem_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.orders_ordereditem_id_seq OWNED BY public.orders_ordereditem.id;
          public          postgres    false    261                       1259    45289    orders_orderhistoryentry    TABLE       CREATE TABLE public.orders_orderhistoryentry (
    id bigint NOT NULL,
    comment character varying(50) NOT NULL,
    date timestamp with time zone NOT NULL,
    status character varying(50) NOT NULL,
    order_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 ,   DROP TABLE public.orders_orderhistoryentry;
       public         heap    postgres    false                       1259    45288    orders_orderhistoryentry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_orderhistoryentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.orders_orderhistoryentry_id_seq;
       public          postgres    false    270            �           0    0    orders_orderhistoryentry_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.orders_orderhistoryentry_id_seq OWNED BY public.orders_orderhistoryentry.id;
          public          postgres    false    269                       1259    45280    orders_orderitemscomment    TABLE     �   CREATE TABLE public.orders_orderitemscomment (
    id bigint NOT NULL,
    comment text NOT NULL,
    rating integer NOT NULL,
    comment_day timestamp with time zone NOT NULL,
    order_items_id bigint
);
 ,   DROP TABLE public.orders_orderitemscomment;
       public         heap    postgres    false                       1259    45279    orders_orderitemscomment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_orderitemscomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.orders_orderitemscomment_id_seq;
       public          postgres    false    268            �           0    0    orders_orderitemscomment_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.orders_orderitemscomment_id_seq OWNED BY public.orders_orderitemscomment.id;
          public          postgres    false    267            
           1259    45273    orders_ordernote    TABLE     �   CREATE TABLE public.orders_ordernote (
    id bigint NOT NULL,
    content character varying(50) NOT NULL,
    date timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 $   DROP TABLE public.orders_ordernote;
       public         heap    postgres    false            	           1259    45272    orders_ordernote_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_ordernote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.orders_ordernote_id_seq;
       public          postgres    false    266            �           0    0    orders_ordernote_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.orders_ordernote_id_seq OWNED BY public.orders_ordernote.id;
          public          postgres    false    265                       1259    45266    orders_voucher    TABLE     �  CREATE TABLE public.orders_voucher (
    id bigint NOT NULL,
    apply_to character varying(50) NOT NULL,
    code character varying(50) NOT NULL,
    discount_value numeric(5,2) NOT NULL,
    discount_value_type character varying(50) NOT NULL,
    end_date date NOT NULL,
    name character varying(50) NOT NULL,
    start_date date NOT NULL,
    usage_limit integer NOT NULL,
    used integer NOT NULL
);
 "   DROP TABLE public.orders_voucher;
       public         heap    postgres    false                       1259    45265    orders_voucher_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.orders_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.orders_voucher_id_seq;
       public          postgres    false    264            �           0    0    orders_voucher_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.orders_voucher_id_seq OWNED BY public.orders_voucher.id;
          public          postgres    false    263                       1259    45439    pages_banner    TABLE     �   CREATE TABLE public.pages_banner (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    image character varying(100) NOT NULL,
    is_show boolean NOT NULL
);
     DROP TABLE public.pages_banner;
       public         heap    postgres    false                       1259    45438    pages_banner_id_seq    SEQUENCE     |   CREATE SEQUENCE public.pages_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pages_banner_id_seq;
       public          postgres    false    285            �           0    0    pages_banner_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pages_banner_id_seq OWNED BY public.pages_banner.id;
          public          postgres    false    284                       1259    45386    pages_daynumber    TABLE     �   CREATE TABLE public.pages_daynumber (
    id bigint NOT NULL,
    day date NOT NULL,
    count integer NOT NULL,
    newvistor integer NOT NULL,
    oldvistor integer NOT NULL
);
 #   DROP TABLE public.pages_daynumber;
       public         heap    postgres    false                       1259    45385    pages_daynumber_id_seq    SEQUENCE        CREATE SEQUENCE public.pages_daynumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pages_daynumber_id_seq;
       public          postgres    false    275            �           0    0    pages_daynumber_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pages_daynumber_id_seq OWNED BY public.pages_daynumber.id;
          public          postgres    false    274                       1259    45393    pages_feedback    TABLE     �   CREATE TABLE public.pages_feedback (
    id bigint NOT NULL,
    name character varying(20),
    email character varying(254),
    gender integer,
    title character varying(30),
    feedback character varying(200)
);
 "   DROP TABLE public.pages_feedback;
       public         heap    postgres    false                       1259    45392    pages_feedback_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.pages_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pages_feedback_id_seq;
       public          postgres    false    277            �           0    0    pages_feedback_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pages_feedback_id_seq OWNED BY public.pages_feedback.id;
          public          postgres    false    276                       1259    45416    pages_notification    TABLE     �   CREATE TABLE public.pages_notification (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    read_status boolean NOT NULL,
    order_id bigint NOT NULL
);
 &   DROP TABLE public.pages_notification;
       public         heap    postgres    false                       1259    45415    pages_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pages_notification_id_seq;
       public          postgres    false    283            �           0    0    pages_notification_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pages_notification_id_seq OWNED BY public.pages_notification.id;
          public          postgres    false    282                       1259    45402    pages_visitorip    TABLE     �   CREATE TABLE public.pages_visitorip (
    id bigint NOT NULL,
    ip character varying(30) NOT NULL,
    location character varying(30) NOT NULL,
    count integer NOT NULL,
    created date NOT NULL,
    visitday date NOT NULL
);
 #   DROP TABLE public.pages_visitorip;
       public         heap    postgres    false                       1259    45401    pages_visitorip_id_seq    SEQUENCE        CREATE SEQUENCE public.pages_visitorip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pages_visitorip_id_seq;
       public          postgres    false    279            �           0    0    pages_visitorip_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pages_visitorip_id_seq OWNED BY public.pages_visitorip.id;
          public          postgres    false    278                       1259    45409    pages_visittotalcount    TABLE     b   CREATE TABLE public.pages_visittotalcount (
    id bigint NOT NULL,
    count integer NOT NULL
);
 )   DROP TABLE public.pages_visittotalcount;
       public         heap    postgres    false                       1259    45408    pages_visittotalcount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_visittotalcount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.pages_visittotalcount_id_seq;
       public          postgres    false    281            �           0    0    pages_visittotalcount_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.pages_visittotalcount_id_seq OWNED BY public.pages_visittotalcount.id;
          public          postgres    false    280            �            1259    45065    products_brand    TABLE     h   CREATE TABLE public.products_brand (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);
 "   DROP TABLE public.products_brand;
       public         heap    postgres    false            �            1259    45064    products_brand_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.products_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.products_brand_id_seq;
       public          postgres    false    236            �           0    0    products_brand_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.products_brand_id_seq OWNED BY public.products_brand.id;
          public          postgres    false    235            �            1259    45072    products_category    TABLE       CREATE TABLE public.products_category (
    id bigint NOT NULL,
    description text NOT NULL,
    level integer NOT NULL,
    name character varying(50) NOT NULL,
    is_show boolean NOT NULL,
    CONSTRAINT products_category_level_check CHECK ((level >= 0))
);
 %   DROP TABLE public.products_category;
       public         heap    postgres    false            �            1259    45071    products_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_category_id_seq;
       public          postgres    false    238            �           0    0    products_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;
          public          postgres    false    237            �            1259    45082    products_product    TABLE     x  CREATE TABLE public.products_product (
    id bigint NOT NULL,
    available_on date NOT NULL,
    "desc" text NOT NULL,
    name character varying(1000) NOT NULL,
    price numeric(10,2) NOT NULL,
    updated_at date,
    weight numeric(10,2) NOT NULL,
    active boolean NOT NULL,
    sale_rank integer,
    brand_id bigint NOT NULL,
    product_class_id bigint NOT NULL
);
 $   DROP TABLE public.products_product;
       public         heap    postgres    false            �            1259    45091    products_product_category    TABLE     �   CREATE TABLE public.products_product_category (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);
 -   DROP TABLE public.products_product_category;
       public         heap    postgres    false            �            1259    45090     products_product_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.products_product_category_id_seq;
       public          postgres    false    242            �           0    0     products_product_category_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.products_product_category_id_seq OWNED BY public.products_product_category.id;
          public          postgres    false    241            �            1259    45081    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    240            �           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;
          public          postgres    false    239                       1259    45157    products_product_sale    TABLE     �   CREATE TABLE public.products_product_sale (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    sale_id bigint NOT NULL
);
 )   DROP TABLE public.products_product_sale;
       public         heap    postgres    false                       1259    45156    products_product_sale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.products_product_sale_id_seq;
       public          postgres    false    258                        0    0    products_product_sale_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.products_product_sale_id_seq OWNED BY public.products_product_sale.id;
          public          postgres    false    257            �            1259    45098    products_productclass    TABLE     �   CREATE TABLE public.products_productclass (
    id bigint NOT NULL,
    is_shipping_required boolean NOT NULL,
    name character varying(50) NOT NULL,
    sale_id bigint
);
 )   DROP TABLE public.products_productclass;
       public         heap    postgres    false            �            1259    45097    products_productclass_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_productclass_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.products_productclass_id_seq;
       public          postgres    false    244                       0    0    products_productclass_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.products_productclass_id_seq OWNED BY public.products_productclass.id;
          public          postgres    false    243                        1259    45140    products_productimage    TABLE     �   CREATE TABLE public.products_productimage (
    id bigint NOT NULL,
    alt character varying(50) NOT NULL,
    image character varying(100) NOT NULL,
    product_id bigint NOT NULL
);
 )   DROP TABLE public.products_productimage;
       public         heap    postgres    false            �            1259    45139    products_productimage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.products_productimage_id_seq;
       public          postgres    false    256                       0    0    products_productimage_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.products_productimage_id_seq OWNED BY public.products_productimage.id;
          public          postgres    false    255            �            1259    45126    products_promotionlist    TABLE     �   CREATE TABLE public.products_promotionlist (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    priority integer,
    brand_id bigint,
    category_id bigint,
    product_class_id bigint
);
 *   DROP TABLE public.products_promotionlist;
       public         heap    postgres    false            �            1259    45125    products_promotionlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_promotionlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.products_promotionlist_id_seq;
       public          postgres    false    252                       0    0    products_promotionlist_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.products_promotionlist_id_seq OWNED BY public.products_promotionlist.id;
          public          postgres    false    251            �            1259    45133    products_promotionlist_product    TABLE     �   CREATE TABLE public.products_promotionlist_product (
    id bigint NOT NULL,
    promotionlist_id bigint NOT NULL,
    product_id bigint NOT NULL
);
 2   DROP TABLE public.products_promotionlist_product;
       public         heap    postgres    false            �            1259    45132 %   products_promotionlist_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_promotionlist_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.products_promotionlist_product_id_seq;
       public          postgres    false    254                       0    0 %   products_promotionlist_product_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.products_promotionlist_product_id_seq OWNED BY public.products_promotionlist_product.id;
          public          postgres    false    253            �            1259    45105    products_sale    TABLE     �   CREATE TABLE public.products_sale (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    value numeric(5,2) NOT NULL
);
 !   DROP TABLE public.products_sale;
       public         heap    postgres    false            �            1259    45104    products_sale_id_seq    SEQUENCE     }   CREATE SEQUENCE public.products_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.products_sale_id_seq;
       public          postgres    false    246                       0    0    products_sale_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.products_sale_id_seq OWNED BY public.products_sale.id;
          public          postgres    false    245            �            1259    45119    products_stock    TABLE     �   CREATE TABLE public.products_stock (
    id bigint NOT NULL,
    cost_price numeric(5,2) NOT NULL,
    quanity integer NOT NULL,
    location_id bigint NOT NULL,
    product_id bigint
);
 "   DROP TABLE public.products_stock;
       public         heap    postgres    false            �            1259    45118    products_stock_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.products_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.products_stock_id_seq;
       public          postgres    false    250                       0    0    products_stock_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.products_stock_id_seq OWNED BY public.products_stock.id;
          public          postgres    false    249            �            1259    45112    products_stocklocation    TABLE     p   CREATE TABLE public.products_stocklocation (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);
 *   DROP TABLE public.products_stocklocation;
       public         heap    postgres    false            �            1259    45111    products_stocklocation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_stocklocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.products_stocklocation_id_seq;
       public          postgres    false    248                       0    0    products_stocklocation_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.products_stocklocation_id_seq OWNED BY public.products_stocklocation.id;
          public          postgres    false    247            ?           2604    45004    accounts_address id    DEFAULT     z   ALTER TABLE ONLY public.accounts_address ALTER COLUMN id SET DEFAULT nextval('public.accounts_address_id_seq'::regclass);
 B   ALTER TABLE public.accounts_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            <           2604    44979    accounts_user id    DEFAULT     t   ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            =           2604    44990    accounts_user_groups id    DEFAULT     �   ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);
 F   ALTER TABLE public.accounts_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            >           2604    44997 !   accounts_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);
 P   ALTER TABLE public.accounts_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            :           2604    44937    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ;           2604    44946    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            9           2604    44930    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            @           2604    45046    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            8           2604    44921    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            7           2604    44912    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            S           2604    45304    orders_deliverygroup id    DEFAULT     �   ALTER TABLE ONLY public.orders_deliverygroup ALTER COLUMN id SET DEFAULT nextval('public.orders_deliverygroup_id_seq'::regclass);
 F   ALTER TABLE public.orders_deliverygroup ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    272    272            M           2604    45253    orders_order id    DEFAULT     r   ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260            N           2604    45262    orders_ordereditem id    DEFAULT     ~   ALTER TABLE ONLY public.orders_ordereditem ALTER COLUMN id SET DEFAULT nextval('public.orders_ordereditem_id_seq'::regclass);
 D   ALTER TABLE public.orders_ordereditem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            R           2604    45292    orders_orderhistoryentry id    DEFAULT     �   ALTER TABLE ONLY public.orders_orderhistoryentry ALTER COLUMN id SET DEFAULT nextval('public.orders_orderhistoryentry_id_seq'::regclass);
 J   ALTER TABLE public.orders_orderhistoryentry ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    270    269    270            Q           2604    45283    orders_orderitemscomment id    DEFAULT     �   ALTER TABLE ONLY public.orders_orderitemscomment ALTER COLUMN id SET DEFAULT nextval('public.orders_orderitemscomment_id_seq'::regclass);
 J   ALTER TABLE public.orders_orderitemscomment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268            P           2604    45276    orders_ordernote id    DEFAULT     z   ALTER TABLE ONLY public.orders_ordernote ALTER COLUMN id SET DEFAULT nextval('public.orders_ordernote_id_seq'::regclass);
 B   ALTER TABLE public.orders_ordernote ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    266    266            O           2604    45269    orders_voucher id    DEFAULT     v   ALTER TABLE ONLY public.orders_voucher ALTER COLUMN id SET DEFAULT nextval('public.orders_voucher_id_seq'::regclass);
 @   ALTER TABLE public.orders_voucher ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    263    264            Y           2604    45442    pages_banner id    DEFAULT     r   ALTER TABLE ONLY public.pages_banner ALTER COLUMN id SET DEFAULT nextval('public.pages_banner_id_seq'::regclass);
 >   ALTER TABLE public.pages_banner ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    285    285            T           2604    45389    pages_daynumber id    DEFAULT     x   ALTER TABLE ONLY public.pages_daynumber ALTER COLUMN id SET DEFAULT nextval('public.pages_daynumber_id_seq'::regclass);
 A   ALTER TABLE public.pages_daynumber ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    275    275            U           2604    45396    pages_feedback id    DEFAULT     v   ALTER TABLE ONLY public.pages_feedback ALTER COLUMN id SET DEFAULT nextval('public.pages_feedback_id_seq'::regclass);
 @   ALTER TABLE public.pages_feedback ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    277    277            X           2604    45419    pages_notification id    DEFAULT     ~   ALTER TABLE ONLY public.pages_notification ALTER COLUMN id SET DEFAULT nextval('public.pages_notification_id_seq'::regclass);
 D   ALTER TABLE public.pages_notification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    282    283    283            V           2604    45405    pages_visitorip id    DEFAULT     x   ALTER TABLE ONLY public.pages_visitorip ALTER COLUMN id SET DEFAULT nextval('public.pages_visitorip_id_seq'::regclass);
 A   ALTER TABLE public.pages_visitorip ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    279    279            W           2604    45412    pages_visittotalcount id    DEFAULT     �   ALTER TABLE ONLY public.pages_visittotalcount ALTER COLUMN id SET DEFAULT nextval('public.pages_visittotalcount_id_seq'::regclass);
 G   ALTER TABLE public.pages_visittotalcount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    281    280    281            A           2604    45068    products_brand id    DEFAULT     v   ALTER TABLE ONLY public.products_brand ALTER COLUMN id SET DEFAULT nextval('public.products_brand_id_seq'::regclass);
 @   ALTER TABLE public.products_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            B           2604    45075    products_category id    DEFAULT     |   ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);
 C   ALTER TABLE public.products_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            C           2604    45085    products_product id    DEFAULT     z   ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            D           2604    45094    products_product_category id    DEFAULT     �   ALTER TABLE ONLY public.products_product_category ALTER COLUMN id SET DEFAULT nextval('public.products_product_category_id_seq'::regclass);
 K   ALTER TABLE public.products_product_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            L           2604    45160    products_product_sale id    DEFAULT     �   ALTER TABLE ONLY public.products_product_sale ALTER COLUMN id SET DEFAULT nextval('public.products_product_sale_id_seq'::regclass);
 G   ALTER TABLE public.products_product_sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            E           2604    45101    products_productclass id    DEFAULT     �   ALTER TABLE ONLY public.products_productclass ALTER COLUMN id SET DEFAULT nextval('public.products_productclass_id_seq'::regclass);
 G   ALTER TABLE public.products_productclass ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            K           2604    45143    products_productimage id    DEFAULT     �   ALTER TABLE ONLY public.products_productimage ALTER COLUMN id SET DEFAULT nextval('public.products_productimage_id_seq'::regclass);
 G   ALTER TABLE public.products_productimage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256            I           2604    45129    products_promotionlist id    DEFAULT     �   ALTER TABLE ONLY public.products_promotionlist ALTER COLUMN id SET DEFAULT nextval('public.products_promotionlist_id_seq'::regclass);
 H   ALTER TABLE public.products_promotionlist ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            J           2604    45136 !   products_promotionlist_product id    DEFAULT     �   ALTER TABLE ONLY public.products_promotionlist_product ALTER COLUMN id SET DEFAULT nextval('public.products_promotionlist_product_id_seq'::regclass);
 P   ALTER TABLE public.products_promotionlist_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            F           2604    45108    products_sale id    DEFAULT     t   ALTER TABLE ONLY public.products_sale ALTER COLUMN id SET DEFAULT nextval('public.products_sale_id_seq'::regclass);
 ?   ALTER TABLE public.products_sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            H           2604    45122    products_stock id    DEFAULT     v   ALTER TABLE ONLY public.products_stock ALTER COLUMN id SET DEFAULT nextval('public.products_stock_id_seq'::regclass);
 @   ALTER TABLE public.products_stock ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250            G           2604    45115    products_stocklocation id    DEFAULT     �   ALTER TABLE ONLY public.products_stocklocation ALTER COLUMN id SET DEFAULT nextval('public.products_stocklocation_id_seq'::regclass);
 H   ALTER TABLE public.products_stocklocation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    248    248            �          0    45001    accounts_address 
   TABLE DATA           �   COPY public.accounts_address (id, first_name, last_name, phone, country_or_area, street_address_1, street_address_2, company_name, type, priority, user_id) FROM stdin;
    public          postgres    false    232   9�      �          0    44976    accounts_user 
   TABLE DATA           �   COPY public.accounts_user (id, password, last_login, is_superuser, email, first_name, last_name, date_joined, is_active, avatar, is_staff, gender, age, membership, email_verified, phone) FROM stdin;
    public          postgres    false    226   ��      �          0    44987    accounts_user_groups 
   TABLE DATA           E   COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    228   ��      �          0    44994    accounts_user_user_permissions 
   TABLE DATA           T   COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    230   ��      �          0    44934 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    222   ��      �          0    44943    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    224   ��      �          0    44927    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    220   ��      �          0    45043    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    234   r�      �          0    44918    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    218   3�      �          0    44909    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    216   c�      �          0    45375    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    273   ��      �          0    45301    orders_deliverygroup 
   TABLE DATA           �   COPY public.orders_deliverygroup (id, last_updated, shipping_method_name, shipping_price, status, tracking_number, order_id) FROM stdin;
    public          postgres    false    272   9�      �          0    45250    orders_order 
   TABLE DATA           �   COPY public.orders_order (id, created, last_status_change, status, total, discount_amount, discount_name, transaction_id, paid_time, cartcomplete, billing_address_id, shipping_address_id, user_id, voucher_id) FROM stdin;
    public          postgres    false    260   V�      �          0    45259    orders_ordereditem 
   TABLE DATA           �   COPY public.orders_ordereditem (id, quantity, product_name, stock_location, unit_price_gross, unit_price_net, order_id, product_id) FROM stdin;
    public          postgres    false    262   �      �          0    45289    orders_orderhistoryentry 
   TABLE DATA           `   COPY public.orders_orderhistoryentry (id, comment, date, status, order_id, user_id) FROM stdin;
    public          postgres    false    270   ��      �          0    45280    orders_orderitemscomment 
   TABLE DATA           d   COPY public.orders_orderitemscomment (id, comment, rating, comment_day, order_items_id) FROM stdin;
    public          postgres    false    268   ��      �          0    45273    orders_ordernote 
   TABLE DATA           P   COPY public.orders_ordernote (id, content, date, order_id, user_id) FROM stdin;
    public          postgres    false    266   y�      �          0    45266    orders_voucher 
   TABLE DATA           �   COPY public.orders_voucher (id, apply_to, code, discount_value, discount_value_type, end_date, name, start_date, usage_limit, used) FROM stdin;
    public          postgres    false    264   ��      �          0    45439    pages_banner 
   TABLE DATA           @   COPY public.pages_banner (id, name, image, is_show) FROM stdin;
    public          postgres    false    285   ��      �          0    45386    pages_daynumber 
   TABLE DATA           O   COPY public.pages_daynumber (id, day, count, newvistor, oldvistor) FROM stdin;
    public          postgres    false    275   ��      �          0    45393    pages_feedback 
   TABLE DATA           R   COPY public.pages_feedback (id, name, email, gender, title, feedback) FROM stdin;
    public          postgres    false    277   �      �          0    45416    pages_notification 
   TABLE DATA           O   COPY public.pages_notification (id, "time", read_status, order_id) FROM stdin;
    public          postgres    false    283   .�      �          0    45402    pages_visitorip 
   TABLE DATA           U   COPY public.pages_visitorip (id, ip, location, count, created, visitday) FROM stdin;
    public          postgres    false    279   0�      �          0    45409    pages_visittotalcount 
   TABLE DATA           :   COPY public.pages_visittotalcount (id, count) FROM stdin;
    public          postgres    false    281   ��      �          0    45065    products_brand 
   TABLE DATA           2   COPY public.products_brand (id, name) FROM stdin;
    public          postgres    false    236   ��      �          0    45072    products_category 
   TABLE DATA           R   COPY public.products_category (id, description, level, name, is_show) FROM stdin;
    public          postgres    false    238   _�      �          0    45082    products_product 
   TABLE DATA           �   COPY public.products_product (id, available_on, "desc", name, price, updated_at, weight, active, sale_rank, brand_id, product_class_id) FROM stdin;
    public          postgres    false    240   ��      �          0    45091    products_product_category 
   TABLE DATA           P   COPY public.products_product_category (id, product_id, category_id) FROM stdin;
    public          postgres    false    242   �      �          0    45157    products_product_sale 
   TABLE DATA           H   COPY public.products_product_sale (id, product_id, sale_id) FROM stdin;
    public          postgres    false    258   A      �          0    45098    products_productclass 
   TABLE DATA           X   COPY public.products_productclass (id, is_shipping_required, name, sale_id) FROM stdin;
    public          postgres    false    244   d      �          0    45140    products_productimage 
   TABLE DATA           K   COPY public.products_productimage (id, alt, image, product_id) FROM stdin;
    public          postgres    false    256   �      �          0    45126    products_promotionlist 
   TABLE DATA           n   COPY public.products_promotionlist (id, title, priority, brand_id, category_id, product_class_id) FROM stdin;
    public          postgres    false    252   @      �          0    45133    products_promotionlist_product 
   TABLE DATA           Z   COPY public.products_promotionlist_product (id, promotionlist_id, product_id) FROM stdin;
    public          postgres    false    254   ~      �          0    45105    products_sale 
   TABLE DATA           >   COPY public.products_sale (id, name, type, value) FROM stdin;
    public          postgres    false    246   �      �          0    45119    products_stock 
   TABLE DATA           Z   COPY public.products_stock (id, cost_price, quanity, location_id, product_id) FROM stdin;
    public          postgres    false    250   �      �          0    45112    products_stocklocation 
   TABLE DATA           :   COPY public.products_stocklocation (id, name) FROM stdin;
    public          postgres    false    248   {                 0    0    accounts_address_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accounts_address_id_seq', 2, true);
          public          postgres    false    231            	           0    0    accounts_user_groups_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);
          public          postgres    false    227            
           0    0    accounts_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.accounts_user_id_seq', 1, true);
          public          postgres    false    225                       0    0 %   accounts_user_user_permissions_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);
          public          postgres    false    229                       0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    221                       0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    223                       0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 116, true);
          public          postgres    false    219                       0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 171, true);
          public          postgres    false    233                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 29, true);
          public          postgres    false    217                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);
          public          postgres    false    215                       0    0    orders_deliverygroup_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.orders_deliverygroup_id_seq', 1, false);
          public          postgres    false    271                       0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 17, true);
          public          postgres    false    259                       0    0    orders_ordereditem_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.orders_ordereditem_id_seq', 28, true);
          public          postgres    false    261                       0    0    orders_orderhistoryentry_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.orders_orderhistoryentry_id_seq', 1, false);
          public          postgres    false    269                       0    0    orders_orderitemscomment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.orders_orderitemscomment_id_seq', 7, true);
          public          postgres    false    267                       0    0    orders_ordernote_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.orders_ordernote_id_seq', 1, false);
          public          postgres    false    265                       0    0    orders_voucher_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_voucher_id_seq', 1, true);
          public          postgres    false    263                       0    0    pages_banner_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pages_banner_id_seq', 3, true);
          public          postgres    false    284                       0    0    pages_daynumber_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pages_daynumber_id_seq', 14, true);
          public          postgres    false    274                       0    0    pages_feedback_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pages_feedback_id_seq', 1, false);
          public          postgres    false    276                       0    0    pages_notification_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pages_notification_id_seq', 16, true);
          public          postgres    false    282                       0    0    pages_visitorip_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pages_visitorip_id_seq', 3, true);
          public          postgres    false    278                       0    0    pages_visittotalcount_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.pages_visittotalcount_id_seq', 1, false);
          public          postgres    false    280                       0    0    products_brand_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.products_brand_id_seq', 14, true);
          public          postgres    false    235                        0    0    products_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_category_id_seq', 7, true);
          public          postgres    false    237            !           0    0     products_product_category_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.products_product_category_id_seq', 24, true);
          public          postgres    false    241            "           0    0    products_product_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_product_id_seq', 24, true);
          public          postgres    false    239            #           0    0    products_product_sale_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.products_product_sale_id_seq', 1, true);
          public          postgres    false    257            $           0    0    products_productclass_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.products_productclass_id_seq', 7, true);
          public          postgres    false    243            %           0    0    products_productimage_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.products_productimage_id_seq', 24, true);
          public          postgres    false    255            &           0    0    products_promotionlist_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.products_promotionlist_id_seq', 5, true);
          public          postgres    false    251            '           0    0 %   products_promotionlist_product_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.products_promotionlist_product_id_seq', 4, true);
          public          postgres    false    253            (           0    0    products_sale_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.products_sale_id_seq', 5, true);
          public          postgres    false    245            )           0    0    products_stock_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.products_stock_id_seq', 24, true);
          public          postgres    false    249            *           0    0    products_stocklocation_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.products_stocklocation_id_seq', 1, true);
          public          postgres    false    247            �           2606    45006 &   accounts_address accounts_address_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_address
    ADD CONSTRAINT accounts_address_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_address DROP CONSTRAINT accounts_address_pkey;
       public            postgres    false    232            t           2606    44985 %   accounts_user accounts_user_email_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);
 O   ALTER TABLE ONLY public.accounts_user DROP CONSTRAINT accounts_user_email_key;
       public            postgres    false    226            y           2606    44992 .   accounts_user_groups accounts_user_groups_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_pkey;
       public            postgres    false    228            |           2606    45009 H   accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);
 r   ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq;
       public            postgres    false    228    228            v           2606    44983     accounts_user accounts_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_user DROP CONSTRAINT accounts_user_pkey;
       public            postgres    false    226            ~           2606    45023 [   accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq;
       public            postgres    false    230    230            �           2606    44999 B   accounts_user_user_permissions accounts_user_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_permissions_pkey;
       public            postgres    false    230            i           2606    44973    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    222            n           2606    44959 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    224    224            q           2606    44948 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    224            k           2606    44939    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    222            d           2606    44950 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    220    220            f           2606    44932 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    220            �           2606    45051 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    234            _           2606    44925 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    218    218            a           2606    44923 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    218            ]           2606    44916 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    216            �           2606    45381 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    273            �           2606    45308 6   orders_deliverygroup orders_deliverygroup_order_id_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.orders_deliverygroup
    ADD CONSTRAINT orders_deliverygroup_order_id_key UNIQUE (order_id);
 `   ALTER TABLE ONLY public.orders_deliverygroup DROP CONSTRAINT orders_deliverygroup_order_id_key;
       public            postgres    false    272            �           2606    45306 .   orders_deliverygroup orders_deliverygroup_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.orders_deliverygroup
    ADD CONSTRAINT orders_deliverygroup_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.orders_deliverygroup DROP CONSTRAINT orders_deliverygroup_pkey;
       public            postgres    false    272            �           2606    45257    orders_order orders_order_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_pkey;
       public            postgres    false    260            �           2606    45264 *   orders_ordereditem orders_ordereditem_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.orders_ordereditem
    ADD CONSTRAINT orders_ordereditem_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.orders_ordereditem DROP CONSTRAINT orders_ordereditem_pkey;
       public            postgres    false    262            �           2606    45294 6   orders_orderhistoryentry orders_orderhistoryentry_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.orders_orderhistoryentry
    ADD CONSTRAINT orders_orderhistoryentry_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.orders_orderhistoryentry DROP CONSTRAINT orders_orderhistoryentry_pkey;
       public            postgres    false    270            �           2606    45287 6   orders_orderitemscomment orders_orderitemscomment_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.orders_orderitemscomment
    ADD CONSTRAINT orders_orderitemscomment_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.orders_orderitemscomment DROP CONSTRAINT orders_orderitemscomment_pkey;
       public            postgres    false    268            �           2606    45278 &   orders_ordernote orders_ordernote_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.orders_ordernote
    ADD CONSTRAINT orders_ordernote_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.orders_ordernote DROP CONSTRAINT orders_ordernote_pkey;
       public            postgres    false    266            �           2606    45271 "   orders_voucher orders_voucher_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.orders_voucher
    ADD CONSTRAINT orders_voucher_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.orders_voucher DROP CONSTRAINT orders_voucher_pkey;
       public            postgres    false    264            �           2606    45444    pages_banner pages_banner_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pages_banner
    ADD CONSTRAINT pages_banner_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.pages_banner DROP CONSTRAINT pages_banner_pkey;
       public            postgres    false    285            �           2606    45391 $   pages_daynumber pages_daynumber_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.pages_daynumber
    ADD CONSTRAINT pages_daynumber_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.pages_daynumber DROP CONSTRAINT pages_daynumber_pkey;
       public            postgres    false    275            �           2606    45400 "   pages_feedback pages_feedback_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pages_feedback
    ADD CONSTRAINT pages_feedback_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pages_feedback DROP CONSTRAINT pages_feedback_pkey;
       public            postgres    false    277            �           2606    45421 *   pages_notification pages_notification_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pages_notification
    ADD CONSTRAINT pages_notification_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pages_notification DROP CONSTRAINT pages_notification_pkey;
       public            postgres    false    283            �           2606    45407 $   pages_visitorip pages_visitorip_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.pages_visitorip
    ADD CONSTRAINT pages_visitorip_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.pages_visitorip DROP CONSTRAINT pages_visitorip_pkey;
       public            postgres    false    279            �           2606    45414 0   pages_visittotalcount pages_visittotalcount_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.pages_visittotalcount
    ADD CONSTRAINT pages_visittotalcount_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.pages_visittotalcount DROP CONSTRAINT pages_visittotalcount_pkey;
       public            postgres    false    281            �           2606    45070 "   products_brand products_brand_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_brand_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.products_brand DROP CONSTRAINT products_brand_pkey;
       public            postgres    false    236            �           2606    45080 (   products_category products_category_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.products_category DROP CONSTRAINT products_category_pkey;
       public            postgres    false    238            �           2606    45096 8   products_product_category products_product_category_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.products_product_category
    ADD CONSTRAINT products_product_category_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.products_product_category DROP CONSTRAINT products_product_category_pkey;
       public            postgres    false    242            �           2606    45170 X   products_product_category products_product_category_product_id_category_id_99b99489_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.products_product_category
    ADD CONSTRAINT products_product_category_product_id_category_id_99b99489_uniq UNIQUE (product_id, category_id);
 �   ALTER TABLE ONLY public.products_product_category DROP CONSTRAINT products_product_category_product_id_category_id_99b99489_uniq;
       public            postgres    false    242    242            �           2606    45089 &   products_product products_product_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_pkey;
       public            postgres    false    240            �           2606    45162 0   products_product_sale products_product_sale_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.products_product_sale
    ADD CONSTRAINT products_product_sale_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.products_product_sale DROP CONSTRAINT products_product_sale_pkey;
       public            postgres    false    258            �           2606    45236 L   products_product_sale products_product_sale_product_id_sale_id_1ccb2239_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.products_product_sale
    ADD CONSTRAINT products_product_sale_product_id_sale_id_1ccb2239_uniq UNIQUE (product_id, sale_id);
 v   ALTER TABLE ONLY public.products_product_sale DROP CONSTRAINT products_product_sale_product_id_sale_id_1ccb2239_uniq;
       public            postgres    false    258    258            �           2606    45103 0   products_productclass products_productclass_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.products_productclass
    ADD CONSTRAINT products_productclass_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.products_productclass DROP CONSTRAINT products_productclass_pkey;
       public            postgres    false    244            �           2606    45145 0   products_productimage products_productimage_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimage_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.products_productimage DROP CONSTRAINT products_productimage_pkey;
       public            postgres    false    256            �           2606    45214 ^   products_promotionlist_product products_promotionlist_p_promotionlist_id_product_29afce22_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.products_promotionlist_product
    ADD CONSTRAINT products_promotionlist_p_promotionlist_id_product_29afce22_uniq UNIQUE (promotionlist_id, product_id);
 �   ALTER TABLE ONLY public.products_promotionlist_product DROP CONSTRAINT products_promotionlist_p_promotionlist_id_product_29afce22_uniq;
       public            postgres    false    254    254            �           2606    45131 2   products_promotionlist products_promotionlist_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.products_promotionlist
    ADD CONSTRAINT products_promotionlist_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.products_promotionlist DROP CONSTRAINT products_promotionlist_pkey;
       public            postgres    false    252            �           2606    45138 B   products_promotionlist_product products_promotionlist_product_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.products_promotionlist_product
    ADD CONSTRAINT products_promotionlist_product_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.products_promotionlist_product DROP CONSTRAINT products_promotionlist_product_pkey;
       public            postgres    false    254            �           2606    45110     products_sale products_sale_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.products_sale
    ADD CONSTRAINT products_sale_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.products_sale DROP CONSTRAINT products_sale_pkey;
       public            postgres    false    246            �           2606    45124 "   products_stock products_stock_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.products_stock DROP CONSTRAINT products_stock_pkey;
       public            postgres    false    250            �           2606    45117 2   products_stocklocation products_stocklocation_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.products_stocklocation
    ADD CONSTRAINT products_stocklocation_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.products_stocklocation DROP CONSTRAINT products_stocklocation_pkey;
       public            postgres    false    248            �           1259    45041 !   accounts_address_user_id_c8c74ddf    INDEX     a   CREATE INDEX accounts_address_user_id_c8c74ddf ON public.accounts_address USING btree (user_id);
 5   DROP INDEX public.accounts_address_user_id_c8c74ddf;
       public            postgres    false    232            r           1259    45007 !   accounts_user_email_b2644a56_like    INDEX     p   CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);
 5   DROP INDEX public.accounts_user_email_b2644a56_like;
       public            postgres    false    226            w           1259    45021 &   accounts_user_groups_group_id_bd11a704    INDEX     k   CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);
 :   DROP INDEX public.accounts_user_groups_group_id_bd11a704;
       public            postgres    false    228            z           1259    45020 %   accounts_user_groups_user_id_52b62117    INDEX     i   CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);
 9   DROP INDEX public.accounts_user_groups_user_id_52b62117;
       public            postgres    false    228                       1259    45035 5   accounts_user_user_permissions_permission_id_113bb443    INDEX     �   CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);
 I   DROP INDEX public.accounts_user_user_permissions_permission_id_113bb443;
       public            postgres    false    230            �           1259    45034 /   accounts_user_user_permissions_user_id_e4f0a161    INDEX     }   CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);
 C   DROP INDEX public.accounts_user_user_permissions_user_id_e4f0a161;
       public            postgres    false    230            g           1259    44974    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    222            l           1259    44970 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    224            o           1259    44971 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    224            b           1259    44956 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    220            �           1259    45062 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    234            �           1259    45063 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    234            �           1259    45383 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    273            �           1259    45382 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    273            �           1259    45324 (   orders_order_billing_address_id_deb02e83    INDEX     o   CREATE INDEX orders_order_billing_address_id_deb02e83 ON public.orders_order USING btree (billing_address_id);
 <   DROP INDEX public.orders_order_billing_address_id_deb02e83;
       public            postgres    false    260            �           1259    45325 )   orders_order_shipping_address_id_c4f8227a    INDEX     q   CREATE INDEX orders_order_shipping_address_id_c4f8227a ON public.orders_order USING btree (shipping_address_id);
 =   DROP INDEX public.orders_order_shipping_address_id_c4f8227a;
       public            postgres    false    260            �           1259    45326    orders_order_user_id_e9b59eb1    INDEX     Y   CREATE INDEX orders_order_user_id_e9b59eb1 ON public.orders_order USING btree (user_id);
 1   DROP INDEX public.orders_order_user_id_e9b59eb1;
       public            postgres    false    260            �           1259    45369     orders_order_voucher_id_eeecc8c2    INDEX     _   CREATE INDEX orders_order_voucher_id_eeecc8c2 ON public.orders_order USING btree (voucher_id);
 4   DROP INDEX public.orders_order_voucher_id_eeecc8c2;
       public            postgres    false    260            �           1259    45337 $   orders_ordereditem_order_id_4ebf4cea    INDEX     g   CREATE INDEX orders_ordereditem_order_id_4ebf4cea ON public.orders_ordereditem USING btree (order_id);
 8   DROP INDEX public.orders_ordereditem_order_id_4ebf4cea;
       public            postgres    false    262            �           1259    45338 &   orders_ordereditem_product_id_2ce7942d    INDEX     k   CREATE INDEX orders_ordereditem_product_id_2ce7942d ON public.orders_ordereditem USING btree (product_id);
 :   DROP INDEX public.orders_ordereditem_product_id_2ce7942d;
       public            postgres    false    262            �           1259    45367 *   orders_orderhistoryentry_order_id_f4a1138a    INDEX     s   CREATE INDEX orders_orderhistoryentry_order_id_f4a1138a ON public.orders_orderhistoryentry USING btree (order_id);
 >   DROP INDEX public.orders_orderhistoryentry_order_id_f4a1138a;
       public            postgres    false    270            �           1259    45368 )   orders_orderhistoryentry_user_id_d8d02163    INDEX     q   CREATE INDEX orders_orderhistoryentry_user_id_d8d02163 ON public.orders_orderhistoryentry USING btree (user_id);
 =   DROP INDEX public.orders_orderhistoryentry_user_id_d8d02163;
       public            postgres    false    270            �           1259    45356 0   orders_orderitemscomment_order_items_id_48953466    INDEX        CREATE INDEX orders_orderitemscomment_order_items_id_48953466 ON public.orders_orderitemscomment USING btree (order_items_id);
 D   DROP INDEX public.orders_orderitemscomment_order_items_id_48953466;
       public            postgres    false    268            �           1259    45349 "   orders_ordernote_order_id_debc8134    INDEX     c   CREATE INDEX orders_ordernote_order_id_debc8134 ON public.orders_ordernote USING btree (order_id);
 6   DROP INDEX public.orders_ordernote_order_id_debc8134;
       public            postgres    false    266            �           1259    45350 !   orders_ordernote_user_id_c8dec706    INDEX     a   CREATE INDEX orders_ordernote_user_id_c8dec706 ON public.orders_ordernote USING btree (user_id);
 5   DROP INDEX public.orders_ordernote_user_id_c8dec706;
       public            postgres    false    266            �           1259    45427 $   pages_notification_order_id_72f19911    INDEX     g   CREATE INDEX pages_notification_order_id_72f19911 ON public.pages_notification USING btree (order_id);
 8   DROP INDEX public.pages_notification_order_id_72f19911;
       public            postgres    false    283            �           1259    45168 "   products_product_brand_id_3e2e8fd1    INDEX     c   CREATE INDEX products_product_brand_id_3e2e8fd1 ON public.products_product USING btree (brand_id);
 6   DROP INDEX public.products_product_brand_id_3e2e8fd1;
       public            postgres    false    240            �           1259    45182 .   products_product_category_category_id_6bd7b606    INDEX     {   CREATE INDEX products_product_category_category_id_6bd7b606 ON public.products_product_category USING btree (category_id);
 B   DROP INDEX public.products_product_category_category_id_6bd7b606;
       public            postgres    false    242            �           1259    45181 -   products_product_category_product_id_08fb2842    INDEX     y   CREATE INDEX products_product_category_product_id_08fb2842 ON public.products_product_category USING btree (product_id);
 A   DROP INDEX public.products_product_category_product_id_08fb2842;
       public            postgres    false    242            �           1259    45234 *   products_product_product_class_id_018f266c    INDEX     s   CREATE INDEX products_product_product_class_id_018f266c ON public.products_product USING btree (product_class_id);
 >   DROP INDEX public.products_product_product_class_id_018f266c;
       public            postgres    false    240            �           1259    45247 )   products_product_sale_product_id_246c5b23    INDEX     q   CREATE INDEX products_product_sale_product_id_246c5b23 ON public.products_product_sale USING btree (product_id);
 =   DROP INDEX public.products_product_sale_product_id_246c5b23;
       public            postgres    false    258            �           1259    45248 &   products_product_sale_sale_id_5a92179c    INDEX     k   CREATE INDEX products_product_sale_sale_id_5a92179c ON public.products_product_sale USING btree (sale_id);
 :   DROP INDEX public.products_product_sale_sale_id_5a92179c;
       public            postgres    false    258            �           1259    45233 &   products_productclass_sale_id_d5a03599    INDEX     k   CREATE INDEX products_productclass_sale_id_d5a03599 ON public.products_productclass USING btree (sale_id);
 :   DROP INDEX public.products_productclass_sale_id_d5a03599;
       public            postgres    false    244            �           1259    45232 )   products_productimage_product_id_e747596a    INDEX     q   CREATE INDEX products_productimage_product_id_e747596a ON public.products_productimage USING btree (product_id);
 =   DROP INDEX public.products_productimage_product_id_e747596a;
       public            postgres    false    256            �           1259    45210 (   products_promotionlist_brand_id_2088625a    INDEX     o   CREATE INDEX products_promotionlist_brand_id_2088625a ON public.products_promotionlist USING btree (brand_id);
 <   DROP INDEX public.products_promotionlist_brand_id_2088625a;
       public            postgres    false    252            �           1259    45211 +   products_promotionlist_category_id_5808e503    INDEX     u   CREATE INDEX products_promotionlist_category_id_5808e503 ON public.products_promotionlist USING btree (category_id);
 ?   DROP INDEX public.products_promotionlist_category_id_5808e503;
       public            postgres    false    252            �           1259    45212 0   products_promotionlist_product_class_id_423bf5af    INDEX        CREATE INDEX products_promotionlist_product_class_id_423bf5af ON public.products_promotionlist USING btree (product_class_id);
 D   DROP INDEX public.products_promotionlist_product_class_id_423bf5af;
       public            postgres    false    252            �           1259    45226 2   products_promotionlist_product_product_id_7b8806eb    INDEX     �   CREATE INDEX products_promotionlist_product_product_id_7b8806eb ON public.products_promotionlist_product USING btree (product_id);
 F   DROP INDEX public.products_promotionlist_product_product_id_7b8806eb;
       public            postgres    false    254            �           1259    45225 8   products_promotionlist_product_promotionlist_id_ae1bacd1    INDEX     �   CREATE INDEX products_promotionlist_product_promotionlist_id_ae1bacd1 ON public.products_promotionlist_product USING btree (promotionlist_id);
 L   DROP INDEX public.products_promotionlist_product_promotionlist_id_ae1bacd1;
       public            postgres    false    254            �           1259    45193 #   products_stock_location_id_2ec66df8    INDEX     e   CREATE INDEX products_stock_location_id_2ec66df8 ON public.products_stock USING btree (location_id);
 7   DROP INDEX public.products_stock_location_id_2ec66df8;
       public            postgres    false    250            �           1259    45194 "   products_stock_product_id_170f916b    INDEX     c   CREATE INDEX products_stock_product_id_170f916b ON public.products_stock USING btree (product_id);
 6   DROP INDEX public.products_stock_product_id_170f916b;
       public            postgres    false    250            �           2606    45036 F   accounts_address accounts_address_user_id_c8c74ddf_fk_accounts_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_address
    ADD CONSTRAINT accounts_address_user_id_c8c74ddf_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.accounts_address DROP CONSTRAINT accounts_address_user_id_c8c74ddf_fk_accounts_user_id;
       public          postgres    false    3702    232    226            �           2606    45015 L   accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id;
       public          postgres    false    222    3691    228            �           2606    45010 N   accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_user_groups DROP CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id;
       public          postgres    false    226    3702    228            �           2606    45029 W   accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm;
       public          postgres    false    230    220    3686            �           2606    45024 Q   accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.accounts_user_user_permissions DROP CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_;
       public          postgres    false    226    3702    230            �           2606    44965 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    224    3686    220            �           2606    44960 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    222    224    3691            �           2606    44951 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    218    220    3681            �           2606    45052 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    234    218    3681            �           2606    45057 F   django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id;
       public          postgres    false    3702    234    226                       2606    45370 N   orders_deliverygroup orders_deliverygroup_order_id_e4ae3cbc_fk_orders_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_deliverygroup
    ADD CONSTRAINT orders_deliverygroup_order_id_e4ae3cbc_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.orders_deliverygroup DROP CONSTRAINT orders_deliverygroup_order_id_e4ae3cbc_fk_orders_order_id;
       public          postgres    false    260    3769    272            �           2606    45309 L   orders_order orders_order_billing_address_id_deb02e83_fk_accounts_address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_billing_address_id_deb02e83_fk_accounts_address_id FOREIGN KEY (billing_address_id) REFERENCES public.accounts_address(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_billing_address_id_deb02e83_fk_accounts_address_id;
       public          postgres    false    3716    260    232            �           2606    45314 C   orders_order orders_order_shipping_address_id_c4f8227a_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_shipping_address_id_c4f8227a_fk_accounts_ FOREIGN KEY (shipping_address_id) REFERENCES public.accounts_address(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_shipping_address_id_c4f8227a_fk_accounts_;
       public          postgres    false    260    3716    232            �           2606    45319 >   orders_order orders_order_user_id_e9b59eb1_fk_accounts_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_user_id_e9b59eb1_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_user_id_e9b59eb1_fk_accounts_user_id;
       public          postgres    false    3702    260    226            �           2606    45295 B   orders_order orders_order_voucher_id_eeecc8c2_fk_orders_voucher_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_voucher_id_eeecc8c2_fk_orders_voucher_id FOREIGN KEY (voucher_id) REFERENCES public.orders_voucher(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.orders_order DROP CONSTRAINT orders_order_voucher_id_eeecc8c2_fk_orders_voucher_id;
       public          postgres    false    264    260    3778                        2606    45327 J   orders_ordereditem orders_ordereditem_order_id_4ebf4cea_fk_orders_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_ordereditem
    ADD CONSTRAINT orders_ordereditem_order_id_4ebf4cea_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.orders_ordereditem DROP CONSTRAINT orders_ordereditem_order_id_4ebf4cea_fk_orders_order_id;
       public          postgres    false    3769    262    260                       2606    45332 P   orders_ordereditem orders_ordereditem_product_id_2ce7942d_fk_products_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_ordereditem
    ADD CONSTRAINT orders_ordereditem_product_id_2ce7942d_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.orders_ordereditem DROP CONSTRAINT orders_ordereditem_product_id_2ce7942d_fk_products_product_id;
       public          postgres    false    3728    262    240                       2606    45357 V   orders_orderhistoryentry orders_orderhistoryentry_order_id_f4a1138a_fk_orders_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_orderhistoryentry
    ADD CONSTRAINT orders_orderhistoryentry_order_id_f4a1138a_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.orders_orderhistoryentry DROP CONSTRAINT orders_orderhistoryentry_order_id_f4a1138a_fk_orders_order_id;
       public          postgres    false    270    3769    260                       2606    45362 V   orders_orderhistoryentry orders_orderhistoryentry_user_id_d8d02163_fk_accounts_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_orderhistoryentry
    ADD CONSTRAINT orders_orderhistoryentry_user_id_d8d02163_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.orders_orderhistoryentry DROP CONSTRAINT orders_orderhistoryentry_user_id_d8d02163_fk_accounts_user_id;
       public          postgres    false    3702    270    226                       2606    45351 R   orders_orderitemscomment orders_orderitemscom_order_items_id_48953466_fk_orders_or    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_orderitemscomment
    ADD CONSTRAINT orders_orderitemscom_order_items_id_48953466_fk_orders_or FOREIGN KEY (order_items_id) REFERENCES public.orders_ordereditem(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.orders_orderitemscomment DROP CONSTRAINT orders_orderitemscom_order_items_id_48953466_fk_orders_or;
       public          postgres    false    262    268    3775                       2606    45339 F   orders_ordernote orders_ordernote_order_id_debc8134_fk_orders_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_ordernote
    ADD CONSTRAINT orders_ordernote_order_id_debc8134_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.orders_ordernote DROP CONSTRAINT orders_ordernote_order_id_debc8134_fk_orders_order_id;
       public          postgres    false    3769    260    266                       2606    45344 F   orders_ordernote orders_ordernote_user_id_c8dec706_fk_accounts_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_ordernote
    ADD CONSTRAINT orders_ordernote_user_id_c8dec706_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.orders_ordernote DROP CONSTRAINT orders_ordernote_user_id_c8dec706_fk_accounts_user_id;
       public          postgres    false    226    266    3702                       2606    45422 J   pages_notification pages_notification_order_id_72f19911_fk_orders_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_notification
    ADD CONSTRAINT pages_notification_order_id_72f19911_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.pages_notification DROP CONSTRAINT pages_notification_order_id_72f19911_fk_orders_order_id;
       public          postgres    false    283    3769    260            �           2606    45163 H   products_product products_product_brand_id_3e2e8fd1_fk_products_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_brand_id_3e2e8fd1_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_brand_id_3e2e8fd1_fk_products_brand_id;
       public          postgres    false    236    240    3723            �           2606    45176 P   products_product_category products_product_cat_category_id_6bd7b606_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_product_category
    ADD CONSTRAINT products_product_cat_category_id_6bd7b606_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.products_product_category DROP CONSTRAINT products_product_cat_category_id_6bd7b606_fk_products_;
       public          postgres    false    242    3725    238            �           2606    45171 O   products_product_category products_product_cat_product_id_08fb2842_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_product_category
    ADD CONSTRAINT products_product_cat_product_id_08fb2842_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.products_product_category DROP CONSTRAINT products_product_cat_product_id_08fb2842_fk_products_;
       public          postgres    false    3728    242    240            �           2606    45151 H   products_product products_product_product_class_id_018f266c_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_product_class_id_018f266c_fk_products_ FOREIGN KEY (product_class_id) REFERENCES public.products_productclass(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_product_class_id_018f266c_fk_products_;
       public          postgres    false    240    244    3737            �           2606    45237 K   products_product_sale products_product_sal_product_id_246c5b23_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_product_sale
    ADD CONSTRAINT products_product_sal_product_id_246c5b23_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.products_product_sale DROP CONSTRAINT products_product_sal_product_id_246c5b23_fk_products_;
       public          postgres    false    258    240    3728            �           2606    45242 P   products_product_sale products_product_sale_sale_id_5a92179c_fk_products_sale_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_product_sale
    ADD CONSTRAINT products_product_sale_sale_id_5a92179c_fk_products_sale_id FOREIGN KEY (sale_id) REFERENCES public.products_sale(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.products_product_sale DROP CONSTRAINT products_product_sale_sale_id_5a92179c_fk_products_sale_id;
       public          postgres    false    3740    258    246            �           2606    45146 P   products_productclass products_productclass_sale_id_d5a03599_fk_products_sale_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_productclass
    ADD CONSTRAINT products_productclass_sale_id_d5a03599_fk_products_sale_id FOREIGN KEY (sale_id) REFERENCES public.products_sale(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.products_productclass DROP CONSTRAINT products_productclass_sale_id_d5a03599_fk_products_sale_id;
       public          postgres    false    244    3740    246            �           2606    45227 K   products_productimage products_productimag_product_id_e747596a_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimag_product_id_e747596a_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.products_productimage DROP CONSTRAINT products_productimag_product_id_e747596a_fk_products_;
       public          postgres    false    240    256    3728            �           2606    45200 M   products_promotionlist products_promotionli_category_id_5808e503_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_promotionlist
    ADD CONSTRAINT products_promotionli_category_id_5808e503_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.products_promotionlist DROP CONSTRAINT products_promotionli_category_id_5808e503_fk_products_;
       public          postgres    false    238    252    3725            �           2606    45205 R   products_promotionlist products_promotionli_product_class_id_423bf5af_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_promotionlist
    ADD CONSTRAINT products_promotionli_product_class_id_423bf5af_fk_products_ FOREIGN KEY (product_class_id) REFERENCES public.products_productclass(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.products_promotionlist DROP CONSTRAINT products_promotionli_product_class_id_423bf5af_fk_products_;
       public          postgres    false    252    244    3737            �           2606    45220 T   products_promotionlist_product products_promotionli_product_id_7b8806eb_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_promotionlist_product
    ADD CONSTRAINT products_promotionli_product_id_7b8806eb_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.products_promotionlist_product DROP CONSTRAINT products_promotionli_product_id_7b8806eb_fk_products_;
       public          postgres    false    3728    240    254            �           2606    45215 Z   products_promotionlist_product products_promotionli_promotionlist_id_ae1bacd1_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_promotionlist_product
    ADD CONSTRAINT products_promotionli_promotionlist_id_ae1bacd1_fk_products_ FOREIGN KEY (promotionlist_id) REFERENCES public.products_promotionlist(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.products_promotionlist_product DROP CONSTRAINT products_promotionli_promotionlist_id_ae1bacd1_fk_products_;
       public          postgres    false    252    3750    254            �           2606    45195 T   products_promotionlist products_promotionlist_brand_id_2088625a_fk_products_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_promotionlist
    ADD CONSTRAINT products_promotionlist_brand_id_2088625a_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.products_promotionlist DROP CONSTRAINT products_promotionlist_brand_id_2088625a_fk_products_brand_id;
       public          postgres    false    252    236    3723            �           2606    45183 ?   products_stock products_stock_location_id_2ec66df8_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_location_id_2ec66df8_fk_products_ FOREIGN KEY (location_id) REFERENCES public.products_stocklocation(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.products_stock DROP CONSTRAINT products_stock_location_id_2ec66df8_fk_products_;
       public          postgres    false    3742    250    248            �           2606    45188 H   products_stock products_stock_product_id_170f916b_fk_products_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_product_id_170f916b_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.products_stock DROP CONSTRAINT products_stock_product_id_170f916b_fk_products_product_id;
       public          postgres    false    3728    250    240            �   D   x�3��Lή��IM崀ΌlΜļ��R +#9���R9A��I�!���(4+����� Q�      �   �   x�E��N�@E��Wt��:308��X˂6M)��B[ ��~���x�7��\N�l��%>����g�����>J�QU�E�RCb�"�.V�E�Z�ç��i�r95�F��j�|h�dy	�Lx��T�L�pH�Q���)S	��n�d]���<����&\L��H�
�j� ���sj �J�6MM�h�-��CX����1Y_�g:��Tm1� b\F����˲~ ?�Q�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   d  x�m�[��0E��*X�(����lc��4��@zԻ?�\��|�Զϕ�C��簔�8���ZN���.�۱��#��a�N�
S=8N�i�`�����y��07!P���>oۼ.E��d´(�@��C?Œ ��(*�;w�����zG/��7��x���Љ�!��-��e]v{����1'/BSn�T'�I`�R|�n	O��oE4���b�h�M��6^�F��QV��#=�ꃨ	�"RE��y���YΏ��R41?L�ʠ@2V�A��,TB���F[���7{�_�^t"�����L9I�9��?	�60�'�Ib�'I���\^���Y�~Kv"��QUJ��`U�K��B��]�������c��-�ޑ��j	
�� �	�̫	$�Z�}�3_�����!��p�U�R�<uB�,M��J��r)��5-��x�XT��sR�� ���R#Z	/C��.�5]Ww,�#����?B#���$?<#	�A.<6#%y<��uً*744�j@|2�����A+�
g 3�Ԫ�܆m+���9Ӝ�
�5)Ҽq��6�H�iK �	��h�MEE'���4��e>�<�O "��qD�����ǯʝ����}#⢄����iU����Fb[��䑰h�N�����������2OǠ�i�D�bcZՒ����ۼ�;��2̺Iӥ�IrKb(�O��C�LI�oK�͚����?gl��3��fE^7�"o�#�YyӬ�f.�zm�8��Y��7�j/�g T�� -O��,^�aU�e���=��éBCӫ2D�S��d"��+EFZ�>G�?0�jIȇՒȐ1ВHxZ?k�i,�}��Qd��M��!S�8Pe~@Mԉ,��̰��k}]>���ICCsVU ��s�S�?p�Z���@��Xf:}=�+�Tԍ\M7a�}v-#�W2���:F�����!����KHd����ٷ���~�u+�~�l����,n#���dq�X?��²�$�t����W�JE�<ԝ�V�O�!�c��'�yw����a�q����6M6~<�铊f�g�]�E��*I�/�,şYI
���L��J���aY\��FP���S��?�����1�?%s��      �   �  x��\�sTE����TY��2w����ӆ��Y�WQC2�@��f&��e��_�B麄E�ǪUR����03�'��=�}'��w�G�T�������Σ�&(��HX���7%."��-�01}�6W[(7+��KoL���+��o����	x�B�(�� a��t�v�Zid-g�rS"22D�P�����<����P���|��k�J3s��Y/K��(D\
i�]/&f�եS��ez=S!������t�^)/d�W��\E�0�n�j�p�ܨ-e#���(�+4`d�
�K�F��N��^��ǫ�������L�1W��nVkK�;��+g*�������+�LZg����Յ���V�v���M��ڛ�ʧ�۵=�P/I I�7�}5�ΥmF��(�8Z�2��ז�'�����Fu����TF#B0X�����k$��X�ƊЯ��8�40*�!n1B�B�Ʀ)Ut �8�л��@DLH.� rq�C�wC�	�j�8��_,���Z�A�bhh��x$�-8����`�q��r�0Z"À����ﴮ}� ,@hr���DTr���;_��Zj�}���o�W�o�����R
sg!�v	�0y�^�_�k���W+��k�NV暉�����j�����R��5� �N�~u�)ɬ��6�J��#)Hol�#�ut�}����o�\�����QSI#T��դ%�")0`0oҨ'�z�~����l����7o����w?S���1Όo���wo����\\����H<�޽�POe����D�7����������:�!��PUm����M~��\�K~�� �BI�H	F�_�|�^9Q[nT
O��"mrE���HQ�Lwb�y���ܩޣ���3�RK��e�8s-jx�4!���"�j�%t��%��D���Q�j)<� ���А�P(��"T)1�M��(CΡ�V	�9�ۡ�.V�5Tۄ[!�p5�%��L	jwe!�0�q0W\�+�d�v�x?�*�|f��(7a擗�./t�6�Y/!`����I��7��G�z� ��h��X�Y���Wꅃˋ��ϡ��ژ.כ�RaOya@�|�Yn.7�x��,���i#��?��!k��з%�T�D������Y9� � "P��8�B����:�>]�z�s�R����\l5��11A%��xCL�\������21y�	6pp͍�D6ѹ�Һ�����̽�4�LcU�0��K{�������U����Z�������wn��3��������ó���P�u�f1+��o]�o�翢������IP�fS&��8�#�f�mt����C!.G��a#���H�x�=$�M5ML�+]ͤ��ɦF0�sT��	�떿��� ����$ڵ�<��lO����#!͠�����X�����[��S�j���և9��	�Z2>��o�q���r��C����T8ɉD�ۣ��F�&RT�ZɈ��
ۢ�@�u�H���G��3����L���}Lq(֋\鱼d(TB�TT@�	��o�m���QC'�H�[�F�h�=m��#�$$�B�*���Zy\��WɑM�2�����&.�ڟ�������T(b[�X�
%�{��K\�<~����˅���7����
��
ܒ�Юg#@C���T�diɘb)�+Mp�ĕ���o�o���(r%�1HJx��cO�������z!�J �� %�1�FJR��l����_�+��/���]g�6&�H+`���̟��� .��~���/��Z��~����+���'W2��%Q�K��\Q�ٽ����7@�pX��ݵ��^�L�RiH\x�ρ��u��i�XM0-�޷���d���LG3! /QQI�7�
u�+��ǷZ��]�����_H�ц��D�@�PYT�"���r����*E?ҾOR�bS������(iK$���r4w_� �P)C�LD����#��:ٶJq��}%#4�^�;�2AsY��fY�E�����y�G���Y�B�A�>(����|�R���~O]�BB<Nѝ��ϥ��/Νo}w���w���'3n��j���9F[�i�~��Ӑh���{(�_���_'`33���˟���o����f��uH ���<��(�e�`�>���nߺ�y^����`�|��LG�c>�|�������Y�סGw�$bg\+�%�4N��n|���~��֗_u�\_{�ղ���:&T1"���	�Mm�I�j�X��t���Њ���0W�=�z�#�%Qv�E��a�z4�C���z��ԑ^(N?=;=���E�R��/*Q��}	WSIe�L7�o�齸�����μP|���3��{�O�q�ȡ"#�Hyo��I��b�:�O��o���f�x�|�X�Y<T�/����Jy���4&ԯ�MOG6H���t�Ǖ�P�qi��^������̦��k��D ��q-u�����+Z����v.��<)����HS�D��k�_i��uk5�*�fRTm�S� ���8u�5u�i8�<b��*da\�Z� |�M��^�5v��aaG�ʝ���}3����|Hݛ���1烘���,D��n@T<6D]FIY��A�╵s������[���.$Ķ�քǎ����Z_l����`Bo��X:i,�}s�%�>����{�y��/?�<:����]h��5���PCoO�����6�=0���F��'X{�[(����侙���{H4"��.N�j���E�Pd=D��⟎̏���A�/��f
N��]>�m�D=��܁]��^Y}�T����Q	f���x���W�G�H�u�i��`����.�{���0VID��xh"�B��=�+����l|��R�R��]奥J��7Z����%�X�~L�P` Fs�T��7*��X��8��i0u��{��8�8Q{-~�2L(�)��̓�]$������Y�7�� �e#0	�m�9 eh�Љ8�َ}�8��-[�FB,�F�����wz��Y����R��z�a�c��`}+O��5��xv&w�mm�C�(��\�12�j��.7�(�zm�f'���� 9��Ţ:R�zrV���xj��ˋP�j/i?BK7�3��!��n`0������<Y�ݳ'k8��] �"�5a�g x�� HN	3��׶�(����e�HX���_^Vt��o���-&犝HFm�h��'rmQ$l��򨦘�I���ќ��`�*���31I��/�o����^��1�au���?�|�7v��)ؿU�ʗ[��p����2�g7}أ������b�����י�J�ɡ\�R�ZYrn�{�C�]T�ƄuF�;�}�c�n%7��0�bD��[�>G����՘>}���u�v������g[g!8�=#��z���<;��Fx�[�\��ʦP�(�h�䂻�r0�O����3��\my�y�Lya��I�x��v� �O�Z|�
���(�郲�wk�E�f����=�GW!ޜ�U�֙����%��#x�4��@�I���)d؞�G�t���L[�b�����t6H;��"㙊�����Z�H�f��!s]68�M��*k�H��N(�2:n �C�6��%�c{�1�4q�4��}\f���X>�	�2��P��S.�΁���̹�*�d ���ș�rr�4���H3V�	��+�ۄ�Ќ�w����Mh���I�H�B��>��UD���;�f�H�D���ǻ(��FZ#R.���O?�\��x��2���\��7��9%��p���R@ߨ��R�͍@H�5��e�Ƥ��2B1n�)�%!#����S�l'^i�=f�NhBB�V�`�ҌW�N�)W��*��tv�+{mQ�7(
��l����ɼ`-U�f�[�0��%�A2����W�@c
�B��[_�0iB�ZU��Jl%MU$ g�}��n�g a ��V�_��f��R7\�5�b�r��O�w�c�      �      x�e�M�� ���0�B��2n�
8�P)��M�f�>?�V֧�U�s-#e[��K
́2�ߤ/�8(G�����������Nj��Ȟ�C�8�J�FG-W����1��a��Ln����z7�L5܂�u��Z�|s�UWl���JD�=IYz��y���\�̠�k�mDЧP�="-��Зͭ�&],~�/���"0;eݫ�K�F��z_��`����{�ߜч�	�a�Oj�>��4OO6e���d�`Λ�]^.�?�e�y��e|�
���9��� ��+�      �   �  x����n�0���S����3��YV�\pSk���ۯ1)IZ��B��y��CQ�~r�4�7�0����m���OH~ �V��� C�I��(�Dׅ7g������s�("2�v�^8\HrQ�M�ƶ��fp����C�O4�}7���]��3�o(zF�cz����.E3��B�]S�G.'Ӹ�` �Ԃ��_#Z;N�G���}c
� Ԇif�a�)�Ű}����C��x��o��hl�c��s�h�<�ȆS���q�	"%dl$�ş�PR���( g�1�yx�ӈ��ۖ[ 3�"g��OWa���#�relI������⌀ʓ��s?=�Ȃ3�k	)�M���	L����%�)a�������De��9��.z�,���l�Kk��~��&hR�V�.���\?Ҽ�����"��Ż"^"G���y��eB ϱC,��2��Њ��*�4����A��S?w�K>�k�m���a�/��ٯ7?���~Xߦ0�6��)��"%G0�w�Mrp��!����'y�LU�5�o���(��EqC��	"��5!�YEh�UJT�@Q^��0�����*���Rj�zuA]���������n���(�Ya�h������U �Ř� �H�����(      �   3  x���Yn�P @��x��l�	�a��!�T�3��3٬�I��k�tWpt��X�Q�WsFr�aU�0׶I4a�e����Rk*dg�\���M.!������۰��h�=`�p��8³�Cc��������]�<�ۚиA]�<W�a�������rX'�Q:H�҃y֑��}	Ah��(��l���G_�FD�=�5ZbWƮ#�{ծ'I�:��R���l�X��S�s���l<'
�nn��xA �%�
�BN�H"d���p�+� m~��TW��]HqY�G���:�o�|��N!�%j�-6��܉᭬�Xzn�m�;���l��56���Ϭ�)*����{֍'R�	�fa�/92{mN���(o~�Tg�M�2�1�gl_�Ŀ�o�ݡ۲����G�Yu�ET�*'M��La��a~a��O����.�lcΔ���J�����D	��A�&�`��h|< �߆GM�9+��ʟi^����C�$�H�rY�{������ݔ�M�m1�� �+�Gi��A�K���B'!�E���j�X�>-      �      x������ � �      �   �  x�uVI��0;˯�=V�1/�s^��W�șH��U��D�I�&$����Г}�O�a�����SjR%��}U7�Ѵ}~l'SK6׈a�`s�O��{�M���x�Z�ut�U^��I<�h�R�5����n8K~�e�>k����1�:�E�<���F�/|i�ǭuH	��v%��D&�+����i�N��A�~�s�����T18�5V,N���~�q.�o�sRU%�w��3�jo��0ua�)D�et�/�?V{����<�vk�z�����y�1�6�/��d�d�7H(ʎ�I�_�&"	�α?CY=���H0}0���|#��i7I@L�,AAT�@�i8�s㪡�J�`�D��h�= }t4�L��m�)�B��r3�k<F`#Z{����#GJ�a@�9�x�Y��r���V&�H-c���'�n��~�N�C���dgQ̅�o�0�Vr��bc���
��M���R�ᠳ
W�;���7���U�^ju�MA��UV!��2i�"	�.^�n\ED�K��
��
��,՛�Ge�7��ϡ®^�F4_[�=V���ע{W��*0_{�(</Q�l��oG��8�m���k�e�\kj�y����Z<�y;x��_�ŝX᫅u������_7.ƂO'r*d_Un'�߄�����x�l�Z      �   �   x�m���0C��0�)�/�	���zi�0|x�HQ�����ш.̭��3G<���O�P��wܫx)Ig)��T�!�a�-����h��&��Lj��CQג�������Y��j��]Se��T�M�:����p�C��:�`�      �      x������ � �      �   �   x�uλ�0���w��(��˾�,4AA�)�  �!��I�
$�!�N���'7]��Χ�rx܎�8
$m���!,"�gD̶
��m�����u��U
������ n7��o����Ii�Z�����qN(��(��Za��Ԡ�"�	Y�vP��;��s��U-&��`��	�RED      �      x������ � �      �   M   x�3�t��Q(�O)M.��M,�4�44�30�,H-JN�+Q�OK�4202�5 "CN�gs:�j "ƺF�����\1z\\\ +��      �   �   x�=�I�0  �s���x���E�1i�D�a���z@0��S�0BH:�"N�ˎYGQ"U	ͼ@��|��R�U�fF�*0A��z(~�aqF�)%b�X���Kd�<���T�yd/{�De�����c��!�-��p��a���։PvՕ{ܺ�
�WB���:�      �   U   x�M���0г�K*�4�t�9J� ���{�h.����,tDZP^��s���0��U��N\����O	ee�����e��\$_���      �      x������ � �      �   �   x�]�;n�0�zy
�A��YR��G�k�[�a(������طʁ�S���_ү�Ho�C05f��h����F�LsR�m��6v@���b�3�2N�41]x@�p��|��(����LR�&`�OK^G�;���&VK���{�x�5+�Zd�eA�����q��b�(ܪ�9N�Z_;�V �C�*��[u���C�<�Mᵯ#�����r�z����P��3����
B>UOIv���Q�~��� Z7mD      �   X   x�3�4�4�34��36�346�(�,K,I�����Lt�u�LS.cdM&��z�L��j��2�442�3 BCd�X�p��qqq ^Y �      �      x�3�4�4����� 
��      �   �   x�3�|���钕\F���{�a�1��-�Ow�}�v�	�黀�˔����E!���1�ˌ�ٌ�{�r�s>���i�.�ȳM��,9���=]�8�<��݃�lC�g;Z�m_�t�$.Cc����!���]O{�<������ ��={      �   Z   x�3�t���K-N�4��J��822s2
@@d^	�1�WbA"T�Y�e��_����2J�L9��KK2R�K�3���"%\1z\\\ ��*�      �   �  x��XKob�^_�
6�l����YΣ�l2�����(�F�b�l-��0�1~a6����c�F�O��w忐�T]��v'��H��VݪS����wιf��=��n�[�i��!�>�f�����"W���|o��.�nZ�Ez�<����a]�nU&��[(,�����Y�&#�$���a��7:�pr,j%�ܚ�|+-`N^�V�欳}�w#�4N�&�y'��a^�y+�E����:M�����%sA]`x�n�x���˫�sO<߷�����:�^��;VxȢik��	q��7�"z�����Y���� �����Gݾu?z^hx=�n���+�\^���>c��͙K����d(��� �2�<R|��,��bk�q��]��M����V��V�q�<��/f�>Ͽ��3=��M�6xo�k��h�%Eb���{��`�����c�MS�>��3����t�����2��f�,̠�P��;�to;�������\�"��}�|�R;x�0���X��[��H������k���~��bp�8y�y�N~�o���A]V>��a��A�C�:�U��ev���ƩX:���8���`_5�azm����~#`x��a/���a,��~�l���&v�	�=Y&i�/X6��g�/�X&��5��FM���~�:��*Q@�Vl�cc��z����c0�Yka��j�Ԡ�!?��#D �&iH��H2�<�ɋ�u��i��d��k�h�%�޺$H��%b춠gX�j�ۗ��
X���T��0�����e�/$h&v/�O��K�N�5V���,�c�{�<�p���It$�.��aR�vS:{3!DC4�h���M��/6Tf��"5�{ݮֿ �F�:�Y�̨��JQ�����<��b��y������a���9eV��}攧�	�b>��H�e�@0tûܨ��k��#,�U�m�f-�<��Kd�,��twu���#��h������܏�������7�Q����[��#��m����^�����q2^�a��4�m��ӱ��0��VY���Aۦ�Q��|1��d��W¤;Db0&?ʌzp���y�/��倖�6LÜ�x��t����l }Y�K�wRZ�N�$�2�ԧ�W��\Z=���?�+�� ���^
�8z���KV��G��VD��c|a�J�b��80BW����/����L˛�VbE�%y2F�_t�����9�C��j��G�$�ok ���,����Q/϶_�s	���k�˚uهk���n O����7�m��	[��6�j@K@�������go�hZ_�
"��-�Y颕�B1��Zr7��� �ɑ-���P��*<����u�u�,��a�i�О�P�4jV).�՗ُ�»W��v�Rh_��t=c>XR�3��&��Ѡ$qǊ:f�(*/�vOqBn�(@��>��"�Z?l&�"A���N�P(+.�%��	�;,�Y�ZT�(�!x�� ��+��
]P�r�k��.6����:��c�F�6P�S��E&w�/Y{��7m����һb��s�F3�VYf#vFБu��sG�u��e�RN��Kt�S���X4�욧��*h8Po�TŮ�8 yq���Z1���ĩ�D$����D8�X'(�K}�K��U��h�(�[�5+/S�<�t���,����^�&�]���6��0�ʦ�6+�>�������t9���%렮��<�w�W�*�/�o�H�5tD��Uh����Ȫ�E����E1�V�X��R���0Z�,�k��	͠a��TRO�ҙK� 0�t�F;i^���8�?a�2�f3��% {�X���b����\0.��8�7�j�u"�<�YߋJ�8����xL�%Z���v�DQF��2��
Q �n��s\�*A=�*��BĒ�^N�c���&E��\�4=����[�:����,naVɳ��<�ȭ]b��/�����;����E"�U��ګ�\�/i|����G�a.�{)�p5Mcf�L�Q��n�^C^LM��8�۾G�7!�;$]���g��Hא��/IRV��!��$��4� ��S�U�Pg��ڙ?���_�����}������C1XI'B�\�U*��]֪j�� ����2݋�߹H�0v��Q�L�t�G)wK!�?��Qm��ְ֚E��~J��;OЭ�iR��Ϋ^���Ĩ�G)T%JV�i�B��~/N�
ק�{�7X/��G��-������e��9�����ً����ZD��3�O&�IΟw�^gJzg{IB��&�;9����<��`q���߿x>��DO9��T�Z�x�| 9B �k�����3U��i�3WiP�ީ�T:�"�q�ቖ]�}�Μ)'��5�{�7T�)%47A��N��:y�A}g��5����<Z1�D'�K|3�f�=����E�Z�D� �Q�P���[��TR=�)g�^RŘ��0�\��$M�9�
�^ؖU�@r8�G�����N��](��J��ʞ�6���W�U��NT� ��!~]��� �*�v��R��wX�0U��zŃ��6ȫ�K-�BP��8��Ө}C�xI��>�NAu���Ql��V�>\�dж��!�z#ح��N���x�l!r��h����0aY���1*	��6��и s=D�Xj4���D��z�ŜF�s/��y����>:�l�^��+�*���s?�꧋BH��,K)8��MD�	n� ]�0�t
E[-ВS] ��;_sWk�No/<���9����N�<�y,��1Oe����`�*�P���Ͱ ogR�>D�
���X�MQ]��-l�qi+����K)D��6��~�ke�7�����
6��o\���zÄ,�)aǤ�i��o��1ϵ����))�_;9��e�``aB���&�t;
:��Q�E�6e�@�ԝo��(u���]1��۪'.��zLd����"W>w����5�u1�tTɋ�x�Yc��(�G�y��e�	�nY"r��<K��z׼�����vJ";�.Si�{�877�/�}uX      �   c   x����@��b���^���:���!Ĉ$��AEQޓ�Xޛ�<��:�bܢ	%Mh�v�0�Eڨ]:�m��}���Ka*҇�{����������      �      x�3�4�4����� 	_      �   W   x�3�L�t����L-���2r��SSK�<3�djQjb�g�KM,�σ�A����9�%���\�@�KQf^6X�1X6� ̉���� @F�      �   e  x�u�]O�0��9���s������d"�d�K#s��K�%����}zr��b�s���ת��-�{��c�<_H��i�A 7�U u�'���ύp�$6��D��D�r#�����}9	*>F�c?�6 ��8YTI�����!p��E���F�%�
�s"���C���U@K�4��%��F	�V�i��mm��
%� Z���SN� �g,�Q���������Z��w,��(���� bv���i�1�5W�dٛ������f�f�z�őE�fq8�hq\��@})�|V@�u�"��,�y���O
 K7��_�		�Ҏ�v5�E˹	^� ����      �   .   x�3���/)�I�4�4��".SN����"NS��!W� �H	�      �      x������ � �      �   >   x�3�t��O��I,IU0UU�OK�,H-JN�+1M��L9T���`2`U� �=... �k      �   �   x�U��!�V0S���\6�8�D/���զەeCh��QZH�`ndnL��'�o����Ҧ�	��D��
6�D%h���U����Pv�JU!+U��T�~�o�����nj(Q���n�x\ �$O7�      �      x�3�O,J��/-NU������� @HS     