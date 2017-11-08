--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-28 23:35:47 COT

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
-- TOC entry 213 (class 1259 OID 65746)
-- Name: inventario_hardwarecomponenttype; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_hardwarecomponenttype (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE inventario_hardwarecomponenttype OWNER TO invetronicdb;

--
-- TOC entry 212 (class 1259 OID 65744)
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
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 212
-- Name: inventario_hardwarecomponenttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_hardwarecomponenttype_id_seq OWNED BY inventario_hardwarecomponenttype.id;


--
-- TOC entry 2090 (class 2604 OID 65749)
-- Name: inventario_hardwarecomponenttype id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponenttype ALTER COLUMN id SET DEFAULT nextval('inventario_hardwarecomponenttype_id_seq'::regclass);


--
-- TOC entry 2211 (class 0 OID 65746)
-- Dependencies: 213
-- Data for Name: inventario_hardwarecomponenttype; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_hardwarecomponenttype VALUES (1, 'Caja');
INSERT INTO inventario_hardwarecomponenttype VALUES (2, 'Board');
INSERT INTO inventario_hardwarecomponenttype VALUES (3, 'Memoria 1');
INSERT INTO inventario_hardwarecomponenttype VALUES (4, 'Memoria 2');
INSERT INTO inventario_hardwarecomponenttype VALUES (5, 'Disco Duro');
INSERT INTO inventario_hardwarecomponenttype VALUES (6, 'Unidad Lectora');
INSERT INTO inventario_hardwarecomponenttype VALUES (7, 'Procesador');
INSERT INTO inventario_hardwarecomponenttype VALUES (8, 'Monitor');
INSERT INTO inventario_hardwarecomponenttype VALUES (9, 'Teclado');
INSERT INTO inventario_hardwarecomponenttype VALUES (10, 'Mouse');
INSERT INTO inventario_hardwarecomponenttype VALUES (11, 'Parlantes');
INSERT INTO inventario_hardwarecomponenttype VALUES (12, 'Impresora');
INSERT INTO inventario_hardwarecomponenttype VALUES (13, 'Otros');


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 212
-- Name: inventario_hardwarecomponenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_hardwarecomponenttype_id_seq', 13, true);


--
-- TOC entry 2092 (class 2606 OID 65751)
-- Name: inventario_hardwarecomponenttype inventario_hardwarecomponenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponenttype
    ADD CONSTRAINT inventario_hardwarecomponenttype_pkey PRIMARY KEY (id);


-- Completed on 2017-10-28 23:35:47 COT

--
-- PostgreSQL database dump complete
--

