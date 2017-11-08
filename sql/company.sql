--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-28 23:38:18 COT

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
-- TOC entry 204 (class 1259 OID 16739)
-- Name: inventario_company; Type: TABLE; Schema: public; Owner: invetronicdb
--

CREATE TABLE inventario_company (
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    address character varying(500),
    nit character varying(50) NOT NULL,
    photo character varying(100),
    telephone character varying(15),
    cellphone character varying(15),
    legal_representative character varying(500),
    photo_thumbnail1 character varying(100)
);


ALTER TABLE inventario_company OWNER TO invetronicdb;

--
-- TOC entry 203 (class 1259 OID 16737)
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
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 203
-- Name: inventario_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_company_id_seq OWNED BY inventario_company.id;


--
-- TOC entry 2090 (class 2604 OID 16742)
-- Name: inventario_company id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_company ALTER COLUMN id SET DEFAULT nextval('inventario_company_id_seq'::regclass);


--
-- TOC entry 2211 (class 0 OID 16739)
-- Dependencies: 204
-- Data for Name: inventario_company; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_company VALUES (1, 'Nacional de Chocolates', '12.234.345', 'cll 112 # 20-33', NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventario_company VALUES (2, 'Trululu', '2.323.345.234', 'Cll 175 # 20 A -60', NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventario_company VALUES (5, 'Combustibles nacionales', '2342342-5', 'Cll 175 # 20 A -65', '8092353', '319 30940293', 'company/img/calendar_copia.jpg', 'Salomon Levisage', 'company/img/calendar_copia.jpg_thumbnail1.jpg');
INSERT INTO inventario_company VALUES (3, 'Teriyaky', '234-345-567', 'Cll 115 # 20 A -65', '34523454', '3452345234', 'company/img/logo3.jpg', 'Robert Kiyosaky', 'company/img/logo3.jpg_thumbnail1.jpg');
INSERT INTO inventario_company VALUES (4, 'Casio', '567.236.678', 'Cll 15 # 02 A -60', '8009232', '3129084920', 'company/img/casio.jpg', 'Casimiro Cortes', 'company/img/casio.jpg_thumbnail1.jpg');


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 203
-- Name: inventario_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_company_id_seq', 5, true);


--
-- TOC entry 2092 (class 2606 OID 16747)
-- Name: inventario_company inventario_company_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_company
    ADD CONSTRAINT inventario_company_pkey PRIMARY KEY (id);


-- Completed on 2017-10-28 23:38:18 COT

--
-- PostgreSQL database dump complete
--

