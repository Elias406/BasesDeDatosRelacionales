PGDMP     
                     z            tienda    14.2    14.2 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16395    tienda    DATABASE     a   CREATE DATABASE tienda WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Peru.utf8';
    DROP DATABASE tienda;
                postgres    false            ?            1259    16426    clientes    TABLE     ?   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(30),
    telefono character varying(30)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            ?            1259    16425    clientes_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    212                       0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    211            ?            1259    16440    modelos    TABLE     a   CREATE TABLE public.modelos (
    id integer NOT NULL,
    descripcion character varying(255)
);
    DROP TABLE public.modelos;
       public         heap    postgres    false            ?            1259    16439    modelos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.modelos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.modelos_id_seq;
       public          postgres    false    214                       0    0    modelos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.modelos_id_seq OWNED BY public.modelos.id;
          public          postgres    false    213            ?            1259    16473    ordenes    TABLE     ?   CREATE TABLE public.ordenes (
    id integer NOT NULL,
    id_cliente integer NOT NULL,
    id_modelo integer NOT NULL,
    id_servicio integer NOT NULL
);
    DROP TABLE public.ordenes;
       public         heap    postgres    false            ?            1259    16472    ordenes_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.ordenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ordenes_id_seq;
       public          postgres    false    216                       0    0    ordenes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ordenes_id_seq OWNED BY public.ordenes.id;
          public          postgres    false    215            ?            1259    16402 	   servicios    TABLE     o   CREATE TABLE public.servicios (
    id integer NOT NULL,
    descripcion character varying,
    precio real
);
    DROP TABLE public.servicios;
       public         heap    postgres    false            ?            1259    16407    servicios_id_seq    SEQUENCE     y   CREATE SEQUENCE public.servicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.servicios_id_seq;
       public          postgres    false    209                       0    0    servicios_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.servicios_id_seq OWNED BY public.servicios.id;
          public          postgres    false    210            l           2604    16429    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            m           2604    16443 
   modelos id    DEFAULT     h   ALTER TABLE ONLY public.modelos ALTER COLUMN id SET DEFAULT nextval('public.modelos_id_seq'::regclass);
 9   ALTER TABLE public.modelos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            n           2604    16476 
   ordenes id    DEFAULT     h   ALTER TABLE ONLY public.ordenes ALTER COLUMN id SET DEFAULT nextval('public.ordenes_id_seq'::regclass);
 9   ALTER TABLE public.ordenes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            k           2604    16409    servicios id    DEFAULT     l   ALTER TABLE ONLY public.servicios ALTER COLUMN id SET DEFAULT nextval('public.servicios_id_seq'::regclass);
 ;   ALTER TABLE public.servicios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209                      0    16426    clientes 
   TABLE DATA           8   COPY public.clientes (id, nombre, telefono) FROM stdin;
    public          postgres    false    212   $       
          0    16440    modelos 
   TABLE DATA           2   COPY public.modelos (id, descripcion) FROM stdin;
    public          postgres    false    214   h$                 0    16473    ordenes 
   TABLE DATA           I   COPY public.ordenes (id, id_cliente, id_modelo, id_servicio) FROM stdin;
    public          postgres    false    216   ?$                 0    16402 	   servicios 
   TABLE DATA           <   COPY public.servicios (id, descripcion, precio) FROM stdin;
    public          postgres    false    209   ?$                  0    0    clientes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clientes_id_seq', 4, true);
          public          postgres    false    211                       0    0    modelos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modelos_id_seq', 1, false);
          public          postgres    false    213                       0    0    ordenes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ordenes_id_seq', 7, true);
          public          postgres    false    215                       0    0    servicios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.servicios_id_seq', 2, true);
          public          postgres    false    210            r           2606    16431    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    212            t           2606    16445    modelos modelos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modelos
    ADD CONSTRAINT modelos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modelos DROP CONSTRAINT modelos_pkey;
       public            postgres    false    214            v           2606    16478    ordenes ordenes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT ordenes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT ordenes_pkey;
       public            postgres    false    216            p           2606    16413    servicios servicios_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_pkey;
       public            postgres    false    209            w           2606    16479    ordenes fk_cliente    FK CONSTRAINT     w   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);
 <   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT fk_cliente;
       public          postgres    false    216    3186    212            x           2606    16484    ordenes fk_modelo    FK CONSTRAINT     t   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_modelo FOREIGN KEY (id_modelo) REFERENCES public.modelos(id);
 ;   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT fk_modelo;
       public          postgres    false    214    216    3188            y           2606    16489    ordenes fk_servicio    FK CONSTRAINT     z   ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_servicio FOREIGN KEY (id_servicio) REFERENCES public.servicios(id);
 =   ALTER TABLE ONLY public.ordenes DROP CONSTRAINT fk_servicio;
       public          postgres    false    216    209    3184               A   x?3??M,?L?4?.΀Ԕ?|N#?2??)?,V?/*J-?442".#NǼDNS(?????? ?[?      
   C   x?3???/,?LTp4?2?????9???K????L#.SN?̴?<s.3(˂?ʲ?????? ??}         2   x?ɹ 0??+??????k??	p?
??)iaa?o?88?G???@         0   x?3?LN?M??W(H?+I??I??4?2?	&%??e&r?p??qqq TM     