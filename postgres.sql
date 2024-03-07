PGDMP      5                {         
   yummymerge    16.0    16.0 H   -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            0           1262    35274 
   yummymerge    DATABASE     �   CREATE DATABASE yummymerge WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE yummymerge;
                postgres    false                        3079    35622    hstore 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;
    DROP EXTENSION hstore;
                   false            1           0    0    EXTENSION hstore    COMMENT     S   COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';
                        false    2            �            1259    35301 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    35300    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    223            2           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    222            �            1259    35310    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    35309    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    225            3           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    224            �            1259    35294    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    35293    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    221            4           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    220                       1259    35969    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false                       1259    35968    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    273            5           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    272            �            1259    35285    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    35284    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    219            6           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    218            �            1259    35276    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    35275    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    217            7           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    216                       1259    35990    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    35343    pages_address    TABLE     �  CREATE TABLE public.pages_address (
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
 !   DROP TABLE public.pages_address;
       public         heap    postgres    false            �            1259    35342    pages_address_id_seq    SEQUENCE     }   CREATE SEQUENCE public.pages_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pages_address_id_seq;
       public          postgres    false    227            8           0    0    pages_address_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pages_address_id_seq OWNED BY public.pages_address.id;
          public          postgres    false    226            �            1259    35352    pages_brand    TABLE     e   CREATE TABLE public.pages_brand (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.pages_brand;
       public         heap    postgres    false            �            1259    35351    pages_brand_id_seq    SEQUENCE     {   CREATE SEQUENCE public.pages_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.pages_brand_id_seq;
       public          postgres    false    229            9           0    0    pages_brand_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.pages_brand_id_seq OWNED BY public.pages_brand.id;
          public          postgres    false    228            �            1259    35359    pages_category    TABLE     �   CREATE TABLE public.pages_category (
    id bigint NOT NULL,
    "desc" text NOT NULL,
    hidden boolean NOT NULL,
    level integer NOT NULL,
    name character varying(50) NOT NULL,
    CONSTRAINT pages_category_level_check CHECK ((level >= 0))
);
 "   DROP TABLE public.pages_category;
       public         heap    postgres    false            �            1259    35358    pages_category_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.pages_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pages_category_id_seq;
       public          postgres    false    231            :           0    0    pages_category_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pages_category_id_seq OWNED BY public.pages_category.id;
          public          postgres    false    230                       1259    44850    pages_daynumber    TABLE     �   CREATE TABLE public.pages_daynumber (
    id bigint NOT NULL,
    day date NOT NULL,
    count integer NOT NULL,
    newvistor integer NOT NULL,
    oldvistor integer NOT NULL
);
 #   DROP TABLE public.pages_daynumber;
       public         heap    postgres    false                       1259    44849    pages_daynumber_id_seq    SEQUENCE        CREATE SEQUENCE public.pages_daynumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pages_daynumber_id_seq;
       public          postgres    false    276            ;           0    0    pages_daynumber_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pages_daynumber_id_seq OWNED BY public.pages_daynumber.id;
          public          postgres    false    275                       1259    35457    pages_deliverygroup    TABLE     X  CREATE TABLE public.pages_deliverygroup (
    id bigint NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    shipping_method_name character varying(50) NOT NULL,
    shipping_price numeric(5,2) NOT NULL,
    status character varying(50) NOT NULL,
    tracking_number character varying(50) NOT NULL,
    order_id bigint NOT NULL
);
 '   DROP TABLE public.pages_deliverygroup;
       public         heap    postgres    false                        1259    35456    pages_deliverygroup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_deliverygroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.pages_deliverygroup_id_seq;
       public          postgres    false    257            <           0    0    pages_deliverygroup_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.pages_deliverygroup_id_seq OWNED BY public.pages_deliverygroup.id;
          public          postgres    false    256                       1259    44875    pages_feedback    TABLE     �   CREATE TABLE public.pages_feedback (
    id bigint NOT NULL,
    name character varying(20),
    email character varying(254),
    gender integer,
    title character varying(30),
    feedback character varying(200)
);
 "   DROP TABLE public.pages_feedback;
       public         heap    postgres    false                       1259    44874    pages_feedback_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.pages_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pages_feedback_id_seq;
       public          postgres    false    282            =           0    0    pages_feedback_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pages_feedback_id_seq OWNED BY public.pages_feedback.id;
          public          postgres    false    281            �            1259    35369    pages_littlelooppicker    TABLE     �   CREATE TABLE public.pages_littlelooppicker (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    brand_id bigint,
    category_id bigint,
    product_class_id bigint,
    priority integer
);
 *   DROP TABLE public.pages_littlelooppicker;
       public         heap    postgres    false            �            1259    35368    pages_littlelooppicker_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_littlelooppicker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.pages_littlelooppicker_id_seq;
       public          postgres    false    233            >           0    0    pages_littlelooppicker_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.pages_littlelooppicker_id_seq OWNED BY public.pages_littlelooppicker.id;
          public          postgres    false    232                       1259    35871    pages_littlelooppicker_product    TABLE     �   CREATE TABLE public.pages_littlelooppicker_product (
    id bigint NOT NULL,
    littlelooppicker_id bigint NOT NULL,
    product_id bigint NOT NULL
);
 2   DROP TABLE public.pages_littlelooppicker_product;
       public         heap    postgres    false                       1259    35870 %   pages_littlelooppicker_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_littlelooppicker_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.pages_littlelooppicker_product_id_seq;
       public          postgres    false    271            ?           0    0 %   pages_littlelooppicker_product_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.pages_littlelooppicker_product_id_seq OWNED BY public.pages_littlelooppicker_product.id;
          public          postgres    false    270            �            1259    35376    pages_order    TABLE        CREATE TABLE public.pages_order (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    discount_amount numeric(5,2),
    discount_name character varying(50) NOT NULL,
    last_status_change timestamp with time zone,
    status integer NOT NULL,
    transaction_id character varying(50) NOT NULL,
    total character varying(500),
    billing_address_id bigint,
    shipping_address_id bigint,
    user_id bigint NOT NULL,
    voucher_id bigint,
    cartcomplete boolean NOT NULL,
    paid_time timestamp with time zone
);
    DROP TABLE public.pages_order;
       public         heap    postgres    false            �            1259    35375    pages_order_id_seq    SEQUENCE     {   CREATE SEQUENCE public.pages_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.pages_order_id_seq;
       public          postgres    false    235            @           0    0    pages_order_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.pages_order_id_seq OWNED BY public.pages_order.id;
          public          postgres    false    234            �            1259    35383    pages_ordereditem    TABLE     5  CREATE TABLE public.pages_ordereditem (
    id bigint NOT NULL,
    product_name character varying(50),
    quantity integer NOT NULL,
    stock_location character varying(50),
    unit_price_gross numeric(5,2),
    unit_price_net numeric(5,2),
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);
 %   DROP TABLE public.pages_ordereditem;
       public         heap    postgres    false            �            1259    35382    pages_ordereditem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_ordereditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.pages_ordereditem_id_seq;
       public          postgres    false    237            A           0    0    pages_ordereditem_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.pages_ordereditem_id_seq OWNED BY public.pages_ordereditem.id;
          public          postgres    false    236            �            1259    35390    pages_orderhistoryentry    TABLE       CREATE TABLE public.pages_orderhistoryentry (
    id bigint NOT NULL,
    comment character varying(50) NOT NULL,
    date timestamp with time zone NOT NULL,
    status character varying(50) NOT NULL,
    order_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 +   DROP TABLE public.pages_orderhistoryentry;
       public         heap    postgres    false            �            1259    35389    pages_orderhistoryentry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_orderhistoryentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.pages_orderhistoryentry_id_seq;
       public          postgres    false    239            B           0    0    pages_orderhistoryentry_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.pages_orderhistoryentry_id_seq OWNED BY public.pages_orderhistoryentry.id;
          public          postgres    false    238            �            1259    35397    pages_orderitemscomment    TABLE     �   CREATE TABLE public.pages_orderitemscomment (
    id bigint NOT NULL,
    comment text NOT NULL,
    rating integer NOT NULL,
    comment_day timestamp with time zone NOT NULL,
    order_items_id bigint NOT NULL
);
 +   DROP TABLE public.pages_orderitemscomment;
       public         heap    postgres    false            �            1259    35396    pages_orderitemscomment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_orderitemscomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.pages_orderitemscomment_id_seq;
       public          postgres    false    241            C           0    0    pages_orderitemscomment_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.pages_orderitemscomment_id_seq OWNED BY public.pages_orderitemscomment.id;
          public          postgres    false    240            �            1259    35406    pages_ordernote    TABLE     �   CREATE TABLE public.pages_ordernote (
    id bigint NOT NULL,
    content character varying(50) NOT NULL,
    date timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 #   DROP TABLE public.pages_ordernote;
       public         heap    postgres    false            �            1259    35405    pages_ordernote_id_seq    SEQUENCE        CREATE SEQUENCE public.pages_ordernote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pages_ordernote_id_seq;
       public          postgres    false    243            D           0    0    pages_ordernote_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pages_ordernote_id_seq OWNED BY public.pages_ordernote.id;
          public          postgres    false    242            	           1259    35848    pages_product    TABLE     �  CREATE TABLE public.pages_product (
    id bigint NOT NULL,
    attributes public.hstore,
    available_on date NOT NULL,
    "desc" text NOT NULL,
    name character varying(1000) NOT NULL,
    price numeric(10,2) NOT NULL,
    updated_at date,
    weight numeric(10,2) NOT NULL,
    active boolean NOT NULL,
    brand_id bigint NOT NULL,
    product_class_id bigint NOT NULL,
    sale_rank integer
);
 !   DROP TABLE public.pages_product;
       public         heap    postgres    false    2    2    2    2    2    2                       1259    35857    pages_product_category    TABLE     �   CREATE TABLE public.pages_product_category (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);
 *   DROP TABLE public.pages_product_category;
       public         heap    postgres    false            
           1259    35856    pages_product_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.pages_product_category_id_seq;
       public          postgres    false    267            E           0    0    pages_product_category_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.pages_product_category_id_seq OWNED BY public.pages_product_category.id;
          public          postgres    false    266                       1259    35847    pages_product_id_seq    SEQUENCE     }   CREATE SEQUENCE public.pages_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pages_product_id_seq;
       public          postgres    false    265            F           0    0    pages_product_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pages_product_id_seq OWNED BY public.pages_product.id;
          public          postgres    false    264                       1259    35864    pages_product_sale    TABLE     �   CREATE TABLE public.pages_product_sale (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    sale_id bigint NOT NULL
);
 &   DROP TABLE public.pages_product_sale;
       public         heap    postgres    false                       1259    35863    pages_product_sale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_product_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pages_product_sale_id_seq;
       public          postgres    false    269            G           0    0    pages_product_sale_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pages_product_sale_id_seq OWNED BY public.pages_product_sale.id;
          public          postgres    false    268            �            1259    35413    pages_productclass    TABLE     �   CREATE TABLE public.pages_productclass (
    id bigint NOT NULL,
    has_variant boolean NOT NULL,
    is_shipping_required boolean NOT NULL,
    name character varying(50) NOT NULL,
    sale_id bigint
);
 &   DROP TABLE public.pages_productclass;
       public         heap    postgres    false            �            1259    35412    pages_productclass_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_productclass_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pages_productclass_id_seq;
       public          postgres    false    245            H           0    0    pages_productclass_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pages_productclass_id_seq OWNED BY public.pages_productclass.id;
          public          postgres    false    244            �            1259    35420    pages_productimage    TABLE     �   CREATE TABLE public.pages_productimage (
    id bigint NOT NULL,
    alt character varying(50) NOT NULL,
    image character varying(100) NOT NULL,
    product_id bigint NOT NULL
);
 &   DROP TABLE public.pages_productimage;
       public         heap    postgres    false            �            1259    35419    pages_productimage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pages_productimage_id_seq;
       public          postgres    false    247            I           0    0    pages_productimage_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pages_productimage_id_seq OWNED BY public.pages_productimage.id;
          public          postgres    false    246            �            1259    35427 
   pages_sale    TABLE     �   CREATE TABLE public.pages_sale (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    value numeric(5,2) NOT NULL
);
    DROP TABLE public.pages_sale;
       public         heap    postgres    false            �            1259    35426    pages_sale_id_seq    SEQUENCE     z   CREATE SEQUENCE public.pages_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.pages_sale_id_seq;
       public          postgres    false    249            J           0    0    pages_sale_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.pages_sale_id_seq OWNED BY public.pages_sale.id;
          public          postgres    false    248            �            1259    35434    pages_stock    TABLE     �   CREATE TABLE public.pages_stock (
    id bigint NOT NULL,
    cost_price numeric(5,2) NOT NULL,
    quanity integer NOT NULL,
    location_id bigint NOT NULL,
    product_id bigint
);
    DROP TABLE public.pages_stock;
       public         heap    postgres    false            �            1259    35433    pages_stock_id_seq    SEQUENCE     {   CREATE SEQUENCE public.pages_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.pages_stock_id_seq;
       public          postgres    false    251            K           0    0    pages_stock_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.pages_stock_id_seq OWNED BY public.pages_stock.id;
          public          postgres    false    250            �            1259    35441    pages_stocklocation    TABLE     m   CREATE TABLE public.pages_stocklocation (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);
 '   DROP TABLE public.pages_stocklocation;
       public         heap    postgres    false            �            1259    35440    pages_stocklocation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_stocklocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.pages_stocklocation_id_seq;
       public          postgres    false    253            L           0    0    pages_stocklocation_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.pages_stocklocation_id_seq OWNED BY public.pages_stocklocation.id;
          public          postgres    false    252                       1259    35466 
   pages_user    TABLE     ^  CREATE TABLE public.pages_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    phone character varying(10),
    date_joined timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    avatar character varying(100),
    is_staff boolean NOT NULL,
    gender integer,
    age integer,
    email_verified boolean NOT NULL,
    membership boolean NOT NULL
);
    DROP TABLE public.pages_user;
       public         heap    postgres    false                       1259    35477    pages_user_groups    TABLE     ~   CREATE TABLE public.pages_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE public.pages_user_groups;
       public         heap    postgres    false                       1259    35476    pages_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.pages_user_groups_id_seq;
       public          postgres    false    261            M           0    0    pages_user_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.pages_user_groups_id_seq OWNED BY public.pages_user_groups.id;
          public          postgres    false    260                       1259    35465    pages_user_id_seq    SEQUENCE     z   CREATE SEQUENCE public.pages_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.pages_user_id_seq;
       public          postgres    false    259            N           0    0    pages_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.pages_user_id_seq OWNED BY public.pages_user.id;
          public          postgres    false    258                       1259    35484    pages_user_user_permissions    TABLE     �   CREATE TABLE public.pages_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE public.pages_user_user_permissions;
       public         heap    postgres    false                       1259    35483 "   pages_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.pages_user_user_permissions_id_seq;
       public          postgres    false    263            O           0    0 "   pages_user_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.pages_user_user_permissions_id_seq OWNED BY public.pages_user_user_permissions.id;
          public          postgres    false    262                       1259    44857    pages_visitorip    TABLE     �   CREATE TABLE public.pages_visitorip (
    id bigint NOT NULL,
    ip character varying(30) NOT NULL,
    location character varying(30) NOT NULL,
    count integer NOT NULL,
    created date NOT NULL,
    visitday date NOT NULL
);
 #   DROP TABLE public.pages_visitorip;
       public         heap    postgres    false                       1259    44856    pages_visitorip_id_seq    SEQUENCE        CREATE SEQUENCE public.pages_visitorip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pages_visitorip_id_seq;
       public          postgres    false    278            P           0    0    pages_visitorip_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pages_visitorip_id_seq OWNED BY public.pages_visitorip.id;
          public          postgres    false    277                       1259    44864    pages_visittotalcount    TABLE     b   CREATE TABLE public.pages_visittotalcount (
    id bigint NOT NULL,
    count integer NOT NULL
);
 )   DROP TABLE public.pages_visittotalcount;
       public         heap    postgres    false                       1259    44863    pages_visittotalcount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_visittotalcount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.pages_visittotalcount_id_seq;
       public          postgres    false    280            Q           0    0    pages_visittotalcount_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.pages_visittotalcount_id_seq OWNED BY public.pages_visittotalcount.id;
          public          postgres    false    279            �            1259    35448    pages_voucher    TABLE     �  CREATE TABLE public.pages_voucher (
    id bigint NOT NULL,
    apply_to character varying(50) NOT NULL,
    code character varying(50) NOT NULL,
    discount_value numeric(5,2) NOT NULL,
    discount_value_type character varying(50) NOT NULL,
    end_date date NOT NULL,
    name character varying(50) NOT NULL,
    start_date date NOT NULL,
    type character varying(50) NOT NULL,
    usage_limit integer NOT NULL,
    used integer NOT NULL
);
 !   DROP TABLE public.pages_voucher;
       public         heap    postgres    false            �            1259    35447    pages_voucher_id_seq    SEQUENCE     }   CREATE SEQUENCE public.pages_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pages_voucher_id_seq;
       public          postgres    false    255            R           0    0    pages_voucher_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pages_voucher_id_seq OWNED BY public.pages_voucher.id;
          public          postgres    false    254            �           2604    35304    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    35313    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    35297    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    35972    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    273    273            �           2604    35288    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    35279    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    35346    pages_address id    DEFAULT     t   ALTER TABLE ONLY public.pages_address ALTER COLUMN id SET DEFAULT nextval('public.pages_address_id_seq'::regclass);
 ?   ALTER TABLE public.pages_address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    35355    pages_brand id    DEFAULT     p   ALTER TABLE ONLY public.pages_brand ALTER COLUMN id SET DEFAULT nextval('public.pages_brand_id_seq'::regclass);
 =   ALTER TABLE public.pages_brand ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    35362    pages_category id    DEFAULT     v   ALTER TABLE ONLY public.pages_category ALTER COLUMN id SET DEFAULT nextval('public.pages_category_id_seq'::regclass);
 @   ALTER TABLE public.pages_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    44853    pages_daynumber id    DEFAULT     x   ALTER TABLE ONLY public.pages_daynumber ALTER COLUMN id SET DEFAULT nextval('public.pages_daynumber_id_seq'::regclass);
 A   ALTER TABLE public.pages_daynumber ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    275    276    276            �           2604    35460    pages_deliverygroup id    DEFAULT     �   ALTER TABLE ONLY public.pages_deliverygroup ALTER COLUMN id SET DEFAULT nextval('public.pages_deliverygroup_id_seq'::regclass);
 E   ALTER TABLE public.pages_deliverygroup ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256    257            �           2604    44878    pages_feedback id    DEFAULT     v   ALTER TABLE ONLY public.pages_feedback ALTER COLUMN id SET DEFAULT nextval('public.pages_feedback_id_seq'::regclass);
 @   ALTER TABLE public.pages_feedback ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    282    281    282            �           2604    35372    pages_littlelooppicker id    DEFAULT     �   ALTER TABLE ONLY public.pages_littlelooppicker ALTER COLUMN id SET DEFAULT nextval('public.pages_littlelooppicker_id_seq'::regclass);
 H   ALTER TABLE public.pages_littlelooppicker ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    35874 !   pages_littlelooppicker_product id    DEFAULT     �   ALTER TABLE ONLY public.pages_littlelooppicker_product ALTER COLUMN id SET DEFAULT nextval('public.pages_littlelooppicker_product_id_seq'::regclass);
 P   ALTER TABLE public.pages_littlelooppicker_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270    271            �           2604    35379    pages_order id    DEFAULT     p   ALTER TABLE ONLY public.pages_order ALTER COLUMN id SET DEFAULT nextval('public.pages_order_id_seq'::regclass);
 =   ALTER TABLE public.pages_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    35386    pages_ordereditem id    DEFAULT     |   ALTER TABLE ONLY public.pages_ordereditem ALTER COLUMN id SET DEFAULT nextval('public.pages_ordereditem_id_seq'::regclass);
 C   ALTER TABLE public.pages_ordereditem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    35393    pages_orderhistoryentry id    DEFAULT     �   ALTER TABLE ONLY public.pages_orderhistoryentry ALTER COLUMN id SET DEFAULT nextval('public.pages_orderhistoryentry_id_seq'::regclass);
 I   ALTER TABLE public.pages_orderhistoryentry ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    35400    pages_orderitemscomment id    DEFAULT     �   ALTER TABLE ONLY public.pages_orderitemscomment ALTER COLUMN id SET DEFAULT nextval('public.pages_orderitemscomment_id_seq'::regclass);
 I   ALTER TABLE public.pages_orderitemscomment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            �           2604    35409    pages_ordernote id    DEFAULT     x   ALTER TABLE ONLY public.pages_ordernote ALTER COLUMN id SET DEFAULT nextval('public.pages_ordernote_id_seq'::regclass);
 A   ALTER TABLE public.pages_ordernote ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    35851    pages_product id    DEFAULT     t   ALTER TABLE ONLY public.pages_product ALTER COLUMN id SET DEFAULT nextval('public.pages_product_id_seq'::regclass);
 ?   ALTER TABLE public.pages_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    264    265    265            �           2604    35860    pages_product_category id    DEFAULT     �   ALTER TABLE ONLY public.pages_product_category ALTER COLUMN id SET DEFAULT nextval('public.pages_product_category_id_seq'::regclass);
 H   ALTER TABLE public.pages_product_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    266    267            �           2604    35867    pages_product_sale id    DEFAULT     ~   ALTER TABLE ONLY public.pages_product_sale ALTER COLUMN id SET DEFAULT nextval('public.pages_product_sale_id_seq'::regclass);
 D   ALTER TABLE public.pages_product_sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268    269            �           2604    35416    pages_productclass id    DEFAULT     ~   ALTER TABLE ONLY public.pages_productclass ALTER COLUMN id SET DEFAULT nextval('public.pages_productclass_id_seq'::regclass);
 D   ALTER TABLE public.pages_productclass ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244    245            �           2604    35423    pages_productimage id    DEFAULT     ~   ALTER TABLE ONLY public.pages_productimage ALTER COLUMN id SET DEFAULT nextval('public.pages_productimage_id_seq'::regclass);
 D   ALTER TABLE public.pages_productimage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    35430    pages_sale id    DEFAULT     n   ALTER TABLE ONLY public.pages_sale ALTER COLUMN id SET DEFAULT nextval('public.pages_sale_id_seq'::regclass);
 <   ALTER TABLE public.pages_sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249            �           2604    35437    pages_stock id    DEFAULT     p   ALTER TABLE ONLY public.pages_stock ALTER COLUMN id SET DEFAULT nextval('public.pages_stock_id_seq'::regclass);
 =   ALTER TABLE public.pages_stock ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            �           2604    35444    pages_stocklocation id    DEFAULT     �   ALTER TABLE ONLY public.pages_stocklocation ALTER COLUMN id SET DEFAULT nextval('public.pages_stocklocation_id_seq'::regclass);
 E   ALTER TABLE public.pages_stocklocation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            �           2604    35469    pages_user id    DEFAULT     n   ALTER TABLE ONLY public.pages_user ALTER COLUMN id SET DEFAULT nextval('public.pages_user_id_seq'::regclass);
 <   ALTER TABLE public.pages_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    259    259            �           2604    35480    pages_user_groups id    DEFAULT     |   ALTER TABLE ONLY public.pages_user_groups ALTER COLUMN id SET DEFAULT nextval('public.pages_user_groups_id_seq'::regclass);
 C   ALTER TABLE public.pages_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260    261            �           2604    35487    pages_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.pages_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.pages_user_user_permissions_id_seq'::regclass);
 M   ALTER TABLE public.pages_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    263    263            �           2604    44860    pages_visitorip id    DEFAULT     x   ALTER TABLE ONLY public.pages_visitorip ALTER COLUMN id SET DEFAULT nextval('public.pages_visitorip_id_seq'::regclass);
 A   ALTER TABLE public.pages_visitorip ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    277    278            �           2604    44867    pages_visittotalcount id    DEFAULT     �   ALTER TABLE ONLY public.pages_visittotalcount ALTER COLUMN id SET DEFAULT nextval('public.pages_visittotalcount_id_seq'::regclass);
 G   ALTER TABLE public.pages_visittotalcount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    279    280    280            �           2604    35451    pages_voucher id    DEFAULT     t   ALTER TABLE ONLY public.pages_voucher ALTER COLUMN id SET DEFAULT nextval('public.pages_voucher_id_seq'::regclass);
 ?   ALTER TABLE public.pages_voucher ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    255    255            �          0    35301 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    223   -�      �          0    35310    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    225   J�      �          0    35294    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    221   g�      !          0    35969    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    273   ��      �          0    35285    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    219    �      �          0    35276    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    217   =�      "          0    35990    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    274   �      �          0    35343    pages_address 
   TABLE DATA           �   COPY public.pages_address (id, first_name, last_name, phone, country_or_area, street_address_1, street_address_2, company_name, type, priority, user_id) FROM stdin;
    public          postgres    false    227   ~�      �          0    35352    pages_brand 
   TABLE DATA           /   COPY public.pages_brand (id, name) FROM stdin;
    public          postgres    false    229   ��      �          0    35359    pages_category 
   TABLE DATA           I   COPY public.pages_category (id, "desc", hidden, level, name) FROM stdin;
    public          postgres    false    231   5�      $          0    44850    pages_daynumber 
   TABLE DATA           O   COPY public.pages_daynumber (id, day, count, newvistor, oldvistor) FROM stdin;
    public          postgres    false    276   ��                0    35457    pages_deliverygroup 
   TABLE DATA           �   COPY public.pages_deliverygroup (id, last_updated, shipping_method_name, shipping_price, status, tracking_number, order_id) FROM stdin;
    public          postgres    false    257   ��      *          0    44875    pages_feedback 
   TABLE DATA           R   COPY public.pages_feedback (id, name, email, gender, title, feedback) FROM stdin;
    public          postgres    false    282   �      �          0    35369    pages_littlelooppicker 
   TABLE DATA           n   COPY public.pages_littlelooppicker (id, title, brand_id, category_id, product_class_id, priority) FROM stdin;
    public          postgres    false    233   g�                0    35871    pages_littlelooppicker_product 
   TABLE DATA           ]   COPY public.pages_littlelooppicker_product (id, littlelooppicker_id, product_id) FROM stdin;
    public          postgres    false    271   ��      �          0    35376    pages_order 
   TABLE DATA           �   COPY public.pages_order (id, created, discount_amount, discount_name, last_status_change, status, transaction_id, total, billing_address_id, shipping_address_id, user_id, voucher_id, cartcomplete, paid_time) FROM stdin;
    public          postgres    false    235   ��      �          0    35383    pages_ordereditem 
   TABLE DATA           �   COPY public.pages_ordereditem (id, product_name, quantity, stock_location, unit_price_gross, unit_price_net, order_id, product_id) FROM stdin;
    public          postgres    false    237   ��      �          0    35390    pages_orderhistoryentry 
   TABLE DATA           _   COPY public.pages_orderhistoryentry (id, comment, date, status, order_id, user_id) FROM stdin;
    public          postgres    false    239   *�                0    35397    pages_orderitemscomment 
   TABLE DATA           c   COPY public.pages_orderitemscomment (id, comment, rating, comment_day, order_items_id) FROM stdin;
    public          postgres    false    241   G�                0    35406    pages_ordernote 
   TABLE DATA           O   COPY public.pages_ordernote (id, content, date, order_id, user_id) FROM stdin;
    public          postgres    false    243   �                0    35848    pages_product 
   TABLE DATA           �   COPY public.pages_product (id, attributes, available_on, "desc", name, price, updated_at, weight, active, brand_id, product_class_id, sale_rank) FROM stdin;
    public          postgres    false    265   0�                0    35857    pages_product_category 
   TABLE DATA           M   COPY public.pages_product_category (id, product_id, category_id) FROM stdin;
    public          postgres    false    267   ��                0    35864    pages_product_sale 
   TABLE DATA           E   COPY public.pages_product_sale (id, product_id, sale_id) FROM stdin;
    public          postgres    false    269   �                0    35413    pages_productclass 
   TABLE DATA           b   COPY public.pages_productclass (id, has_variant, is_shipping_required, name, sale_id) FROM stdin;
    public          postgres    false    245   h�                0    35420    pages_productimage 
   TABLE DATA           H   COPY public.pages_productimage (id, alt, image, product_id) FROM stdin;
    public          postgres    false    247   �      	          0    35427 
   pages_sale 
   TABLE DATA           ;   COPY public.pages_sale (id, name, type, value) FROM stdin;
    public          postgres    false    249                   0    35434    pages_stock 
   TABLE DATA           W   COPY public.pages_stock (id, cost_price, quanity, location_id, product_id) FROM stdin;
    public          postgres    false    251   �                0    35441    pages_stocklocation 
   TABLE DATA           7   COPY public.pages_stocklocation (id, name) FROM stdin;
    public          postgres    false    253   >
                0    35466 
   pages_user 
   TABLE DATA           �   COPY public.pages_user (id, password, last_login, is_superuser, email, first_name, last_name, phone, date_joined, is_active, avatar, is_staff, gender, age, email_verified, membership) FROM stdin;
    public          postgres    false    259   h
                0    35477    pages_user_groups 
   TABLE DATA           B   COPY public.pages_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    261   �                0    35484    pages_user_user_permissions 
   TABLE DATA           Q   COPY public.pages_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    263         &          0    44857    pages_visitorip 
   TABLE DATA           U   COPY public.pages_visitorip (id, ip, location, count, created, visitday) FROM stdin;
    public          postgres    false    278   .      (          0    44864    pages_visittotalcount 
   TABLE DATA           :   COPY public.pages_visittotalcount (id, count) FROM stdin;
    public          postgres    false    280   �                0    35448    pages_voucher 
   TABLE DATA           �   COPY public.pages_voucher (id, apply_to, code, discount_value, discount_value_type, end_date, name, start_date, type, usage_limit, used) FROM stdin;
    public          postgres    false    255   �      S           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    222            T           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    224            U           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 108, true);
          public          postgres    false    220            V           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 127, true);
          public          postgres    false    272            W           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);
          public          postgres    false    218            X           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);
          public          postgres    false    216            Y           0    0    pages_address_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pages_address_id_seq', 56, true);
          public          postgres    false    226            Z           0    0    pages_brand_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pages_brand_id_seq', 10, true);
          public          postgres    false    228            [           0    0    pages_category_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pages_category_id_seq', 6, true);
          public          postgres    false    230            \           0    0    pages_daynumber_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pages_daynumber_id_seq', 3, true);
          public          postgres    false    275            ]           0    0    pages_deliverygroup_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pages_deliverygroup_id_seq', 1, false);
          public          postgres    false    256            ^           0    0    pages_feedback_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pages_feedback_id_seq', 3, true);
          public          postgres    false    281            _           0    0    pages_littlelooppicker_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.pages_littlelooppicker_id_seq', 3, true);
          public          postgres    false    232            `           0    0 %   pages_littlelooppicker_product_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.pages_littlelooppicker_product_id_seq', 1, false);
          public          postgres    false    270            a           0    0    pages_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pages_order_id_seq', 84, true);
          public          postgres    false    234            b           0    0    pages_ordereditem_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pages_ordereditem_id_seq', 94, true);
          public          postgres    false    236            c           0    0    pages_orderhistoryentry_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pages_orderhistoryentry_id_seq', 1, false);
          public          postgres    false    238            d           0    0    pages_orderitemscomment_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pages_orderitemscomment_id_seq', 14, true);
          public          postgres    false    240            e           0    0    pages_ordernote_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pages_ordernote_id_seq', 1, false);
          public          postgres    false    242            f           0    0    pages_product_category_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.pages_product_category_id_seq', 13, true);
          public          postgres    false    266            g           0    0    pages_product_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pages_product_id_seq', 208, true);
          public          postgres    false    264            h           0    0    pages_product_sale_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pages_product_sale_id_seq', 211, true);
          public          postgres    false    268            i           0    0    pages_productclass_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pages_productclass_id_seq', 12, true);
          public          postgres    false    244            j           0    0    pages_productimage_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pages_productimage_id_seq', 208, true);
          public          postgres    false    246            k           0    0    pages_sale_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pages_sale_id_seq', 3, true);
          public          postgres    false    248            l           0    0    pages_stock_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pages_stock_id_seq', 208, true);
          public          postgres    false    250            m           0    0    pages_stocklocation_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pages_stocklocation_id_seq', 1, true);
          public          postgres    false    252            n           0    0    pages_user_groups_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pages_user_groups_id_seq', 1, false);
          public          postgres    false    260            o           0    0    pages_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.pages_user_id_seq', 35, true);
          public          postgres    false    258            p           0    0 "   pages_user_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.pages_user_user_permissions_id_seq', 1, false);
          public          postgres    false    262            q           0    0    pages_visitorip_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pages_visitorip_id_seq', 11, true);
          public          postgres    false    277            r           0    0    pages_visittotalcount_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.pages_visittotalcount_id_seq', 1, false);
          public          postgres    false    279            s           0    0    pages_voucher_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pages_voucher_id_seq', 2, true);
          public          postgres    false    254            �           2606    35340    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    223            �           2606    35326 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    225    225            �           2606    35315 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    225            �           2606    35306    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    223            �           2606    35317 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    221    221            �           2606    35299 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    221            &           2606    35977 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    273            �           2606    35292 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    219    219            �           2606    35290 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    219            �           2606    35283 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    217            *           2606    35996 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    274            �           2606    35350     pages_address pages_address_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.pages_address
    ADD CONSTRAINT pages_address_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.pages_address DROP CONSTRAINT pages_address_pkey;
       public            postgres    false    227            �           2606    35357    pages_brand pages_brand_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pages_brand
    ADD CONSTRAINT pages_brand_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.pages_brand DROP CONSTRAINT pages_brand_pkey;
       public            postgres    false    229            �           2606    35367 "   pages_category pages_category_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pages_category
    ADD CONSTRAINT pages_category_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pages_category DROP CONSTRAINT pages_category_pkey;
       public            postgres    false    231            -           2606    44855 $   pages_daynumber pages_daynumber_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.pages_daynumber
    ADD CONSTRAINT pages_daynumber_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.pages_daynumber DROP CONSTRAINT pages_daynumber_pkey;
       public            postgres    false    276            �           2606    35464 4   pages_deliverygroup pages_deliverygroup_order_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.pages_deliverygroup
    ADD CONSTRAINT pages_deliverygroup_order_id_key UNIQUE (order_id);
 ^   ALTER TABLE ONLY public.pages_deliverygroup DROP CONSTRAINT pages_deliverygroup_order_id_key;
       public            postgres    false    257            �           2606    35462 ,   pages_deliverygroup pages_deliverygroup_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.pages_deliverygroup
    ADD CONSTRAINT pages_deliverygroup_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.pages_deliverygroup DROP CONSTRAINT pages_deliverygroup_pkey;
       public            postgres    false    257            3           2606    44882 "   pages_feedback pages_feedback_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pages_feedback
    ADD CONSTRAINT pages_feedback_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pages_feedback DROP CONSTRAINT pages_feedback_pkey;
       public            postgres    false    282                       2606    35952 ^   pages_littlelooppicker_product pages_littlelooppicker_p_littlelooppicker_id_prod_14067be6_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.pages_littlelooppicker_product
    ADD CONSTRAINT pages_littlelooppicker_p_littlelooppicker_id_prod_14067be6_uniq UNIQUE (littlelooppicker_id, product_id);
 �   ALTER TABLE ONLY public.pages_littlelooppicker_product DROP CONSTRAINT pages_littlelooppicker_p_littlelooppicker_id_prod_14067be6_uniq;
       public            postgres    false    271    271            �           2606    35374 2   pages_littlelooppicker pages_littlelooppicker_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.pages_littlelooppicker
    ADD CONSTRAINT pages_littlelooppicker_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.pages_littlelooppicker DROP CONSTRAINT pages_littlelooppicker_pkey;
       public            postgres    false    233            "           2606    35876 B   pages_littlelooppicker_product pages_littlelooppicker_product_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pages_littlelooppicker_product
    ADD CONSTRAINT pages_littlelooppicker_product_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.pages_littlelooppicker_product DROP CONSTRAINT pages_littlelooppicker_product_pkey;
       public            postgres    false    271            �           2606    35381    pages_order pages_order_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pages_order
    ADD CONSTRAINT pages_order_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.pages_order DROP CONSTRAINT pages_order_pkey;
       public            postgres    false    235            �           2606    35388 (   pages_ordereditem pages_ordereditem_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.pages_ordereditem
    ADD CONSTRAINT pages_ordereditem_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.pages_ordereditem DROP CONSTRAINT pages_ordereditem_pkey;
       public            postgres    false    237            �           2606    35395 4   pages_orderhistoryentry pages_orderhistoryentry_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.pages_orderhistoryentry
    ADD CONSTRAINT pages_orderhistoryentry_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.pages_orderhistoryentry DROP CONSTRAINT pages_orderhistoryentry_pkey;
       public            postgres    false    239            �           2606    35404 4   pages_orderitemscomment pages_orderitemscomment_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.pages_orderitemscomment
    ADD CONSTRAINT pages_orderitemscomment_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.pages_orderitemscomment DROP CONSTRAINT pages_orderitemscomment_pkey;
       public            postgres    false    241            �           2606    35411 $   pages_ordernote pages_ordernote_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.pages_ordernote
    ADD CONSTRAINT pages_ordernote_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.pages_ordernote DROP CONSTRAINT pages_ordernote_pkey;
       public            postgres    false    243                       2606    35862 2   pages_product_category pages_product_category_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.pages_product_category
    ADD CONSTRAINT pages_product_category_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.pages_product_category DROP CONSTRAINT pages_product_category_pkey;
       public            postgres    false    267                       2606    35924 R   pages_product_category pages_product_category_product_id_category_id_1b6ebb6f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.pages_product_category
    ADD CONSTRAINT pages_product_category_product_id_category_id_1b6ebb6f_uniq UNIQUE (product_id, category_id);
 |   ALTER TABLE ONLY public.pages_product_category DROP CONSTRAINT pages_product_category_product_id_category_id_1b6ebb6f_uniq;
       public            postgres    false    267    267                       2606    35855     pages_product pages_product_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.pages_product
    ADD CONSTRAINT pages_product_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.pages_product DROP CONSTRAINT pages_product_pkey;
       public            postgres    false    265                       2606    35869 *   pages_product_sale pages_product_sale_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pages_product_sale
    ADD CONSTRAINT pages_product_sale_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pages_product_sale DROP CONSTRAINT pages_product_sale_pkey;
       public            postgres    false    269                       2606    35938 F   pages_product_sale pages_product_sale_product_id_sale_id_4147e368_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.pages_product_sale
    ADD CONSTRAINT pages_product_sale_product_id_sale_id_4147e368_uniq UNIQUE (product_id, sale_id);
 p   ALTER TABLE ONLY public.pages_product_sale DROP CONSTRAINT pages_product_sale_product_id_sale_id_4147e368_uniq;
       public            postgres    false    269    269            �           2606    35418 *   pages_productclass pages_productclass_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pages_productclass
    ADD CONSTRAINT pages_productclass_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pages_productclass DROP CONSTRAINT pages_productclass_pkey;
       public            postgres    false    245            �           2606    35425 *   pages_productimage pages_productimage_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pages_productimage
    ADD CONSTRAINT pages_productimage_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pages_productimage DROP CONSTRAINT pages_productimage_pkey;
       public            postgres    false    247            �           2606    35432    pages_sale pages_sale_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pages_sale
    ADD CONSTRAINT pages_sale_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.pages_sale DROP CONSTRAINT pages_sale_pkey;
       public            postgres    false    249            �           2606    35439    pages_stock pages_stock_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.pages_stock
    ADD CONSTRAINT pages_stock_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.pages_stock DROP CONSTRAINT pages_stock_pkey;
       public            postgres    false    251            �           2606    35446 ,   pages_stocklocation pages_stocklocation_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.pages_stocklocation
    ADD CONSTRAINT pages_stocklocation_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.pages_stocklocation DROP CONSTRAINT pages_stocklocation_pkey;
       public            postgres    false    253            �           2606    35475    pages_user pages_user_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.pages_user
    ADD CONSTRAINT pages_user_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.pages_user DROP CONSTRAINT pages_user_email_key;
       public            postgres    false    259                       2606    35482 (   pages_user_groups pages_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.pages_user_groups
    ADD CONSTRAINT pages_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.pages_user_groups DROP CONSTRAINT pages_user_groups_pkey;
       public            postgres    false    261                       2606    35497 B   pages_user_groups pages_user_groups_user_id_group_id_6b7f6af9_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.pages_user_groups
    ADD CONSTRAINT pages_user_groups_user_id_group_id_6b7f6af9_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY public.pages_user_groups DROP CONSTRAINT pages_user_groups_user_id_group_id_6b7f6af9_uniq;
       public            postgres    false    261    261                       2606    35473    pages_user pages_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.pages_user
    ADD CONSTRAINT pages_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.pages_user DROP CONSTRAINT pages_user_pkey;
       public            postgres    false    259            
           2606    35489 <   pages_user_user_permissions pages_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.pages_user_user_permissions
    ADD CONSTRAINT pages_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.pages_user_user_permissions DROP CONSTRAINT pages_user_user_permissions_pkey;
       public            postgres    false    263                       2606    35511 [   pages_user_user_permissions pages_user_user_permissions_user_id_permission_id_13e8e4fb_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.pages_user_user_permissions
    ADD CONSTRAINT pages_user_user_permissions_user_id_permission_id_13e8e4fb_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.pages_user_user_permissions DROP CONSTRAINT pages_user_user_permissions_user_id_permission_id_13e8e4fb_uniq;
       public            postgres    false    263    263            /           2606    44862 $   pages_visitorip pages_visitorip_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.pages_visitorip
    ADD CONSTRAINT pages_visitorip_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.pages_visitorip DROP CONSTRAINT pages_visitorip_pkey;
       public            postgres    false    278            1           2606    44869 0   pages_visittotalcount pages_visittotalcount_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.pages_visittotalcount
    ADD CONSTRAINT pages_visittotalcount_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.pages_visittotalcount DROP CONSTRAINT pages_visittotalcount_pkey;
       public            postgres    false    280            �           2606    35455     pages_voucher pages_voucher_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.pages_voucher
    ADD CONSTRAINT pages_voucher_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.pages_voucher DROP CONSTRAINT pages_voucher_pkey;
       public            postgres    false    255            �           1259    35341    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    223            �           1259    35337 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    225            �           1259    35338 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    225            �           1259    35323 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    221            $           1259    35988 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    273            '           1259    35989 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    273            (           1259    35998 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    274            +           1259    35997 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    274            �           1259    35894    pages_address_user_id_8a72cc29    INDEX     [   CREATE INDEX pages_address_user_id_8a72cc29 ON public.pages_address USING btree (user_id);
 2   DROP INDEX public.pages_address_user_id_8a72cc29;
       public            postgres    false    227            �           1259    35895 (   pages_littlelooppicker_brand_id_5dce4980    INDEX     o   CREATE INDEX pages_littlelooppicker_brand_id_5dce4980 ON public.pages_littlelooppicker USING btree (brand_id);
 <   DROP INDEX public.pages_littlelooppicker_brand_id_5dce4980;
       public            postgres    false    233            �           1259    35896 +   pages_littlelooppicker_category_id_40c12d78    INDEX     u   CREATE INDEX pages_littlelooppicker_category_id_40c12d78 ON public.pages_littlelooppicker USING btree (category_id);
 ?   DROP INDEX public.pages_littlelooppicker_category_id_40c12d78;
       public            postgres    false    233            �           1259    35897 0   pages_littlelooppicker_product_class_id_83004df2    INDEX        CREATE INDEX pages_littlelooppicker_product_class_id_83004df2 ON public.pages_littlelooppicker USING btree (product_class_id);
 D   DROP INDEX public.pages_littlelooppicker_product_class_id_83004df2;
       public            postgres    false    233                        1259    35963 ;   pages_littlelooppicker_product_littlelooppicker_id_9fc61eca    INDEX     �   CREATE INDEX pages_littlelooppicker_product_littlelooppicker_id_9fc61eca ON public.pages_littlelooppicker_product USING btree (littlelooppicker_id);
 O   DROP INDEX public.pages_littlelooppicker_product_littlelooppicker_id_9fc61eca;
       public            postgres    false    271            #           1259    35964 2   pages_littlelooppicker_product_product_id_24614306    INDEX     �   CREATE INDEX pages_littlelooppicker_product_product_id_24614306 ON public.pages_littlelooppicker_product USING btree (product_id);
 F   DROP INDEX public.pages_littlelooppicker_product_product_id_24614306;
       public            postgres    false    271            �           1259    35898 '   pages_order_billing_address_id_34658b3d    INDEX     m   CREATE INDEX pages_order_billing_address_id_34658b3d ON public.pages_order USING btree (billing_address_id);
 ;   DROP INDEX public.pages_order_billing_address_id_34658b3d;
       public            postgres    false    235            �           1259    35899 (   pages_order_shipping_address_id_7cae927b    INDEX     o   CREATE INDEX pages_order_shipping_address_id_7cae927b ON public.pages_order USING btree (shipping_address_id);
 <   DROP INDEX public.pages_order_shipping_address_id_7cae927b;
       public            postgres    false    235            �           1259    35900    pages_order_user_id_a8a10f35    INDEX     W   CREATE INDEX pages_order_user_id_a8a10f35 ON public.pages_order USING btree (user_id);
 0   DROP INDEX public.pages_order_user_id_a8a10f35;
       public            postgres    false    235            �           1259    35901    pages_order_voucher_id_54a5ba43    INDEX     ]   CREATE INDEX pages_order_voucher_id_54a5ba43 ON public.pages_order USING btree (voucher_id);
 3   DROP INDEX public.pages_order_voucher_id_54a5ba43;
       public            postgres    false    235            �           1259    35902 #   pages_ordereditem_order_id_9697c8cc    INDEX     e   CREATE INDEX pages_ordereditem_order_id_9697c8cc ON public.pages_ordereditem USING btree (order_id);
 7   DROP INDEX public.pages_ordereditem_order_id_9697c8cc;
       public            postgres    false    237            �           1259    35965 %   pages_ordereditem_product_id_e197b770    INDEX     i   CREATE INDEX pages_ordereditem_product_id_e197b770 ON public.pages_ordereditem USING btree (product_id);
 9   DROP INDEX public.pages_ordereditem_product_id_e197b770;
       public            postgres    false    237            �           1259    35904 )   pages_orderhistoryentry_order_id_d94d748f    INDEX     q   CREATE INDEX pages_orderhistoryentry_order_id_d94d748f ON public.pages_orderhistoryentry USING btree (order_id);
 =   DROP INDEX public.pages_orderhistoryentry_order_id_d94d748f;
       public            postgres    false    239            �           1259    35905 (   pages_orderhistoryentry_user_id_772c83dc    INDEX     o   CREATE INDEX pages_orderhistoryentry_user_id_772c83dc ON public.pages_orderhistoryentry USING btree (user_id);
 <   DROP INDEX public.pages_orderhistoryentry_user_id_772c83dc;
       public            postgres    false    239            �           1259    35906 /   pages_orderitemscomment_order_items_id_2180546e    INDEX     }   CREATE INDEX pages_orderitemscomment_order_items_id_2180546e ON public.pages_orderitemscomment USING btree (order_items_id);
 C   DROP INDEX public.pages_orderitemscomment_order_items_id_2180546e;
       public            postgres    false    241            �           1259    35907 !   pages_ordernote_order_id_cc81ff42    INDEX     a   CREATE INDEX pages_ordernote_order_id_cc81ff42 ON public.pages_ordernote USING btree (order_id);
 5   DROP INDEX public.pages_ordernote_order_id_cc81ff42;
       public            postgres    false    243            �           1259    35908     pages_ordernote_user_id_1fef703c    INDEX     _   CREATE INDEX pages_ordernote_user_id_1fef703c ON public.pages_ordernote USING btree (user_id);
 4   DROP INDEX public.pages_ordernote_user_id_1fef703c;
       public            postgres    false    243                       1259    35921    pages_product_brand_id_7e5d94df    INDEX     ]   CREATE INDEX pages_product_brand_id_7e5d94df ON public.pages_product USING btree (brand_id);
 3   DROP INDEX public.pages_product_brand_id_7e5d94df;
       public            postgres    false    265                       1259    35936 +   pages_product_category_category_id_94c06d06    INDEX     u   CREATE INDEX pages_product_category_category_id_94c06d06 ON public.pages_product_category USING btree (category_id);
 ?   DROP INDEX public.pages_product_category_category_id_94c06d06;
       public            postgres    false    267                       1259    35935 *   pages_product_category_product_id_dbe5cb9d    INDEX     s   CREATE INDEX pages_product_category_product_id_dbe5cb9d ON public.pages_product_category USING btree (product_id);
 >   DROP INDEX public.pages_product_category_product_id_dbe5cb9d;
       public            postgres    false    267                       1259    35922 '   pages_product_product_class_id_58884190    INDEX     m   CREATE INDEX pages_product_product_class_id_58884190 ON public.pages_product USING btree (product_class_id);
 ;   DROP INDEX public.pages_product_product_class_id_58884190;
       public            postgres    false    265                       1259    35949 &   pages_product_sale_product_id_2f52b2d9    INDEX     k   CREATE INDEX pages_product_sale_product_id_2f52b2d9 ON public.pages_product_sale USING btree (product_id);
 :   DROP INDEX public.pages_product_sale_product_id_2f52b2d9;
       public            postgres    false    269                       1259    35950 #   pages_product_sale_sale_id_c984e59d    INDEX     e   CREATE INDEX pages_product_sale_sale_id_c984e59d ON public.pages_product_sale USING btree (sale_id);
 7   DROP INDEX public.pages_product_sale_sale_id_c984e59d;
       public            postgres    false    269            �           1259    35909 #   pages_productclass_sale_id_e0771cf8    INDEX     e   CREATE INDEX pages_productclass_sale_id_e0771cf8 ON public.pages_productclass USING btree (sale_id);
 7   DROP INDEX public.pages_productclass_sale_id_e0771cf8;
       public            postgres    false    245            �           1259    35966 &   pages_productimage_product_id_3ddb808a    INDEX     k   CREATE INDEX pages_productimage_product_id_3ddb808a ON public.pages_productimage USING btree (product_id);
 :   DROP INDEX public.pages_productimage_product_id_3ddb808a;
       public            postgres    false    247            �           1259    35910     pages_stock_location_id_fb84c426    INDEX     _   CREATE INDEX pages_stock_location_id_fb84c426 ON public.pages_stock USING btree (location_id);
 4   DROP INDEX public.pages_stock_location_id_fb84c426;
       public            postgres    false    251            �           1259    35967    pages_stock_product_id_0b368fde    INDEX     ]   CREATE INDEX pages_stock_product_id_0b368fde ON public.pages_stock USING btree (product_id);
 3   DROP INDEX public.pages_stock_product_id_0b368fde;
       public            postgres    false    251            �           1259    35495    pages_user_email_582569e7_like    INDEX     j   CREATE INDEX pages_user_email_582569e7_like ON public.pages_user USING btree (email varchar_pattern_ops);
 2   DROP INDEX public.pages_user_email_582569e7_like;
       public            postgres    false    259                       1259    35509 #   pages_user_groups_group_id_85978ba7    INDEX     e   CREATE INDEX pages_user_groups_group_id_85978ba7 ON public.pages_user_groups USING btree (group_id);
 7   DROP INDEX public.pages_user_groups_group_id_85978ba7;
       public            postgres    false    261                       1259    35508 "   pages_user_groups_user_id_ebb51da1    INDEX     c   CREATE INDEX pages_user_groups_user_id_ebb51da1 ON public.pages_user_groups USING btree (user_id);
 6   DROP INDEX public.pages_user_groups_user_id_ebb51da1;
       public            postgres    false    261                       1259    35523 2   pages_user_user_permissions_permission_id_30db2006    INDEX     �   CREATE INDEX pages_user_user_permissions_permission_id_30db2006 ON public.pages_user_user_permissions USING btree (permission_id);
 F   DROP INDEX public.pages_user_user_permissions_permission_id_30db2006;
       public            postgres    false    263                       1259    35522 ,   pages_user_user_permissions_user_id_d1acec27    INDEX     w   CREATE INDEX pages_user_user_permissions_user_id_d1acec27 ON public.pages_user_user_permissions USING btree (user_id);
 @   DROP INDEX public.pages_user_user_permissions_user_id_d1acec27;
       public            postgres    false    263            5           2606    35332 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    221    225    3772            6           2606    35327 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    223    225    3777            4           2606    35318 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3767    219    221            W           2606    35978 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    273    219    3767            X           2606    35983 C   django_admin_log django_admin_log_user_id_c564eba6_fk_pages_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_pages_user_id FOREIGN KEY (user_id) REFERENCES public.pages_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_pages_user_id;
       public          postgres    false    273    3841    259            7           2606    36002 =   pages_address pages_address_user_id_8a72cc29_fk_pages_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_address
    ADD CONSTRAINT pages_address_user_id_8a72cc29_fk_pages_user_id FOREIGN KEY (user_id) REFERENCES public.pages_user(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.pages_address DROP CONSTRAINT pages_address_user_id_8a72cc29_fk_pages_user_id;
       public          postgres    false    3841    259    227            J           2606    35490 K   pages_deliverygroup pages_deliverygroup_order_id_38b32b9f_fk_pages_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_deliverygroup
    ADD CONSTRAINT pages_deliverygroup_order_id_38b32b9f_fk_pages_order_id FOREIGN KEY (order_id) REFERENCES public.pages_order(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.pages_deliverygroup DROP CONSTRAINT pages_deliverygroup_order_id_38b32b9f_fk_pages_order_id;
       public          postgres    false    3798    257    235            8           2606    35761 M   pages_littlelooppicker pages_littlelooppick_category_id_40c12d78_fk_pages_cat    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_littlelooppicker
    ADD CONSTRAINT pages_littlelooppick_category_id_40c12d78_fk_pages_cat FOREIGN KEY (category_id) REFERENCES public.pages_category(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.pages_littlelooppicker DROP CONSTRAINT pages_littlelooppick_category_id_40c12d78_fk_pages_cat;
       public          postgres    false    3790    233    231            U           2606    35953 ]   pages_littlelooppicker_product pages_littlelooppick_littlelooppicker_id_9fc61eca_fk_pages_lit    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_littlelooppicker_product
    ADD CONSTRAINT pages_littlelooppick_littlelooppicker_id_9fc61eca_fk_pages_lit FOREIGN KEY (littlelooppicker_id) REFERENCES public.pages_littlelooppicker(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.pages_littlelooppicker_product DROP CONSTRAINT pages_littlelooppick_littlelooppicker_id_9fc61eca_fk_pages_lit;
       public          postgres    false    3794    233    271            9           2606    35766 R   pages_littlelooppicker pages_littlelooppick_product_class_id_83004df2_fk_pages_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_littlelooppicker
    ADD CONSTRAINT pages_littlelooppick_product_class_id_83004df2_fk_pages_pro FOREIGN KEY (product_class_id) REFERENCES public.pages_productclass(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.pages_littlelooppicker DROP CONSTRAINT pages_littlelooppick_product_class_id_83004df2_fk_pages_pro;
       public          postgres    false    3818    233    245            V           2606    35958 T   pages_littlelooppicker_product pages_littlelooppick_product_id_24614306_fk_pages_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_littlelooppicker_product
    ADD CONSTRAINT pages_littlelooppick_product_id_24614306_fk_pages_pro FOREIGN KEY (product_id) REFERENCES public.pages_product(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.pages_littlelooppicker_product DROP CONSTRAINT pages_littlelooppick_product_id_24614306_fk_pages_pro;
       public          postgres    false    3856    271    265            :           2606    35756 Q   pages_littlelooppicker pages_littlelooppicker_brand_id_5dce4980_fk_pages_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_littlelooppicker
    ADD CONSTRAINT pages_littlelooppicker_brand_id_5dce4980_fk_pages_brand_id FOREIGN KEY (brand_id) REFERENCES public.pages_brand(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.pages_littlelooppicker DROP CONSTRAINT pages_littlelooppicker_brand_id_5dce4980_fk_pages_brand_id;
       public          postgres    false    3788    229    233            ;           2606    36015 G   pages_order pages_order_billing_address_id_34658b3d_fk_pages_address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_order
    ADD CONSTRAINT pages_order_billing_address_id_34658b3d_fk_pages_address_id FOREIGN KEY (billing_address_id) REFERENCES public.pages_address(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.pages_order DROP CONSTRAINT pages_order_billing_address_id_34658b3d_fk_pages_address_id;
       public          postgres    false    3785    235    227            <           2606    36020 H   pages_order pages_order_shipping_address_id_7cae927b_fk_pages_address_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_order
    ADD CONSTRAINT pages_order_shipping_address_id_7cae927b_fk_pages_address_id FOREIGN KEY (shipping_address_id) REFERENCES public.pages_address(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.pages_order DROP CONSTRAINT pages_order_shipping_address_id_7cae927b_fk_pages_address_id;
       public          postgres    false    235    3785    227            =           2606    35784 9   pages_order pages_order_user_id_a8a10f35_fk_pages_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_order
    ADD CONSTRAINT pages_order_user_id_a8a10f35_fk_pages_user_id FOREIGN KEY (user_id) REFERENCES public.pages_user(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.pages_order DROP CONSTRAINT pages_order_user_id_a8a10f35_fk_pages_user_id;
       public          postgres    false    259    3841    235            >           2606    35789 ?   pages_order pages_order_voucher_id_54a5ba43_fk_pages_voucher_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_order
    ADD CONSTRAINT pages_order_voucher_id_54a5ba43_fk_pages_voucher_id FOREIGN KEY (voucher_id) REFERENCES public.pages_voucher(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.pages_order DROP CONSTRAINT pages_order_voucher_id_54a5ba43_fk_pages_voucher_id;
       public          postgres    false    3832    255    235            ?           2606    35795 G   pages_ordereditem pages_ordereditem_order_id_9697c8cc_fk_pages_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_ordereditem
    ADD CONSTRAINT pages_ordereditem_order_id_9697c8cc_fk_pages_order_id FOREIGN KEY (order_id) REFERENCES public.pages_order(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.pages_ordereditem DROP CONSTRAINT pages_ordereditem_order_id_9697c8cc_fk_pages_order_id;
       public          postgres    false    3798    235    237            @           2606    35878 K   pages_ordereditem pages_ordereditem_product_id_e197b770_fk_pages_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_ordereditem
    ADD CONSTRAINT pages_ordereditem_product_id_e197b770_fk_pages_product_id FOREIGN KEY (product_id) REFERENCES public.pages_product(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.pages_ordereditem DROP CONSTRAINT pages_ordereditem_product_id_e197b770_fk_pages_product_id;
       public          postgres    false    3856    237    265            A           2606    35807 S   pages_orderhistoryentry pages_orderhistoryentry_order_id_d94d748f_fk_pages_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_orderhistoryentry
    ADD CONSTRAINT pages_orderhistoryentry_order_id_d94d748f_fk_pages_order_id FOREIGN KEY (order_id) REFERENCES public.pages_order(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.pages_orderhistoryentry DROP CONSTRAINT pages_orderhistoryentry_order_id_d94d748f_fk_pages_order_id;
       public          postgres    false    3798    239    235            B           2606    35813 Q   pages_orderhistoryentry pages_orderhistoryentry_user_id_772c83dc_fk_pages_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_orderhistoryentry
    ADD CONSTRAINT pages_orderhistoryentry_user_id_772c83dc_fk_pages_user_id FOREIGN KEY (user_id) REFERENCES public.pages_user(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.pages_orderhistoryentry DROP CONSTRAINT pages_orderhistoryentry_user_id_772c83dc_fk_pages_user_id;
       public          postgres    false    3841    259    239            C           2606    35819 Q   pages_orderitemscomment pages_orderitemscomm_order_items_id_2180546e_fk_pages_ord    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_orderitemscomment
    ADD CONSTRAINT pages_orderitemscomm_order_items_id_2180546e_fk_pages_ord FOREIGN KEY (order_items_id) REFERENCES public.pages_ordereditem(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.pages_orderitemscomment DROP CONSTRAINT pages_orderitemscomm_order_items_id_2180546e_fk_pages_ord;
       public          postgres    false    3804    237    241            D           2606    35825 C   pages_ordernote pages_ordernote_order_id_cc81ff42_fk_pages_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_ordernote
    ADD CONSTRAINT pages_ordernote_order_id_cc81ff42_fk_pages_order_id FOREIGN KEY (order_id) REFERENCES public.pages_order(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.pages_ordernote DROP CONSTRAINT pages_ordernote_order_id_cc81ff42_fk_pages_order_id;
       public          postgres    false    3798    235    243            E           2606    35831 A   pages_ordernote pages_ordernote_user_id_1fef703c_fk_pages_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_ordernote
    ADD CONSTRAINT pages_ordernote_user_id_1fef703c_fk_pages_user_id FOREIGN KEY (user_id) REFERENCES public.pages_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.pages_ordernote DROP CONSTRAINT pages_ordernote_user_id_1fef703c_fk_pages_user_id;
       public          postgres    false    259    243    3841            O           2606    35911 ?   pages_product pages_product_brand_id_7e5d94df_fk_pages_brand_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_product
    ADD CONSTRAINT pages_product_brand_id_7e5d94df_fk_pages_brand_id FOREIGN KEY (brand_id) REFERENCES public.pages_brand(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.pages_product DROP CONSTRAINT pages_product_brand_id_7e5d94df_fk_pages_brand_id;
       public          postgres    false    265    3788    229            Q           2606    35930 M   pages_product_category pages_product_catego_category_id_94c06d06_fk_pages_cat    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_product_category
    ADD CONSTRAINT pages_product_catego_category_id_94c06d06_fk_pages_cat FOREIGN KEY (category_id) REFERENCES public.pages_category(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.pages_product_category DROP CONSTRAINT pages_product_catego_category_id_94c06d06_fk_pages_cat;
       public          postgres    false    267    3790    231            R           2606    35925 U   pages_product_category pages_product_category_product_id_dbe5cb9d_fk_pages_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_product_category
    ADD CONSTRAINT pages_product_category_product_id_dbe5cb9d_fk_pages_product_id FOREIGN KEY (product_id) REFERENCES public.pages_product(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.pages_product_category DROP CONSTRAINT pages_product_category_product_id_dbe5cb9d_fk_pages_product_id;
       public          postgres    false    265    267    3856            P           2606    35916 B   pages_product pages_product_product_class_id_58884190_fk_pages_pro    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_product
    ADD CONSTRAINT pages_product_product_class_id_58884190_fk_pages_pro FOREIGN KEY (product_class_id) REFERENCES public.pages_productclass(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.pages_product DROP CONSTRAINT pages_product_product_class_id_58884190_fk_pages_pro;
       public          postgres    false    265    3818    245            S           2606    35939 M   pages_product_sale pages_product_sale_product_id_2f52b2d9_fk_pages_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_product_sale
    ADD CONSTRAINT pages_product_sale_product_id_2f52b2d9_fk_pages_product_id FOREIGN KEY (product_id) REFERENCES public.pages_product(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.pages_product_sale DROP CONSTRAINT pages_product_sale_product_id_2f52b2d9_fk_pages_product_id;
       public          postgres    false    3856    265    269            T           2606    35944 G   pages_product_sale pages_product_sale_sale_id_c984e59d_fk_pages_sale_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_product_sale
    ADD CONSTRAINT pages_product_sale_sale_id_c984e59d_fk_pages_sale_id FOREIGN KEY (sale_id) REFERENCES public.pages_sale(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.pages_product_sale DROP CONSTRAINT pages_product_sale_sale_id_c984e59d_fk_pages_sale_id;
       public          postgres    false    249    3824    269            F           2606    35836 G   pages_productclass pages_productclass_sale_id_e0771cf8_fk_pages_sale_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_productclass
    ADD CONSTRAINT pages_productclass_sale_id_e0771cf8_fk_pages_sale_id FOREIGN KEY (sale_id) REFERENCES public.pages_sale(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.pages_productclass DROP CONSTRAINT pages_productclass_sale_id_e0771cf8_fk_pages_sale_id;
       public          postgres    false    3824    245    249            G           2606    35884 M   pages_productimage pages_productimage_product_id_3ddb808a_fk_pages_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_productimage
    ADD CONSTRAINT pages_productimage_product_id_3ddb808a_fk_pages_product_id FOREIGN KEY (product_id) REFERENCES public.pages_product(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.pages_productimage DROP CONSTRAINT pages_productimage_product_id_3ddb808a_fk_pages_product_id;
       public          postgres    false    265    3856    247            H           2606    35842 F   pages_stock pages_stock_location_id_fb84c426_fk_pages_stocklocation_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_stock
    ADD CONSTRAINT pages_stock_location_id_fb84c426_fk_pages_stocklocation_id FOREIGN KEY (location_id) REFERENCES public.pages_stocklocation(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.pages_stock DROP CONSTRAINT pages_stock_location_id_fb84c426_fk_pages_stocklocation_id;
       public          postgres    false    253    3830    251            I           2606    35889 ?   pages_stock pages_stock_product_id_0b368fde_fk_pages_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_stock
    ADD CONSTRAINT pages_stock_product_id_0b368fde_fk_pages_product_id FOREIGN KEY (product_id) REFERENCES public.pages_product(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.pages_stock DROP CONSTRAINT pages_stock_product_id_0b368fde_fk_pages_product_id;
       public          postgres    false    251    3856    265            K           2606    35503 F   pages_user_groups pages_user_groups_group_id_85978ba7_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_user_groups
    ADD CONSTRAINT pages_user_groups_group_id_85978ba7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.pages_user_groups DROP CONSTRAINT pages_user_groups_group_id_85978ba7_fk_auth_group_id;
       public          postgres    false    261    223    3777            L           2606    35498 E   pages_user_groups pages_user_groups_user_id_ebb51da1_fk_pages_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_user_groups
    ADD CONSTRAINT pages_user_groups_user_id_ebb51da1_fk_pages_user_id FOREIGN KEY (user_id) REFERENCES public.pages_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.pages_user_groups DROP CONSTRAINT pages_user_groups_user_id_ebb51da1_fk_pages_user_id;
       public          postgres    false    3841    259    261            M           2606    35517 T   pages_user_user_permissions pages_user_user_perm_permission_id_30db2006_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_user_user_permissions
    ADD CONSTRAINT pages_user_user_perm_permission_id_30db2006_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.pages_user_user_permissions DROP CONSTRAINT pages_user_user_perm_permission_id_30db2006_fk_auth_perm;
       public          postgres    false    221    3772    263            N           2606    35512 Y   pages_user_user_permissions pages_user_user_permissions_user_id_d1acec27_fk_pages_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_user_user_permissions
    ADD CONSTRAINT pages_user_user_permissions_user_id_d1acec27_fk_pages_user_id FOREIGN KEY (user_id) REFERENCES public.pages_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.pages_user_user_permissions DROP CONSTRAINT pages_user_user_permissions_user_id_d1acec27_fk_pages_user_id;
       public          postgres    false    3841    259    263            �      x������ � �      �      x������ � �      �   *  x�m�]��0���S����y�5
�X�M��vR��+��HJy(�P�`gj�����x/�i*n���6/��~��
��k�_�a&�:����=aa&�&������1�\]^���(�`0|6��F�h�^:"� 1�Z`���y�����u0��cb����hI�V:Kx4���}&t���:���V�mE�7ci���Vzd�E�ckW飣�u�OE�������DN�	!���]<��'9��EO��J�ꂢ�A����[�K.0x`�7�:��Օ�ey����׭E<��1���ԫ�V��s���[)�ȥ�,o�!Y.�-���!�
�M��C�h�B�$"�3�\kn*��݊q�11u��aX�"�ͼ1/-�%F�f����u�5o�eJ_t�"�-'�Ǖ�`�!ːKe�>e�r�L���G�/�rN��I���`�����ZNVp�4U�6�ʴZ]�i3�L��M�6�rZ�l���ew��8�10M��#Rf�ϳ,# <��	e� r{�2=�{y��~��p
�0�L�ڜ�teP��LB7%m�p�Px�%�o�Ňmd�03m�.A�u���D�N��.O2�l��Cp~�M��N���h"�V :�ZZ.`����z�[X89�ө�E� �Z� ��R$���څ?z�.�=ۡ��̖RH,�3�J$�hH�+	'`7�<�_���p$�Wӫ	]GNuGph4r�0�
�"�-������7b�$M�f�z�+�i"RM�Eh;��䒐!p[��OZ�Ay|6�j-�Y T[�@g�D[h=؀U��6Ee�>c���s@zs1C�f_98�����6���ۈ�-s��a\�q�p�V)9�MFT�"%J�ǈ�[��1n����`'~5'�
Q��S�՗8�
AAc�������y<p88��۠Hjú
�0,�~�� ���y��Ū���Y8)p2�_�� ��݅a��a�!z�Y�hi��r_���MOi�:��a�EU�<�� JZg9R����M*r6%��qn��yV�9E�=��&9"P�7��q���I0�دƘ�J� �      !   o  x��Z͎��>k�� ��������{l��>8����#z5�LQ�Y>%��r�S>&��$o��nJ���4��5��H������M@�)D�F_$�J0�K�t� Y$9�����d:M�'��o��b ���9�\�S�E1���!=k���6��b�H���yH�G����5���$UV�� ��y���(A5�<>��h�'W�F�e���r2�.�l�"z�Ԍ��{�|��ѯ���)��[bO����ߜ,�b���4:)�}�N*�=��ߓ[�<�|DPOkj���,��I��������ݏ�����������xMJ9� �x%<����e�U8JTM� #pV��Hy�`�Qu@�Ԉ�Ce}0]�a�6%�1������lIED4��7hC�_�����R�24�'�����8�ҫ�xR\]�y5ά_���D�/�(�Q�E�RhM�4��Ȁ#d�f�*�Q朙�X��,�/k/|�����~~�IRs�gIY!��<�ғ/�m%�J0^G��LS ���$�^�f*��\�Fg�!<,�4�#�!����HP�p/~��y:��cD����\���$Zj���X����M/L,)|�,[NVY����p�#BFDŊ���\,���<�/�ϒ*����	#�H^���ͲŲ��vЫ�q�|���ū4��@�`�c�k@�)��E?�f� �������^r�A.c���K�{|D���aD��J��+��i��4�����l��2��rΉ)�"M�E�G��8L���Ϣ���h�.V��N��t� ��C}����8�2j9+	k0R�I�ܗ����/��MIO}��&�d��_\$�:7�2�Z� X*c�_��h�k7Ƙ�7Z0^ǘ�j�'����4
!��f_��\TI�r�����t4�{�v���g��t�~np��?v�VG۱�������<�Ƌ2���˲�'��.O�ma,TS�V*¸ta˹}�f͛��=�0L��w��c~�!B��o.�&�+HO5g�j�{�9��>��Q��&n_����*ɫ�z�����a��C��"1!��� Y��D1�m <d����~U�ٳU�.��hD�)��Ywzo�;�r�Nc[p��3.��{| .Mp5�t���3o�}*:��/=Y]=��j��r*Ǝ_*L�a�-�6�k�z�9��Pt;��؛п�Xf��$��;�z��hL���0, c�=��5\Lt�-m��<�/�s0j$6����ڗES*������oԹ<���ң7��&�4���ƨ�e�]� zs5o��g�j=g�������mv�R�wr@=r��\؅Ŵ�`�k�u���;�"v�(#jl�*��L�1,[�;9���#��!�V�.y�ܽ\ϳrYE��(Y�łXA��It��t�e���仓���۩gc�ys��~�M,��솺G���!U��;�o�d�V v֎
զ�S�$TOU�R��@��2=��ѯ�$�d�P��S)IC
tvkC5��gE�"K�{=��Ư<Whs�q�c1$�y�lVL�9j}�c);�a�E%�L�E}�O��r9ˮz����9�ݑ�\�˟�̕�5��b�����������p��l�W����2���+׵$+��qb����ȫ�U�lqr���_��4؆��J����ɁRÏ+5�T�IhR��qPӱ�\iޛ�ļMM�ْ\�:xaHh��E��1@����_f}N�Cj�	Y�}��ZZ��610�P���v^fUѵ۲��AƄj��/��)�2�mX�4���ì�&][ � ����w�!���jGCMͶ���]���LѺN1����	���*�f�iL�z�}Q��Yj+��e��'�2[���m�q�D[� �P
�j<�J��~!2�F�ў����׷�C�Eا= ���βy�XX��^L�=��'�m&��utf�Nb�l�  H���@�ǿ���������kqaCV��H�ݡ؛�.N�'���>h^P����fS��9�b��a�Jl��۳���2x�:e�Mq�YC�X��1��k@^�am6��}�k�qlL�M�(��Ú��{Tg!���XD��]a�E�<�|���H����٤�]
a�}�jB �m��'�R6��k%�=��;���X�4�~~c�Z����Ե�om��y,����v��='����2�4%"��7��1%�j����5��5�%s�4���$�k�O��]Fs��� h �( �0[x��iXH�Ń��m���!�E�n>O��_ϕ�\���Y��d~��"���Q��D�b�!����@�@?���a v�K�Ӳ1gt�F�X�I�|�9����1!�]j.9YlSBB2m���D����Sf�u���3�mƀ���D�<G񆐷��zML	� 21�\S��@�MFi�K�Y�����,7�ws�e�76�������ILn,��2����]c��#��t�Զva�SJ��ڑ���&|B�Y�!�2[VWIW_�Y�>�5�c��d�����������C�X
��/i�v7_h���ر y��c(� W:q0Ĺpx�.��e:�A5ͧˡ>M&/�R��~�xrPT����a��a<b� ��V~p���Λ�0p9u�
�D)���̞�-	(��[�����;Q�P<��yv������l�'�Y��C<�ˡ$��s�(�i�0p7�K���������"�a�#/{���/�at��E�O_�y5<K�xI9dǫy'��0{��87MK�����Z�/m��{�!\_�����ǵ�@n�_�Ѭ��I�1q��e�-<�&Aa�b�[|Pob��zI=�����f��Y�=-V���2Y��٫l|QL����QzU����eQf���$�c�H�;g�#@�ov�l�EX��J*j�Rގ�ӎ���Y�O_׸/�2y�3d���_,�ΰE�Z�qK��l����p�v���MڛR2�=���t^���Ov���4�70�n�*���_��@�ߨF�x�\��{ ��O#3����IG.l"֑��-��_\��v%ZC�4B�&���)�κ�3���9f�k��A���Co�9����L�s��δ?��[��1���3nq�9��%�un*�����7�{����?       �     x�U��n� E�㏙���_&M�0)?�	y�^#�[M��c�X���S�9s���4YJ��y�XG�)�Y<�\�Z�k��b��ˮ�a���pݍ�����}b��^��D}�
�g��>G��+KC�!]�K���R�R��R"FP��ʅ\�l����|t}��TDu�m����$��թβP��Q�a��u۪�@��'���A�	\�i
4o��4U|����ۙ5�xu�_�,�˨�h1�	���Gw�?Dw7�o��o� ��Y�z      �   �  x���ݎ�H���O��U��]�<�J%&aҥ%�Қ����2$���A(�;��c�ͩ�vB����t;H� �{�Z�L��Ŀ�}�ݡ���e�o÷HKh]$�D?������>>���>K��$H�Rr�\�/^	����P����v�C;��4�������/ߵ��륔! ��"Ew��ė�܄�K��J*fQ�k�xI���<���|���]$�Z�k��w�)������H�Aq���j�{�R�T'S�-L� ���{$�M��܏�o�Gߎc?�s;M�o/��T6��"g_��$K��$�.J�)EߒRTR��J �J����S1��qaq.�����c�붲��c�0&i,^\�g�y*���YK�	��R#������8�S?�����g;��0�]���0��?��~<����0��|�&.��}������tF�� S���ν�  �GT���U��-���'�\J'3��p<���MfPW �`r+��`�|��dK!p^_� :��B�"[�9�qF�욓?|����?w1���?����[��(e�1Pɝ��Nr�Q\�kT5��A��(�7��¡)��s����[!�O�*�������X+�A�I�WF�O����5R%�J�Ǖ����C�~�e�� k%j9kt�,�-��N������NuE��7k��TK�x!�&&Qp����U�͞�.L��r<�(�$�����GΞ�PJ�S��߶��_p�'�������UP\���9�?w�6y�Pq�]�l{Pܛ�w{Pu̞�����:0���.�󏸾�xz�!����t��z���?pD�Le�v�Tlv�d��ɐ�2N�&�bCp�<h^N{�5[	���X��P���׏��Ip���ņ� [��2<��r� A">�\���X
��ך,6D��<? T�y~��V��<��Ĕ������� �Mӑ      "   ]  x�՘ǎ�H���3O��Ғ��ɰd)o���{>�O�g�gj�� �u�/ND�H�rJ2Fi�{N�a��I�fvagME�?>�U{�e�k���{NQ:�^�ih1>�s���4(���o載�qQ���#���*V��].�mϒ�u���L����^B���۫T����9s2Pd���v�Z�*��Y� ơ���Y]YE�|n����;|7<S�}:/�<�`NӉ+��u��-����xt��ǭݩ���Y`o'�׍��5 ���~ ,a ��	A��`B�Ӡ���ev�4��H�L����-	�X���4��U����E�.豋�"�^�g{�ء���fE�������	�Q�
�1���jc�o+פ��ߐ��_R���B~Ü��y���s;wrc�6���W�{����엿	��H�6� ��yz����Hltг��:�&aT{������Q���)�3��zK/�|joW�Uj��柕��6 �"�������C�E(�Z�)�L^C=`In�i����f6�w$䄎t�
,'y���S+�����)8NC��r3~x��M�� L"C��<����fY����&3�V�uX�X7?�I��EH)^�G{�Y��pen8&��mzȒ���P���Q����U�5XO�w%R���m{s[	�m9���h�T�Q����3�+|Clф��y���l�0s{v���ϱ�6ww���(�ۆE���\�`�g��*����L��o�F�i1�̑2�1h�l64Z���(�/��ՍR`^����r܃_���JX�(��D��89"Z�s�u�m4*(R�]���g��Ew;�,:�r'VmJ�o6��:���LX��J�0k���T�Տ�c�g��Yx���@��lGS��ܔ�_���D��3Oޜ�MYj��{�����ám��\Ǜ�1"4y���2G��������:�Q{u:���Ei6Q��k�������;qb��u��Yf{Y���f�<����P�#��{9"��GB�%Q�7����6�0A�ӱ��k��,}>xU��;��\�i���*'�C݄����ţ��������D�ЋPFX(�P��lҜ���4>�Q��ݷ$���}�)ߤik�'�����Z��>#�<9��ۡ^����/��(a>t��=�]]���N˶���L3����֐��@�K�U�nnS#��Q���¹ݼh�G���si4����w]�+iY�1���-1�i���8���b��R�+s�y&�_�ۇ4`�+�SS�7"�����0=f�i����e]���*J^CE�E�K�r\�2�'@��f^�Dws��,���/՝*���e�C�\v}<�;���:����zn����3݊_U�˂������� D�/fm��
Q�Ql
ic9���o�{(�%��]^�x��q�p4��2?�Qɦ	�JAuz��䫪 !�!r��[5�-�D䂉2���^�� 7!�~���΅�����M-nu��;��a��w5�`�n����*� �� �#NCڵ��s!	��ms+�C��i�/Ճ*�K���sѲ��|��i\�}PnEm��O�&;��$���UU�(�����{YT�-ê+��0�*�Ԙ���p�h i�ߪ��M�g���&��]>ؐ��|�S�ʁ�d��h?�j��l���WX� ��k��$��wZK:�a)p�t���8�� ��z�J����UA�<�qȑ@|�Ony�척�����f�U1�����㗢a�E������%bڥ����7�U-)2G�==�J��(�O�F�W��nzj��G�]��OV��*���!9��oL/�}�t���n�EN�
G�0F�V)x�?����M]ng:��si�	󁼺`cz�����*�D�U߈k�e] !����f%"0�+���f[ёSE���3�2�Sw��`l��n>:/<G�g���f�w�C� 	�	10T�(��Z�S V�����m�q�=�ݺXr�E]����υ�[F�Z8��<):њ+A���4�;]�'�a���?������"��ԲҨ�]\G:�P��8/�����"��M����t�{'�m����8->=�ѫ^Tכ�>`*#g��� }_�C�?8c���X�fѧ��"�1+YIm{U��oHH�����ݽUT×s���͊�i>�>;����J�P<Ч��k	��C���3d�+��u�T]��94:����w$��B�4rq$k�O�;M�L�^�Z:��i&^i���1���|!��D��@)�IHd���k ��P�!L�R����i��z�aWJJxڱ�n��2�1�x�n�]����y�n� �1����-�@Crů`E(��=����G�9�if7	1��:��7��xX1i����\M;��.s=9��Qy���`��Ϛ���ps���o�B�c���6 ����۴�,�u_��J�����B3�]�����GՔ�[����Hfk�4��1ߣ�󳿶J��j���:6�T}�\$�!z�ak�_��z���&���� ����t���_��Tڻ�JZ�j�c�%�~!��QR�������uz�^��:�Q<��*`�u*�t���HQ��Egƃ`WZN~�֍4va�̢v�E5��^T��x����Z��Ll�^ظ�z�*J%(|��=<-�QiF�Mj��Ѳb�1(���j3�X�誘z��C���9-;6�8[�:b}w��M��U�~��w�a��"�8L�# �,q�t����j;�V+Mȧ�]e���q�O<�b�Ҩ�T�V_]͕:��WU�<��)���J�P'����c�i+F}H7M/�߰�x��Rc,4y�Ϗ�ڋ+���X�U1�Ŝ�m/�n2�7�aA�c(
@��~���q�xi��s�� �Ӫ0�����o@��w=k ���L��m(�������̮��t\��ڶl!X��u�f��	�z���ҵקn,R��^LF��>U�RA����G��ta��C}��+N�wf#yv�휓�n�h�ӧeD��Ua����ϱ�[%ou{i��"}VM-hC(߼��v�^�-��c:���r~��zH|݇#���MA��h��7��Z�%�� V�?��7��x�%��ei�C�/��|}7zS�M껥g��!���Q|!4�a�a��z����?���u6�      �   4  x��T�r�0=��j��.��sј��%�LY��� ��Q�L]-J�{Ip�E�@츁����<���|/���ؑ@�i�s���}�\P�
E�pג���a���C�!�j�#+���?�X�R��7{�*��8�{��`�>l������ja?������y;X-,�Թr"���!��!��PD�I?�A'�Z0ͣ:��4x}���*�?����Mv�o���գ*JV�T��Mq���D��s`u׃�<�=�.�4�v!� ����<V����-'J�ͧ�D�x�$zz�lL̇��¯�M0�x�	bH�����(��є��������"!#1h���e�:e�ی��'.��cNZ8k8m�p>m�Se������"NHu�#i6ᜅʫOw����4��5��1�iV�8[�B�O��h�|�F��el}�
	�YB�)\�*�^w_��{��^m��vV*�@*}��	*��w=�r*��:h��lS�ݫ�G�u��������W�1�~���̋1�p*34�Xv���;t��͢Ժ��\���X9.HyGE���J�.OܶD&���z������      �   c   x�3�.-H-R�2����K/����2��M���2��/J��2�t+�,�/�2�tɇ��9�3K�K�,8�2K��,9=�2��8}�����b���� Z�q      �   h   x�3�t���K-N�L�4����8��KK2R�K�3���hb\��^��p�0�1�w~Q*X���e�����YP � ���e��(��$7��(�+F��� �m3      $   6   x�Eʱ 0��ޅlv��s�.���r�"�a}jk�5v2�!� t
x            x������ � �      *   G   x�3�LOI"N �b�%��rr�E�9��S�����Rҹ�9�SҲr�S@��U��qV$�)�=... *�      �   1   x�3�.-H-R�4��!c.#N�����ĒT�����%W� 4�k            x������ � �      �     x��XKn�H\˧�~���1'x�9��Sl�V��d�L�OV1��,��~�~1�Jk��fd�Wm�ￗ��BQk�F��7�|��ĿHW�+�"�k����.`_dk�!P�U��҈KX���X����[+�2��#+r��+{!�����t�i��Z�W,���W�Uh5)Z����I �4j�ߏ ɥR��C�LZ�'��)b��j6����z�щG�+B�R���ݨh�FR�Va^���A&��evh-Pں�d�𾮢�[e�)��BQ�p�>���#H�iP Ӌ8C�&�f�4�{ln��K���XϮ�j\�G������F�rp��td86�o���Z��y��l+��n���g��Ѓ����m���;�ֲ�]���v�ΎX�Pr�:�<�����}v��R��tw0��s������W�l���LnT���M$Z_0�z�	f\�txag��)n�?x�0$�l���Z:qT_XK�7^@d;i�P�K��"�t����a1�͐�06��w@�`tpe���(���*a�qH��g��s��N9�F�&����|�h�ۤ���}g�OF��$�^���n���)�
��b���+�o
-G/�Sa_	B �X|]�����`y۽�����>��W^^�<y���fN�U@[z4���S�K݃���N�S�U���o�r�fD� ��b������- F�[�6�����v��������4�li�b5�2�<A��֛/�81i 2����,���\5��	���y�J�ۭa��%~p⥁i�x8]$�N�|e1`��8�Kd�Dwv)� (:���ё����h8�Wd�J�
�G	���r���u>Muˮc�w�2����O�ފ�Ɋ���ږ:�k�N���KR��Nx�	\��&J$�'��A1x�j��V���k�+�]ӟ�z�bp[v�qxm�閴��+�%b�خ�ExW��%#��X�*=�\R�9�JQ�D�iHf<��ԑn�7" ��v�����`"ޯy�T
���&Ѧ�m�u�ɋ�%t�"K\�~Ӡ���So���YS�8Jn�����t�A7�`G���#��=�P�[8 r�a~د�q�y��z���gƁ?
X�`��0B�0�@lVay_���,�sat���2y8��o4�}�s4���|�m:p	l7����UP�շ�ȫ��ny{��ܫ�f�p�DB'ߜ��*�G��E^@�J@��[i��Q����?*����������2߬�Qm0�
�gd�r\���yLPR���w�Ē��~鬕e�M�-�b��p��L�I��G\�L��nZn'ׄ k���1� �Ț^X���ol{�
`t�F;#�K"ٳa�=�����Ŵ�$�����Ӆ~p\�ì}H����{̳@o�`Z���L�Fb��������InZ�ŵ��I��H�����.<(�oL�� %,��t�`U��p�r��q�-r��/�b?^Z@��7��=�M"�|~����^_��wy<����u      �   -  x�m�Qn� D��a*�ؗ�	���ǭ��6Z)/Øn����{c�MkL�O����+ؾ��֤����%`ښL���7����j�if$����g_ԺI7~�i/j�D��C+#���B��{?���N��$-�2����5��JFǜ����֧R��V�+�G�4���#R�;�Qnz��Ձ��i=hד�d���Kh�Xi������
,��u��
\	W��&\��b�g5d�Hc5d�ZN�����j���X��d���GvOu�;��f���!�@]�;����m��      �      x������ � �         �   x�m�Kn�0D��)�"p���śv���$�?�*�m.�΀�mIIX��#�f���+�p�JB 9�d')�On�z��%B��&�R�I� ���v���/��K��{� �u����OG;�yNYD�?��2���׷i���O��I��9(���vg�/X927��9�.��0���D�            x������ � �         v  x��\mo������?	���K-`�p��I�8@��-�:��Q���ʯ�3��ٕe�^*t�������<3����dS���R��+�V��.G�u���.n����|�+mΚ�'ږ���B%�J�F��Z1�WR�� ٪;I�j+�!HO��n�������u�w��%�^���m��}��������������̙���o/��B{Z7�x ��K�U�"�j�	�I��$)�͔���\v��O}��_l���qu������m�b�AѾC�}KN˙�n9UI����aI�I�N���L���h�u;��x���B�I�z�dL�"���%�}&�RlF�y��E��Jv��A�,l��t�ׇ�㾫���t�~��?�}\�Mߝ�#��YciI��ǐ�!Z �0r�5�T�_ZR3�M2�~�O|�oL�+��k�)�pX?AC6����Q�$�S��CAG[;ra&�?'VxƖ21�2�0%>�ٸq#� �Ӷ�N��Q�ax]�k�+�W�B{���� �q3ׅ�4�E#Z��	3)rA�T�\�V�ż�ǽK�ʱZ�I���f��FFχ�X%�d����eǽ�$% (��owҔ>�za'#V�=Y���EI�D���a e9i�ti��%����'��(��L�DOPgs25P�������w��:]"�Ȇs��n��P%�C�*�䓶<a�;1)g�/8N����`��	9��s��gSm��V	9�������9����%�I,���x:z�r2���{ff�HJ�
�_)��{5Mf�Y���.��g����N(�'�����Z+�b���j63���\3�{HYF*�t������Z��P��q#��J�~��2z)�@/Ik8l�0��!K��rŞФȁӵB��5��]��Z�
B-�O�̖�=D�VK4'Y�T>����4��H��4��S j�Z&��b0����{<�i�B��yL�� �p���?>s�c7 Г��i��K3<����W�	]Yf���[�NUE̘�s,Hr˂�H�%) �U�פo3�+ڢ���K�3&	l�-��C��X�܁J*�Nzģ�HH6��nZ�K∷T�|֯�G#)��f���1�R�5(	����E�m�&��$MD\�sѤ����hKt
˫��]�'��C�	�I�m̂�,Z9�O"2p���vS�rP�	�Gu�N5%.坺�y�.���)�8M��
6n�d!7E$�s�N:�ى�U�s��'ɅQ��PGCE�tlT��C��U�I#Rs�u5&��t���3�M���⎇���GH!��
�~iK.R��#��Z.�m������`Ȁ�w*�����ͷ�#9�0�!�*�2��)��7|E��H\�a��j�y<m�eícơ�p�"O��B�KJ֐W���k��Q�W �r�����u<p,͏�׃:LwC�)�ev@���B^<ݞ�'ֻ̧I� ��pKu���Sw�7]���|n�P-��d91�f��R.EF��n�h&S�����6]&�۾��Cߤ�
�D4<��=vo�n��^�zMMKZ�mCp��e�mI"o�*�&3��p%puMr��m��
��-��>��>D�됵:M#���Y�"L�W�
�-�'P]TF�3",U�9b-�^��D�w�<�z��7eH]8�W~�Vv6�1^���|���9d�H��u�{n��)��B�_�e�Rbh�/G��Ӽ�F��W
ap��{���5ۇ*� |IP�&��L"=5JQ\�YQ���I�4y�T����x�54�D�F+BIE�C�ִ>oJ�P��f�&�'�hKJ�������S��D|P�P���ʻ�@VmE(1�� jr����"v�e��fDF�Lf��4��5�JѢ�i�p�PU�z�?&^1�5�p�����#�,Yh���i�T�Q���2�p��E�@��4l6r#���ܲ�1Ԥf78�\v
��~u���~��_������]I�bs�������o���N�._�ɩ*E`/:p��
� �C��#L�����[�����,1���3Z�HYD�H�ٜ���EeYE��xkyd<W	����,r�p��**�=��P��hV��H�<7<�WCh)bk�
Z0\�"�[+��"ep�g��Q�)r(#�0�Q�9E�(��~�K��*+�Z�p�K��&���y�Ʈ��8P<H*��L�;\�P~(���=N�!<V'4O�i�E���؆4�QE���-��q�8QE�L60'J����ET��!�Ԇ�&�x��ό(�v2�a��m`��*�9d�dIȪ��'���!ʱ�$N��	|�}��*¢���A�3j�*�\�U�1+�P���*���Ͳ8�
�JK��8���Y����p�E�Hw1L��}N,��B���ZD�iqz����3�5}e����v�tv���p��E�K�7Y{��EO�Q�I�7�pY�=[F�H�~�ΕH�#s!�H'��Vt�P������АS�T��i�6k�:�EdC�7~|6z搭�����fx�Ǒ4�_-���ᒮ�Le���g�h���L�EX��G����g��bW�*R��.`z��o�!�/��3��K˵��h@��y�p�[`�}G�7��"B!>�Ц1�F,�#~�(u	�*�����i,Ǝ�����c�;w7��*��lN�V����n�z����o���v�7�UX���?������H#۩),�k�{k}�m������o�f�z�]AP�]i���k����W��剄bZ�H˙/-�j;��կ��ހj���J}a���⫔ث�K��f�����!LATQHnCv���1�PiHr����6�eW?�^��O���f�ߌ ��ݶ��֯�O����x���7����q����+G	�ϕ�����JsT�,�$+�̯g�G.���ݚ�̆�=���X���[����6�"sUR�󛛫>�X��L����ǉ�1ƹ�fUJNq��_��+X��y&��B��MO|:�S���X�&a`"Q�^+&���,]�1i�#�R,r�����I �GKʕ��O��r����aS��]�6�����;�`} e��㦯��~������#6����5R��x�ϻ�f��W����a����Ͷ����հ�=����f�����f8����C�~;�����ׇ�z;�׻���-�ڝ����W�n7���۾�Пo��a���mz��|V���K?As���r�V�3��^�a�_כ�5����`D��s���F�!<�cR,���y�Eq"�\����$7T-B.1l%ӓ�*��*81}11��cSW!��i�tWa�y��3S�Ɛ�^��t �)A.�a��R~����"��z��&��Dl+��>=)6=��2��傡[�y |F�� �%�j�w�v�ug�-Q�2�$�ڰ��S 4��q��ә�^[�1h�Z!���a���/Q�f��zrLbO���'o7���ϓ����LG/�YW��̀�荔��M���wz9Kp��	��d��9�$� U�֨_�[J�[���~8��z� �|7^] �����[�]��r)�Ӊ��Y�þ��]M��=@����pu[��t>�^g�/���]�Ёv�@�fwu8G!���0l��9��|{����aG���'G;��R� �~�i��D�rw6gw�4��'�Ƣ��d>�2��΄�|�.�         B   x���  �7��2j/�_��	ː�#Y݉hq����K4���n��p���!����;H>#C?         P  x�%�K�c!Ǻ�������utI��٘JJ�����7��-Mv�����t٩������!˯8��d�Ֆ�WGH�9l�N�"�S}8�K��W�8~��C�M���X�G�~�j8<!i�k�wNM�ϭ���h:^M_f>M��&$��Z>��V���de�k]-�[O�uv��v	I<�}���3����NӶ�)睡㼳u��a���M�y�t=�;t}�t�w���������5]����M=�����G��������yG��lQ4��'i={w�¦��a�N�(�<�2-~ơ�6�g*.���1��<\E�D�V� !D
F��qvd� 98;R`�Lcp��D(���D@�ˈ�$BQsfh�(j��D(\�T�#ÏÌP9�]��Z���#~����JW�U+35Z;g�,
��s�oq�y#÷����GG;s�D(��e,Oj��#+j��^��~�8�2����6
�c{s���2�7�ހ\���{�o���:
�� <��^f ���+��q�a�}A�#�^�7w��wh�0��x7�mE������p�ݤ{��&E^������}��p��         �   x�-���0E��+���f6�ҁ�K�8`%��4����A�ιױu��#f��_j'<"��˺ȽH���D�>��$��$���\�\{@��#���:D0���"�8b��2IR����L�|���A~���v8䋊�7J��>v         b  x��[kO�J�L�g�O�?����p�{�
��R�I�cg.���tx�h��k,� H}��^]u��`S,6M��-ڿ}[_�����X�Շ�M��]�}Q��t�벨�.|��^���W�p\���b"��3��u9�]6u�Nn�|s 	�����I�k���m�(��w��	��	��g ��IVC��%ٵ�t�	��GuSm[�,VӶX\�V��2$'u��a����z�@��?/?�S-�� ��Y:��8��9�t��*%e8����,�,�l��3�r������#3(ƍ&3R�C��Ւd?��U��*�z��4�Az���AI!K�vN�bQ�Ջ뻽Co��U��K�?�]+&�<��)�l(����,\lW�YQ����i��oڻi�=��̻FQW��P�Y��W�:j��:4{i.�v���<��	~-�`���:o������k����_�0�u���c��;�h I�^͒ٳ�����C��ׁ�$�V:�p����#�k��e�&.z��~;���n�<��e(��Ӣ*�5�~��b��գ|��\��G	E4�LuW*�d�=���?;�<��hC���!*�NT�@�z4�g�7�a,|���Z�U����)֛�U��ʉ빎�U��ё/�!<[��nO|� Q����R����I��>��\&Υ2��:�v��+�ݼ1]�ݝ�ކОխo��>�4l�:��X��{T�[�[O}�ͱ���x�3��qUE'Y�-���zjS�T��H�w�!�//V��{�i��4Msw�w���b*9��Ӳ�pJ����Y���x��]&��.���E{�DߠJ�r��9�)��4R'�	� ���~����LkҖC��~ʩ{���җd$�$�I�95�*��'����Aw0ԭ$9�t$$��$2&닌d�!�LI�p�WZLJ���]���L���$��Kx��мd��d���K ZG6�:*�� �l��/Ӕj����|@Nn$J�	rr��p=��8E΍���|$[��l�K�1 ��|$��Hdo�d���ؐ
l6R��F�l���Ԑ�jj k8@�"�=�e��
�c�����PX�"=I^��Bz&�r���
p���/PcE�B��!�,��B�V�d8�My/���Α�$,���u�K�dxZx��ehO��#��NNL�3�]�.VE���O ѽ��)�W2���n���ꛫ�zg�L��&��;����<��PN-���O�E}܄�	��75�t���'����ѣ��y+�����Zn���î���mY�����oBsO:�f���`&B��YQ&�d�2;Hi��{����zN�#`�G��fV�����O#ݼ�.V  �~�%UFyא�MrEy�l;�#�R.~H(AXh�r#��L�5�8����"����A�C���q1��� �2���	�X���5�2C�+�\J���u�C��Xߝr�Ŗ�TD㢈�D�����q�8p��A�&Ӄ�鰜�X#M����fX#l���0+[X��6�Vφu�Y|=���|�W4UA,"���X��XLl�͆�b_t������ا9^/p�7�pi	�:c
8����#i��"<G��c�6�9�sG2�<O %/$��#J����OCo��٥7���aP@�bd� �X��h�-�K����-p��Y����~�h$���~��.֐=��5����\�*�`���ۗ�t�U)7�	�Y�*EDR�7Q�f"1R�����'[�� 0`�!�n�(R��遃�9I�v6��\J|P�/L���ٱ�ި�P6�¢���  -��,
=��@�X���P�l��x抁��夑	��xD$y�Xq���; �� ��`cиh@ �e 0�!x�  K^<���qt�7R5ҒqL�5pb�:�.�?;K^H���G^���D�Y��1���,2� ������Ho�~�mr�mq���r����/�k�&n��P),�?�}�M1��{�!A%�U�I�Kl����ɦ�����_��"�
2��J��]\l폵�u�*��*b[uۂ��KN�	�/�m1��K��ZG��\��$�z�?���ݾ��a3��lʇZM�X�;�Ǐ�v���2�NC��������d�ѿ'D�_,��-      	   J   x�3�42PU�OKSH�,N�/�+�	 i=.#μ����TC�0�Is:ge��&�T���a
@T��qqq r6�         U  x�UWɵ�0;�����K��# (ۓCޏ8Z�� ���Z��?/n��:���CC�/�Y/>�^�_�6���uoX�%�s��i�u_�_�K�-�N�C���9�������L�wum������kO�45s8(Ks��(��V���=�|�ǖ�в�q]��1M�3�Eñ���u>�������l��l(�a���赫Y�2v��|D7�i��K�a��mz�b�>�:����1k���$j����֬���.n���H^3���N���6��/�`jӲ�f��mp�Ndq}�3iXKՐ�����nu9�y3�=8���c�; ��N�ӭ�r�;4���:
�O�p�Vc�e�o\��}ry�Cǎ!���6���^EÍ��~��h���h6�m��y�4Kl&`c��x��i��6�5����@^m�d�\����7ʬ6�n9�Ԫn3�I�ze��vA��l6�Ty1�ݘ����=��Y�"b�Դ���i��s�m�ܽ��5��ul)	~�rU�ߴd��ٻW%Ǆ�Q�u�^�@VK�m����ϙak>�j�i�-\���l�ivƺ���z��m�}����ss�n��]I�Ma��Ռ��f��'CG�n�>�qtj���=t��	�N�r�K�Mۈ��j�����u��RN���\%�Y�v�g&>=�Ѐ୏N7T)��2�a�ɍݥ!g�y��E_gف�#�:�R�����P+t"�!��P���ն4A/*��r�ԠB2j{�^�b[��+m��J�dP;	�Q��xa�5l����4!�NK�s䣞���
uoD��=:ItJ�/q+��S���]*F�C����P��?
�ٯ�;
���e�@h�e��� 
�1#�
��>V�e�~�Z���y�hAU�G,a�1���!�Nu��TF��N�H]I	�>����R>�����r��qA63��iC\��K0
FFjK]��/#�F��9` �F�� �i��3�;�>����qU�� ��Yy#b��>���������
r��Br�ڑn%�vxD��È�қٹ.B{���4�cL�J��
�T�LH�����OB��ʗsp�{g,9�5�R�,Gv�N���?c��p{$$c0`����E��y>Y ���<��,e�+ߺ���߼Ǖ���q<ͤA��ۡ�>ac���q� �~F�$H4i�!�%}D4d�Z_��6tٷ
��!�� �|�Fp%��
��x���3$[���19
ϋFO�A��ʕ�p;�{��8���]��Ȫ�Xi�v;���*�kD��'?1<~��w����\$�$�X�j���s?��é�Q��.����70��Y`!/�A,����rQ�{XFȺK���Őu��|J��z��a��AE$��}0#�&Y=��X��9�@�9K&~��r{ q�wv��p	D^h�y�|A�ӒӪ&A,a�����	K�Z�����yrizO�Iv� 
���2-W������Sb����t����y�w����}EP�&��.\bi���E؂�b>�/�4T �|��圕���QZ��>�0���U�4�Ìr��).�P�*�&5O)��~��?f�g�k            x�3���ON,���S0����� 3/�         |  x��Yˎ�J�s����.Oہt%�ۀ�y��+?0�1����T��nϺ5��n�?����/*ȄS�I�%��ε"v��v$����[�%Y�
E$ �Sԛ�=����54jU��:ab���������p\w!Uf^H4��z�r6�am1�~. ��O��į�.C�D�~R�)@V����B��r�����ʐ�	-Ir����q�jَqRomK�������N�(|�iqԤI�Xs塮����x����~bc�Q�ͳ&Xo��jy�i�����z�ܜ����'����;��j�+e/D1(��A-~���7�x��=>m��y�e�*��6�Y�܈��fK��XͶ���-�	��I���u�v��P�
��Q�2�%	J~
��9��j���u\�&������!������J�`a����\�⫸�7{�f�����P�
�o����z�"�\ ��,xŰ2�J�BADϰ ����|?�ꙻK=�!�M�O�����3%/�t��-���l<���{ӚQ[e//Ire�
��^��w�˘��TH�>�=���[��h-�hF֊&}��*U���V�����F���L\��X/��x�S53�oEC*�|2�D���� XRI�$A|���Ƽ�������~�O>}�(I2X��A'֗r&�0��^JV�L��<h`�+��W��^C�_ws��m�E��%(F~�J�ex��/1���M5Zȇ��%l�nu��ׄ@����1r��y��2���;�ׇr���{J��2�X�.��Zg�ۙ���-�NQi�ñ���w]VEi�5��Yw�g�j�Nq����ު�V�fʯ��y�������b����p��h�
Q[9�&�� ���� U�{m������H��Q��!�I��+p�,T�7��>bFeK��TxFOHy���1&��o��p�%�aW�j���J����-��jv�^�E�9�Rk(ӱ��M��_�
`��T�ʻΈ�OT���|	���<���n��&���
�U;J���ҋ/���͈�N��i
��I~p��|*��*Q���=�@G,VB����H鍎į�th����g�<�̅�Γ�Ro��hj6��@�T��)̓馫��}�I}c��-�9k��pk`+G��'���&���さ8��p>"Gܧ0�IF {F�����uP8��X?���>�5;)���$�j���D�j7f�*%����ߩ���o��Q��ޠ�
�ft�?�� ��b|`����6��`x����D��"=�m]���[�AJ}E>��Θ����k��X�g��`��
|�x�/�G��M1���3����S�3���V���nQ��]��ii���㎷ˉ�x��l�q"R�v�|�'�bO6b��������<�	�$.���I�{ �'���b\�d�)N�vy�)�V�0�m�����E�N�u��M�u"o1�M��)��n;�mF�	�Y�5��b�.�<��OdK|�8U�<��E8��:@�:<�t)�HkE��/kj�hmn��?v�2egD��07��p+��F�s��Lx��ۓ2I��*����M��u�J"����y���l��̠������Lj�bD�cT���
v���{��̺ȬG�~�Զ�6hm�'?ߧ2�֒HL�ʇVлWo��J6�ϟ#��5�y���@����P���(@�>� ��#�&��T�l�a�����m�4�Vb�>����9x�F_6E3�}��)3��<U��)��*V��IRE�p#��2*��@!xj�T���> �}�u��-|u�Bq�h3���8`�~ia�b���ˊ�Zo���&��W@���gD���B�=t�A1���,��Ag:?�h:����>�u�[7.����Ջ�$��Nrc��]���V9<k��l즲��K����p����Z�ψ��� �{��i�2@�3)=��^jM��og5	�zo��f�Y7�l8˲�	G�4���Ώm�o6ZX��F�ht4if�o]�ظ��֛�����=�	�rP! �g�-z���pn�ImPM�.��;w�/�dV7=��/�a�AG�D�z�˶����D��ؼT�o+p"����S.�;#F�3Y=H�ڰ���Zs.�bS�S�l-��WA2����FΆ��]l�V�	��kk�E��GZr����
>�츐ƙ����)eJH�@��� 	�"�%nk��gy�����b1S����V�0F3��� t͓�y��̤S�i�4�m�=�R��ly��Ͼ^9z	�"������n���y>L�h�P׸1�-g�jy�mW�<c��mˇ�w�8+��ȥM�r{d���=@��C�d��#�d�ٵ�y+�\��vN����`��k�D�3K�؅�G����H'##'�B�O6)z�#0u7�2ҞQ��� �{��v/[Jjm��[�J�mkG��vǓ
!�����e�)dҽ>��?������/��_����_�������܆B�?r�C�����ʿQ{` �͌�*���TǞ'����Q�Uhd��z�����qgq�>�����2h��ךU�?.��{@*Ȩx�1>��7��İp�W������SG�y]2?��V��c�Ŷx���Ӷ��Ӣi�:��	��%�s-mz��pc�~�+_Jxq�f`�\��,�V����7���K���g]N��#w/�B��� �y�3�N���ބE�'Jw�[bĸ�?;�D�L�>~��Ѡ$��p�Pz��Y���9��NR�~��LY��.*��Oz�я��H2Q~��Wa��ݙ��y�Y� U~,&�q����@��k1�'��^Fs�"��&���^]�DT{�k�Rb��8XYTN֭V,׳* ��H�I�L#���;�<�Ju`�;�Z�_/S�P	R�����6���r.���L
��yr����GZ��?���6m�����7b�� |enx�ǉ���~���!��ɑ���"����6F������:�FX�����
&�k�{f�y[�$��u�|k�/�z���%����@DJ����7,���x��6as<vGU�������âR��(��ΫӖ�ā�z�^�Dl� ^q_�l��w������5�#oj�놃?�p���ÿ
0�4m��CO�1�ߕ�|��7���            x������ � �            x������ � �      &   a   x�u���0Dk{b��|`�@CAA��#�ܜt�鬄Ie� gj�~��6̍FҨ�!��V���q�x��z�w_Rf{�e�K��Y��o�+      (      x�3�47����� lY         t   x�3�t��Q(�O)M.����44�44�30 ���nn�FFƺ�F���e)iP����)H�B~Z��4�2�b��1�$c�I&��@�ih�lN�ӖUϚ ,0�)4�4����� &]     