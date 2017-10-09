--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-03 21:45:58 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
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
    address character varying(500) NOT NULL,
    person_contact character varying(500) NOT NULL,
    nit character varying(500) NOT NULL
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
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 203
-- Name: inventario_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_company_id_seq OWNED BY inventario_company.id;


--
-- TOC entry 2063 (class 2604 OID 16742)
-- Name: inventario_company id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_company ALTER COLUMN id SET DEFAULT nextval('inventario_company_id_seq'::regclass);


--
-- TOC entry 2184 (class 0 OID 16739)
-- Dependencies: 204
-- Data for Name: inventario_company; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_company VALUES (1, 'Nacional de Chocolates', 'cll 112 # 20-33', 'Lolita Lola', '12.234.345');
INSERT INTO inventario_company VALUES (2, 'Trululu', 'Cll 175 # 20 A -60', 'Pepito Pepe', '2.323.345.234');
INSERT INTO inventario_company VALUES (3, 'Teriyaky', 'Cll 115 # 20 A -65', 'Dra Sarha', '234-345-567');
INSERT INTO inventario_company VALUES (4, 'Casio', 'Cll 15 # 02 A -60', 'Casimiro', '567.236.678');


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 203
-- Name: inventario_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_company_id_seq', 4, true);


--
-- TOC entry 2065 (class 2606 OID 16747)
-- Name: inventario_company inventario_company_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_company
    ADD CONSTRAINT inventario_company_pkey PRIMARY KEY (id);


-- Completed on 2017-10-03 21:45:58 COT

--
-- PostgreSQL database dump complete
--

