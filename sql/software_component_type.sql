--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-28 23:41:09 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 65777)
-- Name: inventario_softwarecomponenttype; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_softwarecomponenttype (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE inventario_softwarecomponenttype OWNER TO invetronicdb;

--
-- TOC entry 216 (class 1259 OID 65775)
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
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 216
-- Name: inventario_softwarecomponenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_softwarecomponenttype_id_seq OWNED BY inventario_softwarecomponenttype.id;


--
-- TOC entry 2090 (class 2604 OID 65780)
-- Name: inventario_softwarecomponenttype id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponenttype ALTER COLUMN id SET DEFAULT nextval('inventario_softwarecomponenttype_id_seq'::regclass);


--
-- TOC entry 2211 (class 0 OID 65777)
-- Dependencies: 217
-- Data for Name: inventario_softwarecomponenttype; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_softwarecomponenttype VALUES (1, 'Sistema Operativo');
INSERT INTO inventario_softwarecomponenttype VALUES (2, 'Ofimatica');
INSERT INTO inventario_softwarecomponenttype VALUES (4, 'Antivirus');
INSERT INTO inventario_softwarecomponenttype VALUES (5, 'Lector PDF');
INSERT INTO inventario_softwarecomponenttype VALUES (6, 'Contabilidad');
INSERT INTO inventario_softwarecomponenttype VALUES (7, 'Otros');
INSERT INTO inventario_softwarecomponenttype VALUES (3, 'Herramienta de Optimización');


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 216
-- Name: inventario_softwarecomponenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_softwarecomponenttype_id_seq', 7, true);


--
-- TOC entry 2092 (class 2606 OID 65782)
-- Name: inventario_softwarecomponenttype inventario_softwarecomponenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponenttype
    ADD CONSTRAINT inventario_softwarecomponenttype_pkey PRIMARY KEY (id);


-- Completed on 2017-10-28 23:41:10 COT

--
-- PostgreSQL database dump complete
--

