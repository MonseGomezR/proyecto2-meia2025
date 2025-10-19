--
-- PostgreSQL database dump
--

\restrict KOtbhjFX1Plu1pPbwgdGfF2eTYOYdGKSTJJVS4xbWcsHSUzOtGTiAz928sBRrey

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ecommerce_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ecommerce_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE ecommerce_db OWNER TO postgres;

\unrestrict KOtbhjFX1Plu1pPbwgdGfF2eTYOYdGKSTJJVS4xbWcsHSUzOtGTiAz928sBRrey
\connect ecommerce_db
\restrict KOtbhjFX1Plu1pPbwgdGfF2eTYOYdGKSTJJVS4xbWcsHSUzOtGTiAz928sBRrey

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: category; Type: TABLE DATA; Schema: products; Owner: postgres
--

INSERT INTO products.category VALUES (1, 'Tecnologia');
INSERT INTO products.category VALUES (2, 'Hogar');
INSERT INTO products.category VALUES (3, 'Academico');
INSERT INTO products.category VALUES (4, 'Personal');
INSERT INTO products.category VALUES (5, 'Decoracion');
INSERT INTO products.category VALUES (6, 'Otro');


--
-- Data for Name: product; Type: TABLE DATA; Schema: products; Owner: postgres
--

INSERT INTO products.product VALUES ('e3116e56-e802-4000-bdd9-207d2ce7a83a', 'Laptop HP Pavilion 15', 'Laptop HP con procesador Ryzen 5, 16GB RAM y 512GB SSD', 'https://example.com/images/hp-pavilion.jpg', 649.99, 12, 'NEW', 'WAITING', 'ce749530-2355-4452-9b12-4ee0daba1de6', '01:14:22.971913');
INSERT INTO products.product VALUES ('6cc5e8ec-0a84-461b-b6e1-7943e8ab2de9', 'Lámpara LED de escritorio', 'Lámpara LED con brazo ajustable, puerto USB y tres niveles de brillo. Ideal para estudiar o trabajar en casa.', 'https://example.com/images/', 185, 34, 'NEW', 'WAITING', '325eca98-d48c-48d5-be9c-ab780d845c34', '00:24:37.756979');
INSERT INTO products.product VALUES ('03a14295-5af0-4da6-89df-1dfdf52cc081', 'Taza térmica de acero inoxidable', 'Mantiene tus bebidas calientes o frías por más de 8 horas. Diseño minimalista y resistente.', 'https://example.com/images/', 95, 120, 'NEW', 'WAITING', '325eca98-d48c-48d5-be9c-ab780d845c34', '00:32:10.808638');
INSERT INTO products.product VALUES ('df7bb88b-c73d-4e97-8985-2a595c4486ac', 'Taza térmica de acero inoxidable', 'Mantiene tus bebidas calientes o frías por más de 8 horas. Diseño minimalista y resistente.', 'https://example.com/images/', 95, 120, 'NEW', 'WAITING', 'be460dd4-1bd4-48cb-a405-62ec7211d460', '00:34:31.013131');
INSERT INTO products.product VALUES ('4d01d42f-2c1b-4a7c-8a4e-d86f837af7aa', 'Cuaderno de notas con tapa dura', '200 páginas de papel reciclado, ideal para apuntes o journaling. Disponible en varios colores.', 'https://example.com/images/', 45, 200, 'NEW', 'WAITING', 'be460dd4-1bd4-48cb-a405-62ec7211d460', '00:35:20.676593');
INSERT INTO products.product VALUES ('5f89aa1a-d178-4e98-9799-d2c1c2f934a5', 'Reloj inteligente FitTrack Pro', 'Monitorea pasos, ritmo cardíaco, sueño y notificaciones del teléfono.', 'https://example.com/images/', 700, 10, 'USED', 'WAITING', '7f37b68f-c7bb-4cb8-91ed-8060c08c091d', '00:36:54.948809');
INSERT INTO products.product VALUES ('cd6c0e7b-ab72-479a-96aa-9c88c126a09d', 'Set de cojines decorativos', 'Juego de tres cojines con fundas lavables y diseños modernos para sala o dormitorio.', 'https://example.com/images/', 210, 25, 'NEW', 'WAITING', '7f37b68f-c7bb-4cb8-91ed-8060c08c091d', '00:37:43.617554');


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: products; Owner: postgres
--

INSERT INTO products.product_category VALUES ('e3116e56-e802-4000-bdd9-207d2ce7a83a', 3);
INSERT INTO products.product_category VALUES ('e3116e56-e802-4000-bdd9-207d2ce7a83a', 1);
INSERT INTO products.product_category VALUES ('6cc5e8ec-0a84-461b-b6e1-7943e8ab2de9', 3);
INSERT INTO products.product_category VALUES ('6cc5e8ec-0a84-461b-b6e1-7943e8ab2de9', 2);
INSERT INTO products.product_category VALUES ('6cc5e8ec-0a84-461b-b6e1-7943e8ab2de9', 1);
INSERT INTO products.product_category VALUES ('03a14295-5af0-4da6-89df-1dfdf52cc081', 4);
INSERT INTO products.product_category VALUES ('03a14295-5af0-4da6-89df-1dfdf52cc081', 2);
INSERT INTO products.product_category VALUES ('df7bb88b-c73d-4e97-8985-2a595c4486ac', 4);
INSERT INTO products.product_category VALUES ('df7bb88b-c73d-4e97-8985-2a595c4486ac', 2);
INSERT INTO products.product_category VALUES ('4d01d42f-2c1b-4a7c-8a4e-d86f837af7aa', 4);
INSERT INTO products.product_category VALUES ('4d01d42f-2c1b-4a7c-8a4e-d86f837af7aa', 3);
INSERT INTO products.product_category VALUES ('5f89aa1a-d178-4e98-9799-d2c1c2f934a5', 4);
INSERT INTO products.product_category VALUES ('5f89aa1a-d178-4e98-9799-d2c1c2f934a5', 1);
INSERT INTO products.product_category VALUES ('cd6c0e7b-ab72-479a-96aa-9c88c126a09d', 2);
INSERT INTO products.product_category VALUES ('cd6c0e7b-ab72-479a-96aa-9c88c126a09d', 5);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: sales; Owner: postgres
--

INSERT INTO sales.cart VALUES (1, 0);
INSERT INTO sales.cart VALUES (2, 0);
INSERT INTO sales.cart VALUES (3, 0);
INSERT INTO sales.cart VALUES (4, 0);


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: sales; Owner: postgres
--



--
-- Data for Name: card; Type: TABLE DATA; Schema: users; Owner: postgres
--

INSERT INTO users.card VALUES ('4111111111111111', '123', '12/28', 'Juan Pérez', 'ce749530-2355-4452-9b12-4ee0daba1de6');
INSERT INTO users.card VALUES ('4111111111111112', '123', '12/28', 'Juan Pérez', 'ce749530-2355-4452-9b12-4ee0daba1de6');


--
-- Data for Name: person; Type: TABLE DATA; Schema: users; Owner: postgres
--

INSERT INTO users.person VALUES ('0000000000001', 'Admin', '1', '12345678', 'Address1');
INSERT INTO users.person VALUES ('1000000000001', 'Moderador', '1', '12345678', 'Address2');
INSERT INTO users.person VALUES ('1000000000002', 'Moderador', '2', '12345678', 'Address3');
INSERT INTO users.person VALUES ('2000000000001', 'Logistica', '1', '12345678', 'Address4');
INSERT INTO users.person VALUES ('2000000000002', 'Logistica', '2', '12345678', 'Address5');
INSERT INTO users.person VALUES ('3000000000001', 'Usuario', '1', '12345678', 'Address6');
INSERT INTO users.person VALUES ('3000000000002', 'Usuario', '2', '12345678', 'Address7');
INSERT INTO users.person VALUES ('3000000000003', 'Usuario', '3', '12345678', 'Address8');
INSERT INTO users.person VALUES ('3000000000004', 'Usuario', '4', '12345678', 'Address9');
INSERT INTO users.person VALUES ('3000000000005', 'Usuario', '5', '12345678', 'Address10');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: users; Owner: postgres
--

INSERT INTO users.roles VALUES (1, 'ROLE_ADMIN');
INSERT INTO users.roles VALUES (2, 'ROLE_MODERATOR');
INSERT INTO users.roles VALUES (4, 'ROLE_USER');
INSERT INTO users.roles VALUES (3, 'ROLE_LOGISTIC');


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: users; Owner: postgres
--

INSERT INTO users.user_roles VALUES (1, '47c429d0-897a-4c0f-a0dc-06816505b24c');
INSERT INTO users.user_roles VALUES (4, '747cc3d8-ba39-4e7f-a260-d4578f4fadc1');
INSERT INTO users.user_roles VALUES (2, '747cc3d8-ba39-4e7f-a260-d4578f4fadc1');
INSERT INTO users.user_roles VALUES (4, 'e4e62c48-9c4a-4bd1-8bdc-6a1767d5f83c');
INSERT INTO users.user_roles VALUES (2, 'e4e62c48-9c4a-4bd1-8bdc-6a1767d5f83c');
INSERT INTO users.user_roles VALUES (4, 'f47bbe83-40f3-4d78-baf6-df33475707a3');
INSERT INTO users.user_roles VALUES (3, 'f47bbe83-40f3-4d78-baf6-df33475707a3');
INSERT INTO users.user_roles VALUES (4, '6c5694e3-5093-4892-b5b7-383a20ece4a1');
INSERT INTO users.user_roles VALUES (3, '6c5694e3-5093-4892-b5b7-383a20ece4a1');
INSERT INTO users.user_roles VALUES (4, 'ce749530-2355-4452-9b12-4ee0daba1de6');
INSERT INTO users.user_roles VALUES (4, '7f37b68f-c7bb-4cb8-91ed-8060c08c091d');
INSERT INTO users.user_roles VALUES (4, 'be460dd4-1bd4-48cb-a405-62ec7211d460');
INSERT INTO users.user_roles VALUES (4, '325eca98-d48c-48d5-be9c-ab780d845c34');


--
-- Data for Name: users; Type: TABLE DATA; Schema: users; Owner: postgres
--

INSERT INTO users.users VALUES ('admin123', 'admin@monelia.com', '$2a$10$kDC0MAfVBOz6f1JIzqCv4eabxhjTe4pJ2jNSm08f23VirAQsE0EIq', true, '0000000000001', '47c429d0-897a-4c0f-a0dc-06816505b24c', NULL);
INSERT INTO users.users VALUES ('mod1', 'mod1@monelia.com', '$2a$10$6Q03fXA15FLZmX2w3Cc6xeme8GZpisq5xysrJTfvdI.npVvbgYsxi', true, '1000000000001', '747cc3d8-ba39-4e7f-a260-d4578f4fadc1', NULL);
INSERT INTO users.users VALUES ('mod2', 'mod2@monelia.com', '$2a$10$2xJGGg9KwibBlKvn67a0c.jmhsa7Omxu5ls0KzAZCepiO0dl9Bd9K', true, '1000000000002', 'e4e62c48-9c4a-4bd1-8bdc-6a1767d5f83c', NULL);
INSERT INTO users.users VALUES ('logic1', 'logic1@monelia.com', '$2a$10$EmRlE7izZAn0XrJHLQ3c1OTwFJEcWpF2SjnFa7X6/3ZItQJLUc.sa', true, '2000000000001', 'f47bbe83-40f3-4d78-baf6-df33475707a3', NULL);
INSERT INTO users.users VALUES ('logic2', 'logic2@monelia.com', '$2a$10$2TWTReaDFiW8HeCm4lw24.euDZeXOqqpdVMnOhPnOf/bFyqIDF9t6', true, '2000000000002', '6c5694e3-5093-4892-b5b7-383a20ece4a1', NULL);
INSERT INTO users.users VALUES ('user2', 'user2@monelia.com', '$2a$10$IvGKvFuNn6ZC8AhL.UWxqOTFV1SOhGUmJLw6XNWcBmkKXXsza/GFG', true, '3000000000002', '7f37b68f-c7bb-4cb8-91ed-8060c08c091d', 2);
INSERT INTO users.users VALUES ('user3', 'user3@monelia.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '3000000000003', 'be460dd4-1bd4-48cb-a405-62ec7211d460', 3);
INSERT INTO users.users VALUES ('user1', 'user12@gmail.com', '$2a$10$/Mjz8nBe7zquRuWUjvAuHuDAjgK9y9V73Z21siSAvQYSFhNl59ywS', true, '3000000000001', 'ce749530-2355-4452-9b12-4ee0daba1de6', 1);
INSERT INTO users.users VALUES ('user4', 'user4@monelia.com', '$2a$10$.0TMOmJoyig7FrIzFAaps.7qgzVdTgDh98PjrUQ7wzjPK/zizSpJO', true, '3000000000005', '325eca98-d48c-48d5-be9c-ab780d845c34', 4);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: products; Owner: postgres
--

SELECT pg_catalog.setval('products.category_id_seq', 6, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.cart_id_seq', 4, true);


--
-- Name: cart_item_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.cart_item_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: users; Owner: postgres
--

SELECT pg_catalog.setval('users.roles_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict KOtbhjFX1Plu1pPbwgdGfF2eTYOYdGKSTJJVS4xbWcsHSUzOtGTiAz928sBRrey

