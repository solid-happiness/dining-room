--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO solid_happines;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO solid_happines;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO solid_happines;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO solid_happines;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO solid_happines;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO solid_happines;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: solid_happines
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


ALTER TABLE public.auth_user OWNER TO solid_happines;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO solid_happines;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO solid_happines;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO solid_happines;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO solid_happines;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO solid_happines;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: dish_dish; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.dish_dish (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    proteins double precision NOT NULL,
    fats double precision NOT NULL,
    carbohydrates double precision NOT NULL,
    calorific integer NOT NULL
);


ALTER TABLE public.dish_dish OWNER TO solid_happines;

--
-- Name: dish_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.dish_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_dish_id_seq OWNER TO solid_happines;

--
-- Name: dish_dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.dish_dish_id_seq OWNED BY public.dish_dish.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: solid_happines
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


ALTER TABLE public.django_admin_log OWNER TO solid_happines;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO solid_happines;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO solid_happines;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO solid_happines;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO solid_happines;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO solid_happines;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO solid_happines;

--
-- Name: eatery_diningroom; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_diningroom (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(64) NOT NULL,
    description character varying(512) NOT NULL,
    photo character varying(100),
    schedule_id integer NOT NULL
);


ALTER TABLE public.eatery_diningroom OWNER TO solid_happines;

--
-- Name: eatery_diningroom_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_diningroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_diningroom_id_seq OWNER TO solid_happines;

--
-- Name: eatery_diningroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_diningroom_id_seq OWNED BY public.eatery_diningroom.id;


--
-- Name: eatery_diningroommenu; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_diningroommenu (
    id integer NOT NULL,
    dining_room_id integer
);


ALTER TABLE public.eatery_diningroommenu OWNER TO solid_happines;

--
-- Name: eatery_diningroommenu_dishes; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_diningroommenu_dishes (
    id integer NOT NULL,
    diningroommenu_id integer NOT NULL,
    menuitem_id integer NOT NULL
);


ALTER TABLE public.eatery_diningroommenu_dishes OWNER TO solid_happines;

--
-- Name: eatery_diningroommenu_dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_diningroommenu_dishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_diningroommenu_dishes_id_seq OWNER TO solid_happines;

--
-- Name: eatery_diningroommenu_dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_diningroommenu_dishes_id_seq OWNED BY public.eatery_diningroommenu_dishes.id;


--
-- Name: eatery_diningroommenu_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_diningroommenu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_diningroommenu_id_seq OWNER TO solid_happines;

--
-- Name: eatery_diningroommenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_diningroommenu_id_seq OWNED BY public.eatery_diningroommenu.id;


--
-- Name: eatery_diningroommenu_weekday; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_diningroommenu_weekday (
    id integer NOT NULL,
    diningroommenu_id integer NOT NULL,
    weekday_id integer NOT NULL
);


ALTER TABLE public.eatery_diningroommenu_weekday OWNER TO solid_happines;

--
-- Name: eatery_diningroommenu_weekday_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_diningroommenu_weekday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_diningroommenu_weekday_id_seq OWNER TO solid_happines;

--
-- Name: eatery_diningroommenu_weekday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_diningroommenu_weekday_id_seq OWNED BY public.eatery_diningroommenu_weekday.id;


--
-- Name: eatery_dishcategory; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_dishcategory (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(64) NOT NULL
);


ALTER TABLE public.eatery_dishcategory OWNER TO solid_happines;

--
-- Name: eatery_dishcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_dishcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_dishcategory_id_seq OWNER TO solid_happines;

--
-- Name: eatery_dishcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_dishcategory_id_seq OWNED BY public.eatery_dishcategory.id;


--
-- Name: eatery_holiday; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_holiday (
    id integer NOT NULL,
    day date NOT NULL
);


ALTER TABLE public.eatery_holiday OWNER TO solid_happines;

--
-- Name: eatery_holiday_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_holiday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_holiday_id_seq OWNER TO solid_happines;

--
-- Name: eatery_holiday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_holiday_id_seq OWNED BY public.eatery_holiday.id;


--
-- Name: eatery_menuitem; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_menuitem (
    id integer NOT NULL,
    price integer NOT NULL,
    portion character varying(64) NOT NULL,
    net_weight double precision NOT NULL,
    photo character varying(100),
    category_id integer NOT NULL,
    dish_id integer NOT NULL
);


ALTER TABLE public.eatery_menuitem OWNER TO solid_happines;

--
-- Name: eatery_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_menuitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_menuitem_id_seq OWNER TO solid_happines;

--
-- Name: eatery_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_menuitem_id_seq OWNED BY public.eatery_menuitem.id;


--
-- Name: eatery_shedule; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_shedule (
    id integer NOT NULL,
    mon_open time without time zone NOT NULL,
    mon_close time without time zone NOT NULL,
    tue_open time without time zone NOT NULL,
    tue_close time without time zone NOT NULL,
    wed_open time without time zone NOT NULL,
    wed_close time without time zone NOT NULL,
    thu_open time without time zone NOT NULL,
    thu_close time without time zone NOT NULL,
    fri_open time without time zone NOT NULL,
    fri_close time without time zone NOT NULL,
    sat_open time without time zone NOT NULL,
    sat_close time without time zone NOT NULL,
    sun_open time without time zone NOT NULL,
    sun_close time without time zone NOT NULL
);


ALTER TABLE public.eatery_shedule OWNER TO solid_happines;

--
-- Name: eatery_shedule_holidays; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_shedule_holidays (
    id integer NOT NULL,
    shedule_id integer NOT NULL,
    holiday_id integer NOT NULL
);


ALTER TABLE public.eatery_shedule_holidays OWNER TO solid_happines;

--
-- Name: eatery_shedule_holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_shedule_holidays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_shedule_holidays_id_seq OWNER TO solid_happines;

--
-- Name: eatery_shedule_holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_shedule_holidays_id_seq OWNED BY public.eatery_shedule_holidays.id;


--
-- Name: eatery_shedule_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_shedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_shedule_id_seq OWNER TO solid_happines;

--
-- Name: eatery_shedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_shedule_id_seq OWNED BY public.eatery_shedule.id;


--
-- Name: eatery_weekday; Type: TABLE; Schema: public; Owner: solid_happines
--

CREATE TABLE public.eatery_weekday (
    id integer NOT NULL,
    day character varying(3) NOT NULL
);


ALTER TABLE public.eatery_weekday OWNER TO solid_happines;

--
-- Name: eatery_weekday_id_seq; Type: SEQUENCE; Schema: public; Owner: solid_happines
--

CREATE SEQUENCE public.eatery_weekday_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eatery_weekday_id_seq OWNER TO solid_happines;

--
-- Name: eatery_weekday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solid_happines
--

ALTER SEQUENCE public.eatery_weekday_id_seq OWNED BY public.eatery_weekday.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: dish_dish id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.dish_dish ALTER COLUMN id SET DEFAULT nextval('public.dish_dish_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: eatery_diningroom id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroom ALTER COLUMN id SET DEFAULT nextval('public.eatery_diningroom_id_seq'::regclass);


--
-- Name: eatery_diningroommenu id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu ALTER COLUMN id SET DEFAULT nextval('public.eatery_diningroommenu_id_seq'::regclass);


--
-- Name: eatery_diningroommenu_dishes id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_dishes ALTER COLUMN id SET DEFAULT nextval('public.eatery_diningroommenu_dishes_id_seq'::regclass);


--
-- Name: eatery_diningroommenu_weekday id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_weekday ALTER COLUMN id SET DEFAULT nextval('public.eatery_diningroommenu_weekday_id_seq'::regclass);


--
-- Name: eatery_dishcategory id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_dishcategory ALTER COLUMN id SET DEFAULT nextval('public.eatery_dishcategory_id_seq'::regclass);


--
-- Name: eatery_holiday id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_holiday ALTER COLUMN id SET DEFAULT nextval('public.eatery_holiday_id_seq'::regclass);


--
-- Name: eatery_menuitem id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_menuitem ALTER COLUMN id SET DEFAULT nextval('public.eatery_menuitem_id_seq'::regclass);


--
-- Name: eatery_shedule id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_shedule ALTER COLUMN id SET DEFAULT nextval('public.eatery_shedule_id_seq'::regclass);


--
-- Name: eatery_shedule_holidays id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_shedule_holidays ALTER COLUMN id SET DEFAULT nextval('public.eatery_shedule_holidays_id_seq'::regclass);


--
-- Name: eatery_weekday id; Type: DEFAULT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_weekday ALTER COLUMN id SET DEFAULT nextval('public.eatery_weekday_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: solid_happines
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
25	Can add Столовая	7	add_diningroom
26	Can change Столовая	7	change_diningroom
27	Can delete Столовая	7	delete_diningroom
28	Can view Столовая	7	view_diningroom
29	Can add Меню	8	add_diningroommenu
30	Can change Меню	8	change_diningroommenu
31	Can delete Меню	8	delete_diningroommenu
32	Can view Меню	8	view_diningroommenu
33	Can add Категория блюд	9	add_dishcategory
34	Can change Категория блюд	9	change_dishcategory
35	Can delete Категория блюд	9	delete_dishcategory
36	Can view Категория блюд	9	view_dishcategory
37	Can add Выходной день	10	add_holiday
38	Can change Выходной день	10	change_holiday
39	Can delete Выходной день	10	delete_holiday
40	Can view Выходной день	10	view_holiday
41	Can add Пункт меню	11	add_menuitem
42	Can change Пункт меню	11	change_menuitem
43	Can delete Пункт меню	11	delete_menuitem
44	Can view Пункт меню	11	view_menuitem
45	Can add Расписание работы	12	add_shedule
46	Can change Расписание работы	12	change_shedule
47	Can delete Расписание работы	12	delete_shedule
48	Can view Расписание работы	12	view_shedule
49	Can add День недели	13	add_weekday
50	Can change День недели	13	change_weekday
51	Can delete День недели	13	delete_weekday
52	Can view День недели	13	view_weekday
53	Can add Блюдо	14	add_dish
54	Can change Блюдо	14	change_dish
55	Can delete Блюдо	14	delete_dish
56	Can view Блюдо	14	view_dish
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$1dbMQpHXXNTc$ZXPnpa+MLtWPflZSBFGFZDPGBXfkvX2Efc4Dsu5bTk8=	2019-03-20 18:57:07.993402+00	t	ivan				t	t	2019-03-20 18:57:02.498031+00
3	pbkdf2_sha256$120000$gKgFOzB4TUVI$V8yDvaoyba0trRVVIPM6wTZYVVmSZgMJwqczXwvuic4=	2019-03-20 19:13:27.972175+00	t	dchebakov			chad-d@mail.ru	t	t	2019-03-20 18:58:03.834126+00
4	pbkdf2_sha256$120000$UU8pbuHiQZU1$qLyMLopSa6qfA6tVkC+/0TaS0wLE+RgDExxYyfMg/Ko=	2019-03-20 20:29:54.771189+00	t	admin				t	t	2019-03-20 20:19:35+00
2	pbkdf2_sha256$120000$Hwqsv14i6nBN$VED7GDhAH+0Z6UTmE3n0M3mFG8zYPDrAl5iINJI4Yxg=	2019-03-20 20:30:03.786238+00	t	alesin				t	t	2019-03-20 18:57:33.412916+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: dish_dish; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.dish_dish (id, name, proteins, fats, carbohydrates, calorific) FROM stdin;
1	Морковь с сахаром, яблоком, курагой, р/м	4.29999999999999982	14.3000000000000007	9.69999999999999929	48446
2	Рассольник "Ленинградский" с курицей, сметаной	12.1999999999999993	11.6999999999999993	2.39999999999999991	124569
3	Котлета куриная, рубленная	10.3000000000000007	9.40000000000000036	5.79999999999999982	103930
4	Рис, припущенный в бульоне	8	12.4000000000000004	6.79999999999999982	163623
5	Чай с сахаром	6.5	6.5	9	79600
6	Каша молочная рисовая с маслом	12.6999999999999993	2.70000000000000018	6.20000000000000018	153519
7	Пудинг творожный с изюмом, сгущенным молоком	1.89999999999999991	3.10000000000000009	10.5	150648
8	Пудинг творожный с изюмом, сметаной	2	3.20000000000000018	11.8000000000000007	98691
9	Грейпфрут с взбитыми сливками	6.40000000000000036	6.5	14.5	139308
10	Морковь с сахаром, яблоком, курагой, р/м	13.9000000000000004	13.3000000000000007	13	120920
11	Редис "Дайкон" с морковью, сыром и майонезом	3.5	14.5	13.4000000000000004	48466
12	Салат "Золотая рыбка" (крабовое мясо, кукуруза, капуста)	11.3000000000000007	2.89999999999999991	1.69999999999999996	186058
13	Салат "Рыбный" (с рисом)	14.5999999999999996	6.29999999999999982	13.9000000000000004	66256
14	Салат из квашеной капусты с клюквой, р/м	8.09999999999999964	2.20000000000000018	3.60000000000000009	128305
15	Сельдь с гарниром	4.20000000000000018	5.59999999999999964	13.3000000000000007	49952
16	Рассольник "Ленинградский" с курицей, сметаной	11.6999999999999993	6.09999999999999964	6.59999999999999964	110572
17	Суп-пюре из брокколи	10	2.10000000000000009	8.69999999999999929	95148
18	Жульен на сливках	2.29999999999999982	4.90000000000000036	4.70000000000000018	94956
19	Биточек рыбный	12.6999999999999993	2.29999999999999982	5	182237
20	Котлета куриная, рубленная	13.4000000000000004	10.1999999999999993	6.09999999999999964	65182
21	Куры жареные	6.90000000000000036	5.5	4.5	42800
22	Плов из индейки	8.59999999999999964	4.59999999999999964	4	103660
23	Рыба отварная с лимоном	9.30000000000000071	5.5	7	120469
24	Поджарка из свинины	8.90000000000000036	1.89999999999999991	12.0999999999999996	95375
25	Свинина, запеченная с грибами, луком, сыром, майонезом	6.70000000000000018	12.6999999999999993	3	160411
26	Картофельное пюре	9	14.1999999999999993	1.30000000000000004	82534
27	Каша гречневая	7.90000000000000036	10.1999999999999993	5.90000000000000036	178926
28	Рис, припущенный в бульоне	3.70000000000000018	13.0999999999999996	11	189880
29	Фасоль стручковая, тушенная с овощами	10.6999999999999993	11.0999999999999996	14.5999999999999996	174781
30	Горчица	6.59999999999999964	4.5	14.5999999999999996	131719
31	Кетчуп "Хайнц"	2.29999999999999982	10.5	2.10000000000000009	185032
32	Подлива мясная (Поджарка)	1.39999999999999991	11.5	7.90000000000000036	157337
33	Соус "Тар-тар"	9.90000000000000036	11.5	10.4000000000000004	70853
34	Хлеб пшеничный	14	13.4000000000000004	10.0999999999999996	79742
35	Хлеб ржаной	9.59999999999999964	1.19999999999999996	4.29999999999999982	117504
36	Хрен столовый	11.1999999999999993	1.69999999999999996	13.9000000000000004	116341
37	Горячий шоколад	9.09999999999999964	13	9.19999999999999929	99611
38	Компот из кураги	10.5999999999999996	8.80000000000000071	8.19999999999999929	121620
39	Напиток фруктовый	9.59999999999999964	13.9000000000000004	9.90000000000000036	80567
40	Кофе 3 в 1	9	13.6999999999999993	8.69999999999999929	82893
41	Кофе б/р без сахара	9.69999999999999929	12.5999999999999996	8.19999999999999929	174255
42	Кофе б/р с сахаром	11.1999999999999993	4.59999999999999964	7.5	134764
43	Лимон	10.8000000000000007	1.89999999999999991	1.10000000000000009	178017
44	Сок в ассортименте	9	14.5999999999999996	8.40000000000000036	115287
45	Чай без сахара	3.60000000000000009	7.79999999999999982	10.0999999999999996	158276
46	Чай с сахаром	4.70000000000000018	1.80000000000000004	11.9000000000000004	102863
47	Чай с сахаром и лимоном	1.19999999999999996	10.4000000000000004	5.79999999999999982	171121
48	Капуста б/к с овощами, растительным маслом	8.5	4.70000000000000018	14.5999999999999996	22654
49	Суп гороховый с картофелем и копченостями	14.3000000000000007	1.80000000000000004	1.60000000000000009	126017
50	Тефтели мясные, рубленные в красном соусе	10.9000000000000004	6.40000000000000036	14.9000000000000004	140756
51	Макароны отварные с маслом	3.60000000000000009	2.29999999999999982	5.40000000000000036	104966
52	Чай с сахаром	9.19999999999999929	2.70000000000000018	10.5	50793
53	Каша молочная манная с маслом	2	9.69999999999999929	8.19999999999999929	194833
54	Пудинг творожный с черносливом, сгущенным молоком	1.39999999999999991	12.4000000000000004	7.5	82010
55	Пудинг творожный с черносливом, сметаной	2.89999999999999991	7.5	13.3000000000000007	66688
56	Капуста б/к с овощами, растительным маслом	2.79999999999999982	8.59999999999999964	10.0999999999999996	28118
57	Овощи свежие с растительным маслом	10.6999999999999993	7.59999999999999964	2.20000000000000018	147207
58	Салат "Анжелика" (ветчина, салат "Китайский", лук, яйцо, майонез)	9.40000000000000036	6.79999999999999982	10.6999999999999993	69602
59	Салат "Столичный" (с курицей)	2.29999999999999982	9	10.5	78558
60	Салат из редиса со свежим огурцом, яйцом, майонезом	2.39999999999999991	3.79999999999999982	10.5	143620
61	Салат фруктовый с взбитыми сливками	11.8000000000000007	1.5	3.5	199731
62	Свекла с черносливом, грецким орехом, чесноком, майонезом	8.09999999999999964	8.30000000000000071	12.5	81506
63	Суп гороховый с картофелем и копченостями	12.5	3.39999999999999991	10.3000000000000007	145774
64	Суп картофельный с грибами, вермишелью и сметаной	1.30000000000000004	10.0999999999999996	11.1999999999999993	52770
65	Жульен на сливках	13.9000000000000004	4.59999999999999964	14.0999999999999996	186316
66	Говядина отварная	13.6999999999999993	12.9000000000000004	5.5	105921
67	Оладьи из печени со сметаной	10.4000000000000004	12.4000000000000004	1.5	111260
68	Куры жареные	8.19999999999999929	14.6999999999999993	6.20000000000000018	27369
69	Поджарка из филе кур в сливочном соусе	13.8000000000000007	10.5	6.40000000000000036	100886
70	Рыба, запеченная с помидором, сыром, майонезом	12.5999999999999996	6.40000000000000036	4.70000000000000018	47252
71	Свинина, запеченная "по-барски"	5.5	12.4000000000000004	6.90000000000000036	12082
72	Тефтели мясные, рубленные в красном соусе	14.6999999999999993	7.5	5.5	156715
73	Кабачки, тушенные с овощами	14	10.8000000000000007	1.80000000000000004	146109
74	Картофельное пюре	12	10.3000000000000007	4.70000000000000018	15917
75	Каша гречневая	7.5	11.6999999999999993	8.80000000000000071	157901
76	Макароны отварные с маслом	13.4000000000000004	10.8000000000000007	14.8000000000000007	9712
77	Горчица	7.20000000000000018	3.29999999999999982	2.10000000000000009	166370
78	Кетчуп "Хайнц"	10.6999999999999993	4.5	11.5	191515
79	Соус сливочный	11.0999999999999996	13	13.9000000000000004	71930
80	Соус "Тар-тар"	6.90000000000000036	9.90000000000000036	4.40000000000000036	21234
81	Соус красный с кореньями	3.60000000000000009	6.79999999999999982	13.5999999999999996	74480
82	Хлеб пшеничный	4.09999999999999964	4.90000000000000036	11.8000000000000007	175148
83	Хлеб ржаной	8.5	6.59999999999999964	2.79999999999999982	170982
84	Хрен столовый	4.59999999999999964	14.1999999999999993	7.09999999999999964	187899
85	Горячий шоколад	2.79999999999999982	13.1999999999999993	10.3000000000000007	118482
86	Компот вишнёвый	10.1999999999999993	11.9000000000000004	7.59999999999999964	62566
87	Компот из чернослива	13.8000000000000007	3.79999999999999982	13.5	57547
88	Кофе 3 в 1	5.90000000000000036	9	13	55976
89	Кофе б/р без сахара	1.10000000000000009	3.70000000000000018	3.79999999999999982	74188
90	Кофе б/р с сахаром	6.59999999999999964	2.39999999999999991	1.60000000000000009	17692
91	Сок в ассортименте	2.5	1.5	7.59999999999999964	72371
92	Чай без сахара	2.20000000000000018	2.29999999999999982	2.70000000000000018	75562
93	Чай с сахаром	4	12.0999999999999996	9.59999999999999964	51364
94	Чай с сахаром и лимоном	11.9000000000000004	12.9000000000000004	7.90000000000000036	89461
95	Винегрет овощной	4.79999999999999982	8.19999999999999929	1	56634
96	Суп овощной с курицей и сметаной	1.19999999999999996	9.69999999999999929	8.90000000000000036	12860
97	Шницель рубленный по-африкански	2.79999999999999982	13.1999999999999993	2	5054
98	Каша гречневая	5.29999999999999982	1.10000000000000009	14.6999999999999993	106589
99	Чай с сахаром	12.6999999999999993	3.39999999999999991	10.0999999999999996	16607
100	Каша молочная пшенная с маслом	4.20000000000000018	11.6999999999999993	1.60000000000000009	155653
101	Пудинг творожный с курагой, сгущенным молоком	11.5	12.5999999999999996	1.5	50858
102	Пудинг творожный с курагой, сметаной	1.5	4.90000000000000036	2.39999999999999991	35221
103	Винегрет овощной	9.30000000000000071	2.70000000000000018	8.40000000000000036	123609
104	Киви с взбитыми сливками	2.39999999999999991	13.5	1.89999999999999991	87277
105	Салат "Городнецкий" (курица, салат, огурец, кукуруза)	12.8000000000000007	2	1.80000000000000004	112417
106	Салат "Домашний" (с ветчиной)	13.4000000000000004	7.59999999999999964	6.70000000000000018	62713
107	Салат "Осенний"	11.1999999999999993	4.20000000000000018	2.39999999999999991	117432
108	Салат из морской капусты с овощами, растительным маслом	11.6999999999999993	4.20000000000000018	6.29999999999999982	8119
109	Салат из свежей капусты  со свежим огурцом, укропом, р/м	14.1999999999999993	6.5	4.20000000000000018	67546
110	Суп овощной с курицей и сметаной	3.29999999999999982	10	2.60000000000000009	18194
111	Суп-харчо с говядиной	7.40000000000000036	8.80000000000000071	9.09999999999999964	158360
112	Жульен на сливках	12.9000000000000004	2.39999999999999991	14.1999999999999993	153012
113	Гуляш из говядины	12.5	9.19999999999999929	1.19999999999999996	100403
114	Картофель, жаренный с грибами, луком	5.29999999999999982	10.5999999999999996	13.5999999999999996	106126
115	Котлета рыбная "Краснодарская"	7.09999999999999964	3.60000000000000009	4.5	120017
116	Куры жареные	5.5	14.4000000000000004	4.5	93822
117	Филе кур, запеченное с помидором, сыром, майонезом	13.3000000000000007	5.29999999999999982	12.9000000000000004	34871
118	Рыба отварная с лимоном	12.0999999999999996	13.5	14	12136
119	Шницель рубленный по-африкански	6.5	12.3000000000000007	10.1999999999999993	118768
120	Баклажаны, тушенные с овощами	8.69999999999999929	5	9.69999999999999929	115580
121	Картофельное пюре	11.1999999999999993	1.60000000000000009	4.79999999999999982	17843
122	Каша гречневая	13.5	7.90000000000000036	9.40000000000000036	56490
123	Рис, припущенный в бульоне	8.80000000000000071	7.70000000000000018	12.5999999999999996	20487
124	Горчица	4.5	6.90000000000000036	11.3000000000000007	121470
125	Кетчуп "Хайнц"	10.5	9.69999999999999929	12.8000000000000007	63140
126	Подлива мясная (Гуляш)	13.8000000000000007	10.4000000000000004	2.5	141145
127	Соус "Тар-тар"	11.3000000000000007	1.69999999999999996	1.19999999999999996	27781
128	Хлеб пшеничный	3.89999999999999991	4.59999999999999964	14.5999999999999996	160888
129	Хлеб ржаной	8.5	6.90000000000000036	3.39999999999999991	196532
130	Хрен столовый	8.90000000000000036	14.9000000000000004	5.59999999999999964	54382
131	Горячий шоколад	3.5	7.5	13	56476
132	Компот из кураги	12	11.6999999999999993	4.90000000000000036	12521
133	Напиток клюквенный	3.10000000000000009	5.20000000000000018	9	41824
134	Кофе 3 в 1	14.4000000000000004	9.19999999999999929	6	137554
135	Кофе б/р без сахара	13.6999999999999993	6.79999999999999982	13.5999999999999996	181142
136	Кофе б/р с сахаром	3.29999999999999982	11.3000000000000007	10.9000000000000004	36578
137	Сок в ассортименте	6.70000000000000018	7.09999999999999964	13.1999999999999993	73633
138	Чай без сахара	12.6999999999999993	6.59999999999999964	14.9000000000000004	11310
139	Чай с лимоном	13.5	4.40000000000000036	6.70000000000000018	34850
140	Чай с сахаром	15	11	4.29999999999999982	77651
141	Чай с сахаром и лимоном	6.40000000000000036	7.20000000000000018	4.79999999999999982	44751
142	Морковь с сахаром, яблоком, изюмом, р/м	14.5	14.3000000000000007	11.4000000000000004	140500
143	Борщ из квашеной капусты с курицей и сметаной	3.5	2.89999999999999991	6.70000000000000018	106871
144	Котлета "Домашняя"	8.59999999999999964	12.1999999999999993	5.29999999999999982	88231
145	Макароны отварные с маслом	14.6999999999999993	7.90000000000000036	9.40000000000000036	29759
146	Чай с сахаром	5.40000000000000036	1.19999999999999996	6.79999999999999982	50874
147	Каша молочная "Дружба" с маслом	14	6	3	32796
148	Пудинг творожный с шоколадом, сгущенным молоком	3.70000000000000018	4.59999999999999964	4.79999999999999982	42407
149	Пудинг творожный с шоколадом, сметаной	14	10.4000000000000004	12.1999999999999993	155439
150	Морковь с сахаром, яблоком, изюмом, р/м	1.39999999999999991	9.5	1.30000000000000004	76708
151	Салат "Мясной"	14.6999999999999993	10.8000000000000007	7.5	154980
152	Салат "Пикантный" (крабовое мясо, сыр, овощи, яйцо)	7.09999999999999964	11.1999999999999993	11	99933
153	Студень говяжий с хреном	2.60000000000000009	5.09999999999999964	1.5	179568
154	Салат "Сезон" (карбонат, огурец, зеленая фасоль, аджика)	3.39999999999999991	10.9000000000000004	13.5	198173
155	Свекла с соленым огурцом, сыром, майонезом	3.10000000000000009	12	9.19999999999999929	37713
156	Яблоко, запеченное с сахаром, корицей, клюквенным соусом	8.19999999999999929	3.20000000000000018	1.30000000000000004	64954
157	Борщ из квашеной капусты с курицей и сметаной	6	6.20000000000000018	1.30000000000000004	58169
158	Суп полевой с мясным набором	1.5	14.0999999999999996	5.79999999999999982	196098
159	Жульен на сливках	3.89999999999999991	6.40000000000000036	3.89999999999999991	94835
160	Говядина отварная	1.39999999999999991	14.4000000000000004	2.5	81453
161	Жаркое "по-домашнему" со свининой	5.59999999999999964	3.79999999999999982	1.30000000000000004	113414
162	Котлета "Домашняя"	12.6999999999999993	10.9000000000000004	8.69999999999999929	178190
163	Куры жареные	9.80000000000000071	11.6999999999999993	12.6999999999999993	15272
164	Печень "по-строгановски"	3.10000000000000009	7.5	11.6999999999999993	170043
165	Рыба, жаренная под маринадом	9.5	10.1999999999999993	7.59999999999999964	137334
166	Шашлык из филе кур	6.59999999999999964	4.70000000000000018	11.4000000000000004	109607
167	Капуста, тушенная с овощами	4.5	1.19999999999999996	8.69999999999999929	95958
168	Картофельное пюре	3.39999999999999991	13.8000000000000007	12.5	58348
169	Каша гречневая	12.5999999999999996	2.79999999999999982	3.39999999999999991	23245
170	Макароны отварные с маслом	2.39999999999999991	13.6999999999999993	12.0999999999999996	163078
171	Горчица	10.9000000000000004	5	4.09999999999999964	11367
172	Кетчуп "Хайнц"	1.5	8.19999999999999929	3.79999999999999982	176531
173	Соус "Тар-тар"	4.09999999999999964	4.09999999999999964	2.70000000000000018	48266
174	Соус сметанный с луком	6	7.90000000000000036	5.79999999999999982	188143
175	Хлеб пшеничный	10.5	1	8.40000000000000036	143740
176	Хлеб ржаной	3.79999999999999982	10	5	159833
177	Хрен столовый	9.40000000000000036	5.90000000000000036	7.79999999999999982	84881
178	Горячий шоколад	2.79999999999999982	12.0999999999999996	12.5999999999999996	41449
179	Кофе 3 в 1	14.4000000000000004	4.59999999999999964	11.0999999999999996	124034
180	Кофе б/р без сахара	5.90000000000000036	12.8000000000000007	3.20000000000000018	8180
181	Кофе б/р с сахаром	1.30000000000000004	14.8000000000000007	14.1999999999999993	39717
182	Лимон	12.8000000000000007	2	12.9000000000000004	5687
183	Напиток фруктовый	9.59999999999999964	9.90000000000000036	11.8000000000000007	103168
184	Сок в ассортименте	3.10000000000000009	5.40000000000000036	3.60000000000000009	113606
185	Чай без сахара	9.40000000000000036	6.29999999999999982	14.5	17837
186	Чай с сахаром	12.5	1.80000000000000004	8.19999999999999929	122275
187	Чай с  лимоном	8.40000000000000036	12.6999999999999993	7.20000000000000018	115708
188	Чай с сахаром и лимоном	12.0999999999999996	2.89999999999999991	6	70578
189	Морковь по-корейски	10.5	1.30000000000000004	9.40000000000000036	95856
190	Суп-пюре из шампиньонов	1.19999999999999996	5.40000000000000036	14.4000000000000004	58413
191	Капуста, тушенная с сосисками	6.20000000000000018	6	14	94909
192	Чай с сахаром	13.5	2.20000000000000018	10.6999999999999993	157286
193	Каша молочная геркулесовая с маслом	9.69999999999999929	11.0999999999999996	6.70000000000000018	145960
194	Пудинг творожный с курагой, сгущенным молоком	10.0999999999999996	6.70000000000000018	7	32076
195	Пудинг творожный с курагой, сметаной	8.90000000000000036	7.5	9.80000000000000071	112979
196	Апельсин с клюквенным соусом	1.30000000000000004	2	2.10000000000000009	62511
197	Морковь по-корейски	13.5	6.79999999999999982	3.10000000000000009	187507
198	Салат "Витаминный" (овощи, фрукты)	5.70000000000000018	14.5999999999999996	3	29384
199	Салат "Лобио"	10.1999999999999993	14.8000000000000007	2.20000000000000018	169637
200	Салат "Мозаика" (краб. мясо, яйцо, огурец, горошек, кукуруза)	5	12.4000000000000004	10.6999999999999993	88816
201	Салат "Оливье"	6.40000000000000036	7.90000000000000036	11.5	82999
202	Сельдь "под шубой"	14.6999999999999993	9.80000000000000071	8.40000000000000036	178639
203	Солянка мясная сборная со сметаной, лимоном, маслиной	1.60000000000000009	2.20000000000000018	13.3000000000000007	54252
204	Суп-пюре из шампиньонов	12.6999999999999993	4.70000000000000018	8.30000000000000071	127851
205	Жульен на сливках	6.59999999999999964	10.3000000000000007	7	167819
206	Капуста, тушенная с сосисками	6.09999999999999964	10	5.5	142026
207	Котлета "Московская"	9.59999999999999964	12.8000000000000007	2.60000000000000009	135130
208	Котлета рыбная "Нежная"	10	8.90000000000000036	5.79999999999999982	175707
209	Куры жареные	7.59999999999999964	6.70000000000000018	10.0999999999999996	143606
210	Поджарка из филе кур	12.6999999999999993	8.80000000000000071	1.69999999999999996	147058
211	Рыба отварная с лимоном	3.5	1.10000000000000009	9.59999999999999964	115533
212	Свинина, запеченная с помидором, сыром, майонезом	13.0999999999999996	15	11.1999999999999993	69450
213	Картофельное пюре	14	7.20000000000000018	12.8000000000000007	183040
214	Каша гречневая	4.29999999999999982	3.10000000000000009	9.69999999999999929	44481
215	Рис, припущенный в бульоне	2.39999999999999991	14	10.1999999999999993	7665
216	Соте овощное	12.4000000000000004	4	14.5999999999999996	42859
217	Горчица	2.89999999999999991	11	2.89999999999999991	27626
218	Кетчуп "Хайнц"	4.20000000000000018	9.90000000000000036	11.8000000000000007	118681
219	Подлива мясная (Поджарка)	3.60000000000000009	12.5999999999999996	2.60000000000000009	74279
220	Соус "Тар-тар"	10.8000000000000007	2.70000000000000018	11.6999999999999993	6727
221	Соус томатный острый	7.20000000000000018	10.5999999999999996	8.19999999999999929	44076
222	Хлеб пшеничный	11	2.20000000000000018	11.1999999999999993	172281
223	Хлеб ржаной	2.70000000000000018	12.6999999999999993	2.10000000000000009	191910
224	Хрен столовый	12.3000000000000007	1.5	10.6999999999999993	166256
225	Горячий шоколад	13.8000000000000007	11.3000000000000007	10	167629
226	Компот вишнёвый	1.5	13	5.59999999999999964	94633
227	Компот из кураги	7.09999999999999964	10.0999999999999996	13.9000000000000004	27854
228	Кофе 3 в 1	4.90000000000000036	12.8000000000000007	12.0999999999999996	12773
229	Кофе б/р без сахара	10.9000000000000004	9	2.39999999999999991	144305
230	Кофе б/р с сахаром	9.5	5.5	10.9000000000000004	35495
231	Сок в ассортименте	12.4000000000000004	15	14.1999999999999993	144970
232	Чай без сахара	2.20000000000000018	7.40000000000000036	2.70000000000000018	184555
233	Чай с лимоном	10.5999999999999996	2.39999999999999991	1.5	89069
234	Чай с сахаром	12.1999999999999993	6.20000000000000018	13	128089
235	Чай с сахаром и лимоном	14.1999999999999993	3.5	13.4000000000000004	48659
236	Салат из квашеной капусты с репчатым луком, р/м	5.29999999999999982	14.9000000000000004	4.20000000000000018	88396
237	Суп рисовый по-румынски с курицей, сметаной	8.09999999999999964	5.40000000000000036	1.19999999999999996	178939
238	Котлета "по-деревенски"	1.60000000000000009	2.10000000000000009	1.30000000000000004	170893
239	Рис, припущенный в бульоне	2.89999999999999991	9.09999999999999964	7.09999999999999964	97897
240	Чай с сахаром	9.30000000000000071	8.09999999999999964	9.59999999999999964	30905
241	Каша молочная рисовая с маслом	5.20000000000000018	5.40000000000000036	2.60000000000000009	164060
242	Пудинг творожный с шоколадом, сгущенным молоком	9.80000000000000071	1.39999999999999991	6.40000000000000036	137562
243	Пудинг творожный с шоколадом, сметаной	14.8000000000000007	14.8000000000000007	13.3000000000000007	55329
244	Апельсин с клюквенным соусом	14.5999999999999996	9.09999999999999964	8.09999999999999964	188986
245	Помидоры с брынзой, зеленью	1.30000000000000004	4.90000000000000036	1.30000000000000004	141693
246	Салат "Берлинский" (ветчина, сыр, огурец, кукуруза)	8.80000000000000071	14.9000000000000004	10	106213
247	Салат "Домашний" (с ветчиной)	10.4000000000000004	10.5	8.5	93108
248	Салат "Крабовый" (с рисом)	8.09999999999999964	8	6.5	47907
249	Салат из квашеной капусты с репчатым луком, р/м	15	5.79999999999999982	5	42800
250	Салат "Китайский" с овощами, р/м	5.5	2.70000000000000018	13.5999999999999996	144090
251	Свекла с черносливом, грецким орехом, чесноком, майонезом	5.20000000000000018	3	15	90222
252	Суп рисовый по-румынски с курицей, сметаной	12.5999999999999996	6.70000000000000018	6.20000000000000018	116415
253	Щи из свежей капусты с курицей, сметаной	5.09999999999999964	8.5	10.4000000000000004	104660
254	Жульен на сливках	2.39999999999999991	10.9000000000000004	7.09999999999999964	13366
255	Гуляш из говядины	13.5999999999999996	6.20000000000000018	4.90000000000000036	140372
256	Картофель, жаренный с колбасой с/к	2.79999999999999982	10.6999999999999993	9.5	103149
257	Картофель, жаренный с грибами, луком	1.80000000000000004	2.5	14.8000000000000007	62773
258	Котлета "по-деревенски"	11.5999999999999996	12.5999999999999996	12.0999999999999996	95748
259	Котлета рыбная	3.39999999999999991	6.20000000000000018	2.5	26433
260	Куры жареные	14	12.4000000000000004	10.1999999999999993	120639
261	Свинина, запеченная с помидором, сыром, майонезом	14.9000000000000004	3.89999999999999991	11.6999999999999993	22873
262	Эскалоп	4.79999999999999982	11.5	10.6999999999999993	23246
263	Картофельное пюре	14.6999999999999993	14.1999999999999993	7	12318
264	Каша гречневая	4.79999999999999982	14.3000000000000007	7.90000000000000036	73715
265	Рис, припущенный в бульоне	14.1999999999999993	9.30000000000000071	3	59926
266	Фасоль, тушенная с овощами	4.5	7.70000000000000018	2.39999999999999991	14350
267	Горчица	13.5	6.09999999999999964	12.5999999999999996	186363
268	Кетчуп "Хайнц"	5	6.5	12.5	157574
269	Подлива мясная (Гуляш)	10.1999999999999993	2.20000000000000018	12.5999999999999996	135906
270	Соус "Тар-тар"	9.90000000000000036	6.20000000000000018	9.90000000000000036	136936
271	Хлеб пшеничный	10.4000000000000004	5.70000000000000018	13.3000000000000007	166768
272	Хлеб ржаной	2.39999999999999991	9.40000000000000036	7.5	181161
273	Хрен столовый	4.59999999999999964	10.4000000000000004	11.4000000000000004	170842
274	Горячий шоколад	6.20000000000000018	3.60000000000000009	3.89999999999999991	30708
275	Кофе 3 в 1	3.39999999999999991	13.3000000000000007	13.6999999999999993	154574
276	Кофе б/р без сахара	4	11.9000000000000004	12.1999999999999993	153826
277	Кофе б/р с сахаром	10.5	9.30000000000000071	10.1999999999999993	76520
278	Лимон	7.90000000000000036	14.8000000000000007	8	170936
279	Напиток клюквенный	11.1999999999999993	12.6999999999999993	9.40000000000000036	40033
280	Сок в ассортименте	10.9000000000000004	7	1.19999999999999996	113917
281	Чай без сахара	5.5	9.5	5.40000000000000036	170087
282	Чай с лимоном	7.59999999999999964	11.3000000000000007	9	140524
283	Чай с сахаром	6.5	2.39999999999999991	4.90000000000000036	32251
284	Чай с сахаром и лимоном	14.3000000000000007	12	10	194422
285	Круассан с шоколадом	5	20	17	200000
286	Ватрушка с творогом	15	19	12	150000
287	Латте с корицей	3	2	10	30000
288	Пельмени с мясом	15	25	20	400000
289	Вареники с творогом	20	15	30	300000
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-03-20 19:00:24.488922+00	1	2019-03-08	1	[{"added": {}}]	10	2
2	2019-03-20 19:00:37.692015+00	2	2019-05-01	1	[{"added": {}}]	10	2
3	2019-03-20 19:00:44.861704+00	3	2019-05-09	1	[{"added": {}}]	10	2
4	2019-03-20 19:00:52.658416+00	4	2019-06-12	1	[{"added": {}}]	10	2
5	2019-03-20 19:00:54.092401+00	1	Расписание 1 (datetime.time(9, 0), datetime.time(17, 0))	1	[{"added": {}}]	12	2
6	2019-03-20 19:03:31.189034+00	1	Столовая №1	1	[{"added": {}}]	7	2
7	2019-03-20 19:16:03.395412+00	271	Хлеб пшеничный	2	[{"changed": {"fields": ["photo"]}}]	11	2
8	2019-03-20 19:16:15.872193+00	222	Хлеб пшеничный	2	[{"changed": {"fields": ["photo"]}}]	11	2
9	2019-03-20 19:16:25.275625+00	175	Хлеб пшеничный	2	[{"changed": {"fields": ["photo"]}}]	11	2
10	2019-03-20 19:16:48.938466+00	128	Хлеб пшеничный	2	[{"changed": {"fields": ["photo"]}}]	11	2
11	2019-03-20 19:17:05.213979+00	82	Хлеб пшеничный	2	[{"changed": {"fields": ["photo"]}}]	11	2
12	2019-03-20 19:17:22.139597+00	34	Хлеб пшеничный	2	[{"changed": {"fields": ["photo"]}}]	11	2
13	2019-03-20 19:18:01.374497+00	271	Хлеб пшеничный	2	[{"changed": {"fields": ["price"]}}]	11	2
14	2019-03-20 19:18:30.844268+00	103	Винегрет овощной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
15	2019-03-20 19:18:43.727496+00	95	Винегрет овощной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
16	2019-03-20 19:46:40.455412+00	260	Куры жареные	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
17	2019-03-20 19:46:55.401527+00	209	Куры жареные	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
18	2019-03-20 19:47:16.859815+00	163	Куры жареные	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
19	2019-03-20 19:47:28.128094+00	116	Куры жареные	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
20	2019-03-20 19:47:49.037509+00	68	Куры жареные	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
21	2019-03-20 19:48:05.103318+00	21	Куры жареные	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
22	2019-03-20 19:49:23.697789+00	2	Расписание 2 (datetime.time(8, 0), datetime.time(18, 0))	1	[{"added": {}}]	12	2
23	2019-03-20 19:50:41.969647+00	2	Кафетерий	1	[{"added": {}}]	7	2
24	2019-03-20 19:53:26.418858+00	3	Расписание 3 (datetime.time(9, 0), datetime.time(16, 30))	1	[{"added": {}}]	12	2
25	2019-03-20 19:53:29.8981+00	3	Пельменная	1	[{"added": {}}]	7	2
26	2019-03-20 19:54:58.540901+00	285	Круассан с шоколадом	1	[{"added": {}}]	14	2
27	2019-03-20 19:55:23.477271+00	286	Ватрушка с творогом	1	[{"added": {}}]	14	2
28	2019-03-20 19:55:44.514759+00	287	Латте с корицей	1	[{"added": {}}]	14	2
29	2019-03-20 19:57:24.046068+00	9	Основное меню	1	[{"added": {}}]	9	2
30	2019-03-20 19:57:29.952463+00	285	Круассан с шоколадом	1	[{"added": {}}]	11	2
31	2019-03-20 19:57:58.707693+00	286	Ватрушка с творогом	1	[{"added": {}}]	11	2
32	2019-03-20 19:58:31.439387+00	7	Кафетерий (Понедельник, Вторник, Среда, Четверг, Пятница)	1	[{"added": {}}]	8	2
33	2019-03-20 20:00:08.205856+00	285	Круассан с шоколадом	2	[{"changed": {"fields": ["price"]}}]	11	2
34	2019-03-20 20:00:17.300492+00	286	Ватрушка с творогом	2	[{"changed": {"fields": ["price"]}}]	11	2
35	2019-03-20 20:01:15.980877+00	29	Фасоль стручковая, тушенная с овощами	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
36	2019-03-20 20:01:44.552821+00	211	Рыба отварная с лимоном	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
37	2019-03-20 20:01:56.765306+00	118	Рыба отварная с лимоном	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
38	2019-03-20 20:02:09.779962+00	23	Рыба отварная с лимоном	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
39	2019-03-20 20:02:39.825769+00	267	Горчица	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
40	2019-03-20 20:02:52.92588+00	217	Горчица	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
41	2019-03-20 20:03:04.095193+00	171	Горчица	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
42	2019-03-20 20:03:16.047036+00	124	Горчица	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
43	2019-03-20 20:03:27.641738+00	77	Горчица	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
44	2019-03-20 20:03:37.573515+00	30	Горчица	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
45	2019-03-20 20:04:37.41135+00	288	Пельмени с мясом	1	[{"added": {}}]	14	2
46	2019-03-20 20:04:58.607243+00	289	Вареники с творогом	1	[{"added": {}}]	14	2
47	2019-03-20 20:05:35.77654+00	10	Горячие блюда	1	[{"added": {}}]	9	2
48	2019-03-20 20:05:53.766949+00	287	Вареники с творогом	1	[{"added": {}}]	11	2
49	2019-03-20 20:06:37.250945+00	288	Пельмени с мясом	1	[{"added": {}}]	11	2
50	2019-03-20 20:06:59.246401+00	8	Пельменная (Понедельник, Вторник, Среда, Четверг, Пятница)	1	[{"added": {}}]	8	2
51	2019-03-20 20:08:13.680718+00	3	Пельменная	2	[{"changed": {"fields": ["photo"]}}]	7	2
52	2019-03-20 20:08:53.913254+00	288	Пельмени с мясом	2	[{"changed": {"fields": ["photo"]}}]	11	2
53	2019-03-20 20:10:52.765975+00	274	Горячий шоколад	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
54	2019-03-20 20:11:04.048563+00	225	Горячий шоколад	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
55	2019-03-20 20:11:17.19785+00	178	Горячий шоколад	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
56	2019-03-20 20:11:29.952632+00	131	Горячий шоколад	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
57	2019-03-20 20:11:42.440814+00	85	Горячий шоколад	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
58	2019-03-20 20:11:57.288933+00	37	Горячий шоколад	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
59	2019-03-20 20:12:23.944818+00	280	Сок в ассортименте	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
60	2019-03-20 20:12:33.272914+00	231	Сок в ассортименте	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
61	2019-03-20 20:12:43.944128+00	184	Сок в ассортименте	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
62	2019-03-20 20:12:53.660527+00	137	Сок в ассортименте	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
63	2019-03-20 20:13:03.968306+00	91	Сок в ассортименте	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
64	2019-03-20 20:13:14.712628+00	44	Сок в ассортименте	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
65	2019-03-20 20:13:47.98202+00	264	Каша гречневая	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
66	2019-03-20 20:13:57.192974+00	214	Каша гречневая	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
67	2019-03-20 20:14:08.683252+00	169	Каша гречневая	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
68	2019-03-20 20:14:19.324437+00	122	Каша гречневая	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
69	2019-03-20 20:14:28.79588+00	98	Каша гречневая	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
70	2019-03-20 20:14:40.906514+00	75	Каша гречневая	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
71	2019-03-20 20:14:51.677618+00	27	Каша гречневая	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
72	2019-03-20 20:16:53.552688+00	243	Пудинг творожный с шоколадом, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
73	2019-03-20 20:17:03.318172+00	242	Пудинг творожный с шоколадом, сгущенным молоком	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
74	2019-03-20 20:17:13.033117+00	195	Пудинг творожный с курагой, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
75	2019-03-20 20:17:21.933308+00	194	Пудинг творожный с курагой, сгущенным молоком	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
76	2019-03-20 20:17:31.44871+00	149	Пудинг творожный с шоколадом, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
77	2019-03-20 20:17:42.441591+00	148	Пудинг творожный с шоколадом, сгущенным молоком	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
78	2019-03-20 20:17:52.955758+00	102	Пудинг творожный с курагой, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
79	2019-03-20 20:18:03.098157+00	101	Пудинг творожный с курагой, сгущенным молоком	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
80	2019-03-20 20:18:14.975857+00	55	Пудинг творожный с черносливом, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
81	2019-03-20 20:18:25.053084+00	54	Пудинг творожный с черносливом, сгущенным молоком	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
82	2019-03-20 20:18:33.658738+00	8	Пудинг творожный с изюмом, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
83	2019-03-20 20:18:45.907852+00	7	Пудинг творожный с изюмом, сгущенным молоком	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
84	2019-03-20 20:19:16.933734+00	22	Плов из индейки	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
85	2019-03-20 20:19:35.464574+00	4	admin	1	[{"added": {}}]	4	1
86	2019-03-20 20:19:46.540683+00	278	Лимон	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
87	2019-03-20 20:19:57.537575+00	182	Лимон	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
88	2019-03-20 20:20:01.343856+00	4	admin	2	[{"changed": {"fields": ["is_staff", "is_superuser"]}}]	4	1
89	2019-03-20 20:20:08.39307+00	43	Лимон	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
90	2019-03-20 20:20:41.323133+00	263	Картофельное пюре	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
91	2019-03-20 20:20:51.569135+00	213	Картофельное пюре	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
92	2019-03-20 20:21:01.987377+00	168	Картофельное пюре	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
93	2019-03-20 20:21:11.9933+00	121	Картофельное пюре	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
94	2019-03-20 20:21:25.142397+00	74	Картофельное пюре	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
95	2019-03-20 20:21:35.281399+00	26	Картофельное пюре	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
96	2019-03-20 20:21:59.708344+00	16	Рассольник "Ленинградский" с курицей, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
97	2019-03-20 20:22:12.516185+00	2	Рассольник "Ленинградский" с курицей, сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
98	2019-03-20 20:22:50.188203+00	56	Капуста б/к с овощами, растительным маслом	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
99	2019-03-20 20:23:14.154074+00	109	Салат из свежей капусты  со свежим огурцом, укропом, р/м	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
100	2019-03-20 20:23:34.725129+00	48	Капуста б/к с овощами, растительным маслом	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
101	2019-03-20 20:25:44.557073+00	108	Салат из морской капусты с овощами, растительным маслом	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
102	2019-03-20 20:26:13.278093+00	270	Соус "Тар-тар"	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
103	2019-03-20 20:26:23.926519+00	220	Соус "Тар-тар"	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
104	2019-03-20 20:26:35.39495+00	173	Соус "Тар-тар"	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
105	2019-03-20 20:26:44.710829+00	127	Соус "Тар-тар"	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
106	2019-03-20 20:26:55.363423+00	80	Соус "Тар-тар"	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
107	2019-03-20 20:27:04.484571+00	33	Соус "Тар-тар"	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
108	2019-03-20 20:30:53.166316+00	17	Суп-пюре из брокколи	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
109	2019-03-20 20:31:11.83828+00	111	Суп-харчо с говядиной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
110	2019-03-20 20:31:38.7068+00	110	Суп овощной с курицей и сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
111	2019-03-20 20:31:47.539694+00	96	Суп овощной с курицей и сметаной	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
112	2019-03-20 20:32:17.235641+00	254	Жульен на сливках	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
113	2019-03-20 20:32:26.565309+00	205	Жульен на сливках	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
114	2019-03-20 20:32:39.481434+00	254	Жульен на сливках	2	[{"changed": {"fields": ["photo"]}}]	11	2
115	2019-03-20 20:32:53.421546+00	159	Жульен на сливках	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
116	2019-03-20 20:33:09.792997+00	112	Жульен на сливках	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
117	2019-03-20 20:33:18.587094+00	65	Жульен на сливках	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
118	2019-03-20 20:33:25.478125+00	18	Жульен на сливках	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
119	2019-03-20 20:34:06.015124+00	281	Чай без сахара	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
120	2019-03-20 20:34:16.347606+00	232	Чай без сахара	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
121	2019-03-20 20:34:25.965401+00	185	Чай без сахара	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
122	2019-03-20 20:34:35.592865+00	138	Чай без сахара	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
123	2019-03-20 20:34:43.887461+00	92	Чай без сахара	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
124	2019-03-20 20:34:54.944835+00	45	Чай без сахара	2	[{"changed": {"fields": ["price", "photo"]}}]	11	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	eatery	diningroom
8	eatery	diningroommenu
9	eatery	dishcategory
10	eatery	holiday
11	eatery	menuitem
12	eatery	shedule
13	eatery	weekday
14	dish	dish
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-03-20 18:21:40.93291+00
2	auth	0001_initial	2019-03-20 18:21:41.123074+00
3	admin	0001_initial	2019-03-20 18:21:41.168092+00
4	admin	0002_logentry_remove_auto_add	2019-03-20 18:21:41.181441+00
5	admin	0003_logentry_add_action_flag_choices	2019-03-20 18:21:41.19526+00
6	contenttypes	0002_remove_content_type_name	2019-03-20 18:21:41.222859+00
7	auth	0002_alter_permission_name_max_length	2019-03-20 18:21:41.238037+00
8	auth	0003_alter_user_email_max_length	2019-03-20 18:21:41.254429+00
9	auth	0004_alter_user_username_opts	2019-03-20 18:21:41.269277+00
10	auth	0005_alter_user_last_login_null	2019-03-20 18:21:41.28642+00
11	auth	0006_require_contenttypes_0002	2019-03-20 18:21:41.290894+00
12	auth	0007_alter_validators_add_error_messages	2019-03-20 18:21:41.304439+00
13	auth	0008_alter_user_username_max_length	2019-03-20 18:21:41.328332+00
14	auth	0009_alter_user_last_name_max_length	2019-03-20 18:21:41.345937+00
15	dish	0001_initial	2019-03-20 18:21:41.366813+00
16	eatery	0001_initial	2019-03-20 18:21:41.606358+00
17	eatery	0002_auto_20190320_1643	2019-03-20 18:21:41.666097+00
18	sessions	0001_initial	2019-03-20 18:21:41.695964+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
f6jw55sqhxithobn6a4l6z4iq7uozbrw	NDYxMWE2YWMyZGE4MzQzMzU1ZmYxOGY2OGVlODIwY2Y4Y2JkYjkyNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWVmYWRjYWRlNmFiZjZiN2YzYmNmZmZlNTYzZmRhMDI4Y2E3Nzc1In0=	2019-04-03 19:13:27.97569+00
xl8b8gdib1mycggynmi0e8x1jh24jqh1	MDQ3MTY0MjljYTcwNTI0NzU3NmYyNDVkYzU5ZmQ5MjI3YmJiNmJmOTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTI5YTc3Y2E1ZWY4YzZlNWNkNWZhZWUyODhkYWY5ZTE3YjI5ZTA5In0=	2019-04-03 20:20:17.427545+00
2tbgwmpedc2xn037jha7w7ndputfcw1n	MGEyYmY0YjZkNGQ1MzdlYmMwMjIzMjg5YjhlNjk0ODZmYjdkN2I2NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlM2E5ZDBjMGM2YWFlODU4NzU4MmY5YWQ3ZWFjYzk3MWIxZjc3NGM5In0=	2019-04-03 20:30:03.790461+00
\.


--
-- Data for Name: eatery_diningroom; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_diningroom (id, name, slug, description, photo, schedule_id) FROM stdin;
1	Столовая №1	dining-room	Каждый день радуем вас вкусными и свежими блюдами, выпечкой, напитками. Мы находимся в ГЗ, 2 этаж, северное крыло.	dining-room/main.jpg	1
2	Кафетерий	cafe	Здесь вы можете попить кофе на коротком перерыве и перекусить свежими круассанами и булочками.	dining-room/main_nL9IiDQ.jpg	2
3	Пельменная	dumplings	Горячие пельмени и вареники в любое время! ГЗ, 2 этаж, северное крыло.	dining-room/main_FyGArHx.jpg	3
\.


--
-- Data for Name: eatery_diningroommenu; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_diningroommenu (id, dining_room_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	2
8	3
\.


--
-- Data for Name: eatery_diningroommenu_dishes; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_diningroommenu_dishes (id, diningroommenu_id, menuitem_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	2	48
49	2	49
50	2	50
51	2	51
52	2	52
53	2	53
54	2	54
55	2	55
56	2	56
57	2	57
58	2	58
59	2	59
60	2	60
61	2	61
62	2	62
63	2	63
64	2	64
65	2	65
66	2	66
67	2	67
68	2	68
69	2	69
70	2	70
71	2	71
72	2	72
73	2	73
74	2	74
75	2	75
76	2	76
77	2	77
78	2	78
79	2	79
80	2	80
81	2	81
82	2	82
83	2	83
84	2	84
85	2	85
86	2	86
87	2	87
88	2	88
89	2	89
90	2	90
91	2	91
92	2	92
93	2	93
94	2	94
95	3	128
96	3	129
97	3	130
98	3	131
99	3	132
100	3	133
101	3	134
102	3	135
103	3	136
104	3	137
105	3	138
106	3	139
107	3	140
108	3	141
109	3	95
110	3	96
111	3	97
112	3	98
113	3	99
114	3	100
115	3	101
116	3	102
117	3	103
118	3	104
119	3	105
120	3	106
121	3	107
122	3	108
123	3	109
124	3	110
125	3	111
126	3	112
127	3	113
128	3	114
129	3	115
130	3	116
131	3	117
132	3	118
133	3	119
134	3	120
135	3	121
136	3	122
137	3	123
138	3	124
139	3	125
140	3	126
141	3	127
142	4	142
143	4	143
144	4	144
145	4	145
146	4	146
147	4	147
148	4	148
149	4	149
150	4	150
151	4	151
152	4	152
153	4	153
154	4	154
155	4	155
156	4	156
157	4	157
158	4	158
159	4	159
160	4	160
161	4	161
162	4	162
163	4	163
164	4	164
165	4	165
166	4	166
167	4	167
168	4	168
169	4	169
170	4	170
171	4	171
172	4	172
173	4	173
174	4	174
175	4	175
176	4	176
177	4	177
178	4	178
179	4	179
180	4	180
181	4	181
182	4	182
183	4	183
184	4	184
185	4	185
186	4	186
187	4	187
188	4	188
189	5	189
190	5	190
191	5	191
192	5	192
193	5	193
194	5	194
195	5	195
196	5	196
197	5	197
198	5	198
199	5	199
200	5	200
201	5	201
202	5	202
203	5	203
204	5	204
205	5	205
206	5	206
207	5	207
208	5	208
209	5	209
210	5	210
211	5	211
212	5	212
213	5	213
214	5	214
215	5	215
216	5	216
217	5	217
218	5	218
219	5	219
220	5	220
221	5	221
222	5	222
223	5	223
224	5	224
225	5	225
226	5	226
227	5	227
228	5	228
229	5	229
230	5	230
231	5	231
232	5	232
233	5	233
234	5	234
235	5	235
236	6	256
237	6	257
238	6	258
239	6	259
240	6	260
241	6	261
242	6	262
243	6	263
244	6	264
245	6	265
246	6	266
247	6	267
248	6	268
249	6	269
250	6	270
251	6	271
252	6	272
253	6	273
254	6	274
255	6	275
256	6	276
257	6	277
258	6	278
259	6	279
260	6	280
261	6	281
262	6	282
263	6	283
264	6	284
265	6	236
266	6	237
267	6	238
268	6	239
269	6	240
270	6	241
271	6	242
272	6	243
273	6	244
274	6	245
275	6	246
276	6	247
277	6	248
278	6	249
279	6	250
280	6	251
281	6	252
282	6	253
283	6	254
284	6	255
285	7	285
286	7	286
287	8	288
288	8	287
\.


--
-- Data for Name: eatery_diningroommenu_weekday; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_diningroommenu_weekday (id, diningroommenu_id, weekday_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	1
8	7	2
9	7	3
10	7	4
11	7	5
12	8	1
13	8	2
14	8	3
15	8	4
16	8	5
\.


--
-- Data for Name: eatery_dishcategory; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_dishcategory (id, name, slug) FROM stdin;
1	ЭКОНОМ ОБЕД	ekonom-obed
2	ДИЕТИЧЕСКИЕ БЛЮДА	dieticheskie-bljuda
3	ХОЛОДНЫЕ ЗАКУСКИ	holodnye-zakuski
4	ПЕРВЫЕ БЛЮДА	pervye-bljuda
5	ВТОРЫЕ БЛЮДА	vtorye-bljuda
6	ГАРНИРЫ	garniry
7	СОУСЫ / ХЛЕБ	sousy-/-hleb
8	НАПИТКИ	napitki
9	Основное меню	main-menu
10	Горячие блюда	hot-dishes
\.


--
-- Data for Name: eatery_holiday; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_holiday (id, day) FROM stdin;
1	2019-03-08
2	2019-05-01
3	2019-05-09
4	2019-06-12
\.


--
-- Data for Name: eatery_menuitem; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_menuitem (id, price, portion, net_weight, photo, category_id, dish_id) FROM stdin;
1	25	100 г	100		1	1
3	75	100 г	100		1	3
4	20	150 г	150		1	4
5	15	200 мл/16 г	216		1	5
6	40	250 г	250		2	6
9	50	100 г	100		3	9
10	25	100 г	100		3	10
11	50	100 г	100		3	11
12	30	100 г	100		3	12
13	60	100 г	100		3	13
14	35	100 г	100		3	14
15	80	70/50 г	120		3	15
19	100	100 г	100		5	19
20	75	100 г	100		5	20
24	100	75/50 г	125		5	24
25	145	80/40 г	120		5	25
28	20	150 г	150		6	28
31	20	50 г	50		7	31
32	5	50 г	50		7	32
35	2	35 г	35		7	35
36	5	10 г	10		7	36
38	30	200 мл	200		8	38
39	20	200 мл	200		8	39
40	25	200 мл	200		8	40
41	25	200 мл	200		8	41
42	25	200 мл/16 г	216		8	42
46	15	200 мл/16 г	216		8	46
47	15	200 мл/16/7 г	223		8	47
49	50	25/250 г	275		1	49
50	95	115/50 г	165		1	50
51	15	150 г	150		1	51
52	15	200 мл/16 г	216		1	52
53	40	250 г	250		2	53
57	40	100 г	100		3	57
58	55	100 г	100		3	58
59	50	100 г	100		3	59
60	40	100 г	100		3	60
61	50	100/20 г	120		3	61
62	45	100	100		3	62
63	50	25/250 г	275		4	63
64	50	250/10 г	260		4	64
66	120	75 г	75		5	66
67	100	150/20 г	170		5	67
69	105	75/50 г	125		5	69
70	160	80/40 г	120		5	70
71	140	75/60 г	135		5	71
72	95	115/50 г	165		5	72
73	60	150 г	150		6	73
76	15	150 г	150		6	76
78	20	50 г	50		7	78
79	15	50 г	50		7	79
81	5	50 г	50		7	81
83	2	40 г	40		7	83
84	5	10 г	10		7	84
86	30	200 мл	200		8	86
87	30	200 мл	200		8	87
88	25	200 мл	200		8	88
89	25	200 мл	200		8	89
90	25	200 мл/16 г	216		8	90
93	15	200 мл/16 г	216		8	93
94	15	200 мл/16/7 г	223		8	94
97	90	100 г	100		1	97
99	13	330 мл	330		1	99
100	40	250 г	250		2	100
104	60	100 г	100		3	104
105	55	100 г	100		3	105
106	45	100 г	100		3	106
107	60	100 г	100		3	107
113	125	75/50 г	125		5	113
114	85	150 г	150		5	114
103	3000	100 г	100	dishes/vinegret.png	3	103
95	3000	100 г	100	dishes/vinegret_KKsrmNr.png	1	95
21	9500	120 г	120	dishes/chicken-leg_YpawQ1a.png	5	21
29	5000	150 г	150	dishes/fasol.png	6	29
23	17000	100/10 г	110	dishes/fish-lemon_Is6EWOM.png	5	23
30	500	10 г	10	dishes/gotchitsa_0nn4BXQ.png	7	30
85	3000	200 мл	200	dishes/hot-chocolate_5SWLykk.png	8	85
91	3500	200 мл	200	dishes/juice_nljvlRv.png	8	91
44	3500	200 мл	200	dishes/juice_a3mq0WF.png	8	44
75	2000	150 г	150	dishes/kasha-grechnevaya_73FtUMy.png	6	75
27	2000	150 г	150	dishes/kasha-grechnevaya_4cURRo2.png	6	27
101	6000	150/20 г	170	dishes/puding_uyBqIke.png	2	101
55	6000	150/20 г	170	dishes/puding_g2yKDzN.png	2	55
54	6000	150/20 г	170	dishes/puding_64Lrzro.png	2	54
7	6000	150/20 г	170	dishes/puding_UMnxxBb.png	2	7
22	11000	250 г	250	dishes/plov.png	5	22
43	500	7 г.	7	dishes/limon_UtxXR0l.png	8	43
26	3500	150 г	150	dishes/pure-cartofelnoe_iMmxJpS.png	6	26
16	5000	35/250/10	295	dishes/rassolnik.png	4	16
56	3500	120 г	120	dishes/salat-kapusta.png	3	56
109	3000	100 г	100	dishes/salat-kapusta_P7avf35.png	3	109
108	4500	100 г	100	dishes/salat-morskaya-kapusta.png	3	108
80	2000	50 г	50	dishes/souce-tartar_OgwusaE.png	7	80
33	2000	50 г	50	dishes/souce-tartar_ZNbuJsS.png	7	33
111	6500	35/250 г	285	dishes/sup-kharcho.png	4	111
110	5500	35/250/10 г	295	dishes/sup-ovoshnoy.png	4	110
112	9000	100 г	100	dishes/zhulen_onM39eL.png	5	112
65	9000	100 г	100	dishes/zhulen_etlMNpc.png	5	65
18	9000	100 г	100	dishes/zhulen_84uDQsH.png	5	18
45	1500	200 мл	200	dishes/tea_WZOadEE.png	8	45
115	100	100 г	100		5	115
117	140	100/50 г	150		5	117
119	90	100 г	100		5	119
120	70	150 г	150		6	120
123	20	150 г	150		6	123
125	20	50 г	50		7	125
126	5	50 г	50		7	126
129	2	35 г	35		7	129
130	5	10 г	10		7	130
132	30	200 мл	200		8	132
133	30	200 мл	200		8	133
134	25	200 мл	200		8	134
135	25	200 мл	200		8	135
136	25	200 мл/16 г	216		8	136
139	15	200 мл/7 г	207		8	139
140	15	200 мл/16 г	216		8	140
141	15	200 мл/16/7 г	223		8	141
142	25	100 г	100		1	142
143	50	250/35/10 г	295		1	143
144	85	100 г	100		1	144
145	15	150 г	150		1	145
146	15	200 мл/16 г	216		1	146
147	40	250 г	250		2	147
150	25	100 г	100		3	150
151	50	100 г	100		3	151
152	60	130 г	130		3	152
153	100	150/20 г	170		3	153
154	60	100	100		3	154
155	40	100 г	100		3	155
156	50	140/20/20 г	180		3	156
157	50	250/35/10 г	295		4	157
158	50	25/250 г	275		4	158
160	120	75 г	75		5	160
161	110	50/250 г	300		5	161
162	85	100 г	100		5	162
164	75	75/50 г	125		5	164
165	155	80/40	120		5	165
166	130	100 г	100		5	166
167	35	150 г	150		6	167
170	15	150 г	150		6	170
172	20	50 г	50		7	172
174	10	50 г	50		7	174
176	2	35 г	35		7	176
177	5	10 г	10		7	177
179	25	200 мл	200		8	179
180	25	200 мл	200		8	180
181	25	200 мл/16 г	216		8	181
183	20	200 мл	200		8	183
186	15	200 мл/16 г	216		8	186
187	15	200 мл/7 г	207		8	187
188	15	200 мл/16/7 г	223		8	188
189	25	150 г	150		1	189
190	60	250 г	250		1	190
191	70	250 г	250		1	191
192	15	200 мл/16 г	216		1	192
193	40	250 г	250		2	193
196	40	80/20 г	100		3	196
197	25	150 г	150		3	197
198	30	100 г	100		3	198
199	45	100 г	100		3	199
200	40	100 г	100		3	200
201	50	100 г	100		3	201
202	60	100 г	100		3	202
203	80	40/250/10/3/1 г	304		4	203
204	60	250 г	250		4	204
206	70	250 г	250		5	206
207	85	100 г	100		5	207
208	115	100 г	100		5	208
210	105	75/50 г	125		5	210
212	140	80/40 г	120		5	212
215	20	150 г	150		6	215
216	65	150 г	150		6	216
218	20	50 г	50		7	218
219	5	50 г	50		7	219
221	15	50 г	50		7	221
223	2	35 г	35		7	223
224	5	10 г	10		7	224
226	30	200 мл	200		8	226
227	30	200 мл	200		8	227
228	25	200 мл	200		8	228
175	3	35 г	35	dishes/broad_UIiteww.png	7	175
209	9500	120 г	120	dishes/chicken-leg_v8cuQza.png	5	209
163	9500	120 г	120	dishes/chicken-leg_uFbWVOP.png	5	163
211	17000	100/10 г	110	dishes/fish-lemon.png	5	211
118	17000	100/10 г	110	dishes/fish-lemon_QIUjj3q.png	5	118
217	500	10 г	10	dishes/gotchitsa_Th18Uo4.png	7	217
124	500	10 г	10	dishes/gotchitsa_RiIfXiX.png	7	124
178	3000	200 мл	200	dishes/hot-chocolate_kZEd0dG.png	8	178
131	3000	200 мл	200	dishes/hot-chocolate_oSV4qqI.png	8	131
184	3500	200 мл	200	dishes/juice_OTrlAlA.png	8	184
214	2000	150 г	150	dishes/kasha-grechnevaya_bFrrxnz.png	6	214
169	2000	150 г	150	dishes/kasha-grechnevaya_FrCnrnn.png	6	169
195	6000	150/20 г	170	dishes/puding_ZBlg4Z7.png	2	195
194	6000	150/20 г	170	dishes/puding_pbei90c.png	2	194
148	6000	150/20 г	170	dishes/puding_Mv8ALFe.png	2	148
182	500	7 г.	7	dishes/limon_K3ZaSuV.png	8	182
168	3500	150 г	150	dishes/pure-cartofelnoe_qgXPswL.png	6	168
121	3500	150 г	150	dishes/pure-cartofelnoe_5CfzSfv.png	6	121
173	2000	50 г	50	dishes/souce-tartar_FVeGaf4.png	7	173
127	2000	50 г	50	dishes/souce-tartar_ADpvmiU.png	7	127
205	9000	100 г	100	dishes/zhulen.png	5	205
185	1500	200 мл	200	dishes/tea_K3ZbPQC.png	8	185
138	1500	200 мл	200	dishes/tea_q83z6O3.png	8	138
229	25	200 мл	200		8	229
230	25	200 мл/16 г	216		8	230
233	15	200 мл/7 г	207		8	233
234	15	200 мл/16 г	216		8	234
235	15	200 мл/16/7 г	223		8	235
236	35	100 г	100		1	236
237	50	35/250/10 г	295		1	237
238	90	100 г	100		1	238
239	20	150 г	150		1	239
240	15	200 мл/16 г	216		1	240
241	40	250 г	250		2	241
244	40	80/20 г	100		3	244
245	40	50/20 г	70		3	245
246	55	100 г	100		3	246
247	45	100 г	100		3	247
248	40	100 г	100		3	248
249	35	100 г	100		3	249
250	40	100 г	100		3	250
251	45	100	100		3	251
252	50	35/250/10 г	295		4	252
253	50	35/250/10 г	295		4	253
255	125	75/50 г	125		5	255
256	80	150 г	150		5	256
257	85	150 г	150		5	257
258	90	100 г	100		5	258
259	105	100 г	100		5	259
261	140	80/40 г	120		5	261
262	150	100 г	100		5	262
265	20	150 г	150		6	265
266	45	150 г	150		6	266
268	20	50 г	50		7	268
269	5	50 г	50		7	269
272	2	35 г	35		7	272
273	5	10 г	10		7	273
275	25	200 мл	200		8	275
276	25	200 мл	200		8	276
277	25	200 мл/16 г	216		8	277
279	30	200 мл	200		8	279
282	15	200 мл/7 г	207		8	282
283	15	200 мл/16 г	216		8	283
284	15	200 мл/16/7 г	223		8	284
74	3500	150 г	150	dishes/pure-cartofelnoe_ZS0I4mH.png	6	74
222	3	35 г	35	dishes/broad_9REd45R.png	7	222
128	3	35 г	35	dishes/broad_8AuhfEG.png	7	128
82	3	40 г	40	dishes/broad_OSfduJ6.png	7	82
34	3	35 г	35	dishes/broad_fUrgMsr.png	7	34
271	300	35 г	35	dishes/broad.png	7	271
260	9500	120 г	120	dishes/chicken-leg.png	5	260
116	9500	120 г	120	dishes/chicken-leg_RWTsuQc.png	5	116
68	9500	120 г	120	dishes/chicken-leg_Nbl3NJU.png	5	68
285	12000	200г.	200	dishes/cruassane-chokolate.png	9	285
286	7000	150г.	150	dishes/vatrushka-tvorog.png	9	286
267	500	10 г	10	dishes/gotchitsa.png	7	267
171	500	10 г	10	dishes/gotchitsa_AarsJIJ.png	7	171
77	500	10 г	10	dishes/gotchitsa_CvJdETp.png	7	77
287	15000	300г.	300	dishes/vareniki-tvorog.png	10	289
288	20000	300г.	300	dishes/pelmeni-myaso_WUVH0N3.png	10	288
274	3000	200 мл	200	dishes/hot-chocolate.png	8	274
225	3000	200 мл	200	dishes/hot-chocolate_1Z1zzBD.png	8	225
37	3000	200 мл	200	dishes/hot-chocolate_J12h0dX.png	8	37
280	3500	200 мл	200	dishes/juice.png	8	280
231	3500	200 мл	200	dishes/juice_ic51RUS.png	8	231
137	3500	200 мл	200	dishes/juice_1e34pMg.png	8	137
264	2000	150 г	150	dishes/kasha-grechnevaya.png	6	264
122	2000	150 г	150	dishes/kasha-grechnevaya_wQCe7WM.png	6	122
98	2000	150 г	150	dishes/kasha-grechnevaya_uETDjXZ.png	1	98
243	6000	150/20 г	170	dishes/puding.png	2	243
242	6000	150/20 г	170	dishes/puding_lZI63cN.png	2	242
149	6000	150/20 г	170	dishes/puding_DBTNcjQ.png	2	149
102	6000	150/20 г	170	dishes/puding_gncGEOh.png	2	102
8	6000	150/20 г	170	dishes/puding_0LO86vM.png	2	8
278	500	7 г.	7	dishes/limon.png	8	278
263	3500	150 г	150	dishes/pure-cartofelnoe.png	6	263
213	3500	150 г	150	dishes/pure-cartofelnoe_JZK5RTh.png	6	213
2	5000	35/250/10	295	dishes/rassolnik_HdttbeJ.png	1	2
48	3500	120 г	120	dishes/salat-kapusta_aV4L7TT.png	1	48
270	2000	50 г	50	dishes/souce-tartar.png	7	270
220	2000	50 г	50	dishes/souce-tartar_pBq0Qup.png	7	220
17	6000	250 г	250	dishes/sup-iz-prokkoli.png	4	17
96	5500	35/250/10 г	295	dishes/sup-ovoshnoy_EavvzBU.png	1	96
232	1500	200 мл	200	dishes/tea_OaPY2No.png	8	232
254	9000	100 г	100	dishes/zhulen_SLW7a3E.png	5	254
159	9000	100 г	100	dishes/zhulen_bYrVXer.png	5	159
281	1500	200 мл	200	dishes/tea.png	8	281
92	1500	200 мл	200	dishes/tea_UWvKBri.png	8	92
\.


--
-- Data for Name: eatery_shedule; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_shedule (id, mon_open, mon_close, tue_open, tue_close, wed_open, wed_close, thu_open, thu_close, fri_open, fri_close, sat_open, sat_close, sun_open, sun_close) FROM stdin;
1	09:00:00	17:00:00	09:00:00	17:00:00	09:00:00	17:00:00	09:00:00	17:00:00	09:00:00	17:00:00	09:00:00	16:00:00	00:00:00	00:00:00
2	08:00:00	18:00:00	08:00:00	18:00:00	08:00:00	18:00:00	08:00:00	18:00:00	08:00:00	17:00:00	00:00:00	00:00:00	00:00:00	00:00:00
3	09:00:00	16:30:00	09:00:00	16:30:00	09:00:00	16:30:00	09:00:00	16:30:00	09:00:00	16:30:00	00:00:00	00:00:00	00:00:00	00:00:00
\.


--
-- Data for Name: eatery_shedule_holidays; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_shedule_holidays (id, shedule_id, holiday_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	1
6	2	2
7	2	3
8	2	4
9	3	1
10	3	2
11	3	3
12	3	4
\.


--
-- Data for Name: eatery_weekday; Type: TABLE DATA; Schema: public; Owner: solid_happines
--

COPY public.eatery_weekday (id, day) FROM stdin;
1	mon
2	tue
3	wed
4	thu
5	fri
6	sat
7	sun
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: dish_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.dish_dish_id_seq', 289, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 124, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: eatery_diningroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_diningroom_id_seq', 3, true);


--
-- Name: eatery_diningroommenu_dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_diningroommenu_dishes_id_seq', 288, true);


--
-- Name: eatery_diningroommenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_diningroommenu_id_seq', 8, true);


--
-- Name: eatery_diningroommenu_weekday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_diningroommenu_weekday_id_seq', 16, true);


--
-- Name: eatery_dishcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_dishcategory_id_seq', 10, true);


--
-- Name: eatery_holiday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_holiday_id_seq', 4, true);


--
-- Name: eatery_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_menuitem_id_seq', 288, true);


--
-- Name: eatery_shedule_holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_shedule_holidays_id_seq', 12, true);


--
-- Name: eatery_shedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_shedule_id_seq', 3, true);


--
-- Name: eatery_weekday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solid_happines
--

SELECT pg_catalog.setval('public.eatery_weekday_id_seq', 7, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: dish_dish dish_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.dish_dish
    ADD CONSTRAINT dish_dish_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: eatery_diningroom eatery_diningroom_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroom
    ADD CONSTRAINT eatery_diningroom_pkey PRIMARY KEY (id);


--
-- Name: eatery_diningroom eatery_diningroom_schedule_id_c5896f5b_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroom
    ADD CONSTRAINT eatery_diningroom_schedule_id_c5896f5b_uniq UNIQUE (schedule_id);


--
-- Name: eatery_diningroom eatery_diningroom_slug_key; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroom
    ADD CONSTRAINT eatery_diningroom_slug_key UNIQUE (slug);


--
-- Name: eatery_diningroommenu_dishes eatery_diningroommenu_di_diningroommenu_id_menuit_dc31c2a7_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_dishes
    ADD CONSTRAINT eatery_diningroommenu_di_diningroommenu_id_menuit_dc31c2a7_uniq UNIQUE (diningroommenu_id, menuitem_id);


--
-- Name: eatery_diningroommenu_dishes eatery_diningroommenu_dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_dishes
    ADD CONSTRAINT eatery_diningroommenu_dishes_pkey PRIMARY KEY (id);


--
-- Name: eatery_diningroommenu eatery_diningroommenu_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu
    ADD CONSTRAINT eatery_diningroommenu_pkey PRIMARY KEY (id);


--
-- Name: eatery_diningroommenu_weekday eatery_diningroommenu_we_diningroommenu_id_weekda_4bcaa712_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_weekday
    ADD CONSTRAINT eatery_diningroommenu_we_diningroommenu_id_weekda_4bcaa712_uniq UNIQUE (diningroommenu_id, weekday_id);


--
-- Name: eatery_diningroommenu_weekday eatery_diningroommenu_weekday_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_weekday
    ADD CONSTRAINT eatery_diningroommenu_weekday_pkey PRIMARY KEY (id);


--
-- Name: eatery_dishcategory eatery_dishcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_dishcategory
    ADD CONSTRAINT eatery_dishcategory_pkey PRIMARY KEY (id);


--
-- Name: eatery_dishcategory eatery_dishcategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_dishcategory
    ADD CONSTRAINT eatery_dishcategory_slug_key UNIQUE (slug);


--
-- Name: eatery_holiday eatery_holiday_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_holiday
    ADD CONSTRAINT eatery_holiday_pkey PRIMARY KEY (id);


--
-- Name: eatery_menuitem eatery_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_menuitem
    ADD CONSTRAINT eatery_menuitem_pkey PRIMARY KEY (id);


--
-- Name: eatery_shedule_holidays eatery_shedule_holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_shedule_holidays
    ADD CONSTRAINT eatery_shedule_holidays_pkey PRIMARY KEY (id);


--
-- Name: eatery_shedule_holidays eatery_shedule_holidays_shedule_id_holiday_id_c247d3be_uniq; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_shedule_holidays
    ADD CONSTRAINT eatery_shedule_holidays_shedule_id_holiday_id_c247d3be_uniq UNIQUE (shedule_id, holiday_id);


--
-- Name: eatery_shedule eatery_shedule_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_shedule
    ADD CONSTRAINT eatery_shedule_pkey PRIMARY KEY (id);


--
-- Name: eatery_weekday eatery_weekday_pkey; Type: CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_weekday
    ADD CONSTRAINT eatery_weekday_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: eatery_diningroom_slug_8d00c51b_like; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_diningroom_slug_8d00c51b_like ON public.eatery_diningroom USING btree (slug varchar_pattern_ops);


--
-- Name: eatery_diningroommenu_dining_room_id_2364d4d3; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_diningroommenu_dining_room_id_2364d4d3 ON public.eatery_diningroommenu USING btree (dining_room_id);


--
-- Name: eatery_diningroommenu_dishes_diningroommenu_id_eac39f3a; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_diningroommenu_dishes_diningroommenu_id_eac39f3a ON public.eatery_diningroommenu_dishes USING btree (diningroommenu_id);


--
-- Name: eatery_diningroommenu_dishes_menuitem_id_5ed34ac6; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_diningroommenu_dishes_menuitem_id_5ed34ac6 ON public.eatery_diningroommenu_dishes USING btree (menuitem_id);


--
-- Name: eatery_diningroommenu_weekday_diningroommenu_id_61760994; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_diningroommenu_weekday_diningroommenu_id_61760994 ON public.eatery_diningroommenu_weekday USING btree (diningroommenu_id);


--
-- Name: eatery_diningroommenu_weekday_weekday_id_2d3505a1; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_diningroommenu_weekday_weekday_id_2d3505a1 ON public.eatery_diningroommenu_weekday USING btree (weekday_id);


--
-- Name: eatery_dishcategory_slug_f1b42170_like; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_dishcategory_slug_f1b42170_like ON public.eatery_dishcategory USING btree (slug varchar_pattern_ops);


--
-- Name: eatery_menuitem_category_id_9cc2d1b0; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_menuitem_category_id_9cc2d1b0 ON public.eatery_menuitem USING btree (category_id);


--
-- Name: eatery_menuitem_dish_id_3e9f0c38; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_menuitem_dish_id_3e9f0c38 ON public.eatery_menuitem USING btree (dish_id);


--
-- Name: eatery_shedule_holidays_holiday_id_5fe5e6b7; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_shedule_holidays_holiday_id_5fe5e6b7 ON public.eatery_shedule_holidays USING btree (holiday_id);


--
-- Name: eatery_shedule_holidays_shedule_id_ad160ecd; Type: INDEX; Schema: public; Owner: solid_happines
--

CREATE INDEX eatery_shedule_holidays_shedule_id_ad160ecd ON public.eatery_shedule_holidays USING btree (shedule_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_diningroom eatery_diningroom_schedule_id_c5896f5b_fk_eatery_shedule_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroom
    ADD CONSTRAINT eatery_diningroom_schedule_id_c5896f5b_fk_eatery_shedule_id FOREIGN KEY (schedule_id) REFERENCES public.eatery_shedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_diningroommenu eatery_diningroommen_dining_room_id_2364d4d3_fk_eatery_di; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu
    ADD CONSTRAINT eatery_diningroommen_dining_room_id_2364d4d3_fk_eatery_di FOREIGN KEY (dining_room_id) REFERENCES public.eatery_diningroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_diningroommenu_weekday eatery_diningroommen_diningroommenu_id_61760994_fk_eatery_di; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_weekday
    ADD CONSTRAINT eatery_diningroommen_diningroommenu_id_61760994_fk_eatery_di FOREIGN KEY (diningroommenu_id) REFERENCES public.eatery_diningroommenu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_diningroommenu_dishes eatery_diningroommen_diningroommenu_id_eac39f3a_fk_eatery_di; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_dishes
    ADD CONSTRAINT eatery_diningroommen_diningroommenu_id_eac39f3a_fk_eatery_di FOREIGN KEY (diningroommenu_id) REFERENCES public.eatery_diningroommenu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_diningroommenu_dishes eatery_diningroommen_menuitem_id_5ed34ac6_fk_eatery_me; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_dishes
    ADD CONSTRAINT eatery_diningroommen_menuitem_id_5ed34ac6_fk_eatery_me FOREIGN KEY (menuitem_id) REFERENCES public.eatery_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_diningroommenu_weekday eatery_diningroommen_weekday_id_2d3505a1_fk_eatery_we; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_diningroommenu_weekday
    ADD CONSTRAINT eatery_diningroommen_weekday_id_2d3505a1_fk_eatery_we FOREIGN KEY (weekday_id) REFERENCES public.eatery_weekday(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_menuitem eatery_menuitem_category_id_9cc2d1b0_fk_eatery_dishcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_menuitem
    ADD CONSTRAINT eatery_menuitem_category_id_9cc2d1b0_fk_eatery_dishcategory_id FOREIGN KEY (category_id) REFERENCES public.eatery_dishcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_menuitem eatery_menuitem_dish_id_3e9f0c38_fk_dish_dish_id; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_menuitem
    ADD CONSTRAINT eatery_menuitem_dish_id_3e9f0c38_fk_dish_dish_id FOREIGN KEY (dish_id) REFERENCES public.dish_dish(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_shedule_holidays eatery_shedule_holid_holiday_id_5fe5e6b7_fk_eatery_ho; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_shedule_holidays
    ADD CONSTRAINT eatery_shedule_holid_holiday_id_5fe5e6b7_fk_eatery_ho FOREIGN KEY (holiday_id) REFERENCES public.eatery_holiday(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: eatery_shedule_holidays eatery_shedule_holid_shedule_id_ad160ecd_fk_eatery_sh; Type: FK CONSTRAINT; Schema: public; Owner: solid_happines
--

ALTER TABLE ONLY public.eatery_shedule_holidays
    ADD CONSTRAINT eatery_shedule_holid_shedule_id_ad160ecd_fk_eatery_sh FOREIGN KEY (shedule_id) REFERENCES public.eatery_shedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

