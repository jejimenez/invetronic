--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-11-26 17:19:58 COT

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
-- TOC entry 2352 (class 0 OID 106893)
-- Dependencies: 204
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2336 (class 0 OID 106768)
-- Dependencies: 188
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--
/*
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'inventario', 'company');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'inventario', 'hardwarecomponent');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'inventario', 'hardwarecomponenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'inventario', 'machine');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'inventario', 'softwarecomponent');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'inventario', 'softwarecomponenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'authentication', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'tickets', 'incident');
*/

--
-- TOC entry 2350 (class 0 OID 106885)
-- Dependencies: 202
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--
/*
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add Empresa', 1, 'add_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change Empresa', 1, 'change_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete Empresa', 1, 'delete_company');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add Componente de Hardware', 2, 'add_hardwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change Componente de Hardware', 2, 'change_hardwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete Componente de Hardware', 2, 'delete_hardwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add Tipo de Componente Hardware', 3, 'add_hardwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change Tipo de Componente Hardware', 3, 'change_hardwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete Tipo de Componente Hardware', 3, 'delete_hardwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add Máquina', 4, 'add_machine');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change Máquina', 4, 'change_machine');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete Máquina', 4, 'delete_machine');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add Componente de Software', 5, 'add_softwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change Componente de Software', 5, 'change_softwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete Componente de Software', 5, 'delete_softwarecomponent');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add Tipo de Componente Software', 6, 'add_softwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change Tipo de Componente Software', 6, 'change_softwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete Tipo de Componente Software', 6, 'delete_softwarecomponenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add user', 7, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change user', 7, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete user', 7, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add log entry', 8, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change log entry', 8, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete log entry', 8, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add permission', 9, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change permission', 9, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete permission', 9, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add group', 10, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change group', 10, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete group', 10, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add content type', 11, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change content type', 11, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete content type', 11, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add session', 12, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change session', 12, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete session', 12, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add Incidente', 13, 'add_incident');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change Incidente', 13, 'change_incident');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete Incidente', 13, 'delete_incident');
*/

--
-- TOC entry 2354 (class 0 OID 106903)
-- Dependencies: 206
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- TOC entry 2338 (class 0 OID 106795)
-- Dependencies: 190
-- Data for Name: inventario_company; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (2, 'Trululu', '2.323.345.234', 'Cll 175 # 20 A -60', '786 76 87', '319 3910232', NULL, 'company/img/trululu.jpg', 'company/img/trululu.jpg_thumbnail1.jpg');
INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (3, 'Teriyaky', '234-345-567', 'Cll 115 # 20 A -65', '34523454', '3452345234', 'Robert Kiyosaky', 'company/img/teriyaki.jpg', 'company/img/teriyaki.jpg_thumbnail1.jpg');
INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (4, 'Casio', '567.236.678', 'Cll 15 # 02 A -60', '8009232', '3129084920', 'Casimiro Cortes', 'company/img/casio_4n4Jhs5.jpg', 'company/img/casio.jpg_thumbnail1.jpg');
INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (5, 'Combustibles nacionales', '2342342-5', 'Cll 175 # 20 A -65', '8092353', '319 30940293', NULL, 'company/img/combustible.jpg', 'company/img/combustible.jpg_thumbnail1.jpg');
--INSERT INTO inventario_company (id, name, nit, address, telephone, cellphone, legal_representative, photo, photo_thumbnail1) VALUES (1, 'INVETRONIC', '901.065.797-9', 'Cll 14b # 116-69 Bl 2 C 5-2', '810 1121', '320 8929273', 'Eduardo Rozo', 'company/img/logo4.jpg', 'company/img/logo4.jpg_thumbnail1.jpg');


--
-- TOC entry 2356 (class 0 OID 106934)
-- Dependencies: 208
-- Data for Name: authentication_user; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO authentication_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, company_id, tipo_usuario) VALUES (4, 'pbkdf2_sha256$36000$sxANCkrXr0ZU$B980fTHmxP+GAbieSraLPlT2zMfHxr7Isc1UyLXb4zg=', '2017-11-06 02:09:21.939979+00', true, 'jejimenez', 'Jaime Enrique', 'Jiménez Arbeláez', 'jimenez.ing.sis@gmail.com', true, true, '2017-10-30 03:36:04+00', 1, NULL);
INSERT INTO authentication_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, company_id, tipo_usuario) VALUES (5, 'pbkdf2_sha256$36000$UB2sPFZ0WgCR$zQ8ydgsI6umDagcSkuNleLyqpY9akCTzwFscnKd33vI=', '2017-11-06 02:45:41.946306+00', false, 'tecnico1', 'tecnico empresa', 'numero uno', 'tecnico@tecnico.com', false, true, '2017-11-06 02:43:34+00', 1, 'TECNICO');
INSERT INTO authentication_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, company_id, tipo_usuario) VALUES (6, 'pbkdf2_sha256$36000$oRtcUnNLkTDJ$1fdz03iy7EaazRkeMDC27HukCuyEpOMtO8kbAKtv60s=', '2017-11-06 03:00:22.757607+00', false, 'cliente1', 'cliente empresa', 'numero uno', 'cliente@cliente.comd', false, true, '2017-11-06 02:59:24+00', 2, 'CLIENTE');
INSERT INTO authentication_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, company_id, tipo_usuario) VALUES (7, 'pbkdf2_sha256$36000$jowELqgU7Gir$N8DPCTElzCkHGK4V0H6XPRyfYFdwyHld6xzivR28XdQ=', '2017-11-08 03:20:27.503947+00', false, 'cliente5', 'cliente empersa', 'numero cinco', 'cliente@cliente.com', false, true, '2017-11-06 03:09:06+00', 5, 'CLIENTE');
INSERT INTO authentication_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, company_id, tipo_usuario) VALUES (2, 'pbkdf2_sha256$36000$GrHfue3cAiM0$sRM9ZCpdNC9KhHxUvGi4F5XUgkuc4a/SmeOZWbP21rE=', '2017-11-26 22:07:01.854357+00', true, 'admin', '', '', '', true, true, '2017-10-30 03:30:38.000353+00', 1, NULL);


--
-- TOC entry 2358 (class 0 OID 106947)
-- Dependencies: 210
-- Data for Name: authentication_user_groups; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 209
-- Name: authentication_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('authentication_user_groups_id_seq', 1, false);


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 207
-- Name: authentication_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('authentication_user_id_seq', 7, true);


--
-- TOC entry 2360 (class 0 OID 106955)
-- Dependencies: 212
-- Data for Name: authentication_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--



--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 211
-- Name: authentication_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('authentication_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2362 (class 0 OID 106998)
-- Dependencies: 214
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--
/*
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2017-10-30 03:36:04.472346+00', '4', 'jejimenez', 1, '[{"added": {}}]', 7, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2017-10-31 02:48:38.666049+00', '4', 'jejimenez', 2, '[{"changed": {"fields": ["first_name"]}}]', 7, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2017-10-31 02:49:39.174964+00', '4', 'jejimenez', 2, '[{"changed": {"fields": ["last_name", "email", "is_staff", "is_superuser", "last_login", "company"]}}]', 7, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2017-10-31 03:29:02.474418+00', '1', 'INVETRONIC', 2, '[{"changed": {"fields": ["photo"]}}]', 1, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2017-11-06 02:43:34.57796+00', '5', 'tecnico1', 1, '[{"added": {}}]', 7, 4);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2017-11-06 02:44:12.98848+00', '5', 'tecnico1', 2, '[{"changed": {"fields": ["first_name", "last_name", "email", "company", "tipo_usuario"]}}]', 7, 4);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2017-11-06 02:59:24.114992+00', '6', 'cliente1', 1, '[{"added": {}}]', 7, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2017-11-06 03:00:11.56717+00', '6', 'cliente1', 2, '[{"changed": {"fields": ["first_name", "last_name", "email", "company", "tipo_usuario"]}}]', 7, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2017-11-06 03:09:06.655376+00', '7', 'cliente5', 1, '[{"added": {}}]', 7, 2);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2017-11-06 03:09:34.458318+00', '7', 'cliente5', 2, '[{"changed": {"fields": ["first_name", "last_name", "email", "company", "tipo_usuario"]}}]', 7, 2);
*/

--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('django_admin_log_id_seq', 10, true);


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- TOC entry 2334 (class 0 OID 98622)
-- Dependencies: 186
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--
/*
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2017-10-30 03:24:16.074403+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'inventario', '0001_initial', '2017-10-30 03:26:38.639938+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'contenttypes', '0002_remove_content_type_name', '2017-10-30 03:26:38.703262+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'auth', '0001_initial', '2017-10-30 03:26:39.04132+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0002_alter_permission_name_max_length', '2017-10-30 03:26:39.078958+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0003_alter_user_email_max_length', '2017-10-30 03:26:39.1073+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0004_alter_user_username_opts', '2017-10-30 03:26:39.127898+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0005_alter_user_last_login_null', '2017-10-30 03:26:39.158489+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0006_require_contenttypes_0002', '2017-10-30 03:26:39.172286+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0007_alter_validators_add_error_messages', '2017-10-30 03:26:39.20592+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0008_alter_user_username_max_length', '2017-10-30 03:26:39.229508+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'authentication', '0001_initial', '2017-10-30 03:26:39.639975+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'admin', '0001_initial', '2017-10-30 03:26:39.785974+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2017-10-30 03:26:39.82201+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'inventario', 'sequence', '2017-10-30 03:26:39.862958+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'sessions', '0001_initial', '2017-10-30 03:26:40.00619+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'authentication', '0002_auto_20171029_2235', '2017-10-30 03:35:58.197367+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'authentication', '0003_user_year_in_school', '2017-11-06 02:36:50.786197+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'authentication', '0004_auto_20171105_2137', '2017-11-06 02:37:41.68536+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'authentication', '0005_auto_20171106_1701', '2017-11-06 22:01:18.736653+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'inventario', '0001_auto_20171106_1701', '2017-11-06 22:01:19.145039+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'inventario', '0002_auto_20171106_1707', '2017-11-06 22:15:39.265373+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'inventario', '0003_auto_20171106_1715', '2017-11-06 22:15:39.325789+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'tickets', '0001_initial', '2017-11-06 22:15:39.501255+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'inventario', '0004_auto_20171106_2056', '2017-11-07 01:59:21.888715+00');
INSERT INTO django_migrations (id, app, name, applied) VALUES (26, 'tickets', '0002_auto_20171106_2056', '2017-11-07 01:59:22.083213+00');
*/

--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

--SELECT pg_catalog.setval('django_migrations_id_seq', 26, true);


--
-- TOC entry 2364 (class 0 OID 107025)
-- Dependencies: 216
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--
/*
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('d5haulztdmed0medoa1xtj8vjhmvt262', 'NmEyMTg2MzYyZDU3OGI1Yjg5ZjNmMzRkNjg4MzU5MTRhZWQyODE0ODp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZWM2MGI5Mzc5YTUzZjA4NjI1ZDFiNDNkNWZjMjM1YWNhNjc3MjBhIn0=', '2017-11-16 01:36:02.660973+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('5gmzi4rtw21lm79zks2lsemtl2wluer9', 'OTdiMzViZWUzNjg2M2NkNTlmMGUwZGI1ODFjNjgwNTAzYzY3NzUyOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyY2VlMWYzMmM2ODk1MTMzZmFiMDEyM2JjNWVjMjAzNWQzZjk5OTc3In0=', '2017-11-20 23:03:22.748348+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('1ue5jt4ssivabomj23l19huqd7xkqg10', 'ZWIzODVkNmY3MWMyMzIwNTE5ZWNkZjcyNzYzNmU3NjJkZTE2YTcxNDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGQ5MDUyZmU0ZmNiYTdlMDg4MzcyZmZhYTZmNGVmMmZmN2IzODFmIn0=', '2017-11-22 03:20:27.518509+00');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('6hgx1b51gnp4twwo4lggkjzoc7o9p45e', 'OTdiMzViZWUzNjg2M2NkNTlmMGUwZGI1ODFjNjgwNTAzYzY3NzUyOTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyY2VlMWYzMmM2ODk1MTMzZmFiMDEyM2JjNWVjMjAzNWQzZjk5OTc3In0=', '2017-12-10 22:07:01.869448+00');
*/

--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 189
-- Name: inventario_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_company_id_seq', 1, false);


--
-- TOC entry 2342 (class 0 OID 106817)
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
-- TOC entry 2344 (class 0 OID 106825)
-- Dependencies: 196
-- Data for Name: inventario_machine; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_machine (id, name, ip, mac_address, shared, printers, os, machine_sequence, company_id, buyed_date, creation_time, supplier, warranty_months) VALUES (18, 'n987n', NULL, NULL, '7g9', '87g987g', '97g9', 'HV2017103000001', 4, NULL, '2017-11-06 22:01:18.856887+00', NULL, NULL);
INSERT INTO inventario_machine (id, name, ip, mac_address, shared, printers, os, machine_sequence, company_id, buyed_date, creation_time, supplier, warranty_months) VALUES (20, 'mch34234', '127.0.0.1', '00:0a:95:9d:68:16', '/carpeta/', 'Printer1', 'Window', 'HV2017103000002', 5, NULL, '2017-11-06 22:01:18.856887+00', NULL, NULL);
INSERT INTO inventario_machine (id, name, ip, mac_address, shared, printers, os, machine_sequence, company_id, buyed_date, creation_time, supplier, warranty_months) VALUES (21, 'KSTABOG293-320', '127.0.0.1', '00:0a:95:9d:68:16', '/iuoiuo/', 'Printer2', 'LINUX', 'HV2017103000003', 5, NULL, '2017-11-06 22:01:18.856887+00', NULL, NULL);


--
-- TOC entry 2340 (class 0 OID 106806)
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
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 191
-- Name: inventario_hardwarecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_hardwarecomponent_id_seq', 1, false);


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 193
-- Name: inventario_hardwarecomponenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_hardwarecomponenttype_id_seq', 1, false);


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 195
-- Name: inventario_machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_machine_id_seq', 1, false);


--
-- TOC entry 2348 (class 0 OID 106847)
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
-- TOC entry 2346 (class 0 OID 106836)
-- Dependencies: 198
-- Data for Name: inventario_softwarecomponent; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO inventario_softwarecomponent (id, name, release, compilation, bits, features, component_type_id, machine_id) VALUES (1, 'Windows', '7', '2349.234', '64', 'LC', 1, 21);
INSERT INTO inventario_softwarecomponent (id, name, release, compilation, bits, features, component_type_id, machine_id) VALUES (2, 'Avast', '9.11', NULL, '64', 'Av', 4, 21);
INSERT INTO inventario_softwarecomponent (id, name, release, compilation, bits, features, component_type_id, machine_id) VALUES (3, 'Adobe', NULL, NULL, '64', NULL, 5, 21);


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 197
-- Name: inventario_softwarecomponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_softwarecomponent_id_seq', 1, false);


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 199
-- Name: inventario_softwarecomponenttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('inventario_softwarecomponenttype_id_seq', 1, false);


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 215
-- Name: machine_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('machine_seq', 3, true);


--
-- TOC entry 2366 (class 0 OID 114971)
-- Dependencies: 218
-- Data for Name: tickets_incident; Type: TABLE DATA; Schema: public; Owner: invetronicdb
--

INSERT INTO tickets_incident (id, overview, description, remote_diagnosis, phone_diagnosis, visit_diagnosis, creation_time, severity, status, user_id, machine_id) VALUES (1, 'No imprime, No imprime, No imprime No imprime No imprime No imprime No imprime No imprime, No imprime', 'La máquina ya no imprime', NULL, NULL, NULL, '2017-11-08 01:02:48.683572+00', '0', 'O', 2, 21);
INSERT INTO tickets_incident (id, overview, description, remote_diagnosis, phone_diagnosis, visit_diagnosis, creation_time, severity, status, user_id, machine_id) VALUES (2, 'OTRO MAS , OTRO MAS , OTRO MAS , OTRO MAS , OTRO MAS , OTRO MAS ,OTRO MAS , OTRO MAS , OTRO MAS , OT', 'OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS', NULL, NULL, NULL, '2017-11-08 02:42:01.42024+00', '0', 'O', 7, 20);
INSERT INTO tickets_incident (id, overview, description, remote_diagnosis, phone_diagnosis, visit_diagnosis, creation_time, severity, status, user_id, machine_id) VALUES (3, 'OTRO MAS , OTRO MAS , OTRO MAS , OTRO MAS , OTRO MAS , OTRO MAS ,OTRO MAS , OTRO MAS , OTRO MAS , OT', 'OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS OTRO MAS', NULL, NULL, NULL, '2017-11-08 02:44:34.017381+00', '0', 'O', 7, 20);


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 217
-- Name: tickets_incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: invetronicdb
--

SELECT pg_catalog.setval('tickets_incident_id_seq', 3, true);


-- Completed on 2017-11-26 17:19:59 COT

--
-- PostgreSQL database dump complete
--

