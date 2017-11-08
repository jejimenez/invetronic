--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-29 21:51:18 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 217 (class 1255 OID 82308)
-- Name: fn_machine_seq(); Type: FUNCTION; Schema: public; Owner: invetronicdb
--

CREATE FUNCTION fn_machine_seq() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 BEGIN NEW.machine_sequence := 'HV'||to_char(now(),'YYYYMMDD')||lpad(nextval('machine_seq')::char, 5, '0'); RETURN NEW; END; 
$$;


ALTER FUNCTION public.fn_machine_seq() OWNER TO invetronicdb;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 82320)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO invetronicdb;

--
-- TOC entry 204 (class 1259 OID 82318)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 207 (class 1259 OID 82330)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO invetronicdb;

--
-- TOC entry 206 (class 1259 OID 82328)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 203 (class 1259 OID 82312)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO invetronicdb;

--
-- TOC entry 202 (class 1259 OID 82310)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 209 (class 1259 OID 82361)
-- Name: authentication_user; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE authentication_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE authentication_user OWNER TO invetronicdb;

--
-- TOC entry 211 (class 1259 OID 82374)
-- Name: authentication_user_groups; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE authentication_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE authentication_user_groups OWNER TO invetronicdb;

--
-- TOC entry 210 (class 1259 OID 82372)
-- Name: authentication_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE authentication_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication_user_groups_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 210
-- Name: authentication_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE authentication_user_groups_id_seq OWNED BY authentication_user_groups.id;


--
-- TOC entry 208 (class 1259 OID 82359)
-- Name: authentication_user_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE authentication_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication_user_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 208
-- Name: authentication_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE authentication_user_id_seq OWNED BY authentication_user.id;


--
-- TOC entry 213 (class 1259 OID 82382)
-- Name: authentication_user_user_permissions; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE authentication_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE authentication_user_user_permissions OWNER TO invetronicdb;

--
-- TOC entry 212 (class 1259 OID 82380)
-- Name: authentication_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE authentication_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication_user_user_permissions_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 212
-- Name: authentication_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE authentication_user_user_permissions_id_seq OWNED BY authentication_user_user_permissions.id;


--
-- TOC entry 215 (class 1259 OID 82425)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO invetronicdb;

--
-- TOC entry 214 (class 1259 OID 82423)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 188 (class 1259 OID 82202)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO invetronicdb;

--
-- TOC entry 187 (class 1259 OID 82200)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 186 (class 1259 OID 82191)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO invetronicdb;

--
-- TOC entry 185 (class 1259 OID 82189)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 216 (class 1259 OID 82448)
-- Name: django_session; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO invetronicdb;

--
-- TOC entry 190 (class 1259 OID 82218)
-- Name: inventario_company; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_company (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    nit character varying(50) NOT NULL,
    address character varying(500),
    telephone character varying(15),
    cellphone character varying(15),
    legal_representative character varying(500),
    photo character varying(100),
    photo_thumbnail1 character varying(100)
);


ALTER TABLE inventario_company OWNER TO invetronicdb;

--
-- TOC entry 189 (class 1259 OID 82216)
-- Name: inventario_company_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE inventario_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inventario_company_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 189
-- Name: inventario_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_company_id_seq OWNED BY inventario_company.id;


--
-- TOC entry 192 (class 1259 OID 82229)
-- Name: inventario_hardwarecomponent; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_hardwarecomponent (
    id integer NOT NULL,
    brand character varying(200),
    model character varying(200),
    serie character varying(200),
    size character varying(200),
    features character varying(500),
    component_type_id integer NOT NULL,
    machine_id integer NOT NULL
);


ALTER TABLE inventario_hardwarecomponent OWNER TO invetronicdb;

--
-- TOC entry 191 (class 1259 OID 82227)
-- Name: inventario_hardwarecomponent_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE inventario_hardwarecomponent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inventario_hardwarecomponent_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 191
-- Name: inventario_hardwarecomponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_hardwarecomponent_id_seq OWNED BY inventario_hardwarecomponent.id;


--
-- TOC entry 194 (class 1259 OID 82240)
-- Name: inventario_hardwarecomponenttype; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_hardwarecomponenttype (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE inventario_hardwarecomponenttype OWNER TO invetronicdb;

--
-- TOC entry 193 (class 1259 OID 82238)
-- Name: inventario_hardwarecomponenttype_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE inventario_hardwarecomponenttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inventario_hardwarecomponenttype_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 193
-- Name: inventario_hardwarecomponenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_hardwarecomponenttype_id_seq OWNED BY inventario_hardwarecomponenttype.id;


--
-- TOC entry 196 (class 1259 OID 82248)
-- Name: inventario_machine; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_machine (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    ip inet,
    mac_address character varying(17),
    shared character varying(200),
    printers character varying(200),
    os character varying(200),
    machine_sequence character varying(200),
    company_id integer NOT NULL
);


ALTER TABLE inventario_machine OWNER TO invetronicdb;

--
-- TOC entry 195 (class 1259 OID 82246)
-- Name: inventario_machine_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE inventario_machine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inventario_machine_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 195
-- Name: inventario_machine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_machine_id_seq OWNED BY inventario_machine.id;


--
-- TOC entry 198 (class 1259 OID 82259)
-- Name: inventario_softwarecomponent; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_softwarecomponent (
    id integer NOT NULL,
    name character varying(200),
    release character varying(200),
    compilation character varying(200),
    bits character varying(200),
    features character varying(500),
    component_type_id integer NOT NULL,
    machine_id integer NOT NULL
);


ALTER TABLE inventario_softwarecomponent OWNER TO invetronicdb;

--
-- TOC entry 197 (class 1259 OID 82257)
-- Name: inventario_softwarecomponent_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE inventario_softwarecomponent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inventario_softwarecomponent_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 197
-- Name: inventario_softwarecomponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_softwarecomponent_id_seq OWNED BY inventario_softwarecomponent.id;


--
-- TOC entry 200 (class 1259 OID 82270)
-- Name: inventario_softwarecomponenttype; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_softwarecomponenttype (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE inventario_softwarecomponenttype OWNER TO invetronicdb;

--
-- TOC entry 199 (class 1259 OID 82268)
-- Name: inventario_softwarecomponenttype_id_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE inventario_softwarecomponenttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inventario_softwarecomponenttype_id_seq OWNER TO invetronicdb;

--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 199
-- Name: inventario_softwarecomponenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_softwarecomponenttype_id_seq OWNED BY inventario_softwarecomponenttype.id;


--
-- TOC entry 201 (class 1259 OID 82306)
-- Name: machine_seq; Type: SEQUENCE; Schema: public; Owner: invetronicdb
--

CREATE SEQUENCE machine_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1
    CYCLE;


ALTER TABLE machine_seq OWNER TO invetronicdb;

--
-- TOC entry 2113 (class 2604 OID 82323)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 82333)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 82315)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2115 (class 2604 OID 82364)
-- Name: authentication_user id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user ALTER COLUMN id SET DEFAULT nextval('authentication_user_id_seq'::regclass);


--
-- TOC entry 2116 (class 2604 OID 82377)
-- Name: authentication_user_groups id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_groups ALTER COLUMN id SET DEFAULT nextval('authentication_user_groups_id_seq'::regclass);


--
-- TOC entry 2117 (class 2604 OID 82385)
-- Name: authentication_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('authentication_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2118 (class 2604 OID 82428)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 82205)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 82194)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 82221)
-- Name: inventario_company id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_company ALTER COLUMN id SET DEFAULT nextval('inventario_company_id_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 82232)
-- Name: inventario_hardwarecomponent id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent ALTER COLUMN id SET DEFAULT nextval('inventario_hardwarecomponent_id_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 82243)
-- Name: inventario_hardwarecomponenttype id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponenttype ALTER COLUMN id SET DEFAULT nextval('inventario_hardwarecomponenttype_id_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 82251)
-- Name: inventario_machine id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_machine ALTER COLUMN id SET DEFAULT nextval('inventario_machine_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 82262)
-- Name: inventario_softwarecomponent id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent ALTER COLUMN id SET DEFAULT nextval('inventario_softwarecomponent_id_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 82273)
-- Name: inventario_softwarecomponenttype id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponenttype ALTER COLUMN id SET DEFAULT nextval('inventario_softwarecomponenttype_id_seq'::regclass);


--
-- TOC entry 2338 (class 0 OID 82320)
-- Dependencies: 205
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2340 (class 0 OID 82330)
-- Dependencies: 207
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2336 (class 0 OID 82312)
-- Dependencies: 203
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add Empresa', 3, 'add_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change Empresa', 3, 'change_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete Empresa', 3, 'delete_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add Componente de Hardware', 5, 'add_hardwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change Componente de Hardware', 5, 'change_hardwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete Componente de Hardware', 5, 'delete_hardwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add Tipo de Componente Hardware', 1, 'add_hardwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change Tipo de Componente Hardware', 1, 'change_hardwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete Tipo de Componente Hardware', 1, 'delete_hardwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add Máquina', 2, 'add_machine');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change Máquina', 2, 'change_machine');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete Máquina', 2, 'delete_machine');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add Componente de Software', 6, 'add_softwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change Componente de Software', 6, 'change_softwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete Componente de Software', 6, 'delete_softwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add Tipo de Componente Software', 4, 'add_softwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change Tipo de Componente Software', 4, 'change_softwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete Tipo de Componente Software', 4, 'delete_softwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add user', 8, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change user', 8, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete user', 8, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add log entry', 9, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change log entry', 9, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete log entry', 9, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add permission', 10, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change permission', 10, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete permission', 10, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add group', 11, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change group', 11, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete group', 11, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add content type', 7, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change content type', 7, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete content type', 7, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add session', 12, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change session', 12, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete session', 12, 'delete_session');


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);


--
-- TOC entry 2342 (class 0 OID 82361)
-- Dependencies: 209
-- Data for Name: authentication_user; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO authentication_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, company_id) VALUES (43, 'pbkdf2_sha256$36000$Yb2hgeQvhKtY$pjatXeC2P56YBg6Bb6AzW9NjxBcns3f899xz7wdHcnk=', '2017-10-29 21:20:52.619471+00', true, 'admin', '', '', '', true, true, '2017-10-29 21:15:22.662099+00', 1);
INSERT INTO authentication_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, company_id) VALUES (44, 'desarroll0', '2017-10-30 02:49:19+00', true, 'jejimenez', 'Jaime Enrique', 'Jiménez Arbeláez', 'jimenez.ing.sis@gmail.com', true, true, '2017-10-30 02:49:08+00', 1);


--
-- TOC entry 2344 (class 0 OID 82374)
-- Dependencies: 211
-- Data for Name: authentication_user_groups; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 210
-- Name: authentication_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('authentication_user_groups_id_seq', 1, false);


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 208
-- Name: authentication_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('authentication_user_id_seq', 44, true);


--
-- TOC entry 2346 (class 0 OID 82382)
-- Dependencies: 213
-- Data for Name: authentication_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 212
-- Name: authentication_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('authentication_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2348 (class 0 OID 82425)
-- Dependencies: 215
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2017-10-29 21:27:23.565373+00', '1', 'INVETRONIC', 2, '[{"changed": {"fields": ["name", "nit", "address", "telephone", "cellphone", "legal_representative"]}}]', 3, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2017-10-29 21:32:41.389554+00', '2', 'Trululu', 2, '[{"changed": {"fields": ["telephone", "cellphone", "photo"]}}]', 3, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2017-10-29 21:37:14.505486+00', '3', 'Teriyaky', 2, '[{"changed": {"fields": ["legal_representative", "photo"]}}]', 3, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2017-10-29 21:37:45.755198+00', '4', 'Casio', 2, '[{"changed": {"fields": ["legal_representative", "photo"]}}]', 3, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2017-10-29 21:43:32.923078+00', '5', 'Combustibles nacionales', 2, '[{"changed": {"fields": ["legal_representative", "photo"]}}]', 3, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2017-10-30 01:12:04.579024+00', '20', 'Trululu mch34234', 2, '[{"changed": {"fields": ["company", "ip", "mac_address"]}}]', 2, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2017-10-30 01:12:30.333832+00', '20', 'Combustibles nacionales mch34234', 2, '[{"changed": {"fields": ["company"]}}]', 2, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2017-10-30 01:14:36.525124+00', '21', 'Combustibles nacionales KSTABOG293-320', 2, '[{"changed": {"fields": ["company"]}}]', 2, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2017-10-30 01:19:06.12919+00', '21', 'Teriyaky KSTABOG293-320', 2, '[{"changed": {"fields": ["company"]}}]', 2, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2017-10-30 01:19:41.432337+00', '21', 'Combustibles nacionales KSTABOG293-320', 2, '[{"changed": {"fields": ["company"]}}]', 2, 43);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2017-10-30 02:50:38.922067+00', '44', 'jejimenez', 1, '[{"added": {}}]', 8, 43);


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 11, true);


--
-- TOC entry 2321 (class 0 OID 82202)
-- Dependencies: 188
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'inventario', 'hardwarecomponenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'inventario', 'machine');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'inventario', 'company');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'inventario', 'softwarecomponenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'inventario', 'hardwarecomponent');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'inventario', 'softwarecomponent');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'authentication', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'sessions', 'session');


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- TOC entry 2319 (class 0 OID 82191)
-- Dependencies: 186
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2017-10-29 05:00:31.106586+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'inventario', '0001_auto_20171028_2325', '2017-10-29 05:01:54.847084+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'inventario', 'sequence', '2017-10-29 05:01:54.893202+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'contenttypes', '0002_remove_content_type_name', '2017-10-29 05:01:59.894686+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0001_initial', '2017-10-29 05:02:00.22114+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2017-10-29 05:02:00.259705+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2017-10-29 05:02:00.307595+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_alter_user_username_opts', '2017-10-29 05:02:00.389138+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2017-10-29 05:02:00.422314+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2017-10-29 05:02:00.437501+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2017-10-29 05:02:00.465742+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0008_alter_user_username_max_length', '2017-10-29 05:02:00.488399+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'authentication', '0001_initial', '2017-10-29 05:02:00.895553+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'admin', '0001_initial', '2017-10-29 05:02:01.041983+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'admin', '0002_logentry_remove_auto_add', '2017-10-29 05:02:01.089359+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'sessions', '0001_initial', '2017-10-29 05:02:01.243295+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'authentication', '0002_auto_20171029_1604', '2017-10-29 21:04:38.183249+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'authentication', '0003_auto_20171029_1607', '2017-10-29 21:09:49.860865+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'authentication', '0002_auto_20171029_2145', '2017-10-30 02:46:02.634405+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'inventario', '0001_auto_20171029_2145', '2017-10-30 02:46:02.66269+00');


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('django_migrations_id_seq', 20, true);


--
-- TOC entry 2349 (class 0 OID 82448)
-- Dependencies: 216
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('gbt6o8prey438pokoucqojoypc2iodmm', 'MWVhODI5MDE3YzEyMjM5NDRkNzBiNmRkNGExYmUwYzA5YjEwZTg4NTp7Il9hdXRoX3VzZXJfaWQiOiI0MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzRlMGMyMWJmNWVkZjI4NWM4NDVlNWQ0ZjY0OTE4ODZjOWM5YWU4MSJ9', '2017-11-12 21:20:52.634178+00');


--
-- TOC entry 2323 (class 0 OID 82218)
-- Dependencies: 190
-- Data for Name: inventario_company; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (1, 'INVETRONIC', '901.065.797-9', 'Cll 14b # 116-69 Bl 2 C 5-2', '810 1121', '320 8929273', 'Eduardo Rozo', '', '');
INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (2, 'Trululu', '2.323.345.234', 'Cll 175 # 20 A -60', '786 76 87', '319 3910232', NULL, 'company/img/trululu.jpg', 'company/img/trululu.jpg_thumbnail1.jpg');
INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (3, 'Teriyaky', '234-345-567', 'Cll 115 # 20 A -65', '34523454', '3452345234', 'Robert Kiyosaky', 'company/img/teriyaki.jpg', 'company/img/teriyaki.jpg_thumbnail1.jpg');
INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (4, 'Casio', '567.236.678', 'Cll 15 # 02 A -60', '8009232', '3129084920', 'Casimiro Cortes', 'company/img/casio_4n4Jhs5.jpg', 'company/img/casio.jpg_thumbnail1.jpg');
INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (5, 'Combustibles nacionales', '2342342-5', 'Cll 175 # 20 A -65', '8092353', '319 30940293', NULL, 'company/img/combustible.jpg', 'company/img/combustible.jpg_thumbnail1.jpg');


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 189
-- Name: inventario_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_company_id_seq', 1, false);


--
-- TOC entry 2325 (class 0 OID 82229)
-- Dependencies: 192
-- Data for Name: inventario_hardwarecomponent; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (1, 'HP', 'SDF9879S8', '98S7D9F87SD', '1', 'Color: Negra', 1, 20);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (2, 'Kingstone', '9s8d7f987', 'SD98F7A09S', '3', 'Color:Verde', 3, 20);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (3, 'Kinsgstone', '9s8df0987', '987s0d987f', '4', 'Amarilla', 4, 20);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (4, 'Samsung', 's98df987', 'a09s870 b8a7', '7', 'Rigido', 5, 20);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (5, 'Nikon', '9a8f9b87a0', 'a0s9d87f09a', '9', '.', 11, 20);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (6, 'Hewlet packard Registered Company', '98sd9f87987s', '9a87sd0f987', '1', 'Antiguo - Dañado', 10, 20);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (7, 'Hewlet Packard', 'OIU324IU', '29384092', NULL, 'Color:Rojo', 1, 21);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (8, 'Sony', '897WER', 'R987T', NULL, 'Color:Blanco', 11, 21);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (9, 'LG', 'LG-ASDFPW', '0Q98AF', NULL, NULL, 6, 21);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (10, 'LG', 'LG-233', '234', '37', 'Negro', 8, 21);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (11, 'Ledmark', 'LM', '98', NULL, 'Tinta', 12, 21);
INSERT INTO inventario_hardwarecomponent (id, brand, model, serie, size, features, component_type_id, machine_id) VALUES (12, 'Generico', NULL, NULL, NULL, 'Español', 9, 21);


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 191
-- Name: inventario_hardwarecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_hardwarecomponent_id_seq', 1, false);


--
-- TOC entry 2327 (class 0 OID 82240)
-- Dependencies: 194
-- Data for Name: inventario_hardwarecomponenttype; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (1, 'Caja');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (2, 'Board');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (3, 'Memoria 1');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (4, 'Memoria 2');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (5, 'Disco Duro');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (6, 'Unidad Lectora');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (7, 'Procesador');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (8, 'Monitor');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (9, 'Teclado');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (10, 'Mouse');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (11, 'Parlantes');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (12, 'Impresora');
INSERT INTO inventario_hardwarecomponenttype (id, name) VALUES (13, 'Otros');


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 193
-- Name: inventario_hardwarecomponenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_hardwarecomponenttype_id_seq', 1, false);


--
-- TOC entry 2329 (class 0 OID 82248)
-- Dependencies: 196
-- Data for Name: inventario_machine; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_machine (id, name, ip, mac_address, shared, printers, os, machine_sequence, company_id) VALUES (18, 'n987n', NULL, NULL, '7g9', '87g987g', '97g9', 'HV2017102900005', 4);
INSERT INTO inventario_machine (id, name, ip, mac_address, shared, printers, os, machine_sequence, company_id) VALUES (20, 'mch34234', '127.0.0.1', '00:0a:95:9d:68:16', '/carpeta/', 'Printer1', 'Window', 'HV2017102900004', 5);
INSERT INTO inventario_machine (id, name, ip, mac_address, shared, printers, os, machine_sequence, company_id) VALUES (21, 'KSTABOG293-320', '127.0.0.1', '00:0a:95:9d:68:16', '/iuoiuo/', 'Printer2', 'LINUX', 'HV2017102900006', 5);


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 195
-- Name: inventario_machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_machine_id_seq', 1, false);


--
-- TOC entry 2331 (class 0 OID 82259)
-- Dependencies: 198
-- Data for Name: inventario_softwarecomponent; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_softwarecomponent (id, name, release, compilation, bits, features, component_type_id, machine_id) VALUES (1, 'Windows', '7', '2349.234', '64', 'LC', 1, 21);
INSERT INTO inventario_softwarecomponent (id, name, release, compilation, bits, features, component_type_id, machine_id) VALUES (2, 'Avast', '9.11', NULL, '64', 'Av', 4, 21);
INSERT INTO inventario_softwarecomponent (id, name, release, compilation, bits, features, component_type_id, machine_id) VALUES (3, 'Adobe', NULL, NULL, '64', NULL, 5, 21);


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 197
-- Name: inventario_softwarecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_softwarecomponent_id_seq', 1, false);


--
-- TOC entry 2333 (class 0 OID 82270)
-- Dependencies: 200
-- Data for Name: inventario_softwarecomponenttype; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_softwarecomponenttype (id, name) VALUES (1, 'Sistema Operativo');
INSERT INTO inventario_softwarecomponenttype (id, name) VALUES (2, 'Ofimatica');
INSERT INTO inventario_softwarecomponenttype (id, name) VALUES (4, 'Antivirus');
INSERT INTO inventario_softwarecomponenttype (id, name) VALUES (5, 'Lector PDF');
INSERT INTO inventario_softwarecomponenttype (id, name) VALUES (6, 'Contabilidad');
INSERT INTO inventario_softwarecomponenttype (id, name) VALUES (7, 'Otros');
INSERT INTO inventario_softwarecomponenttype (id, name) VALUES (3, 'Herramienta de Optimización');


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 199
-- Name: inventario_softwarecomponenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_softwarecomponenttype_id_seq', 1, false);


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 201
-- Name: machine_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('machine_seq', 6, true);


--
-- TOC entry 2150 (class 2606 OID 82327)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2155 (class 2606 OID 82356)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2158 (class 2606 OID 82335)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 82325)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 82342)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2147 (class 2606 OID 82317)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 82379)
-- Name: authentication_user_groups authentication_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 82406)
-- Name: authentication_user_groups authentication_user_groups_user_id_group_id_8af031ac_uniq; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_user_id_group_id_8af031ac_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2161 (class 2606 OID 82369)
-- Name: authentication_user authentication_user_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user
    ADD CONSTRAINT authentication_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 82387)
-- Name: authentication_user_user_permissions authentication_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_user_permissions
    ADD CONSTRAINT authentication_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 82420)
-- Name: authentication_user_user_permissions authentication_user_user_user_id_permission_id_ec51b09f_uniq; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_user_permissions
    ADD CONSTRAINT authentication_user_user_user_id_permission_id_ec51b09f_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2164 (class 2606 OID 90382)
-- Name: authentication_user authentication_user_username_key; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user
    ADD CONSTRAINT authentication_user_username_key UNIQUE (username);


--
-- TOC entry 2179 (class 2606 OID 82434)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 82209)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2125 (class 2606 OID 82207)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2121 (class 2606 OID 82199)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2183 (class 2606 OID 82455)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2127 (class 2606 OID 82226)
-- Name: inventario_company inventario_company_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_company
    ADD CONSTRAINT inventario_company_pkey PRIMARY KEY (id);


--
-- TOC entry 2131 (class 2606 OID 82237)
-- Name: inventario_hardwarecomponent inventario_hardwarecomponent_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent
    ADD CONSTRAINT inventario_hardwarecomponent_pkey PRIMARY KEY (id);


--
-- TOC entry 2133 (class 2606 OID 82245)
-- Name: inventario_hardwarecomponenttype inventario_hardwarecomponenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponenttype
    ADD CONSTRAINT inventario_hardwarecomponenttype_pkey PRIMARY KEY (id);


--
-- TOC entry 2136 (class 2606 OID 82256)
-- Name: inventario_machine inventario_machine_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_machine
    ADD CONSTRAINT inventario_machine_pkey PRIMARY KEY (id);


--
-- TOC entry 2140 (class 2606 OID 82267)
-- Name: inventario_softwarecomponent inventario_softwarecomponent_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent
    ADD CONSTRAINT inventario_softwarecomponent_pkey PRIMARY KEY (id);


--
-- TOC entry 2142 (class 2606 OID 82275)
-- Name: inventario_softwarecomponenttype inventario_softwarecomponenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponenttype
    ADD CONSTRAINT inventario_softwarecomponenttype_pkey PRIMARY KEY (id);


--
-- TOC entry 2148 (class 1259 OID 82344)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2153 (class 1259 OID 82357)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2156 (class 1259 OID 82358)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2143 (class 1259 OID 82343)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2159 (class 1259 OID 82394)
-- Name: authentication_user_company_id_a38f3939; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX authentication_user_company_id_a38f3939 ON authentication_user USING btree (company_id);


--
-- TOC entry 2165 (class 1259 OID 82408)
-- Name: authentication_user_groups_group_id_6b5c44b7; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX authentication_user_groups_group_id_6b5c44b7 ON authentication_user_groups USING btree (group_id);


--
-- TOC entry 2168 (class 1259 OID 82407)
-- Name: authentication_user_groups_user_id_30868577; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX authentication_user_groups_user_id_30868577 ON authentication_user_groups USING btree (user_id);


--
-- TOC entry 2171 (class 1259 OID 82422)
-- Name: authentication_user_user_permissions_permission_id_ea6be19a; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX authentication_user_user_permissions_permission_id_ea6be19a ON authentication_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2174 (class 1259 OID 82421)
-- Name: authentication_user_user_permissions_user_id_736ebf7e; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX authentication_user_user_permissions_user_id_736ebf7e ON authentication_user_user_permissions USING btree (user_id);


--
-- TOC entry 2162 (class 1259 OID 90383)
-- Name: authentication_user_username_a09a089e_like; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX authentication_user_username_a09a089e_like ON authentication_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2177 (class 1259 OID 82445)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2180 (class 1259 OID 82446)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2181 (class 1259 OID 82457)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- TOC entry 2184 (class 1259 OID 82456)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2128 (class 1259 OID 82294)
-- Name: inventario_hardwarecomponent_component_type_id_e15e0280; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_hardwarecomponent_component_type_id_e15e0280 ON inventario_hardwarecomponent USING btree (component_type_id);


--
-- TOC entry 2129 (class 1259 OID 82300)
-- Name: inventario_hardwarecomponent_machine_id_5b100b08; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_hardwarecomponent_machine_id_5b100b08 ON inventario_hardwarecomponent USING btree (machine_id);


--
-- TOC entry 2134 (class 1259 OID 82281)
-- Name: inventario_machine_company_id_e012d0ea; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_machine_company_id_e012d0ea ON inventario_machine USING btree (company_id);


--
-- TOC entry 2137 (class 1259 OID 82282)
-- Name: inventario_softwarecomponent_component_type_id_34ee641b; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_softwarecomponent_component_type_id_34ee641b ON inventario_softwarecomponent USING btree (component_type_id);


--
-- TOC entry 2138 (class 1259 OID 82288)
-- Name: inventario_softwarecomponent_machine_id_dfa245bd; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_softwarecomponent_machine_id_dfa245bd ON inventario_softwarecomponent USING btree (machine_id);


--
-- TOC entry 2200 (class 2620 OID 82309)
-- Name: inventario_machine tg_machine_seq; Type: TRIGGER; Schema: public; Owner: invetronicdb
--

CREATE TRIGGER tg_machine_seq BEFORE INSERT ON inventario_machine FOR EACH ROW EXECUTE PROCEDURE fn_machine_seq();


--
-- TOC entry 2192 (class 2606 OID 82350)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2191 (class 2606 OID 82345)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2190 (class 2606 OID 82336)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2197 (class 2606 OID 82414)
-- Name: authentication_user_user_permissions authentication_user__permission_id_ea6be19a_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_user_permissions
    ADD CONSTRAINT authentication_user__permission_id_ea6be19a_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2194 (class 2606 OID 82395)
-- Name: authentication_user_groups authentication_user__user_id_30868577_fk_authentic; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_groups
    ADD CONSTRAINT authentication_user__user_id_30868577_fk_authentic FOREIGN KEY (user_id) REFERENCES authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2196 (class 2606 OID 82409)
-- Name: authentication_user_user_permissions authentication_user__user_id_736ebf7e_fk_authentic; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_user_permissions
    ADD CONSTRAINT authentication_user__user_id_736ebf7e_fk_authentic FOREIGN KEY (user_id) REFERENCES authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2193 (class 2606 OID 82388)
-- Name: authentication_user authentication_user_company_id_a38f3939_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user
    ADD CONSTRAINT authentication_user_company_id_a38f3939_fk_inventari FOREIGN KEY (company_id) REFERENCES inventario_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2195 (class 2606 OID 82400)
-- Name: authentication_user_groups authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2198 (class 2606 OID 82435)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2199 (class 2606 OID 82440)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_authentication_user_id; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authentication_user_id FOREIGN KEY (user_id) REFERENCES authentication_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2185 (class 2606 OID 82295)
-- Name: inventario_hardwarecomponent inventario_hardwarec_component_type_id_e15e0280_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent
    ADD CONSTRAINT inventario_hardwarec_component_type_id_e15e0280_fk_inventari FOREIGN KEY (component_type_id) REFERENCES inventario_hardwarecomponenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2186 (class 2606 OID 82301)
-- Name: inventario_hardwarecomponent inventario_hardwarec_machine_id_5b100b08_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent
    ADD CONSTRAINT inventario_hardwarec_machine_id_5b100b08_fk_inventari FOREIGN KEY (machine_id) REFERENCES inventario_machine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2187 (class 2606 OID 82276)
-- Name: inventario_machine inventario_machine_company_id_e012d0ea_fk_inventario_company_id; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_machine
    ADD CONSTRAINT inventario_machine_company_id_e012d0ea_fk_inventario_company_id FOREIGN KEY (company_id) REFERENCES inventario_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2188 (class 2606 OID 82283)
-- Name: inventario_softwarecomponent inventario_softwarec_component_type_id_34ee641b_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent
    ADD CONSTRAINT inventario_softwarec_component_type_id_34ee641b_fk_inventari FOREIGN KEY (component_type_id) REFERENCES inventario_softwarecomponenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2189 (class 2606 OID 82289)
-- Name: inventario_softwarecomponent inventario_softwarec_machine_id_dfa245bd_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent
    ADD CONSTRAINT inventario_softwarec_machine_id_dfa245bd_fk_inventari FOREIGN KEY (machine_id) REFERENCES inventario_machine(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-10-29 21:51:19 COT

--
-- PostgreSQL database dump complete
--

