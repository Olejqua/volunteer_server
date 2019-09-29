--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-1.pgdg18.04+1)

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
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    author character varying(64) NOT NULL,
    event_id integer NOT NULL,
    start timestamp without time zone,
    "end" timestamp without time zone,
    index integer NOT NULL,
    title text,
    description text,
    place text,
    id integer NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    entity character varying(200) NOT NULL,
    type character varying(200) NOT NULL,
    action character varying(200) NOT NULL,
    params character varying(200) NOT NULL,
    active boolean,
    priority integer,
    id integer NOT NULL,
    date_start timestamp(4) without time zone,
    date_end timestamp(4) without time zone,
    img character varying(255),
    place character varying(255)
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    name text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_data (
    id integer NOT NULL,
    reputation integer,
    coins integer
);


ALTER TABLE public.users_data OWNER TO postgres;

--
-- Name: users_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_data_id_seq OWNER TO postgres;

--
-- Name: users_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_data_id_seq OWNED BY public.users_data.id;


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_data ALTER COLUMN id SET DEFAULT nextval('public.users_data_id_seq'::regclass);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (author, event_id, start, "end", index, title, description, place, id) FROM stdin;
oleg	1	2019-09-27 07:00:00	2019-09-27 12:00:00	1	Регистрация	\N	\N	1
oleg	1	2019-09-27 12:00:00	2019-09-27 12:45:00	2	Церемония открытия	\N	Большой зал	2
oleg	1	2019-09-27 12:45:00	2019-09-27 13:30:00	3	Панельная дискуссия "Цифровой код"	\N	Большой зал	3
oleg	1	2019-09-27 13:30:00	2019-09-27 14:30:00	4	Официальный старт хакатона	\N	\N	4
oleg	1	2019-09-27 14:30:00	2019-09-27 16:00:00	5	Обед	\N	\N	5
oleg	1	2019-09-27 15:30:00	2019-09-27 16:00:00	6	Брифинг экспертов на работу с командами	\N	\N	6
oleg	1	2019-09-27 16:00:00	2019-09-27 18:30:00	7	Работа экспертов с командами, консультационная помощь по уточнению задач	\N	\N	7
oleg	1	2019-09-27 18:30:00	2019-09-27 20:00:00	8	Установочная сессия для экспертов на деловую программу. Презентация площадок деловой программы, интерактивная дискуссия	\N	\N	8
oleg	1	2019-09-27 20:00:00	2019-09-27 22:00:00	9	Ужин	\N	\N	9
oleg	1	2019-09-27 22:00:00	2019-09-28 09:00:00	10	Ночной режим работы хакатона	\N	\N	10
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (entity, type, action, params, active, priority, id, date_start, date_end, img, place) FROM stdin;
Фонд продовольствия Русь и X5 Retail Group	Помощь пожилым	Общегородской продовольственный марафон "Корзина доброты"	30 октября с 14:00 до 18:00 в Москве состоится общегородской продовольственный марафон «Корзина доброты» в  всех магазинах «Пятерочка» в пределах МКАД.\n\nВ ходе марафона волонтеры Фонда соберут #ПРОДУК	t	1	2	2019-10-30 14:00:00	2019-10-30 18:00:00	pjaterochka.jpg	Казань Экспо
БФ "Волонтеры в помощь детям-сиротам"	Помощь детям	Приглашаем на акцию по сбору помощи в гипермаркете "Глобус"	Дорогие друзья!\n28 сентября с 11.00 до 21.00 состоится акция по сбору помощи для подопечных нашего фонда, которая пройдет в гипермаркете ГЛОБУС на Новорижском шоссе\nЧто делают волонтеры?\nНа акции воло	t	1	3	2019-12-13 09:00:00	2019-12-14 18:00:00	2f5bda7378ed531edfafd0794f3403c5.jpg	Казань Экспо
Россия страна возможностей	конкурс	всероссийский конкурс для ИТ-специалистов, дизайнеров и управленцев в сфере цифровой экономики	О проекте\nЦифровой прорыв — новый конкурс платформы «Россия – страна возможностей».\n\nЗарегистрируйся на сайте, пройди онлайн-тестирование и участвуй в одном из 40 хакатонов в регионах России.\n\nЛучшие 	t	1	1	2019-11-20 10:00:00	2019-11-23 18:00:00	icanteam.jpg	Казань Экспо
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (name, id) FROM stdin;
admin	1
organizer	2
volunteer	3
\.


--
-- Data for Name: users_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_data (id, reputation, coins) FROM stdin;
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 3, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 3, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: users_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_data_id_seq', 1, false);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users_data users_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_data
    ADD CONSTRAINT users_data_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

