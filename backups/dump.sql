--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: KE_test_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KE_test_category" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text
);


ALTER TABLE public."KE_test_category" OWNER TO postgres;

--
-- Name: KE_test_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KE_test_category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KE_test_category_id_seq" OWNER TO postgres;

--
-- Name: KE_test_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KE_test_category_id_seq" OWNED BY public."KE_test_category".id;


--
-- Name: KE_test_category_subcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KE_test_category_subcategory" (
    id integer NOT NULL,
    from_category_id integer NOT NULL,
    to_category_id integer NOT NULL
);


ALTER TABLE public."KE_test_category_subcategory" OWNER TO postgres;

--
-- Name: KE_test_category_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KE_test_category_subcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KE_test_category_subcategory_id_seq" OWNER TO postgres;

--
-- Name: KE_test_category_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KE_test_category_subcategory_id_seq" OWNED BY public."KE_test_category_subcategory".id;


--
-- Name: KE_test_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KE_test_product" (
    id integer NOT NULL,
    description text,
    title character varying(255) NOT NULL,
    amount integer NOT NULL,
    price double precision NOT NULL,
    shop_id integer NOT NULL,
    active boolean NOT NULL,
    orders integer NOT NULL
);


ALTER TABLE public."KE_test_product" OWNER TO postgres;

--
-- Name: KE_test_product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KE_test_product_category" (
    id integer NOT NULL,
    product_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public."KE_test_product_category" OWNER TO postgres;

--
-- Name: KE_test_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KE_test_product_category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KE_test_product_category_id_seq" OWNER TO postgres;

--
-- Name: KE_test_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KE_test_product_category_id_seq" OWNED BY public."KE_test_product_category".id;


--
-- Name: KE_test_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KE_test_product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KE_test_product_id_seq" OWNER TO postgres;

--
-- Name: KE_test_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KE_test_product_id_seq" OWNED BY public."KE_test_product".id;


--
-- Name: KE_test_productimage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KE_test_productimage" (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public."KE_test_productimage" OWNER TO postgres;

--
-- Name: KE_test_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KE_test_productimage_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KE_test_productimage_id_seq" OWNER TO postgres;

--
-- Name: KE_test_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KE_test_productimage_id_seq" OWNED BY public."KE_test_productimage".id;


--
-- Name: KE_test_shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KE_test_shop" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    image character varying(100)
);


ALTER TABLE public."KE_test_shop" OWNER TO postgres;

--
-- Name: KE_test_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KE_test_shop_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KE_test_shop_id_seq" OWNER TO postgres;

--
-- Name: KE_test_shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KE_test_shop_id_seq" OWNED BY public."KE_test_shop".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: jet_bookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jet_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_bookmark OWNER TO postgres;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jet_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_bookmark_id_seq OWNER TO postgres;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jet_bookmark_id_seq OWNED BY public.jet_bookmark.id;


--
-- Name: jet_pinnedapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jet_pinnedapplication (
    id integer NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);


ALTER TABLE public.jet_pinnedapplication OWNER TO postgres;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jet_pinnedapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jet_pinnedapplication_id_seq OWNER TO postgres;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jet_pinnedapplication_id_seq OWNED BY public.jet_pinnedapplication.id;


--
-- Name: KE_test_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_category" ALTER COLUMN id SET DEFAULT nextval('public."KE_test_category_id_seq"'::regclass);


--
-- Name: KE_test_category_subcategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_category_subcategory" ALTER COLUMN id SET DEFAULT nextval('public."KE_test_category_subcategory_id_seq"'::regclass);


--
-- Name: KE_test_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product" ALTER COLUMN id SET DEFAULT nextval('public."KE_test_product_id_seq"'::regclass);


--
-- Name: KE_test_product_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product_category" ALTER COLUMN id SET DEFAULT nextval('public."KE_test_product_category_id_seq"'::regclass);


--
-- Name: KE_test_productimage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_productimage" ALTER COLUMN id SET DEFAULT nextval('public."KE_test_productimage_id_seq"'::regclass);


--
-- Name: KE_test_shop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_shop" ALTER COLUMN id SET DEFAULT nextval('public."KE_test_shop_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: jet_bookmark id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_bookmark ALTER COLUMN id SET DEFAULT nextval('public.jet_bookmark_id_seq'::regclass);


--
-- Name: jet_pinnedapplication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('public.jet_pinnedapplication_id_seq'::regclass);


--
-- Data for Name: KE_test_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KE_test_category" (id, title, description) FROM stdin;
1	Alcohol	Alcoholic alcoholeous alcohol
3	Wine	Wine
4	Beer	Beer
5	Vodka	Vodka
7	Italian wine	Italian wine
8	American wine	American wine
6	French wine	French wine
9	Russian beer	Russian beer
10	German beer	German beer
\.


--
-- Data for Name: KE_test_category_subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KE_test_category_subcategory" (id, from_category_id, to_category_id) FROM stdin;
1	3	7
2	3	8
3	3	9
4	4	9
5	4	10
6	1	3
7	1	4
8	1	5
\.


--
-- Data for Name: KE_test_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KE_test_product" (id, description, title, amount, price, shop_id, active, orders) FROM stdin;
5	Wine with the heart's warmth	Kagor	3	1000	1	t	3
6	Ready-made shitty-tasting cocktail	Gin Tonic cocktail	2	70	1	t	2
4	Beer with history	Heineken	50	65	1	t	4
\.


--
-- Data for Name: KE_test_product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KE_test_product_category" (id, product_id, category_id) FROM stdin;
8	5	7
9	6	1
10	4	10
\.


--
-- Data for Name: KE_test_productimage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KE_test_productimage" (id, image, product_id) FROM stdin;
\.


--
-- Data for Name: KE_test_shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KE_test_shop" (id, title, description, image) FROM stdin;
1	Kazan	samyi big magazin	\N
2	Innopolis	samyi small magazin	
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	manager
2	director
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	32
2	1	37
3	1	38
4	1	39
5	1	40
6	1	29
7	1	30
8	1	31
9	2	4
10	2	5
11	2	6
12	2	7
13	2	8
14	2	9
15	2	10
16	2	11
17	2	12
18	2	13
19	2	14
20	2	15
21	2	16
22	2	25
23	2	26
24	2	27
25	2	28
26	2	29
27	2	30
28	2	31
29	2	32
30	2	33
31	2	34
32	2	35
33	2	36
34	2	37
35	2	38
36	2	39
37	2	40
38	2	41
39	2	42
40	2	43
41	2	44
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add product	8	add_product
30	Can change product	8	change_product
31	Can delete product	8	delete_product
32	Can view product	8	view_product
33	Can add shop	9	add_shop
34	Can change shop	9	change_shop
35	Can delete shop	9	delete_shop
36	Can view shop	9	view_shop
37	Can add product image	10	add_productimage
38	Can change product image	10	change_productimage
39	Can delete product image	10	delete_productimage
40	Can view product image	10	view_productimage
41	Can add bookmark	11	add_bookmark
42	Can change bookmark	11	change_bookmark
43	Can delete bookmark	11	delete_bookmark
44	Can view bookmark	11	view_bookmark
45	Can add pinned application	12	add_pinnedapplication
46	Can change pinned application	12	change_pinnedapplication
47	Can delete pinned application	12	delete_pinnedapplication
48	Can view pinned application	12	view_pinnedapplication
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$hZK5eBBDw90k$qqcBGJbvh/hiUP+1A7LywMCt2+MxrYCmisRCTZ2d03Y=	2019-09-18 15:36:00.744111+00	t	admin			admin@admin.ru	t	t	2019-09-18 12:24:29.084376+00
3	pbkdf2_sha256$150000$ilyxfA6MoofB$dv0v7a3vn5oaz1eSzMXW3PiiXejobVcvdpk2y71B3eA=	2019-09-18 18:17:45.116718+00	f	manager			manager@manager.ru	t	t	2019-09-18 18:16:44+00
2	pbkdf2_sha256$150000$7zNdw8h5w1p6$oySWFSkofCm3BZqnE2GI0kuYl65e4bMWEdIlnb3Ypso=	2019-09-18 18:23:35.851701+00	f	director			director@director.ru	t	t	2019-09-18 18:15:32+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	2
2	3	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-09-18 13:32:39.322517+00	2	Shop object (2)	2	[{"changed": {"fields": ["image"]}}]	9	1
2	2019-09-18 13:34:11.364763+00	2	Shop object (2)	2	[{"changed": {"fields": ["image"]}}]	9	1
3	2019-09-18 15:29:16.909723+00	3	noski	2	[{"changed": {"fields": ["category"]}}]	8	1
4	2019-09-18 15:34:56.376875+00	3	noski	2	[]	8	1
5	2019-09-18 15:41:28.416986+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	1
6	2019-09-18 15:41:39.68852+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	1
7	2019-09-18 15:47:21.151089+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	1
8	2019-09-18 15:50:08.154531+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	1
9	2019-09-18 15:57:27.606072+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	1
10	2019-09-18 16:06:59.132876+00	3	noski	2	[{"added": {"name": "Product image", "object": "ProductImage object (1)"}}, {"added": {"name": "Product image", "object": "ProductImage object (2)"}}, {"added": {"name": "Product image", "object": "ProductImage object (3)"}}]	8	1
11	2019-09-18 17:56:11.075986+00	2	pivo	2	[{"changed": {"fields": ["category"]}}]	8	1
12	2019-09-18 18:12:21.771521+00	1	manager	1	[{"added": {}}]	3	1
13	2019-09-18 18:13:36.061593+00	2	director	1	[{"added": {}}]	3	1
14	2019-09-18 18:16:03.97669+00	2	director	2	[{"changed": {"fields": ["is_superuser", "groups"]}}]	4	1
15	2019-09-18 18:17:15.641003+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	3
16	2019-09-18 18:17:33.801551+00	3	manager	2	[{"changed": {"fields": ["is_superuser", "groups"]}}]	4	1
17	2019-09-18 18:18:21.714574+00	2	Socks	3		7	1
18	2019-09-18 18:18:43.281214+00	3	noski	3		8	1
19	2019-09-18 18:18:49.616188+00	2	pivo	3		8	1
20	2019-09-18 18:30:52.239938+00	4	Heineken	1	[{"added": {}}]	8	2
21	2019-09-18 19:06:17.297988+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	2
22	2019-09-18 19:07:26.15867+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	2
23	2019-09-18 19:23:27.989523+00	4	Heineken	2	[{"added": {"name": "Product image", "object": "ProductImage object (4)"}}]	8	2
24	2019-09-18 19:23:49.191329+00	2	Innopolis	2	[{"changed": {"fields": ["image"]}}]	9	2
25	2019-09-18 19:24:03.737389+00	4	Heineken	2	[{"deleted": {"name": "Product image", "object": "ProductImage object (None)"}}]	8	2
26	2019-09-18 19:25:18.342767+00	5	Kagor	1	[{"added": {}}]	8	2
27	2019-09-18 19:26:22.366114+00	6	Gin Tonic cocktail	1	[{"added": {}}]	8	2
28	2019-09-18 19:26:58.126825+00	4	Heineken	2	[{"changed": {"fields": ["category"]}}]	8	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	KE_test	category
8	KE_test	product
9	KE_test	shop
10	KE_test	productimage
11	jet	bookmark
12	jet	pinnedapplication
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	KE_test	0001_initial	2019-09-18 12:24:00.253455+00
2	contenttypes	0001_initial	2019-09-18 12:24:00.32253+00
3	auth	0001_initial	2019-09-18 12:24:00.383484+00
4	admin	0001_initial	2019-09-18 12:24:00.488644+00
5	admin	0002_logentry_remove_auto_add	2019-09-18 12:24:00.520673+00
6	admin	0003_logentry_add_action_flag_choices	2019-09-18 12:24:00.537051+00
7	contenttypes	0002_remove_content_type_name	2019-09-18 12:24:00.578901+00
8	auth	0002_alter_permission_name_max_length	2019-09-18 12:24:00.590752+00
9	auth	0003_alter_user_email_max_length	2019-09-18 12:24:00.615042+00
10	auth	0004_alter_user_username_opts	2019-09-18 12:24:00.636585+00
11	auth	0005_alter_user_last_login_null	2019-09-18 12:24:00.656804+00
12	auth	0006_require_contenttypes_0002	2019-09-18 12:24:00.667862+00
13	auth	0007_alter_validators_add_error_messages	2019-09-18 12:24:00.688196+00
14	auth	0008_alter_user_username_max_length	2019-09-18 12:24:00.718249+00
15	auth	0009_alter_user_last_name_max_length	2019-09-18 12:24:00.739044+00
16	auth	0010_alter_group_name_max_length	2019-09-18 12:24:00.762575+00
17	auth	0011_update_proxy_permissions	2019-09-18 12:24:00.788428+00
18	sessions	0001_initial	2019-09-18 12:24:00.811299+00
19	KE_test	0002_auto_20190918_1313	2019-09-18 13:13:20.193272+00
20	KE_test	0003_auto_20190918_1518	2019-09-18 15:18:48.587318+00
21	jet	0001_initial	2019-09-18 15:33:44.47879+00
22	jet	0002_delete_userdashboardmodule	2019-09-18 15:33:44.498989+00
23	KE_test	0004_auto_20190918_1820	2019-09-18 18:20:17.981086+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
icmyftengx2qpwnna8ivp8op5ir9iv0w	Y2IwZDhlYTQ3NjdlNzM5M2MzYjIzM2MzNjQxOWM1YzM1MDk0NTgzMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OTg5NGYxYTM4MzI1N2QyODkxZmQwYjlmMjJhYjgzZDZlYjM1NThmIn0=	2019-10-02 12:25:17.730806+00
tit28xtnzbfdhncj3tlkkq4y9slzx4dw	Y2IwZDhlYTQ3NjdlNzM5M2MzYjIzM2MzNjQxOWM1YzM1MDk0NTgzMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OTg5NGYxYTM4MzI1N2QyODkxZmQwYjlmMjJhYjgzZDZlYjM1NThmIn0=	2019-10-02 12:53:23.165789+00
oihd9yhqchfzi7qcigyc638a1h4abzpg	Y2IwZDhlYTQ3NjdlNzM5M2MzYjIzM2MzNjQxOWM1YzM1MDk0NTgzMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OTg5NGYxYTM4MzI1N2QyODkxZmQwYjlmMjJhYjgzZDZlYjM1NThmIn0=	2019-10-02 13:05:44.539641+00
z5q7p1swtytl87rfcwh50xtskxsc2ipm	MjAyNDkyMWRiNjAwYWU3MTdlMzI1ZDUwMjc4YjI0MGI3MDdlMGNlYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MjQwMjhmM2Y4MzE2NjJkZjU1NzQyMzhhMGMzOWEwOWEwNDM5YWJjIn0=	2019-10-02 18:16:17.938696+00
kqpidx0vzhx0qmwnnanpmymls0m16dlo	N2JjM2U4MDY5Y2Y0YWM5MDNkZWUwOTMzMGJhMWQ1ODY5MGNkNTU1Mzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWU3YzJkNjgyZDZkYTM1Y2I5MTEwYWIxZmVmMmZmMDc5YzQ3ZWEwIn0=	2019-10-02 18:17:04.335732+00
e0irajo5fvrplh6rxyif9bit7198imt5	N2JjM2U4MDY5Y2Y0YWM5MDNkZWUwOTMzMGJhMWQ1ODY5MGNkNTU1Mzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWU3YzJkNjgyZDZkYTM1Y2I5MTEwYWIxZmVmMmZmMDc5YzQ3ZWEwIn0=	2019-10-02 18:17:45.122235+00
5v1uif3lqtbj9l6396csbgokggy2duip	MjAyNDkyMWRiNjAwYWU3MTdlMzI1ZDUwMjc4YjI0MGI3MDdlMGNlYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MjQwMjhmM2Y4MzE2NjJkZjU1NzQyMzhhMGMzOWEwOWEwNDM5YWJjIn0=	2019-10-02 18:23:35.857305+00
\.


--
-- Data for Name: jet_bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jet_bookmark (id, url, title, "user", date_add) FROM stdin;
\.


--
-- Data for Name: jet_pinnedapplication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
\.


--
-- Name: KE_test_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KE_test_category_id_seq"', 10, true);


--
-- Name: KE_test_category_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KE_test_category_subcategory_id_seq"', 8, true);


--
-- Name: KE_test_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KE_test_product_category_id_seq"', 10, true);


--
-- Name: KE_test_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KE_test_product_id_seq"', 6, true);


--
-- Name: KE_test_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KE_test_productimage_id_seq"', 4, true);


--
-- Name: KE_test_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KE_test_shop_id_seq"', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 41, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 28, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jet_bookmark_id_seq', 1, false);


--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jet_pinnedapplication_id_seq', 1, false);


--
-- Name: KE_test_category KE_test_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_category"
    ADD CONSTRAINT "KE_test_category_pkey" PRIMARY KEY (id);


--
-- Name: KE_test_category_subcategory KE_test_category_subcate_from_category_id_to_cate_1016da5e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_category_subcategory"
    ADD CONSTRAINT "KE_test_category_subcate_from_category_id_to_cate_1016da5e_uniq" UNIQUE (from_category_id, to_category_id);


--
-- Name: KE_test_category_subcategory KE_test_category_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_category_subcategory"
    ADD CONSTRAINT "KE_test_category_subcategory_pkey" PRIMARY KEY (id);


--
-- Name: KE_test_product_category KE_test_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product_category"
    ADD CONSTRAINT "KE_test_product_category_pkey" PRIMARY KEY (id);


--
-- Name: KE_test_product_category KE_test_product_category_product_id_category_id_3306f618_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product_category"
    ADD CONSTRAINT "KE_test_product_category_product_id_category_id_3306f618_uniq" UNIQUE (product_id, category_id);


--
-- Name: KE_test_product KE_test_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product"
    ADD CONSTRAINT "KE_test_product_pkey" PRIMARY KEY (id);


--
-- Name: KE_test_productimage KE_test_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_productimage"
    ADD CONSTRAINT "KE_test_productimage_pkey" PRIMARY KEY (id);


--
-- Name: KE_test_shop KE_test_shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_shop"
    ADD CONSTRAINT "KE_test_shop_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: jet_bookmark jet_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);


--
-- Name: jet_pinnedapplication jet_pinnedapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);


--
-- Name: KE_test_category_subcategory_from_category_id_ef9314ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KE_test_category_subcategory_from_category_id_ef9314ab" ON public."KE_test_category_subcategory" USING btree (from_category_id);


--
-- Name: KE_test_category_subcategory_to_category_id_ee5329cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KE_test_category_subcategory_to_category_id_ee5329cd" ON public."KE_test_category_subcategory" USING btree (to_category_id);


--
-- Name: KE_test_product_category_category_id_6d3f5f77; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KE_test_product_category_category_id_6d3f5f77" ON public."KE_test_product_category" USING btree (category_id);


--
-- Name: KE_test_product_category_product_id_4c9d436d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KE_test_product_category_product_id_4c9d436d" ON public."KE_test_product_category" USING btree (product_id);


--
-- Name: KE_test_product_shop_id_6f1551c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KE_test_product_shop_id_6f1551c7" ON public."KE_test_product" USING btree (shop_id);


--
-- Name: KE_test_productimage_product_id_404dda84; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KE_test_productimage_product_id_404dda84" ON public."KE_test_productimage" USING btree (product_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: KE_test_category_subcategory KE_test_category_sub_from_category_id_ef9314ab_fk_KE_test_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_category_subcategory"
    ADD CONSTRAINT "KE_test_category_sub_from_category_id_ef9314ab_fk_KE_test_c" FOREIGN KEY (from_category_id) REFERENCES public."KE_test_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: KE_test_category_subcategory KE_test_category_sub_to_category_id_ee5329cd_fk_KE_test_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_category_subcategory"
    ADD CONSTRAINT "KE_test_category_sub_to_category_id_ee5329cd_fk_KE_test_c" FOREIGN KEY (to_category_id) REFERENCES public."KE_test_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: KE_test_product_category KE_test_product_cate_category_id_6d3f5f77_fk_KE_test_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product_category"
    ADD CONSTRAINT "KE_test_product_cate_category_id_6d3f5f77_fk_KE_test_c" FOREIGN KEY (category_id) REFERENCES public."KE_test_category"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: KE_test_product_category KE_test_product_cate_product_id_4c9d436d_fk_KE_test_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product_category"
    ADD CONSTRAINT "KE_test_product_cate_product_id_4c9d436d_fk_KE_test_p" FOREIGN KEY (product_id) REFERENCES public."KE_test_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: KE_test_product KE_test_product_shop_id_6f1551c7_fk_KE_test_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_product"
    ADD CONSTRAINT "KE_test_product_shop_id_6f1551c7_fk_KE_test_shop_id" FOREIGN KEY (shop_id) REFERENCES public."KE_test_shop"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: KE_test_productimage KE_test_productimage_product_id_404dda84_fk_KE_test_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KE_test_productimage"
    ADD CONSTRAINT "KE_test_productimage_product_id_404dda84_fk_KE_test_product_id" FOREIGN KEY (product_id) REFERENCES public."KE_test_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

