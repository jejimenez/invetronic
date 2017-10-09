--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-10-03 21:42:50 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2186 (class 0 OID 16750)
-- Dependencies: 206
-- Data for Name: inventario_machine; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_machine VALUES (1, 'MACHINE-123', '127.0.0.1', 'SDF23423SDF23', '1', 'Printer1', 'Window', 4);
INSERT INTO inventario_machine VALUES (2, 'MACH-2342', '127.0.0.1', 'SLKJ34LK5J2LKJ', '/carpeta/', 'Printer2', 'LINUX', 2);
INSERT INTO inventario_machine VALUES (3, 'MAC-3457', '127.90.3.23', '34LKJ2LKJ', '/path/', 'Printer3', 'OSX', 3);


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 205
-- Name: inventario_machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_machine_id_seq', 2, true);


-- Completed on 2017-10-03 21:42:50 COT

--
-- PostgreSQL database dump complete
--

