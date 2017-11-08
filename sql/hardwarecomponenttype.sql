--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-28 23:33:02 COT

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
-- TOC entry 211 (class 1259 OID 65735)
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
-- TOC entry 210 (class 1259 OID 65733)
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
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 210
-- Name: inventario_hardwarecomponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: invetronicdb
--

ALTER SEQUENCE inventario_hardwarecomponent_id_seq OWNED BY inventario_hardwarecomponent.id;


--
-- TOC entry 2090 (class 2604 OID 65738)
-- Name: inventario_hardwarecomponent id; Type: DEFAULT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent ALTER COLUMN id SET DEFAULT nextval('inventario_hardwarecomponent_id_seq'::regclass);


--
-- TOC entry 2215 (class 0 OID 65735)
-- Dependencies: 211
-- Data for Name: inventario_hardwarecomponent; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_hardwarecomponent VALUES (1, 'HP', 'SDF9879S8', '98S7D9F87SD', '1', 'Color: Negra', 1, 20);
INSERT INTO inventario_hardwarecomponent VALUES (2, 'Kingstone', '9s8d7f987', 'SD98F7A09S', '3', 'Color:Verde', 3, 20);
INSERT INTO inventario_hardwarecomponent VALUES (3, 'Kinsgstone', '9s8df0987', '987s0d987f', '4', 'Amarilla', 4, 20);
INSERT INTO inventario_hardwarecomponent VALUES (4, 'Samsung', 's98df987', 'a09s870 b8a7', '7', 'Rigido', 5, 20);
INSERT INTO inventario_hardwarecomponent VALUES (5, 'Nikon', '9a8f9b87a0', 'a0s9d87f09a', '9', '.', 11, 20);
INSERT INTO inventario_hardwarecomponent VALUES (6, 'Hewlet packard Registered Company', '98sd9f87987s', '9a87sd0f987', '1', 'Antiguo - Dañado', 10, 20);
INSERT INTO inventario_hardwarecomponent VALUES (7, 'Hewlet Packard', 'OIU324IU', '29384092', NULL, 'Color:Rojo', 1, 21);
INSERT INTO inventario_hardwarecomponent VALUES (8, 'Sony', '897WER', 'R987T', NULL, 'Color:Blanco', 11, 21);
INSERT INTO inventario_hardwarecomponent VALUES (9, 'LG', 'LG-ASDFPW', '0Q98AF', NULL, NULL, 6, 21);
INSERT INTO inventario_hardwarecomponent VALUES (10, 'LG', 'LG-233', '234', '37', 'Negro', 8, 21);
INSERT INTO inventario_hardwarecomponent VALUES (11, 'Ledmark', 'LM', '98', NULL, 'Tinta', 12, 21);
INSERT INTO inventario_hardwarecomponent VALUES (12, 'Generico', NULL, NULL, NULL, 'Español', 9, 21);


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 210
-- Name: inventario_hardwarecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_hardwarecomponent_id_seq', 12, true);


--
-- TOC entry 2094 (class 2606 OID 65743)
-- Name: inventario_hardwarecomponent inventario_hardwarecomponent_pkey; Type: CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent
    ADD CONSTRAINT inventario_hardwarecomponent_pkey PRIMARY KEY (id);


--
-- TOC entry 2091 (class 1259 OID 65752)
-- Name: inventario_hardwarecomponent_component_type_id_e15e0280; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_hardwarecomponent_component_type_id_e15e0280 ON inventario_hardwarecomponent USING btree (component_type_id);


--
-- TOC entry 2092 (class 1259 OID 65758)
-- Name: inventario_hardwarecomponent_machine_id_5b100b08; Type: INDEX; Schema: public; Owner: invetronicdb
--

CREATE INDEX inventario_hardwarecomponent_machine_id_5b100b08 ON inventario_hardwarecomponent USING btree (machine_id);


--
-- TOC entry 2095 (class 2606 OID 65783)
-- Name: inventario_hardwarecomponent inventario_hardwarec_component_type_id_e15e0280_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent
    ADD CONSTRAINT inventario_hardwarec_component_type_id_e15e0280_fk_inventari FOREIGN KEY (component_type_id) REFERENCES inventario_hardwarecomponenttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2096 (class 2606 OID 65788)
-- Name: inventario_hardwarecomponent inventario_hardwarec_machine_id_5b100b08_fk_inventari; Type: FK CONSTRAINT; Schema: public; Owner: invetronicdb
--

ALTER TABLE ONLY inventario_hardwarecomponent
    ADD CONSTRAINT inventario_hardwarec_machine_id_5b100b08_fk_inventari FOREIGN KEY (machine_id) REFERENCES inventario_machine(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2017-10-28 23:33:03 COT

--
-- PostgreSQL database dump complete
--

