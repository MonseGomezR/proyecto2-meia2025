--
-- PostgreSQL database dump
--

\restrict ANhOojLUrYoG1ClnuKhexGQoZ7M2Tj7E2qhgEHZYk4Yep8DQYqbSVGESkQ2Ufrf

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

DROP DATABASE ecommerce_db;
--
-- Name: ecommerce_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ecommerce_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Guatemala.1252';


ALTER DATABASE ecommerce_db OWNER TO postgres;

\unrestrict ANhOojLUrYoG1ClnuKhexGQoZ7M2Tj7E2qhgEHZYk4Yep8DQYqbSVGESkQ2Ufrf
\connect ecommerce_db
\restrict ANhOojLUrYoG1ClnuKhexGQoZ7M2Tj7E2qhgEHZYk4Yep8DQYqbSVGESkQ2Ufrf

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
-- Data for Name: logs; Type: TABLE DATA; Schema: admin; Owner: postgres
--



--
-- Data for Name: notification; Type: TABLE DATA; Schema: admin; Owner: postgres
--



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

INSERT INTO products.product VALUES ('44022242-5e33-44de-9f32-f9d6bac8a199', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 12.47, 6, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 10);
INSERT INTO products.product VALUES ('855e8449-35be-4b5d-9322-1a6d3446e7f0', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 17.99, 7, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 11);
INSERT INTO products.product VALUES ('aadfeebd-d97c-4850-aad3-e0056300a605', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 40.4, 8, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 12);
INSERT INTO products.product VALUES ('dacc0f9e-3cbf-46f5-9de2-4e85fd070014', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 105.58, 9, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 13);
INSERT INTO products.product VALUES ('2b4bac29-5d80-42a5-9b6b-b6b49249bd54', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 62.79, 10, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 14);
INSERT INTO products.product VALUES ('561982a8-aa30-4868-932e-fac819448330', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 72.69, 11, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 15);
INSERT INTO products.product VALUES ('bb7dac37-36d5-41e3-b7fa-b679d16489f0', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 86.51, 12, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 16);
INSERT INTO products.product VALUES ('52c966ca-e515-4715-a128-95d2a33ea994', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 28.64, 13, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 17);
INSERT INTO products.product VALUES ('d6411863-2879-4532-9d2d-f75170a01d5a', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 47.95, 14, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 18);
INSERT INTO products.product VALUES ('3a6703db-d0cf-4c07-bbc5-8e5a95b94315', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 101.34, 15, 'NEW', 'WAITING', 'e225a977-b3ca-49f7-a489-50693cccfe9e', '16:11:04.306386', 19);
INSERT INTO products.product VALUES ('fdba3b79-937b-4041-b768-d6f346220bad', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 48.34, 6, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 20);
INSERT INTO products.product VALUES ('40cc206d-108d-4071-9896-f33fa2f65959', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 99.37, 7, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 21);
INSERT INTO products.product VALUES ('2175d170-93aa-415b-ad11-64d249ba190c', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 22.78, 8, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 22);
INSERT INTO products.product VALUES ('f9f71405-8521-4546-b6e0-b318ff699241', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 81.23, 9, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 23);
INSERT INTO products.product VALUES ('c322a245-cadc-4716-8dd8-54429f00b110', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 39.83, 10, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 24);
INSERT INTO products.product VALUES ('59087f89-e0a4-4a98-a5ff-72aa6253f78a', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 58.94, 11, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 25);
INSERT INTO products.product VALUES ('768eeb5a-e031-4d2b-81cd-f486fe91ac10', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 41.03, 12, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 26);
INSERT INTO products.product VALUES ('4f2c88b7-e479-48fc-a1a2-3a75a4ee7f06', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 61.07, 13, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 27);
INSERT INTO products.product VALUES ('00acc967-556e-449a-a66c-8f1c3c09bbd8', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 24.31, 14, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 28);
INSERT INTO products.product VALUES ('129492a6-0454-4810-906f-464d5aef31bd', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 33.42, 15, 'NEW', 'WAITING', '99877352-463b-4465-90e9-e2b2dfc5130e', '16:11:04.306386', 29);
INSERT INTO products.product VALUES ('bda8f542-d2c5-45dc-9d5c-a5dd1c5653d7', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 13.11, 6, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 30);
INSERT INTO products.product VALUES ('5f8c86ac-3589-4dff-97b7-6c35df07b4a2', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 79.87, 7, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 31);
INSERT INTO products.product VALUES ('51b6efca-86d6-4218-b647-7c3b9c9c4950', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 91.08, 8, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 32);
INSERT INTO products.product VALUES ('fd382b66-0493-4b51-a6d0-c1e02c35d91c', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 55.86, 9, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 33);
INSERT INTO products.product VALUES ('31f512b4-b2d5-4a24-8447-1f4a10057a88', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 108.48, 10, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 34);
INSERT INTO products.product VALUES ('df4f60e7-0f0a-4e46-b652-fe51c84a201c', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 14.54, 11, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 35);
INSERT INTO products.product VALUES ('5aa866ad-66e9-46c0-b140-13e83d34e78e', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 100.36, 12, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 36);
INSERT INTO products.product VALUES ('d4f0503e-caa1-46af-a87c-e389c5203c78', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 58.25, 13, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 37);
INSERT INTO products.product VALUES ('9c27acb9-f0fc-4dee-bafc-6663a6900fce', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 77.1, 14, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 38);
INSERT INTO products.product VALUES ('03b30ed6-22e5-4f6e-b13b-7bc4217c57f8', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 43.93, 15, 'NEW', 'WAITING', 'fbb09610-21e9-4b97-a468-57f219850a78', '16:11:04.306386', 39);
INSERT INTO products.product VALUES ('c78614b4-3e29-4013-a8af-e9a531254038', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 109.53, 6, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 40);
INSERT INTO products.product VALUES ('0d502a92-49ad-46b3-b1ca-c0d25f5c28a5', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 109.49, 7, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 41);
INSERT INTO products.product VALUES ('6213645b-446c-452e-b43e-d8494d1b5e4e', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 22.46, 8, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 42);
INSERT INTO products.product VALUES ('3438c5b3-0f9f-4d42-8fa4-7141fa28481a', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 24.65, 9, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 43);
INSERT INTO products.product VALUES ('6ce7b250-b491-4dcb-b816-6cd83a4673e5', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 23.45, 10, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 44);
INSERT INTO products.product VALUES ('f6ad53d3-e46c-4232-9dfb-f5c12f3bb67f', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 71.96, 11, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 45);
INSERT INTO products.product VALUES ('8ebaadea-0a13-4eac-883c-50d4acd1666e', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 88.01, 12, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 46);
INSERT INTO products.product VALUES ('c8cbf9f9-19e7-4a86-91f9-292c3b61cdff', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 18.16, 13, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 47);
INSERT INTO products.product VALUES ('8043fc26-efea-4eda-8c75-488f7902a7ba', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 80.3, 14, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 48);
INSERT INTO products.product VALUES ('23197b2c-2f5c-4033-819f-a3ec01269727', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 58.94, 15, 'NEW', 'WAITING', '6f83d294-1914-4afa-ba9c-691af19890de', '16:11:04.306386', 49);
INSERT INTO products.product VALUES ('7e1d0b64-fa18-45cf-acfb-5f16b9d4ef94', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 51.31, 6, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 50);
INSERT INTO products.product VALUES ('89b2c3c5-fe94-44ec-88f3-90119879d3d9', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 61.74, 7, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 51);
INSERT INTO products.product VALUES ('858f3cec-00f8-4dbf-9350-91ad6b49b217', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 87.15, 8, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 52);
INSERT INTO products.product VALUES ('cd632aab-aa90-4a5f-ad5d-924972c4571e', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 21.82, 9, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 53);
INSERT INTO products.product VALUES ('774d5a82-c90d-4fe8-8afe-c62686ad5462', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 78.63, 10, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 54);
INSERT INTO products.product VALUES ('658b45b0-6a61-4433-8634-e6a11501a670', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 25.73, 11, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 55);
INSERT INTO products.product VALUES ('28b3cd8a-d996-4a01-a0b0-4c42339f7786', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 47.94, 12, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 56);
INSERT INTO products.product VALUES ('49c56f3f-abdb-4287-8a16-8842adee546e', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 74.45, 13, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 57);
INSERT INTO products.product VALUES ('e48b9ce8-c899-4f5d-be86-ddb78ebc094e', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 84.38, 14, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 58);
INSERT INTO products.product VALUES ('92d972c9-7000-47c4-8fb3-8b7fcc18365d', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 12.09, 15, 'NEW', 'WAITING', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', '16:11:04.306386', 59);
INSERT INTO products.product VALUES ('1efa96f2-bb9a-49d6-a111-18fbea57db73', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 10.45, 6, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 60);
INSERT INTO products.product VALUES ('8d933466-3ce1-4017-82e6-2e8e43067528', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 55.94, 7, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 61);
INSERT INTO products.product VALUES ('03ca4460-08c7-42ab-888d-2facd410f0fe', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 81.57, 8, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 62);
INSERT INTO products.product VALUES ('89201103-91d0-4bb7-81ce-2c4b244d5ab9', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 17.09, 9, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 63);
INSERT INTO products.product VALUES ('6228997d-6e04-456c-9c0c-65b37f069197', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 11.52, 10, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 64);
INSERT INTO products.product VALUES ('128a9b4c-9f07-4af5-861c-090c7fa9774b', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 49.04, 11, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 65);
INSERT INTO products.product VALUES ('2c682370-07e4-4451-9067-046f8c36c94e', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 92.36, 12, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 66);
INSERT INTO products.product VALUES ('69c3bc2b-f6c7-4612-8ec3-b355ff38e9e1', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 47.93, 13, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 67);
INSERT INTO products.product VALUES ('4d4e527a-b91d-4bcd-b564-cf92ceb46358', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 68.57, 14, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 68);
INSERT INTO products.product VALUES ('d54dfc4a-bafd-4af1-b88e-aea22c64663d', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 28.97, 15, 'NEW', 'WAITING', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', '16:11:04.306386', 69);
INSERT INTO products.product VALUES ('dd1ddc53-6fd0-4731-b0c3-e77b0e0dd90c', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 54.65, 6, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 70);
INSERT INTO products.product VALUES ('c5672211-e56e-4479-bce9-f0f9ecfb27f7', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 63.4, 7, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 71);
INSERT INTO products.product VALUES ('6141afe8-eb54-4356-909a-9b4f6a869c38', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 67.8, 8, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 72);
INSERT INTO products.product VALUES ('1edc7c8a-ff29-421f-8872-4585863f0892', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 14.64, 9, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 73);
INSERT INTO products.product VALUES ('e91597f0-f0ca-4087-8b58-928b0880b3d1', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 43.56, 10, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 74);
INSERT INTO products.product VALUES ('6e6ad10f-44f2-4689-a338-89c2b9943e0d', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 107.7, 11, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 75);
INSERT INTO products.product VALUES ('24d0be04-9ed5-4a35-8f82-0d5780beca03', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 67.73, 12, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 76);
INSERT INTO products.product VALUES ('97da61a2-02ff-473b-9866-13ef1d06e8c3', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 20.52, 13, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 77);
INSERT INTO products.product VALUES ('3a4af4e8-a975-4608-9cf6-60d2ecdbf863', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 84.79, 14, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 78);
INSERT INTO products.product VALUES ('3d51e47d-7a9b-4ed2-b3e7-385071e46ae1', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 90.74, 15, 'NEW', 'WAITING', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', '16:11:04.306386', 79);
INSERT INTO products.product VALUES ('f199228f-ea6e-4dc8-a102-a8955bdad55d', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 54.02, 6, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 80);
INSERT INTO products.product VALUES ('ea0f7e42-aa15-409a-8556-0b6ec30bd743', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 28.63, 7, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 81);
INSERT INTO products.product VALUES ('04fc3310-a549-422c-aed3-e02dcb24284c', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 39.35, 8, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 82);
INSERT INTO products.product VALUES ('ae8121c1-a930-4b2d-bc7a-934b999983a8', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 41.2, 9, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 83);
INSERT INTO products.product VALUES ('541d29d5-f905-4468-91aa-d63d51366f2a', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 94.11, 10, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 84);
INSERT INTO products.product VALUES ('60fecc0c-7e6b-4741-a345-eae4197b308f', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 105.62, 11, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 85);
INSERT INTO products.product VALUES ('b961ae01-e40a-443a-8ac9-c291715894d7', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 22.36, 12, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 86);
INSERT INTO products.product VALUES ('806b4d09-40ee-4b05-95b0-024e7382a2e4', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 106.93, 13, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 87);
INSERT INTO products.product VALUES ('11224714-b87c-4991-b35a-5267e673b984', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 68.05, 14, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 88);
INSERT INTO products.product VALUES ('a2189fbb-9462-49f5-a59c-53eda5a47113', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 34.87, 15, 'NEW', 'WAITING', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', '16:11:04.306386', 89);
INSERT INTO products.product VALUES ('1061da2a-5c71-47a2-bfc0-76211b97d8f5', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 17.08, 6, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 90);
INSERT INTO products.product VALUES ('435dec2d-df5e-4e80-b7d3-38fa06d58ee2', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 18.46, 7, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 91);
INSERT INTO products.product VALUES ('e65855fd-61b1-4ce1-871b-4c9e44860b69', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 36.12, 8, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 92);
INSERT INTO products.product VALUES ('05e3094c-5640-40ff-920e-335a0778333b', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 47.71, 9, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 93);
INSERT INTO products.product VALUES ('d23df9ea-f462-4d92-9f9c-1eb913b03d1f', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 100.6, 10, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 94);
INSERT INTO products.product VALUES ('ed273659-a04a-4896-8667-c70aaa5c295b', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 84.91, 11, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 95);
INSERT INTO products.product VALUES ('85e9e91c-e412-43eb-be84-0c2292f69138', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 33.28, 12, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 96);
INSERT INTO products.product VALUES ('9e246fcc-31d8-4e24-a462-0b33feb1325d', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 83.08, 13, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 97);
INSERT INTO products.product VALUES ('6d85e199-7623-4ab2-bc47-b994b197742f', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 77.1, 14, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 98);
INSERT INTO products.product VALUES ('151177dd-798c-424c-a0d3-c51e585a556f', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 56.42, 15, 'NEW', 'WAITING', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', '16:11:04.306386', 99);
INSERT INTO products.product VALUES ('48ecdad9-3617-47ac-bfcf-8d9fb67ef805', 'Camisa Casual', 'Camisa cómoda y moderna para uso diario.', 'https://i.imgur.com/fNYRW3M.png', 84.28, 6, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 100);
INSERT INTO products.product VALUES ('695c5d1e-e398-4584-9262-9ae68fab8991', 'Zapatos Deportivos', 'Zapatos ligeros ideales para correr y entrenar.', 'https://i.imgur.com/fNYRW3M.png', 28.02, 7, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 101);
INSERT INTO products.product VALUES ('4f7b1699-a689-4d05-adad-3180e546e27c', 'Bolso de Cuero', 'Bolso de cuero elegante y resistente.', 'https://i.imgur.com/fNYRW3M.png', 82.76, 8, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 102);
INSERT INTO products.product VALUES ('8cb340c9-a21b-4e03-adb9-1fd95ed8f4f7', 'Reloj Analógico', 'Reloj clásico con correa de cuero.', 'https://i.imgur.com/fNYRW3M.png', 81.13, 9, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 103);
INSERT INTO products.product VALUES ('7cc94e28-8f51-4dc8-a14f-2ad7fa228e53', 'Gorra de Verano', 'Gorra fresca perfecta para el verano.', 'https://i.imgur.com/fNYRW3M.png', 66.99, 10, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 104);
INSERT INTO products.product VALUES ('a47d8a09-a43d-44ac-ba1e-0e1c7b5e059f', 'Pantalón Jeans', 'Jeans resistentes de corte moderno.', 'https://i.imgur.com/fNYRW3M.png', 59.82, 11, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 105);
INSERT INTO products.product VALUES ('192edf46-5f35-4a7f-9504-ddbd2e1d6c8b', 'Chaqueta Ligera', 'Chaqueta ligera para climas templados.', 'https://i.imgur.com/fNYRW3M.png', 64.71, 12, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 106);
INSERT INTO products.product VALUES ('05d2fcf0-a0e5-4757-be31-23390efe85b1', 'Auriculares Inalámbricos', 'Auriculares con sonido claro y batería duradera.', 'https://i.imgur.com/fNYRW3M.png', 76.4, 13, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 107);
INSERT INTO products.product VALUES ('bae2632b-7011-4b3d-9d29-adb0beab862a', 'Libro de Aventuras', 'Libro emocionante lleno de aventuras.', 'https://i.imgur.com/fNYRW3M.png', 90.85, 14, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 108);
INSERT INTO products.product VALUES ('d8ecd521-9e4f-4528-b2c9-59e0e67baf8f', 'Mochila Escolar', 'Mochila práctica con varios compartimentos.', 'https://i.imgur.com/fNYRW3M.png', 67.14, 15, 'NEW', 'WAITING', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', '16:11:04.306386', 109);


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
INSERT INTO products.product_category VALUES ('4c2909cc-dba7-43e5-951b-4a9bb9306e48', 6);
INSERT INTO products.product_category VALUES ('4c2909cc-dba7-43e5-951b-4a9bb9306e48', 2);
INSERT INTO products.product_category VALUES ('44022242-5e33-44de-9f32-f9d6bac8a199', 2);
INSERT INTO products.product_category VALUES ('44022242-5e33-44de-9f32-f9d6bac8a199', 5);
INSERT INTO products.product_category VALUES ('44022242-5e33-44de-9f32-f9d6bac8a199', 6);
INSERT INTO products.product_category VALUES ('855e8449-35be-4b5d-9322-1a6d3446e7f0', 5);
INSERT INTO products.product_category VALUES ('855e8449-35be-4b5d-9322-1a6d3446e7f0', 6);
INSERT INTO products.product_category VALUES ('aadfeebd-d97c-4850-aad3-e0056300a605', 6);
INSERT INTO products.product_category VALUES ('dacc0f9e-3cbf-46f5-9de2-4e85fd070014', 1);
INSERT INTO products.product_category VALUES ('2b4bac29-5d80-42a5-9b6b-b6b49249bd54', 4);
INSERT INTO products.product_category VALUES ('2b4bac29-5d80-42a5-9b6b-b6b49249bd54', 6);
INSERT INTO products.product_category VALUES ('2b4bac29-5d80-42a5-9b6b-b6b49249bd54', 3);
INSERT INTO products.product_category VALUES ('561982a8-aa30-4868-932e-fac819448330', 4);
INSERT INTO products.product_category VALUES ('561982a8-aa30-4868-932e-fac819448330', 6);
INSERT INTO products.product_category VALUES ('561982a8-aa30-4868-932e-fac819448330', 1);
INSERT INTO products.product_category VALUES ('bb7dac37-36d5-41e3-b7fa-b679d16489f0', 5);
INSERT INTO products.product_category VALUES ('bb7dac37-36d5-41e3-b7fa-b679d16489f0', 2);
INSERT INTO products.product_category VALUES ('bb7dac37-36d5-41e3-b7fa-b679d16489f0', 1);
INSERT INTO products.product_category VALUES ('52c966ca-e515-4715-a128-95d2a33ea994', 6);
INSERT INTO products.product_category VALUES ('d6411863-2879-4532-9d2d-f75170a01d5a', 3);
INSERT INTO products.product_category VALUES ('3a6703db-d0cf-4c07-bbc5-8e5a95b94315', 2);
INSERT INTO products.product_category VALUES ('3a6703db-d0cf-4c07-bbc5-8e5a95b94315', 6);
INSERT INTO products.product_category VALUES ('fdba3b79-937b-4041-b768-d6f346220bad', 5);
INSERT INTO products.product_category VALUES ('40cc206d-108d-4071-9896-f33fa2f65959', 5);
INSERT INTO products.product_category VALUES ('2175d170-93aa-415b-ad11-64d249ba190c', 6);
INSERT INTO products.product_category VALUES ('2175d170-93aa-415b-ad11-64d249ba190c', 3);
INSERT INTO products.product_category VALUES ('2175d170-93aa-415b-ad11-64d249ba190c', 2);
INSERT INTO products.product_category VALUES ('f9f71405-8521-4546-b6e0-b318ff699241', 2);
INSERT INTO products.product_category VALUES ('f9f71405-8521-4546-b6e0-b318ff699241', 1);
INSERT INTO products.product_category VALUES ('c322a245-cadc-4716-8dd8-54429f00b110', 6);
INSERT INTO products.product_category VALUES ('c322a245-cadc-4716-8dd8-54429f00b110', 5);
INSERT INTO products.product_category VALUES ('c322a245-cadc-4716-8dd8-54429f00b110', 4);
INSERT INTO products.product_category VALUES ('59087f89-e0a4-4a98-a5ff-72aa6253f78a', 4);
INSERT INTO products.product_category VALUES ('59087f89-e0a4-4a98-a5ff-72aa6253f78a', 2);
INSERT INTO products.product_category VALUES ('768eeb5a-e031-4d2b-81cd-f486fe91ac10', 4);
INSERT INTO products.product_category VALUES ('4f2c88b7-e479-48fc-a1a2-3a75a4ee7f06', 6);
INSERT INTO products.product_category VALUES ('4f2c88b7-e479-48fc-a1a2-3a75a4ee7f06', 3);
INSERT INTO products.product_category VALUES ('4f2c88b7-e479-48fc-a1a2-3a75a4ee7f06', 4);
INSERT INTO products.product_category VALUES ('00acc967-556e-449a-a66c-8f1c3c09bbd8', 5);
INSERT INTO products.product_category VALUES ('129492a6-0454-4810-906f-464d5aef31bd', 5);
INSERT INTO products.product_category VALUES ('bda8f542-d2c5-45dc-9d5c-a5dd1c5653d7', 6);
INSERT INTO products.product_category VALUES ('5f8c86ac-3589-4dff-97b7-6c35df07b4a2', 3);
INSERT INTO products.product_category VALUES ('5f8c86ac-3589-4dff-97b7-6c35df07b4a2', 5);
INSERT INTO products.product_category VALUES ('51b6efca-86d6-4218-b647-7c3b9c9c4950', 5);
INSERT INTO products.product_category VALUES ('51b6efca-86d6-4218-b647-7c3b9c9c4950', 3);
INSERT INTO products.product_category VALUES ('51b6efca-86d6-4218-b647-7c3b9c9c4950', 2);
INSERT INTO products.product_category VALUES ('fd382b66-0493-4b51-a6d0-c1e02c35d91c', 6);
INSERT INTO products.product_category VALUES ('fd382b66-0493-4b51-a6d0-c1e02c35d91c', 5);
INSERT INTO products.product_category VALUES ('31f512b4-b2d5-4a24-8447-1f4a10057a88', 3);
INSERT INTO products.product_category VALUES ('31f512b4-b2d5-4a24-8447-1f4a10057a88', 4);
INSERT INTO products.product_category VALUES ('df4f60e7-0f0a-4e46-b652-fe51c84a201c', 3);
INSERT INTO products.product_category VALUES ('df4f60e7-0f0a-4e46-b652-fe51c84a201c', 2);
INSERT INTO products.product_category VALUES ('5aa866ad-66e9-46c0-b140-13e83d34e78e', 2);
INSERT INTO products.product_category VALUES ('d4f0503e-caa1-46af-a87c-e389c5203c78', 5);
INSERT INTO products.product_category VALUES ('d4f0503e-caa1-46af-a87c-e389c5203c78', 1);
INSERT INTO products.product_category VALUES ('9c27acb9-f0fc-4dee-bafc-6663a6900fce', 3);
INSERT INTO products.product_category VALUES ('9c27acb9-f0fc-4dee-bafc-6663a6900fce', 2);
INSERT INTO products.product_category VALUES ('9c27acb9-f0fc-4dee-bafc-6663a6900fce', 5);
INSERT INTO products.product_category VALUES ('03b30ed6-22e5-4f6e-b13b-7bc4217c57f8', 6);
INSERT INTO products.product_category VALUES ('03b30ed6-22e5-4f6e-b13b-7bc4217c57f8', 5);
INSERT INTO products.product_category VALUES ('c78614b4-3e29-4013-a8af-e9a531254038', 6);
INSERT INTO products.product_category VALUES ('c78614b4-3e29-4013-a8af-e9a531254038', 1);
INSERT INTO products.product_category VALUES ('0d502a92-49ad-46b3-b1ca-c0d25f5c28a5', 3);
INSERT INTO products.product_category VALUES ('0d502a92-49ad-46b3-b1ca-c0d25f5c28a5', 4);
INSERT INTO products.product_category VALUES ('0d502a92-49ad-46b3-b1ca-c0d25f5c28a5', 6);
INSERT INTO products.product_category VALUES ('6213645b-446c-452e-b43e-d8494d1b5e4e', 6);
INSERT INTO products.product_category VALUES ('6213645b-446c-452e-b43e-d8494d1b5e4e', 3);
INSERT INTO products.product_category VALUES ('6213645b-446c-452e-b43e-d8494d1b5e4e', 4);
INSERT INTO products.product_category VALUES ('3438c5b3-0f9f-4d42-8fa4-7141fa28481a', 1);
INSERT INTO products.product_category VALUES ('3438c5b3-0f9f-4d42-8fa4-7141fa28481a', 5);
INSERT INTO products.product_category VALUES ('3438c5b3-0f9f-4d42-8fa4-7141fa28481a', 4);
INSERT INTO products.product_category VALUES ('6ce7b250-b491-4dcb-b816-6cd83a4673e5', 3);
INSERT INTO products.product_category VALUES ('f6ad53d3-e46c-4232-9dfb-f5c12f3bb67f', 4);
INSERT INTO products.product_category VALUES ('8ebaadea-0a13-4eac-883c-50d4acd1666e', 2);
INSERT INTO products.product_category VALUES ('8ebaadea-0a13-4eac-883c-50d4acd1666e', 6);
INSERT INTO products.product_category VALUES ('8ebaadea-0a13-4eac-883c-50d4acd1666e', 5);
INSERT INTO products.product_category VALUES ('c8cbf9f9-19e7-4a86-91f9-292c3b61cdff', 1);
INSERT INTO products.product_category VALUES ('c8cbf9f9-19e7-4a86-91f9-292c3b61cdff', 4);
INSERT INTO products.product_category VALUES ('8043fc26-efea-4eda-8c75-488f7902a7ba', 2);
INSERT INTO products.product_category VALUES ('23197b2c-2f5c-4033-819f-a3ec01269727', 2);
INSERT INTO products.product_category VALUES ('23197b2c-2f5c-4033-819f-a3ec01269727', 1);
INSERT INTO products.product_category VALUES ('23197b2c-2f5c-4033-819f-a3ec01269727', 5);
INSERT INTO products.product_category VALUES ('7e1d0b64-fa18-45cf-acfb-5f16b9d4ef94', 6);
INSERT INTO products.product_category VALUES ('89b2c3c5-fe94-44ec-88f3-90119879d3d9', 1);
INSERT INTO products.product_category VALUES ('89b2c3c5-fe94-44ec-88f3-90119879d3d9', 2);
INSERT INTO products.product_category VALUES ('89b2c3c5-fe94-44ec-88f3-90119879d3d9', 4);
INSERT INTO products.product_category VALUES ('858f3cec-00f8-4dbf-9350-91ad6b49b217', 4);
INSERT INTO products.product_category VALUES ('858f3cec-00f8-4dbf-9350-91ad6b49b217', 5);
INSERT INTO products.product_category VALUES ('cd632aab-aa90-4a5f-ad5d-924972c4571e', 1);
INSERT INTO products.product_category VALUES ('cd632aab-aa90-4a5f-ad5d-924972c4571e', 6);
INSERT INTO products.product_category VALUES ('cd632aab-aa90-4a5f-ad5d-924972c4571e', 3);
INSERT INTO products.product_category VALUES ('774d5a82-c90d-4fe8-8afe-c62686ad5462', 4);
INSERT INTO products.product_category VALUES ('774d5a82-c90d-4fe8-8afe-c62686ad5462', 3);
INSERT INTO products.product_category VALUES ('658b45b0-6a61-4433-8634-e6a11501a670', 4);
INSERT INTO products.product_category VALUES ('658b45b0-6a61-4433-8634-e6a11501a670', 3);
INSERT INTO products.product_category VALUES ('28b3cd8a-d996-4a01-a0b0-4c42339f7786', 2);
INSERT INTO products.product_category VALUES ('28b3cd8a-d996-4a01-a0b0-4c42339f7786', 5);
INSERT INTO products.product_category VALUES ('49c56f3f-abdb-4287-8a16-8842adee546e', 6);
INSERT INTO products.product_category VALUES ('49c56f3f-abdb-4287-8a16-8842adee546e', 5);
INSERT INTO products.product_category VALUES ('49c56f3f-abdb-4287-8a16-8842adee546e', 3);
INSERT INTO products.product_category VALUES ('e48b9ce8-c899-4f5d-be86-ddb78ebc094e', 4);
INSERT INTO products.product_category VALUES ('e48b9ce8-c899-4f5d-be86-ddb78ebc094e', 5);
INSERT INTO products.product_category VALUES ('e48b9ce8-c899-4f5d-be86-ddb78ebc094e', 6);
INSERT INTO products.product_category VALUES ('92d972c9-7000-47c4-8fb3-8b7fcc18365d', 4);
INSERT INTO products.product_category VALUES ('92d972c9-7000-47c4-8fb3-8b7fcc18365d', 3);
INSERT INTO products.product_category VALUES ('92d972c9-7000-47c4-8fb3-8b7fcc18365d', 5);
INSERT INTO products.product_category VALUES ('1efa96f2-bb9a-49d6-a111-18fbea57db73', 4);
INSERT INTO products.product_category VALUES ('8d933466-3ce1-4017-82e6-2e8e43067528', 3);
INSERT INTO products.product_category VALUES ('8d933466-3ce1-4017-82e6-2e8e43067528', 5);
INSERT INTO products.product_category VALUES ('03ca4460-08c7-42ab-888d-2facd410f0fe', 5);
INSERT INTO products.product_category VALUES ('03ca4460-08c7-42ab-888d-2facd410f0fe', 6);
INSERT INTO products.product_category VALUES ('03ca4460-08c7-42ab-888d-2facd410f0fe', 3);
INSERT INTO products.product_category VALUES ('89201103-91d0-4bb7-81ce-2c4b244d5ab9', 4);
INSERT INTO products.product_category VALUES ('89201103-91d0-4bb7-81ce-2c4b244d5ab9', 5);
INSERT INTO products.product_category VALUES ('89201103-91d0-4bb7-81ce-2c4b244d5ab9', 2);
INSERT INTO products.product_category VALUES ('6228997d-6e04-456c-9c0c-65b37f069197', 6);
INSERT INTO products.product_category VALUES ('6228997d-6e04-456c-9c0c-65b37f069197', 2);
INSERT INTO products.product_category VALUES ('128a9b4c-9f07-4af5-861c-090c7fa9774b', 2);
INSERT INTO products.product_category VALUES ('128a9b4c-9f07-4af5-861c-090c7fa9774b', 6);
INSERT INTO products.product_category VALUES ('2c682370-07e4-4451-9067-046f8c36c94e', 2);
INSERT INTO products.product_category VALUES ('69c3bc2b-f6c7-4612-8ec3-b355ff38e9e1', 3);
INSERT INTO products.product_category VALUES ('69c3bc2b-f6c7-4612-8ec3-b355ff38e9e1', 1);
INSERT INTO products.product_category VALUES ('69c3bc2b-f6c7-4612-8ec3-b355ff38e9e1', 6);
INSERT INTO products.product_category VALUES ('4d4e527a-b91d-4bcd-b564-cf92ceb46358', 2);
INSERT INTO products.product_category VALUES ('4d4e527a-b91d-4bcd-b564-cf92ceb46358', 1);
INSERT INTO products.product_category VALUES ('4d4e527a-b91d-4bcd-b564-cf92ceb46358', 4);
INSERT INTO products.product_category VALUES ('d54dfc4a-bafd-4af1-b88e-aea22c64663d', 1);
INSERT INTO products.product_category VALUES ('dd1ddc53-6fd0-4731-b0c3-e77b0e0dd90c', 3);
INSERT INTO products.product_category VALUES ('c5672211-e56e-4479-bce9-f0f9ecfb27f7', 3);
INSERT INTO products.product_category VALUES ('c5672211-e56e-4479-bce9-f0f9ecfb27f7', 5);
INSERT INTO products.product_category VALUES ('c5672211-e56e-4479-bce9-f0f9ecfb27f7', 2);
INSERT INTO products.product_category VALUES ('6141afe8-eb54-4356-909a-9b4f6a869c38', 1);
INSERT INTO products.product_category VALUES ('6141afe8-eb54-4356-909a-9b4f6a869c38', 5);
INSERT INTO products.product_category VALUES ('1edc7c8a-ff29-421f-8872-4585863f0892', 4);
INSERT INTO products.product_category VALUES ('e91597f0-f0ca-4087-8b58-928b0880b3d1', 4);
INSERT INTO products.product_category VALUES ('e91597f0-f0ca-4087-8b58-928b0880b3d1', 6);
INSERT INTO products.product_category VALUES ('e91597f0-f0ca-4087-8b58-928b0880b3d1', 1);
INSERT INTO products.product_category VALUES ('6e6ad10f-44f2-4689-a338-89c2b9943e0d', 4);
INSERT INTO products.product_category VALUES ('6e6ad10f-44f2-4689-a338-89c2b9943e0d', 2);
INSERT INTO products.product_category VALUES ('24d0be04-9ed5-4a35-8f82-0d5780beca03', 2);
INSERT INTO products.product_category VALUES ('97da61a2-02ff-473b-9866-13ef1d06e8c3', 1);
INSERT INTO products.product_category VALUES ('97da61a2-02ff-473b-9866-13ef1d06e8c3', 5);
INSERT INTO products.product_category VALUES ('3a4af4e8-a975-4608-9cf6-60d2ecdbf863', 2);
INSERT INTO products.product_category VALUES ('3a4af4e8-a975-4608-9cf6-60d2ecdbf863', 3);
INSERT INTO products.product_category VALUES ('3d51e47d-7a9b-4ed2-b3e7-385071e46ae1', 5);
INSERT INTO products.product_category VALUES ('3d51e47d-7a9b-4ed2-b3e7-385071e46ae1', 3);
INSERT INTO products.product_category VALUES ('3d51e47d-7a9b-4ed2-b3e7-385071e46ae1', 6);
INSERT INTO products.product_category VALUES ('f199228f-ea6e-4dc8-a102-a8955bdad55d', 5);
INSERT INTO products.product_category VALUES ('ea0f7e42-aa15-409a-8556-0b6ec30bd743', 6);
INSERT INTO products.product_category VALUES ('04fc3310-a549-422c-aed3-e02dcb24284c', 6);
INSERT INTO products.product_category VALUES ('04fc3310-a549-422c-aed3-e02dcb24284c', 3);
INSERT INTO products.product_category VALUES ('ae8121c1-a930-4b2d-bc7a-934b999983a8', 6);
INSERT INTO products.product_category VALUES ('ae8121c1-a930-4b2d-bc7a-934b999983a8', 4);
INSERT INTO products.product_category VALUES ('ae8121c1-a930-4b2d-bc7a-934b999983a8', 2);
INSERT INTO products.product_category VALUES ('541d29d5-f905-4468-91aa-d63d51366f2a', 3);
INSERT INTO products.product_category VALUES ('541d29d5-f905-4468-91aa-d63d51366f2a', 6);
INSERT INTO products.product_category VALUES ('541d29d5-f905-4468-91aa-d63d51366f2a', 5);
INSERT INTO products.product_category VALUES ('60fecc0c-7e6b-4741-a345-eae4197b308f', 2);
INSERT INTO products.product_category VALUES ('60fecc0c-7e6b-4741-a345-eae4197b308f', 4);
INSERT INTO products.product_category VALUES ('60fecc0c-7e6b-4741-a345-eae4197b308f', 6);
INSERT INTO products.product_category VALUES ('b961ae01-e40a-443a-8ac9-c291715894d7', 3);
INSERT INTO products.product_category VALUES ('806b4d09-40ee-4b05-95b0-024e7382a2e4', 1);
INSERT INTO products.product_category VALUES ('806b4d09-40ee-4b05-95b0-024e7382a2e4', 4);
INSERT INTO products.product_category VALUES ('806b4d09-40ee-4b05-95b0-024e7382a2e4', 2);
INSERT INTO products.product_category VALUES ('11224714-b87c-4991-b35a-5267e673b984', 3);
INSERT INTO products.product_category VALUES ('11224714-b87c-4991-b35a-5267e673b984', 6);
INSERT INTO products.product_category VALUES ('a2189fbb-9462-49f5-a59c-53eda5a47113', 6);
INSERT INTO products.product_category VALUES ('a2189fbb-9462-49f5-a59c-53eda5a47113', 1);
INSERT INTO products.product_category VALUES ('a2189fbb-9462-49f5-a59c-53eda5a47113', 2);
INSERT INTO products.product_category VALUES ('1061da2a-5c71-47a2-bfc0-76211b97d8f5', 4);
INSERT INTO products.product_category VALUES ('1061da2a-5c71-47a2-bfc0-76211b97d8f5', 3);
INSERT INTO products.product_category VALUES ('435dec2d-df5e-4e80-b7d3-38fa06d58ee2', 1);
INSERT INTO products.product_category VALUES ('435dec2d-df5e-4e80-b7d3-38fa06d58ee2', 6);
INSERT INTO products.product_category VALUES ('435dec2d-df5e-4e80-b7d3-38fa06d58ee2', 3);
INSERT INTO products.product_category VALUES ('e65855fd-61b1-4ce1-871b-4c9e44860b69', 4);
INSERT INTO products.product_category VALUES ('05e3094c-5640-40ff-920e-335a0778333b', 5);
INSERT INTO products.product_category VALUES ('05e3094c-5640-40ff-920e-335a0778333b', 6);
INSERT INTO products.product_category VALUES ('05e3094c-5640-40ff-920e-335a0778333b', 1);
INSERT INTO products.product_category VALUES ('d23df9ea-f462-4d92-9f9c-1eb913b03d1f', 6);
INSERT INTO products.product_category VALUES ('d23df9ea-f462-4d92-9f9c-1eb913b03d1f', 4);
INSERT INTO products.product_category VALUES ('ed273659-a04a-4896-8667-c70aaa5c295b', 2);
INSERT INTO products.product_category VALUES ('85e9e91c-e412-43eb-be84-0c2292f69138', 2);
INSERT INTO products.product_category VALUES ('85e9e91c-e412-43eb-be84-0c2292f69138', 6);
INSERT INTO products.product_category VALUES ('9e246fcc-31d8-4e24-a462-0b33feb1325d', 6);
INSERT INTO products.product_category VALUES ('9e246fcc-31d8-4e24-a462-0b33feb1325d', 2);
INSERT INTO products.product_category VALUES ('6d85e199-7623-4ab2-bc47-b994b197742f', 4);
INSERT INTO products.product_category VALUES ('6d85e199-7623-4ab2-bc47-b994b197742f', 5);
INSERT INTO products.product_category VALUES ('151177dd-798c-424c-a0d3-c51e585a556f', 1);
INSERT INTO products.product_category VALUES ('151177dd-798c-424c-a0d3-c51e585a556f', 2);
INSERT INTO products.product_category VALUES ('151177dd-798c-424c-a0d3-c51e585a556f', 6);
INSERT INTO products.product_category VALUES ('48ecdad9-3617-47ac-bfcf-8d9fb67ef805', 5);
INSERT INTO products.product_category VALUES ('695c5d1e-e398-4584-9262-9ae68fab8991', 6);
INSERT INTO products.product_category VALUES ('695c5d1e-e398-4584-9262-9ae68fab8991', 3);
INSERT INTO products.product_category VALUES ('4f7b1699-a689-4d05-adad-3180e546e27c', 5);
INSERT INTO products.product_category VALUES ('4f7b1699-a689-4d05-adad-3180e546e27c', 3);
INSERT INTO products.product_category VALUES ('8cb340c9-a21b-4e03-adb9-1fd95ed8f4f7', 2);
INSERT INTO products.product_category VALUES ('8cb340c9-a21b-4e03-adb9-1fd95ed8f4f7', 6);
INSERT INTO products.product_category VALUES ('7cc94e28-8f51-4dc8-a14f-2ad7fa228e53', 3);
INSERT INTO products.product_category VALUES ('7cc94e28-8f51-4dc8-a14f-2ad7fa228e53', 4);
INSERT INTO products.product_category VALUES ('a47d8a09-a43d-44ac-ba1e-0e1c7b5e059f', 3);
INSERT INTO products.product_category VALUES ('a47d8a09-a43d-44ac-ba1e-0e1c7b5e059f', 1);
INSERT INTO products.product_category VALUES ('a47d8a09-a43d-44ac-ba1e-0e1c7b5e059f', 6);
INSERT INTO products.product_category VALUES ('192edf46-5f35-4a7f-9504-ddbd2e1d6c8b', 2);
INSERT INTO products.product_category VALUES ('192edf46-5f35-4a7f-9504-ddbd2e1d6c8b', 3);
INSERT INTO products.product_category VALUES ('05d2fcf0-a0e5-4757-be31-23390efe85b1', 3);
INSERT INTO products.product_category VALUES ('bae2632b-7011-4b3d-9d29-adb0beab862a', 4);
INSERT INTO products.product_category VALUES ('bae2632b-7011-4b3d-9d29-adb0beab862a', 5);
INSERT INTO products.product_category VALUES ('bae2632b-7011-4b3d-9d29-adb0beab862a', 3);
INSERT INTO products.product_category VALUES ('d8ecd521-9e4f-4528-b2c9-59e0e67baf8f', 5);
INSERT INTO products.product_category VALUES ('d8ecd521-9e4f-4528-b2c9-59e0e67baf8f', 2);


--
-- Data for Name: review; Type: TABLE DATA; Schema: products; Owner: postgres
--

INSERT INTO products.review VALUES (10, 0);
INSERT INTO products.review VALUES (11, 0);
INSERT INTO products.review VALUES (12, 0);
INSERT INTO products.review VALUES (13, 0);
INSERT INTO products.review VALUES (14, 0);
INSERT INTO products.review VALUES (15, 0);
INSERT INTO products.review VALUES (16, 0);
INSERT INTO products.review VALUES (17, 0);
INSERT INTO products.review VALUES (18, 0);
INSERT INTO products.review VALUES (19, 0);
INSERT INTO products.review VALUES (20, 0);
INSERT INTO products.review VALUES (21, 0);
INSERT INTO products.review VALUES (22, 0);
INSERT INTO products.review VALUES (23, 0);
INSERT INTO products.review VALUES (24, 0);
INSERT INTO products.review VALUES (25, 0);
INSERT INTO products.review VALUES (26, 0);
INSERT INTO products.review VALUES (27, 0);
INSERT INTO products.review VALUES (28, 0);
INSERT INTO products.review VALUES (29, 0);
INSERT INTO products.review VALUES (30, 0);
INSERT INTO products.review VALUES (31, 0);
INSERT INTO products.review VALUES (32, 0);
INSERT INTO products.review VALUES (33, 0);
INSERT INTO products.review VALUES (34, 0);
INSERT INTO products.review VALUES (35, 0);
INSERT INTO products.review VALUES (36, 0);
INSERT INTO products.review VALUES (37, 0);
INSERT INTO products.review VALUES (38, 0);
INSERT INTO products.review VALUES (39, 0);
INSERT INTO products.review VALUES (40, 0);
INSERT INTO products.review VALUES (41, 0);
INSERT INTO products.review VALUES (42, 0);
INSERT INTO products.review VALUES (43, 0);
INSERT INTO products.review VALUES (44, 0);
INSERT INTO products.review VALUES (45, 0);
INSERT INTO products.review VALUES (46, 0);
INSERT INTO products.review VALUES (47, 0);
INSERT INTO products.review VALUES (48, 0);
INSERT INTO products.review VALUES (49, 0);
INSERT INTO products.review VALUES (50, 0);
INSERT INTO products.review VALUES (51, 0);
INSERT INTO products.review VALUES (52, 0);
INSERT INTO products.review VALUES (53, 0);
INSERT INTO products.review VALUES (54, 0);
INSERT INTO products.review VALUES (55, 0);
INSERT INTO products.review VALUES (56, 0);
INSERT INTO products.review VALUES (57, 0);
INSERT INTO products.review VALUES (58, 0);
INSERT INTO products.review VALUES (59, 0);
INSERT INTO products.review VALUES (60, 0);
INSERT INTO products.review VALUES (61, 0);
INSERT INTO products.review VALUES (62, 0);
INSERT INTO products.review VALUES (63, 0);
INSERT INTO products.review VALUES (64, 0);
INSERT INTO products.review VALUES (65, 0);
INSERT INTO products.review VALUES (66, 0);
INSERT INTO products.review VALUES (67, 0);
INSERT INTO products.review VALUES (68, 0);
INSERT INTO products.review VALUES (69, 0);
INSERT INTO products.review VALUES (70, 0);
INSERT INTO products.review VALUES (71, 0);
INSERT INTO products.review VALUES (72, 0);
INSERT INTO products.review VALUES (73, 0);
INSERT INTO products.review VALUES (74, 0);
INSERT INTO products.review VALUES (75, 0);
INSERT INTO products.review VALUES (76, 0);
INSERT INTO products.review VALUES (77, 0);
INSERT INTO products.review VALUES (78, 0);
INSERT INTO products.review VALUES (79, 0);
INSERT INTO products.review VALUES (80, 0);
INSERT INTO products.review VALUES (81, 0);
INSERT INTO products.review VALUES (82, 0);
INSERT INTO products.review VALUES (83, 0);
INSERT INTO products.review VALUES (84, 0);
INSERT INTO products.review VALUES (85, 0);
INSERT INTO products.review VALUES (86, 0);
INSERT INTO products.review VALUES (87, 0);
INSERT INTO products.review VALUES (88, 0);
INSERT INTO products.review VALUES (89, 0);
INSERT INTO products.review VALUES (90, 0);
INSERT INTO products.review VALUES (91, 0);
INSERT INTO products.review VALUES (92, 0);
INSERT INTO products.review VALUES (93, 0);
INSERT INTO products.review VALUES (94, 0);
INSERT INTO products.review VALUES (95, 0);
INSERT INTO products.review VALUES (96, 0);
INSERT INTO products.review VALUES (97, 0);
INSERT INTO products.review VALUES (98, 0);
INSERT INTO products.review VALUES (99, 0);
INSERT INTO products.review VALUES (100, 0);
INSERT INTO products.review VALUES (101, 0);
INSERT INTO products.review VALUES (102, 0);
INSERT INTO products.review VALUES (103, 0);
INSERT INTO products.review VALUES (104, 0);
INSERT INTO products.review VALUES (105, 0);
INSERT INTO products.review VALUES (106, 0);
INSERT INTO products.review VALUES (107, 0);
INSERT INTO products.review VALUES (108, 0);
INSERT INTO products.review VALUES (109, 0);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: sales; Owner: postgres
--

INSERT INTO sales.cart VALUES (6, 0);
INSERT INTO sales.cart VALUES (7, 0);
INSERT INTO sales.cart VALUES (8, 0);
INSERT INTO sales.cart VALUES (9, 0);
INSERT INTO sales.cart VALUES (10, 0);
INSERT INTO sales.cart VALUES (11, 0);
INSERT INTO sales.cart VALUES (12, 0);
INSERT INTO sales.cart VALUES (13, 0);
INSERT INTO sales.cart VALUES (14, 0);
INSERT INTO sales.cart VALUES (15, 0);


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: sales; Owner: postgres
--



--
-- Data for Name: order_item; Type: TABLE DATA; Schema: sales; Owner: postgres
--



--
-- Data for Name: order_status; Type: TABLE DATA; Schema: sales; Owner: postgres
--



--
-- Data for Name: orders; Type: TABLE DATA; Schema: sales; Owner: postgres
--



--
-- Data for Name: payment; Type: TABLE DATA; Schema: sales; Owner: postgres
--



--
-- Data for Name: card; Type: TABLE DATA; Schema: users; Owner: postgres
--



--
-- Data for Name: person; Type: TABLE DATA; Schema: users; Owner: postgres
--

INSERT INTO users.person VALUES ('100000000001', 'Juan', 'Perez', '55550001', 'Zona 1, Ciudad');
INSERT INTO users.person VALUES ('100000000002', 'Maria', 'Lopez', '55550002', 'Zona 2, Ciudad');
INSERT INTO users.person VALUES ('100000000003', 'Carlos', 'Gomez', '55550003', 'Zona 3, Ciudad');
INSERT INTO users.person VALUES ('100000000004', 'Ana', 'Ramirez', '55550004', 'Zona 4, Ciudad');
INSERT INTO users.person VALUES ('100000000005', 'Luis', 'Martinez', '55550005', 'Zona 5, Ciudad');
INSERT INTO users.person VALUES ('100000000006', 'Sofia', 'Hernandez', '55550006', 'Zona 6, Ciudad');
INSERT INTO users.person VALUES ('100000000007', 'Pedro', 'Diaz', '55550007', 'Zona 7, Ciudad');
INSERT INTO users.person VALUES ('100000000008', 'Laura', 'Torres', '55550008', 'Zona 8, Ciudad');
INSERT INTO users.person VALUES ('100000000009', 'Diego', 'Vargas', '55550009', 'Zona 9, Ciudad');
INSERT INTO users.person VALUES ('100000000010', 'Carla', 'Rojas', '55550010', 'Zona 10, Ciudad');
INSERT INTO users.person VALUES ('200000000001', 'Mod1', 'Uno', '55550101', 'Zona 11, Ciudad');
INSERT INTO users.person VALUES ('200000000002', 'Mod2', 'Dos', '55550102', 'Zona 12, Ciudad');
INSERT INTO users.person VALUES ('200000000003', 'Mod3', 'Tres', '55550103', 'Zona 13, Ciudad');
INSERT INTO users.person VALUES ('200000000004', 'Mod4', 'Cuatro', '55550104', 'Zona 14, Ciudad');
INSERT INTO users.person VALUES ('200000000005', 'Mod5', 'Cinco', '55550105', 'Zona 15, Ciudad');
INSERT INTO users.person VALUES ('300000000001', 'Log1', 'Uno', '55550201', 'Zona 16, Ciudad');
INSERT INTO users.person VALUES ('300000000002', 'Log2', 'Dos', '55550202', 'Zona 17, Ciudad');
INSERT INTO users.person VALUES ('300000000003', 'Log3', 'Tres', '55550203', 'Zona 18, Ciudad');
INSERT INTO users.person VALUES ('400000000001', 'Admin', 'Principal', '55550301', 'Zona 19, Ciudad');


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

INSERT INTO users.user_roles VALUES (4, 'e225a977-b3ca-49f7-a489-50693cccfe9e');
INSERT INTO users.user_roles VALUES (4, '99877352-463b-4465-90e9-e2b2dfc5130e');
INSERT INTO users.user_roles VALUES (4, 'fbb09610-21e9-4b97-a468-57f219850a78');
INSERT INTO users.user_roles VALUES (4, '6f83d294-1914-4afa-ba9c-691af19890de');
INSERT INTO users.user_roles VALUES (4, '64afd30f-ea7d-42d4-83e4-91ffdd2e3774');
INSERT INTO users.user_roles VALUES (4, 'c62cff42-fc8b-4023-9c21-8c64b33f4bce');
INSERT INTO users.user_roles VALUES (4, '1c7b732b-9dc2-4617-b526-9fc6f7e3803b');
INSERT INTO users.user_roles VALUES (4, 'dfc2af5e-dc31-44d5-9054-f9337d8509ca');
INSERT INTO users.user_roles VALUES (4, '41108d2a-acb3-40b8-bff8-c0cfd6be876a');
INSERT INTO users.user_roles VALUES (4, 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114');
INSERT INTO users.user_roles VALUES (2, 'c48cc801-c034-4c2e-a5e9-577275c201c5');
INSERT INTO users.user_roles VALUES (2, '4785eb53-2f84-4a41-ba87-e819c409a86b');
INSERT INTO users.user_roles VALUES (2, '52cab15f-93ac-4536-960a-017e483e535e');
INSERT INTO users.user_roles VALUES (2, '314b8c87-ad7a-40f9-b921-df0c65dce752');
INSERT INTO users.user_roles VALUES (2, 'e3025137-a73f-4cb8-baff-6c194c042b4a');
INSERT INTO users.user_roles VALUES (3, 'c0eb0fc3-3378-4861-a6ff-eadcf9a1c6fc');
INSERT INTO users.user_roles VALUES (3, '6a76cf61-c305-4fd0-96f9-48302a5eb5fa');
INSERT INTO users.user_roles VALUES (3, '47f7c531-1b84-4631-92de-d6e69781f25d');
INSERT INTO users.user_roles VALUES (1, 'd75f8bd7-393d-44e1-b3f3-ad22b081b390');


--
-- Data for Name: users; Type: TABLE DATA; Schema: users; Owner: postgres
--

INSERT INTO users.users VALUES ('mod1', 'mod1@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '200000000001', 'c48cc801-c034-4c2e-a5e9-577275c201c5', NULL, 0);
INSERT INTO users.users VALUES ('mod2', 'mod2@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '200000000002', '4785eb53-2f84-4a41-ba87-e819c409a86b', NULL, 0);
INSERT INTO users.users VALUES ('mod3', 'mod3@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '200000000003', '52cab15f-93ac-4536-960a-017e483e535e', NULL, 0);
INSERT INTO users.users VALUES ('mod4', 'mod4@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '200000000004', '314b8c87-ad7a-40f9-b921-df0c65dce752', NULL, 0);
INSERT INTO users.users VALUES ('mod5', 'mod5@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '200000000005', 'e3025137-a73f-4cb8-baff-6c194c042b4a', NULL, 0);
INSERT INTO users.users VALUES ('log1', 'log1@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '300000000001', 'c0eb0fc3-3378-4861-a6ff-eadcf9a1c6fc', NULL, 0);
INSERT INTO users.users VALUES ('log2', 'log2@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '300000000002', '6a76cf61-c305-4fd0-96f9-48302a5eb5fa', NULL, 0);
INSERT INTO users.users VALUES ('log3', 'log3@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '300000000003', '47f7c531-1b84-4631-92de-d6e69781f25d', NULL, 0);
INSERT INTO users.users VALUES ('admin', 'admin@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '400000000001', 'd75f8bd7-393d-44e1-b3f3-ad22b081b390', NULL, 0);
INSERT INTO users.users VALUES ('pedrod', 'pedrod@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000007', '1c7b732b-9dc2-4617-b526-9fc6f7e3803b', 6, 0);
INSERT INTO users.users VALUES ('diegov', 'diegov@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000009', '41108d2a-acb3-40b8-bff8-c0cfd6be876a', 7, 0);
INSERT INTO users.users VALUES ('luism', 'luism@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000005', '64afd30f-ea7d-42d4-83e4-91ffdd2e3774', 8, 0);
INSERT INTO users.users VALUES ('anar', 'anar@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000004', '6f83d294-1914-4afa-ba9c-691af19890de', 9, 0);
INSERT INTO users.users VALUES ('marial', 'marial@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000002', '99877352-463b-4465-90e9-e2b2dfc5130e', 10, 0);
INSERT INTO users.users VALUES ('sofiah', 'sofiah@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000006', 'c62cff42-fc8b-4023-9c21-8c64b33f4bce', 11, 0);
INSERT INTO users.users VALUES ('laurat', 'laurat@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000008', 'dfc2af5e-dc31-44d5-9054-f9337d8509ca', 12, 0);
INSERT INTO users.users VALUES ('juanp', 'juanp@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000001', 'e225a977-b3ca-49f7-a489-50693cccfe9e', 13, 0);
INSERT INTO users.users VALUES ('carlar', 'carlar@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000010', 'ef4cbe7c-3e02-4893-a5b8-77adbc6ad114', 14, 0);
INSERT INTO users.users VALUES ('carlosg', 'carlosg@gmail.com', '$2a$10$.nIqrOVczcf1Y6a.XqCM/.L00FEY7oPN8CuEoDIYyz1LBv/Kfrava', true, '100000000003', 'fbb09610-21e9-4b97-a468-57f219850a78', 15, 0);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: postgres
--

SELECT pg_catalog.setval('admin.logs_id_seq', 1, true);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: admin; Owner: postgres
--

SELECT pg_catalog.setval('admin.notification_id_seq', 18, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: products; Owner: postgres
--

SELECT pg_catalog.setval('products.category_id_seq', 6, true);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: products; Owner: postgres
--

SELECT pg_catalog.setval('products.review_id_seq', 109, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.cart_id_seq', 15, true);


--
-- Name: cart_item_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.cart_item_id_seq', 1, false);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.order_item_id_seq', 1, false);


--
-- Name: order_status_id_seq; Type: SEQUENCE SET; Schema: sales; Owner: postgres
--

SELECT pg_catalog.setval('sales.order_status_id_seq', 5, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: users; Owner: postgres
--

SELECT pg_catalog.setval('users.roles_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict ANhOojLUrYoG1ClnuKhexGQoZ7M2Tj7E2qhgEHZYk4Yep8DQYqbSVGESkQ2Ufrf

