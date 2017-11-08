--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-28 23:40:42 COT

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
-- TOC entry 215 (class 1259 OID 65766)
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
-- TOC entry 214 (class 1259 OID 65764)
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
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 214
-- Name: inventario_softwarecomponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_softwarecomponent_id_seq OWNED BY inventario_softwarecomponent.id;


--
-- TOC entry 2090 (class 2604 OID 65769)
-- Name: inventario_softwarecomponent id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent ALTER COLUMN id SET DEFAULT nextval('inventario_softwarecomponent_id_seq'::regclass);


--
-- TOC entry 2215 (class 0 OID 65766)
-- Dependencies: 215
-- Data for Name: inventario_softwarecomponent; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_softwarecomponent VALUES (1, 'Windows', '7', '2349.234', '64', 'LC', 1, 21);
INSERT INTO inventario_softwarecomponent VALUES (2, 'Avast', '9.11', NULL, '64', 'Av', 4, 21);
INSERT INTO inventario_softwarecomponent VALUES (3, 'Adobe', NULL, NULL, '64', NULL, 5, 21);


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 214
-- Name: inventario_softwarecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_softwarecomponent_id_seq', 3, true);


--
-- TOC entry 2094 (class 2606 OID 65774)
-- Name: inventario_softwarecomponent inventario_softwarecomponent_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent
    ADD CONSTRAINT inventario_softwarecomponent_pkey PRIMARY KEY (id);


--
-- TOC entry 2091 (class 1259 OID 65793)
-- Name: inventario_softwarecomponent_component_type_id_34ee641b; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_softwarecomponent_component_type_id_34ee641b ON inventario_softwarecomponent USING btree (component_type_id);


--
-- TOC entry 2092 (class 1259 OID 65799)
-- Name: inventario_softwarecomponent_machine_id_dfa245bd; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_softwarecomponent_machine_id_dfa245bd ON inventario_softwarecomponent USING btree (machine_id);


--
-- TOC entry 2095 (class 2606 OID 65794)
-- Name: inventario_softwarecomponent inventario_softwarec_component_type_id_34ee641b_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent
    ADD CONSTRAINT inventario_softwarec_component_type_id_34ee641b_fk_inventari FOREIGN KEY (component_type_id) REFERENCES inventario_softwarecomponenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2096 (class 2606 OID 65800)
-- Name: inventario_softwarecomponent inventario_softwarec_machine_id_dfa245bd_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_softwarecomponent
    ADD CONSTRAINT inventario_softwarec_machine_id_dfa245bd_fk_inventari FOREIGN KEY (machine_id) REFERENCES inventario_machine(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-10-28 23:40:43 COT

--
-- PostgreSQL database dump complete
--

