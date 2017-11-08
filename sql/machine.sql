--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-28 23:39:25 COT

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
-- TOC entry 206 (class 1259 OID 16750)
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
    company_id integer NOT NULL,
    machine_sequence character varying(200) DEFAULT nextval('mc_sequence'::regclass)
);


ALTER TABLE inventario_machine OWNER TO invetronicdb;

--
-- TOC entry 205 (class 1259 OID 16748)
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
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 205
-- Name: inventario_machine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_machine_id_seq OWNED BY inventario_machine.id;


--
-- TOC entry 2090 (class 2604 OID 16753)
-- Name: inventario_machine id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_machine ALTER COLUMN id SET DEFAULT nextval('inventario_machine_id_seq'::regclass);


--
-- TOC entry 2215 (class 0 OID 16750)
-- Dependencies: 206
-- Data for Name: inventario_machine; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_machine VALUES (20, 'mch34234', NULL, NULL, '/carpeta/', 'Printer1', 'Window', 3, 'HV2017102200003');
INSERT INTO inventario_machine VALUES (18, 'n987n', NULL, NULL, '7g9', '87g987g', '97g9', 4, '1');
INSERT INTO inventario_machine VALUES (21, 'KSTABOG293-320', '127.0.0.1', '00:0a:95:9d:68:16', '/iuoiuo/', 'Printer2', 'LINUX', 4, 'HV2017102700004');


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 205
-- Name: inventario_machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_machine_id_seq', 21, true);


--
-- TOC entry 2094 (class 2606 OID 16758)
-- Name: inventario_machine inventario_machine_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_machine
    ADD CONSTRAINT inventario_machine_pkey PRIMARY KEY (id);


--
-- TOC entry 2092 (class 1259 OID 16764)
-- Name: inventario_machine_company_id_e012d0ea; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_machine_company_id_e012d0ea ON inventario_machine USING btree (company_id);


--
-- TOC entry 2096 (class 2620 OID 57564)
-- Name: inventario_machine tg_machine_seq; Type: TRIGGER; Schema: public; Owner: invetronicdb
--

CREATE TRIGGER tg_machine_seq BEFORE INSERT ON inventario_machine FOR EACH ROW EXECUTE PROCEDURE fn_machine_seq();


--
-- TOC entry 2095 (class 2606 OID 24773)
-- Name: inventario_machine inventario_machine_company_id_e012d0ea_fk_inventario_company_id; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_machine
    ADD CONSTRAINT inventario_machine_company_id_e012d0ea_fk_inventario_company_id FOREIGN KEY (company_id) REFERENCES inventario_company(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-10-28 23:39:25 COT

--
-- PostgreSQL database dump complete
--

