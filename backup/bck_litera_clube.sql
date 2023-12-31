PGDMP                 
        {            literaclube    15.3    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32774    literaclube    DATABASE     �   CREATE DATABASE literaclube WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE literaclube;
                postgres    false            �           0    0    DATABASE literaclube    COMMENT     K   COMMENT ON DATABASE literaclube IS 'Banco de dados, trabalho literaclube';
                   postgres    false    3548                        2615    36969    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5                       1255    37262    validar_data_final()    FUNCTION     k  CREATE FUNCTION public.validar_data_final() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
IF NOT EXISTS (
  SELECT 1
  FROM leituraClube lc
  WHERE lc.id_leitura = NEW.id_leitura
  AND NEW.data_final >= lc.data_inicio
) THEN
RAISE EXCEPTION 'A discussao final deve aconter depois do da data que iniciou a leitura do livro.';
END IF;
RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.validar_data_final();
       public          postgres    false    5                       1255    37258    validar_existencia_clube()    FUNCTION     `  CREATE FUNCTION public.validar_existencia_clube() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM clube c
        WHERE c.id_clube = NEW.id_clube
          AND NEW.data_inicio < c.data_criacao
    ) THEN
        RAISE EXCEPTION 'O clube não existia nessa data.';
    END IF;
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.validar_existencia_clube();
       public          postgres    false    5                       1255    37256    validar_parceria()    FUNCTION     j  CREATE FUNCTION public.validar_parceria() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
IF NOT EXISTS (
  SELECT 1
  FROM parceria p
  WHERE p.id_leitor = NEW.id_leitor
  AND p.id_editora = NEW.id_editora
  AND NEW.data_inicio > p.data_inicio
  AND NEW.data_fim > NEW.data_inicio
) THEN
RAISE EXCEPTION 'A data inválida.';
END IF;
RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.validar_parceria();
       public          postgres    false    5                       1255    37254    validar_voto()    FUNCTION     �  CREATE FUNCTION public.validar_voto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
IF NOT EXISTS (
  SELECT 1
  FROM participacao p 
  JOIN enquete e ON p.id_clube = e.id_clube
  WHERE p.id_leitor = NEW.id_leitor
  AND e.id_enquete = NEW.id_enquete
  AND NEW.data_voto BETWEEN e.data_inicio AND e.data_fim
) THEN
RAISE EXCEPTION 'O voto não é válido para o leitor e enquete especificados.';
END IF;

RETURN NEW;
END;
$$;
 %   DROP FUNCTION public.validar_voto();
       public          postgres    false    5            �            1259    36996    autor    TABLE     �   CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    nome character varying(200) NOT NULL,
    pseudonimo character varying(200),
    data_nasc date
);
    DROP TABLE public.autor;
       public         heap    postgres    false    5            �            1259    36995    autor_id_autor_seq    SEQUENCE     �   CREATE SEQUENCE public.autor_id_autor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.autor_id_autor_seq;
       public          postgres    false    219    5            �           0    0    autor_id_autor_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.autor_id_autor_seq OWNED BY public.autor.id_autor;
          public          postgres    false    218            �            1259    37061    clube    TABLE     �   CREATE TABLE public.clube (
    id_clube integer NOT NULL,
    nome character varying(200) NOT NULL,
    tema character varying(200) NOT NULL,
    data_criacao date NOT NULL,
    id_criador integer NOT NULL
);
    DROP TABLE public.clube;
       public         heap    postgres    false    5            �            1259    37060    clube_id_clube_seq    SEQUENCE     �   CREATE SEQUENCE public.clube_id_clube_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.clube_id_clube_seq;
       public          postgres    false    230    5            �           0    0    clube_id_clube_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.clube_id_clube_seq OWNED BY public.clube.id_clube;
          public          postgres    false    229            �            1259    36984    criador    TABLE     m   CREATE TABLE public.criador (
    id_leitor integer NOT NULL,
    telefone character varying(50) NOT NULL
);
    DROP TABLE public.criador;
       public         heap    postgres    false    5            �            1259    36983    criador_id_leitor_seq    SEQUENCE     �   CREATE SEQUENCE public.criador_id_leitor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.criador_id_leitor_seq;
       public          postgres    false    5    217            �           0    0    criador_id_leitor_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.criador_id_leitor_seq OWNED BY public.criador.id_leitor;
          public          postgres    false    216            �            1259    37243    cupom    TABLE     �   CREATE TABLE public.cupom (
    id_cupom integer NOT NULL,
    id_leitor integer NOT NULL,
    id_editora integer NOT NULL,
    codigo character varying(20) NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL
);
    DROP TABLE public.cupom;
       public         heap    postgres    false    5            �            1259    37242    cupom_id_cupom_seq    SEQUENCE     �   CREATE SEQUENCE public.cupom_id_cupom_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cupom_id_cupom_seq;
       public          postgres    false    5    246            �           0    0    cupom_id_cupom_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cupom_id_cupom_seq OWNED BY public.cupom.id_cupom;
          public          postgres    false    245            �            1259    37156    discussaofinal    TABLE     f   CREATE TABLE public.discussaofinal (
    id_leitura integer NOT NULL,
    data_final date NOT NULL
);
 "   DROP TABLE public.discussaofinal;
       public         heap    postgres    false    5            �            1259    37155    discussaofinal_id_leitura_seq    SEQUENCE     �   CREATE SEQUENCE public.discussaofinal_id_leitura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.discussaofinal_id_leitura_seq;
       public          postgres    false    5    239            �           0    0    discussaofinal_id_leitura_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.discussaofinal_id_leitura_seq OWNED BY public.discussaofinal.id_leitura;
          public          postgres    false    238            �            1259    37005    editora    TABLE     �   CREATE TABLE public.editora (
    id_editora integer NOT NULL,
    nome character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    telefone character varying(50) NOT NULL
);
    DROP TABLE public.editora;
       public         heap    postgres    false    5            �            1259    37004    editora_id_editora_seq    SEQUENCE     �   CREATE SEQUENCE public.editora_id_editora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.editora_id_editora_seq;
       public          postgres    false    5    221            �           0    0    editora_id_editora_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.editora_id_editora_seq OWNED BY public.editora.id_editora;
          public          postgres    false    220            �            1259    37090    enquete    TABLE     �   CREATE TABLE public.enquete (
    id_enquete integer NOT NULL,
    id_clube integer NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL
);
    DROP TABLE public.enquete;
       public         heap    postgres    false    5            �            1259    37089    enquete_id_enquete_seq    SEQUENCE     �   CREATE SEQUENCE public.enquete_id_enquete_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.enquete_id_enquete_seq;
       public          postgres    false    5    233            �           0    0    enquete_id_enquete_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.enquete_id_enquete_seq OWNED BY public.enquete.id_enquete;
          public          postgres    false    232            �            1259    37101    enquetelivro    TABLE     e   CREATE TABLE public.enquetelivro (
    id_enquete integer NOT NULL,
    id_livro integer NOT NULL
);
     DROP TABLE public.enquetelivro;
       public         heap    postgres    false    5            �            1259    37211    escrita    TABLE     ^   CREATE TABLE public.escrita (
    id_livro integer NOT NULL,
    id_autor integer NOT NULL
);
    DROP TABLE public.escrita;
       public         heap    postgres    false    5            �            1259    36971    leitor    TABLE     �   CREATE TABLE public.leitor (
    id_leitor integer NOT NULL,
    nome character varying(200) NOT NULL,
    data_nasc date,
    login character varying(100) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(200) NOT NULL
);
    DROP TABLE public.leitor;
       public         heap    postgres    false    5            �            1259    36970    leitor_id_leitor_seq    SEQUENCE     �   CREATE SEQUENCE public.leitor_id_leitor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.leitor_id_leitor_seq;
       public          postgres    false    5    215            �           0    0    leitor_id_leitor_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.leitor_id_leitor_seq OWNED BY public.leitor.id_leitor;
          public          postgres    false    214            �            1259    37183    leitura    TABLE     ~   CREATE TABLE public.leitura (
    id_leitor integer NOT NULL,
    id_livro integer NOT NULL,
    data_inicio date NOT NULL
);
    DROP TABLE public.leitura;
       public         heap    postgres    false    5            �            1259    37137    leituraclube    TABLE     �   CREATE TABLE public.leituraclube (
    id_leitura integer NOT NULL,
    id_clube integer NOT NULL,
    id_livro integer NOT NULL,
    data_inicio date NOT NULL
);
     DROP TABLE public.leituraclube;
       public         heap    postgres    false    5            �            1259    37136    leituraclube_id_leitura_seq    SEQUENCE     �   CREATE SEQUENCE public.leituraclube_id_leitura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.leituraclube_id_leitura_seq;
       public          postgres    false    5    237            �           0    0    leituraclube_id_leitura_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.leituraclube_id_leitura_seq OWNED BY public.leituraclube.id_leitura;
          public          postgres    false    236            �            1259    37028    lista    TABLE     �   CREATE TABLE public.lista (
    id_lista integer NOT NULL,
    titulo character varying(100) NOT NULL,
    descricao character varying(100000),
    id_leitor integer NOT NULL
);
    DROP TABLE public.lista;
       public         heap    postgres    false    5            �            1259    37027    lista_id_lista_seq    SEQUENCE     �   CREATE SEQUENCE public.lista_id_lista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.lista_id_lista_seq;
       public          postgres    false    225    5            �           0    0    lista_id_lista_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.lista_id_lista_seq OWNED BY public.lista.id_lista;
          public          postgres    false    224            �            1259    37043 
   listalivro    TABLE     a   CREATE TABLE public.listalivro (
    id_lista integer NOT NULL,
    id_livro integer NOT NULL
);
    DROP TABLE public.listalivro;
       public         heap    postgres    false    5            �            1259    37041    listalivro_id_lista_seq    SEQUENCE     �   CREATE SEQUENCE public.listalivro_id_lista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.listalivro_id_lista_seq;
       public          postgres    false    5    228            �           0    0    listalivro_id_lista_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.listalivro_id_lista_seq OWNED BY public.listalivro.id_lista;
          public          postgres    false    226            �            1259    37042    listalivro_id_livro_seq    SEQUENCE     �   CREATE SEQUENCE public.listalivro_id_livro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.listalivro_id_livro_seq;
       public          postgres    false    228    5            �           0    0    listalivro_id_livro_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.listalivro_id_livro_seq OWNED BY public.listalivro.id_livro;
          public          postgres    false    227            �            1259    37016    livro    TABLE     �   CREATE TABLE public.livro (
    id_livro integer NOT NULL,
    titulo character varying(100) NOT NULL,
    num_paginas integer NOT NULL,
    id_editora integer NOT NULL
);
    DROP TABLE public.livro;
       public         heap    postgres    false    5            �            1259    37015    livro_id_livro_seq    SEQUENCE     �   CREATE SEQUENCE public.livro_id_livro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.livro_id_livro_seq;
       public          postgres    false    5    223            �           0    0    livro_id_livro_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.livro_id_livro_seq OWNED BY public.livro.id_livro;
          public          postgres    false    222            �            1259    37226    parceria    TABLE     �   CREATE TABLE public.parceria (
    id_leitor integer NOT NULL,
    id_editora integer NOT NULL,
    data_inicio date NOT NULL,
    data_validade date NOT NULL,
    CONSTRAINT parceria_check CHECK ((data_validade > data_inicio))
);
    DROP TABLE public.parceria;
       public         heap    postgres    false    5            �            1259    37167 	   participa    TABLE     �   CREATE TABLE public.participa (
    id_leitura integer NOT NULL,
    id_leitor integer NOT NULL,
    nota numeric(2,1) NOT NULL,
    CONSTRAINT participa_nota_check CHECK (((nota >= (1)::numeric) AND (nota <= (5)::numeric)))
);
    DROP TABLE public.participa;
       public         heap    postgres    false    5            �            1259    37074    participacao    TABLE     �   CREATE TABLE public.participacao (
    id_leitor integer NOT NULL,
    id_clube integer NOT NULL,
    data_inicio date NOT NULL
);
     DROP TABLE public.participacao;
       public         heap    postgres    false    5            �            1259    37198    resenha    TABLE     U  CREATE TABLE public.resenha (
    id_leitor integer NOT NULL,
    id_livro integer NOT NULL,
    data_fim date NOT NULL,
    nota numeric(2,1) NOT NULL,
    titulo character varying(100) NOT NULL,
    texto character varying(1000000) NOT NULL,
    CONSTRAINT resenha_nota_check CHECK (((nota >= (1)::numeric) AND (nota <= (5)::numeric)))
);
    DROP TABLE public.resenha;
       public         heap    postgres    false    5            �            1259    37116    voto    TABLE     �   CREATE TABLE public.voto (
    id_leitor integer NOT NULL,
    id_enquete integer NOT NULL,
    id_livro integer NOT NULL,
    data_voto date NOT NULL
);
    DROP TABLE public.voto;
       public         heap    postgres    false    5            �           2604    36999    autor id_autor    DEFAULT     p   ALTER TABLE ONLY public.autor ALTER COLUMN id_autor SET DEFAULT nextval('public.autor_id_autor_seq'::regclass);
 =   ALTER TABLE public.autor ALTER COLUMN id_autor DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    37064    clube id_clube    DEFAULT     p   ALTER TABLE ONLY public.clube ALTER COLUMN id_clube SET DEFAULT nextval('public.clube_id_clube_seq'::regclass);
 =   ALTER TABLE public.clube ALTER COLUMN id_clube DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    36987    criador id_leitor    DEFAULT     v   ALTER TABLE ONLY public.criador ALTER COLUMN id_leitor SET DEFAULT nextval('public.criador_id_leitor_seq'::regclass);
 @   ALTER TABLE public.criador ALTER COLUMN id_leitor DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    37246    cupom id_cupom    DEFAULT     p   ALTER TABLE ONLY public.cupom ALTER COLUMN id_cupom SET DEFAULT nextval('public.cupom_id_cupom_seq'::regclass);
 =   ALTER TABLE public.cupom ALTER COLUMN id_cupom DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    37159    discussaofinal id_leitura    DEFAULT     �   ALTER TABLE ONLY public.discussaofinal ALTER COLUMN id_leitura SET DEFAULT nextval('public.discussaofinal_id_leitura_seq'::regclass);
 H   ALTER TABLE public.discussaofinal ALTER COLUMN id_leitura DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    37008    editora id_editora    DEFAULT     x   ALTER TABLE ONLY public.editora ALTER COLUMN id_editora SET DEFAULT nextval('public.editora_id_editora_seq'::regclass);
 A   ALTER TABLE public.editora ALTER COLUMN id_editora DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    37093    enquete id_enquete    DEFAULT     x   ALTER TABLE ONLY public.enquete ALTER COLUMN id_enquete SET DEFAULT nextval('public.enquete_id_enquete_seq'::regclass);
 A   ALTER TABLE public.enquete ALTER COLUMN id_enquete DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    36974    leitor id_leitor    DEFAULT     t   ALTER TABLE ONLY public.leitor ALTER COLUMN id_leitor SET DEFAULT nextval('public.leitor_id_leitor_seq'::regclass);
 ?   ALTER TABLE public.leitor ALTER COLUMN id_leitor DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    37140    leituraclube id_leitura    DEFAULT     �   ALTER TABLE ONLY public.leituraclube ALTER COLUMN id_leitura SET DEFAULT nextval('public.leituraclube_id_leitura_seq'::regclass);
 F   ALTER TABLE public.leituraclube ALTER COLUMN id_leitura DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    37031    lista id_lista    DEFAULT     p   ALTER TABLE ONLY public.lista ALTER COLUMN id_lista SET DEFAULT nextval('public.lista_id_lista_seq'::regclass);
 =   ALTER TABLE public.lista ALTER COLUMN id_lista DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    37046    listalivro id_lista    DEFAULT     z   ALTER TABLE ONLY public.listalivro ALTER COLUMN id_lista SET DEFAULT nextval('public.listalivro_id_lista_seq'::regclass);
 B   ALTER TABLE public.listalivro ALTER COLUMN id_lista DROP DEFAULT;
       public          postgres    false    228    226    228            �           2604    37047    listalivro id_livro    DEFAULT     z   ALTER TABLE ONLY public.listalivro ALTER COLUMN id_livro SET DEFAULT nextval('public.listalivro_id_livro_seq'::regclass);
 B   ALTER TABLE public.listalivro ALTER COLUMN id_livro DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    37019    livro id_livro    DEFAULT     p   ALTER TABLE ONLY public.livro ALTER COLUMN id_livro SET DEFAULT nextval('public.livro_id_livro_seq'::regclass);
 =   ALTER TABLE public.livro ALTER COLUMN id_livro DROP DEFAULT;
       public          postgres    false    222    223    223            �          0    36996    autor 
   TABLE DATA           F   COPY public.autor (id_autor, nome, pseudonimo, data_nasc) FROM stdin;
    public          postgres    false    219   !�       �          0    37061    clube 
   TABLE DATA           O   COPY public.clube (id_clube, nome, tema, data_criacao, id_criador) FROM stdin;
    public          postgres    false    230   |�       �          0    36984    criador 
   TABLE DATA           6   COPY public.criador (id_leitor, telefone) FROM stdin;
    public          postgres    false    217   $�       �          0    37243    cupom 
   TABLE DATA           _   COPY public.cupom (id_cupom, id_leitor, id_editora, codigo, data_inicio, data_fim) FROM stdin;
    public          postgres    false    246   j�       �          0    37156    discussaofinal 
   TABLE DATA           @   COPY public.discussaofinal (id_leitura, data_final) FROM stdin;
    public          postgres    false    239   ��       �          0    37005    editora 
   TABLE DATA           D   COPY public.editora (id_editora, nome, email, telefone) FROM stdin;
    public          postgres    false    221   ��       �          0    37090    enquete 
   TABLE DATA           N   COPY public.enquete (id_enquete, id_clube, data_inicio, data_fim) FROM stdin;
    public          postgres    false    233   ��       �          0    37101    enquetelivro 
   TABLE DATA           <   COPY public.enquetelivro (id_enquete, id_livro) FROM stdin;
    public          postgres    false    234   ��       �          0    37211    escrita 
   TABLE DATA           5   COPY public.escrita (id_livro, id_autor) FROM stdin;
    public          postgres    false    243   �       �          0    36971    leitor 
   TABLE DATA           Q   COPY public.leitor (id_leitor, nome, data_nasc, login, senha, email) FROM stdin;
    public          postgres    false    215   s�       �          0    37183    leitura 
   TABLE DATA           C   COPY public.leitura (id_leitor, id_livro, data_inicio) FROM stdin;
    public          postgres    false    241   ��       �          0    37137    leituraclube 
   TABLE DATA           S   COPY public.leituraclube (id_leitura, id_clube, id_livro, data_inicio) FROM stdin;
    public          postgres    false    237   _�       �          0    37028    lista 
   TABLE DATA           G   COPY public.lista (id_lista, titulo, descricao, id_leitor) FROM stdin;
    public          postgres    false    225   $�       �          0    37043 
   listalivro 
   TABLE DATA           8   COPY public.listalivro (id_lista, id_livro) FROM stdin;
    public          postgres    false    228   ��       �          0    37016    livro 
   TABLE DATA           J   COPY public.livro (id_livro, titulo, num_paginas, id_editora) FROM stdin;
    public          postgres    false    223   ��       �          0    37226    parceria 
   TABLE DATA           U   COPY public.parceria (id_leitor, id_editora, data_inicio, data_validade) FROM stdin;
    public          postgres    false    244   ��       �          0    37167 	   participa 
   TABLE DATA           @   COPY public.participa (id_leitura, id_leitor, nota) FROM stdin;
    public          postgres    false    240   ��       �          0    37074    participacao 
   TABLE DATA           H   COPY public.participacao (id_leitor, id_clube, data_inicio) FROM stdin;
    public          postgres    false    231   �       �          0    37198    resenha 
   TABLE DATA           U   COPY public.resenha (id_leitor, id_livro, data_fim, nota, titulo, texto) FROM stdin;
    public          postgres    false    242   Y�       �          0    37116    voto 
   TABLE DATA           J   COPY public.voto (id_leitor, id_enquete, id_livro, data_voto) FROM stdin;
    public          postgres    false    235   ��       �           0    0    autor_id_autor_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.autor_id_autor_seq', 14, true);
          public          postgres    false    218            �           0    0    clube_id_clube_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.clube_id_clube_seq', 4, true);
          public          postgres    false    229            �           0    0    criador_id_leitor_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.criador_id_leitor_seq', 1, false);
          public          postgres    false    216            �           0    0    cupom_id_cupom_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cupom_id_cupom_seq', 2, true);
          public          postgres    false    245            �           0    0    discussaofinal_id_leitura_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.discussaofinal_id_leitura_seq', 1, false);
          public          postgres    false    238            �           0    0    editora_id_editora_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.editora_id_editora_seq', 5, true);
          public          postgres    false    220            �           0    0    enquete_id_enquete_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.enquete_id_enquete_seq', 1, true);
          public          postgres    false    232            �           0    0    leitor_id_leitor_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.leitor_id_leitor_seq', 10, true);
          public          postgres    false    214            �           0    0    leituraclube_id_leitura_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.leituraclube_id_leitura_seq', 28, true);
          public          postgres    false    236            �           0    0    lista_id_lista_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.lista_id_lista_seq', 2, true);
          public          postgres    false    224            �           0    0    listalivro_id_lista_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.listalivro_id_lista_seq', 1, false);
          public          postgres    false    226            �           0    0    listalivro_id_livro_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.listalivro_id_livro_seq', 1, false);
          public          postgres    false    227            �           0    0    livro_id_livro_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.livro_id_livro_seq', 22, true);
          public          postgres    false    222            �           2606    37001    autor autor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    219            �           2606    37003    autor autor_pseudonimo_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pseudonimo_key UNIQUE (pseudonimo);
 D   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pseudonimo_key;
       public            postgres    false    219            �           2606    37068    clube clube_nome_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.clube
    ADD CONSTRAINT clube_nome_key UNIQUE (nome);
 >   ALTER TABLE ONLY public.clube DROP CONSTRAINT clube_nome_key;
       public            postgres    false    230            �           2606    37066    clube clube_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clube
    ADD CONSTRAINT clube_pkey PRIMARY KEY (id_clube);
 :   ALTER TABLE ONLY public.clube DROP CONSTRAINT clube_pkey;
       public            postgres    false    230            �           2606    36989    criador criador_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.criador
    ADD CONSTRAINT criador_pkey PRIMARY KEY (id_leitor);
 >   ALTER TABLE ONLY public.criador DROP CONSTRAINT criador_pkey;
       public            postgres    false    217                       2606    37248    cupom cupom_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cupom
    ADD CONSTRAINT cupom_pkey PRIMARY KEY (id_cupom);
 :   ALTER TABLE ONLY public.cupom DROP CONSTRAINT cupom_pkey;
       public            postgres    false    246            �           2606    37161 "   discussaofinal discussaofinal_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.discussaofinal
    ADD CONSTRAINT discussaofinal_pkey PRIMARY KEY (id_leitura);
 L   ALTER TABLE ONLY public.discussaofinal DROP CONSTRAINT discussaofinal_pkey;
       public            postgres    false    239            �           2606    37014    editora editora_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.editora
    ADD CONSTRAINT editora_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.editora DROP CONSTRAINT editora_email_key;
       public            postgres    false    221            �           2606    37012    editora editora_nome_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.editora
    ADD CONSTRAINT editora_nome_key UNIQUE (nome);
 B   ALTER TABLE ONLY public.editora DROP CONSTRAINT editora_nome_key;
       public            postgres    false    221            �           2606    37010    editora editora_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.editora
    ADD CONSTRAINT editora_pkey PRIMARY KEY (id_editora);
 >   ALTER TABLE ONLY public.editora DROP CONSTRAINT editora_pkey;
       public            postgres    false    221            �           2606    37095    enquete enquete_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.enquete
    ADD CONSTRAINT enquete_pkey PRIMARY KEY (id_enquete);
 >   ALTER TABLE ONLY public.enquete DROP CONSTRAINT enquete_pkey;
       public            postgres    false    233            �           2606    37105    enquetelivro enquetelivro_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.enquetelivro
    ADD CONSTRAINT enquetelivro_pkey PRIMARY KEY (id_enquete, id_livro);
 H   ALTER TABLE ONLY public.enquetelivro DROP CONSTRAINT enquetelivro_pkey;
       public            postgres    false    234    234                       2606    37215    escrita escrita_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.escrita
    ADD CONSTRAINT escrita_pkey PRIMARY KEY (id_livro, id_autor);
 >   ALTER TABLE ONLY public.escrita DROP CONSTRAINT escrita_pkey;
       public            postgres    false    243    243            �           2606    36982    leitor leitor_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.leitor
    ADD CONSTRAINT leitor_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.leitor DROP CONSTRAINT leitor_email_key;
       public            postgres    false    215            �           2606    36980    leitor leitor_login_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.leitor
    ADD CONSTRAINT leitor_login_key UNIQUE (login);
 A   ALTER TABLE ONLY public.leitor DROP CONSTRAINT leitor_login_key;
       public            postgres    false    215            �           2606    36978    leitor leitor_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.leitor
    ADD CONSTRAINT leitor_pkey PRIMARY KEY (id_leitor);
 <   ALTER TABLE ONLY public.leitor DROP CONSTRAINT leitor_pkey;
       public            postgres    false    215            �           2606    37187    leitura leitura_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.leitura
    ADD CONSTRAINT leitura_pkey PRIMARY KEY (id_leitor, id_livro);
 >   ALTER TABLE ONLY public.leitura DROP CONSTRAINT leitura_pkey;
       public            postgres    false    241    241            �           2606    37142    leituraclube leituraclube_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.leituraclube
    ADD CONSTRAINT leituraclube_pkey PRIMARY KEY (id_leitura);
 H   ALTER TABLE ONLY public.leituraclube DROP CONSTRAINT leituraclube_pkey;
       public            postgres    false    237            �           2606    37035    lista lista_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.lista
    ADD CONSTRAINT lista_pkey PRIMARY KEY (id_lista);
 :   ALTER TABLE ONLY public.lista DROP CONSTRAINT lista_pkey;
       public            postgres    false    225            �           2606    37049    listalivro listalivro_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.listalivro
    ADD CONSTRAINT listalivro_pkey PRIMARY KEY (id_lista, id_livro);
 D   ALTER TABLE ONLY public.listalivro DROP CONSTRAINT listalivro_pkey;
       public            postgres    false    228    228            �           2606    37021    livro livro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY (id_livro);
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public            postgres    false    223                       2606    37231    parceria parceria_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.parceria
    ADD CONSTRAINT parceria_pkey PRIMARY KEY (id_leitor, id_editora);
 @   ALTER TABLE ONLY public.parceria DROP CONSTRAINT parceria_pkey;
       public            postgres    false    244    244            �           2606    37172    participa participa_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_pkey PRIMARY KEY (id_leitura, id_leitor);
 B   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_pkey;
       public            postgres    false    240    240            �           2606    37078    participacao participacao_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT participacao_pkey PRIMARY KEY (id_leitor, id_clube);
 H   ALTER TABLE ONLY public.participacao DROP CONSTRAINT participacao_pkey;
       public            postgres    false    231    231                        2606    37205    resenha resenha_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.resenha
    ADD CONSTRAINT resenha_pkey PRIMARY KEY (id_leitor, id_livro);
 >   ALTER TABLE ONLY public.resenha DROP CONSTRAINT resenha_pkey;
       public            postgres    false    242    242            �           2606    37154    leituraclube unicidade_leitura 
   CONSTRAINT     t   ALTER TABLE ONLY public.leituraclube
    ADD CONSTRAINT unicidade_leitura UNIQUE (id_clube, id_livro, data_inicio);
 H   ALTER TABLE ONLY public.leituraclube DROP CONSTRAINT unicidade_leitura;
       public            postgres    false    237    237    237            �           2606    37120    voto voto_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_pkey PRIMARY KEY (id_leitor, id_enquete, id_livro);
 8   ALTER TABLE ONLY public.voto DROP CONSTRAINT voto_pkey;
       public            postgres    false    235    235    235            "           2620    37259 -   participacao trigger_validar_existencia_clube    TRIGGER     �   CREATE TRIGGER trigger_validar_existencia_clube BEFORE INSERT ON public.participacao FOR EACH ROW EXECUTE FUNCTION public.validar_existencia_clube();
 F   DROP TRIGGER trigger_validar_existencia_clube ON public.participacao;
       public          postgres    false    260    231            &           2620    37263     discussaofinal validar_discussao    TRIGGER     �   CREATE TRIGGER validar_discussao BEFORE INSERT ON public.discussaofinal FOR EACH ROW EXECUTE FUNCTION public.validar_data_final();
 9   DROP TRIGGER validar_discussao ON public.discussaofinal;
       public          postgres    false    239    261            %           2620    37261 !   leituraclube validar_leituraclube    TRIGGER     �   CREATE TRIGGER validar_leituraclube BEFORE INSERT ON public.leituraclube FOR EACH ROW EXECUTE FUNCTION public.validar_existencia_clube();
 :   DROP TRIGGER validar_leituraclube ON public.leituraclube;
       public          postgres    false    237    260            '           2620    37257    cupom validar_parceria_trigger    TRIGGER        CREATE TRIGGER validar_parceria_trigger BEFORE INSERT ON public.cupom FOR EACH ROW EXECUTE FUNCTION public.validar_parceria();
 7   DROP TRIGGER validar_parceria_trigger ON public.cupom;
       public          postgres    false    246    259            #           2620    37260 !   participacao validar_participacao    TRIGGER     �   CREATE TRIGGER validar_participacao BEFORE INSERT ON public.participacao FOR EACH ROW EXECUTE FUNCTION public.validar_existencia_clube();
 :   DROP TRIGGER validar_participacao ON public.participacao;
       public          postgres    false    260    231            $           2620    37255    voto validar_voto_trigger    TRIGGER     v   CREATE TRIGGER validar_voto_trigger BEFORE INSERT ON public.voto FOR EACH ROW EXECUTE FUNCTION public.validar_voto();
 2   DROP TRIGGER validar_voto_trigger ON public.voto;
       public          postgres    false    258    235                       2606    37069    clube clube_id_criador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clube
    ADD CONSTRAINT clube_id_criador_fkey FOREIGN KEY (id_criador) REFERENCES public.criador(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.clube DROP CONSTRAINT clube_id_criador_fkey;
       public          postgres    false    230    217    3288                       2606    36990    criador criador_id_leitor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criador
    ADD CONSTRAINT criador_id_leitor_fkey FOREIGN KEY (id_leitor) REFERENCES public.leitor(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.criador DROP CONSTRAINT criador_id_leitor_fkey;
       public          postgres    false    217    3286    215            !           2606    37249 %   cupom cupom_id_leitor_id_editora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cupom
    ADD CONSTRAINT cupom_id_leitor_id_editora_fkey FOREIGN KEY (id_leitor, id_editora) REFERENCES public.parceria(id_leitor, id_editora) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.cupom DROP CONSTRAINT cupom_id_leitor_id_editora_fkey;
       public          postgres    false    246    246    3332    244    244                       2606    37162 -   discussaofinal discussaofinal_id_leitura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.discussaofinal
    ADD CONSTRAINT discussaofinal_id_leitura_fkey FOREIGN KEY (id_leitura) REFERENCES public.leituraclube(id_leitura) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.discussaofinal DROP CONSTRAINT discussaofinal_id_leitura_fkey;
       public          postgres    false    3318    237    239                       2606    37096    enquete enquete_id_clube_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enquete
    ADD CONSTRAINT enquete_id_clube_fkey FOREIGN KEY (id_clube) REFERENCES public.clube(id_clube) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.enquete DROP CONSTRAINT enquete_id_clube_fkey;
       public          postgres    false    233    3308    230                       2606    37106 )   enquetelivro enquetelivro_id_enquete_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enquetelivro
    ADD CONSTRAINT enquetelivro_id_enquete_fkey FOREIGN KEY (id_enquete) REFERENCES public.enquete(id_enquete) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.enquetelivro DROP CONSTRAINT enquetelivro_id_enquete_fkey;
       public          postgres    false    233    234    3312                       2606    37111 '   enquetelivro enquetelivro_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enquetelivro
    ADD CONSTRAINT enquetelivro_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.enquetelivro DROP CONSTRAINT enquetelivro_id_livro_fkey;
       public          postgres    false    234    223    3300                       2606    37221    escrita escrita_id_autor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.escrita
    ADD CONSTRAINT escrita_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.autor(id_autor) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.escrita DROP CONSTRAINT escrita_id_autor_fkey;
       public          postgres    false    243    3290    219                       2606    37216    escrita escrita_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.escrita
    ADD CONSTRAINT escrita_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.escrita DROP CONSTRAINT escrita_id_livro_fkey;
       public          postgres    false    3300    223    243                       2606    37188    leitura leitura_id_leitor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leitura
    ADD CONSTRAINT leitura_id_leitor_fkey FOREIGN KEY (id_leitor) REFERENCES public.leitor(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.leitura DROP CONSTRAINT leitura_id_leitor_fkey;
       public          postgres    false    215    241    3286                       2606    37193    leitura leitura_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leitura
    ADD CONSTRAINT leitura_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.leitura DROP CONSTRAINT leitura_id_livro_fkey;
       public          postgres    false    223    241    3300                       2606    37143 '   leituraclube leituraclube_id_clube_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leituraclube
    ADD CONSTRAINT leituraclube_id_clube_fkey FOREIGN KEY (id_clube) REFERENCES public.clube(id_clube) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.leituraclube DROP CONSTRAINT leituraclube_id_clube_fkey;
       public          postgres    false    3308    230    237                       2606    37148 '   leituraclube leituraclube_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leituraclube
    ADD CONSTRAINT leituraclube_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.leituraclube DROP CONSTRAINT leituraclube_id_livro_fkey;
       public          postgres    false    237    223    3300            	           2606    37036    lista lista_id_leitor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lista
    ADD CONSTRAINT lista_id_leitor_fkey FOREIGN KEY (id_leitor) REFERENCES public.leitor(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.lista DROP CONSTRAINT lista_id_leitor_fkey;
       public          postgres    false    215    225    3286            
           2606    37050 #   listalivro listalivro_id_lista_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listalivro
    ADD CONSTRAINT listalivro_id_lista_fkey FOREIGN KEY (id_lista) REFERENCES public.lista(id_lista) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.listalivro DROP CONSTRAINT listalivro_id_lista_fkey;
       public          postgres    false    3302    228    225                       2606    37055 #   listalivro listalivro_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listalivro
    ADD CONSTRAINT listalivro_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.listalivro DROP CONSTRAINT listalivro_id_livro_fkey;
       public          postgres    false    3300    228    223                       2606    37022    livro livro_id_editora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_id_editora_fkey FOREIGN KEY (id_editora) REFERENCES public.editora(id_editora) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_id_editora_fkey;
       public          postgres    false    3298    221    223                       2606    37237 !   parceria parceria_id_editora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.parceria
    ADD CONSTRAINT parceria_id_editora_fkey FOREIGN KEY (id_editora) REFERENCES public.editora(id_editora) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.parceria DROP CONSTRAINT parceria_id_editora_fkey;
       public          postgres    false    244    3298    221                        2606    37232     parceria parceria_id_leitor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.parceria
    ADD CONSTRAINT parceria_id_leitor_fkey FOREIGN KEY (id_leitor) REFERENCES public.criador(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.parceria DROP CONSTRAINT parceria_id_leitor_fkey;
       public          postgres    false    244    217    3288                       2606    37178 "   participa participa_id_leitor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_id_leitor_fkey FOREIGN KEY (id_leitor) REFERENCES public.leitor(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_id_leitor_fkey;
       public          postgres    false    3286    240    215                       2606    37173 #   participa participa_id_leitura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participa
    ADD CONSTRAINT participa_id_leitura_fkey FOREIGN KEY (id_leitura) REFERENCES public.discussaofinal(id_leitura) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.participa DROP CONSTRAINT participa_id_leitura_fkey;
       public          postgres    false    239    3322    240                       2606    37084 '   participacao participacao_id_clube_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT participacao_id_clube_fkey FOREIGN KEY (id_clube) REFERENCES public.clube(id_clube) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.participacao DROP CONSTRAINT participacao_id_clube_fkey;
       public          postgres    false    3308    231    230                       2606    37079 (   participacao participacao_id_leitor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT participacao_id_leitor_fkey FOREIGN KEY (id_leitor) REFERENCES public.leitor(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.participacao DROP CONSTRAINT participacao_id_leitor_fkey;
       public          postgres    false    231    215    3286                       2606    37206 '   resenha resenha_id_leitor_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resenha
    ADD CONSTRAINT resenha_id_leitor_id_livro_fkey FOREIGN KEY (id_leitor, id_livro) REFERENCES public.leitura(id_leitor, id_livro) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.resenha DROP CONSTRAINT resenha_id_leitor_id_livro_fkey;
       public          postgres    false    241    242    242    3326    241                       2606    37126    voto voto_id_enquete_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_id_enquete_fkey FOREIGN KEY (id_enquete) REFERENCES public.enquete(id_enquete) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.voto DROP CONSTRAINT voto_id_enquete_fkey;
       public          postgres    false    235    233    3312                       2606    37121    voto voto_id_leitor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_id_leitor_fkey FOREIGN KEY (id_leitor) REFERENCES public.leitor(id_leitor) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.voto DROP CONSTRAINT voto_id_leitor_fkey;
       public          postgres    false    215    3286    235                       2606    37131    voto voto_id_livro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.voto
    ADD CONSTRAINT voto_id_livro_fkey FOREIGN KEY (id_livro) REFERENCES public.livro(id_livro) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.voto DROP CONSTRAINT voto_id_livro_fkey;
       public          postgres    false    235    3300    223            �   K  x�EP;nB1�ק����}KD�D!R�X��"�M��r. E�jgvvf^����'��5��L�9`Yt��
�2�H�9�d��&���PȺ�[�Ѽ�	���nxQ�ǔ%0"��ᓬ�__ue�J�0�aO�O�~X�L�D��e0�ΐ�c�jK����ė�T[�Wj~��Zj��M$w���T������|�|h�yMA���1�eHX	c
;�����X�Ȁ�����P���(�v��3DX4�����AN��}�
���[_;�&zs�>6[sg)��.��{h�t�.?��._��@�G����0�g}���=ٍ���h��:��?@|v      �   �   x�]ͱ
�0�����9U�T��R������\54����W�A|1��"���|�~l�	�ă'�w$�������MU�]�-��BC9D����DO8r���C�/�K�a����D�K���������ፆ��P�@j�(��嬍��u��� X]9      �   6   x����06Ҵ��445213�2�!|S##.CNc#KS#c�=... �A	       �   <   x�3�4�4�t-K�+64�4202�5��50�2-u����j�<}�MA�%�P%1z\\\ 3��      �   9   x�3�4202�50�52�2�r�u�L���K]c.�2 ��1q��z��b���� K�      �   �   x�u�A
�0E��)���6m݉EPp!�݌i��ؔi��)��!�(g����AZwa��&v�a"��ۨ7�F��(�"YIɅ�"/J.���9�u�;v<>�ä$���	�D���_7u�eY�H��V��c��.�ć�d8jl��aۆ��&I����O�:� �j�s����*.��	��pt      �      x�3�4�4202�50�5@0�b���� Ro      �      x�3�4�2� bK�=... �      �   E   x�̱�0B�Z�g$�rv��s�0�Ju�:�uի��A��T��6ǌ�^��-��)��ֱ�      �   k  x�]�AN�0E��S��l7i�]�� �u7�A�SR!.�A�㤥uW��w�f���G����%�bB2��=��a�=�ֿᵲ�_�9�����)xƮ���v}���`"ebMpx_�#N����t=b-�κ��-��lR���LI(��ݿ��)���r�J�}m�5���j��/3�(�-��:$��LdL��M���'P�.o􈳄�4��(&T�D;ʸ�	3�'�{�Z*lH��D
&h�o�o�)�Ŝ�Mj���i0�4�bJ��uWY������О�M��ǲ4�3��a4y�z3y��Bڷv��P����sM��P=,e
�ThR-���I!2����-2qjqE�������$�      �   a   x�M���0�s�KP>��.�?6D�R/O�g���x�-����,vuO�� {q  2X��gq}U�L6���dط�6#����H�f��}���A�      �   �   x�U�Q�� �o���@K�2�?�8iV�������j4b��N�J�v���p��V�����[?�gh`��3nA�9AA�� ��N�!Z�N��OJ,��p�t�"/�� O�yfD�9�%O������I+�Q�ҍ&)�IiG�A����㒔vܒڎ�Si�۩��ыU���޿?=P�      �   V   x�e�1� й=�?����������Ղ������9Z��$&�smIPr7���e��L�"9�Gȱ�)v�ܴ���I�u`��� L      �       x�3�4�2� bK.#NC 6bc�=... 5��      �   �  x�M����0�ϓ��So���@8F��j%�"{�ŐX<�v�fߦ��9�bG{���ǿ��glM�+����A�f�256�3�r����E��NZ{�tt7-{��`�'�*)�!��3��1n>n�B`�{K.��^d%lp7�al����K]&q.��۴�>�����yhAW�lkcÀ��(�7|�6��yeV�>`C�pk�MM���N���?3RfKx�MB]��v�W�\��0lm��-�ʄ���CGC9 �`��}wa$�����D6�u�AgJ�ǳ7N�=���R���_���o����|���Rr]�S	u{�~�-��]˸����)��q�i�	s�M�����B]����h#�Ҝ�U	Bb�w)�ڍ�R�*�K����N�a��a[>�����"�dG��������NM(�����[�R�����~�Ȳ��Y�g      �   $   x�3�4�4202�50�501�u�t��b���� R�      �   A   x�-���0�f�1v�a��EN�nŊ΁6�G,�)n�}�Ӿ�iߗƟ�������5      �   =   x�Uͻ  �К�"�����ܼʞ<��s�Y#Ev2�AN�#q$��M9�E�bfy�$u      �   �  x��T�n�@<�~E ���f�c!�@p�ұ{�-<3ˌmE�_�r@9���gl;"�fy�U]�U.U���Ȓ�H�\����u�-�<8�^X��P��4�p�C�0��������z8���`Cƃ�,T��r��M����L�,2���j2�U���:F`�9np­$�jG;�}
��K/��l��#:�7� λ��`i9��'E���B�X'���
耳�^�����.?>�>��M��޳��e���w��b�����w��$;�D����	��>�듓�I�[ۃ'A����V�[@{�)�l�T�n��'���k�NL�ۙ}�[a/�GlI��`4y��w'��[�hqoZ,�
o�"����-���S��<P!G�Vު��E�����e|��ï�d�nƾL�`fX^��Z%���̟�X�R���P^��f2�� /Of�t��eLl��\�����\���s1��.,����wb����=��'-��	���G86��"O�j1�g� ʆă`������n��׷����1��x����t�Rqk��ֲ����Sd^���e7�����3ۑ9H�%�O�tN��YYtk=�*p��e��]Di�ɧ�~\D����;�ja���n6�ߌ�ϖ      �   !   x�3�4�4�4202�50�50�2A����� x��     