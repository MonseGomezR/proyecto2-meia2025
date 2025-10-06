--
-- PostgreSQL database dump
--

\restrict xMBBA3Nf5zNm05W5hULB4hPlun9iqPkLaJztY9vlPiUlUvHjG5bLQ0B4pDZKd0G

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-06 16:55:50

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
-- TOC entry 7 (class 2615 OID 24577)
-- Name: general; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA general;


ALTER SCHEMA general OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 24793)
-- Name: productos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA productos;


ALTER SCHEMA productos OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 24576)
-- Name: usuarios; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA usuarios;


ALTER SCHEMA usuarios OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 24578)
-- Name: ventas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ventas;


ALTER SCHEMA ventas OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 24587)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA general;


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 252 (class 1259 OID 24933)
-- Name: entrega; Type: TABLE; Schema: general; Owner: postgres
--

CREATE TABLE general.entrega (
    id integer NOT NULL,
    comentario text NOT NULL,
    fecha_entrega timestamp with time zone NOT NULL,
    id_pedido uuid NOT NULL,
    id_encargado uuid NOT NULL
);


ALTER TABLE general.entrega OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 24932)
-- Name: entrega_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE general.entrega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE general.entrega_id_seq OWNER TO postgres;

--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 251
-- Name: entrega_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE general.entrega_id_seq OWNED BY general.entrega.id;


--
-- TOC entry 248 (class 1259 OID 24898)
-- Name: notificacion; Type: TABLE; Schema: general; Owner: postgres
--

CREATE TABLE general.notificacion (
    id integer NOT NULL,
    tipo character varying(20) NOT NULL,
    contenido text NOT NULL,
    fecha timestamp with time zone DEFAULT now() NOT NULL,
    id_usuario uuid NOT NULL
);


ALTER TABLE general.notificacion OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 24897)
-- Name: notificacion_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE general.notificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE general.notificacion_id_seq OWNER TO postgres;

--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 247
-- Name: notificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE general.notificacion_id_seq OWNED BY general.notificacion.id;


--
-- TOC entry 250 (class 1259 OID 24913)
-- Name: revision_producto; Type: TABLE; Schema: general; Owner: postgres
--

CREATE TABLE general.revision_producto (
    id integer NOT NULL,
    razon text[] NOT NULL,
    estado character varying(20) NOT NULL,
    fecha_solicitud timestamp with time zone DEFAULT now() NOT NULL,
    fecha_revision timestamp with time zone,
    id_producto uuid NOT NULL,
    id_moderador uuid NOT NULL
);


ALTER TABLE general.revision_producto OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 24912)
-- Name: revision_producto_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE general.revision_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE general.revision_producto_id_seq OWNER TO postgres;

--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 249
-- Name: revision_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE general.revision_producto_id_seq OWNED BY general.revision_producto.id;


--
-- TOC entry 246 (class 1259 OID 24878)
-- Name: sancion; Type: TABLE; Schema: general; Owner: postgres
--

CREATE TABLE general.sancion (
    id integer NOT NULL,
    estado character varying(20) NOT NULL,
    razon text NOT NULL,
    fecha_inicio timestamp with time zone DEFAULT now() NOT NULL,
    fecha_fin timestamp with time zone,
    id_moderador uuid NOT NULL,
    id_usuario uuid NOT NULL
);


ALTER TABLE general.sancion OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 24877)
-- Name: sancion_id_seq; Type: SEQUENCE; Schema: general; Owner: postgres
--

CREATE SEQUENCE general.sancion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE general.sancion_id_seq OWNER TO postgres;

--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 245
-- Name: sancion_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: postgres
--

ALTER SEQUENCE general.sancion_id_seq OWNED BY general.sancion.id;


--
-- TOC entry 227 (class 1259 OID 24654)
-- Name: categoria_producto; Type: TABLE; Schema: productos; Owner: postgres
--

CREATE TABLE productos.categoria_producto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE productos.categoria_producto OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24653)
-- Name: categoria_producto_id_seq; Type: SEQUENCE; Schema: productos; Owner: postgres
--

CREATE SEQUENCE productos.categoria_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE productos.categoria_producto_id_seq OWNER TO postgres;

--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 226
-- Name: categoria_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: postgres
--

ALTER SEQUENCE productos.categoria_producto_id_seq OWNED BY productos.categoria_producto.id;


--
-- TOC entry 233 (class 1259 OID 24743)
-- Name: detalle_rating; Type: TABLE; Schema: productos; Owner: postgres
--

CREATE TABLE productos.detalle_rating (
    id integer NOT NULL,
    id_rating integer NOT NULL,
    id_usuario uuid NOT NULL,
    valor numeric(1,2) NOT NULL,
    comentario text
);


ALTER TABLE productos.detalle_rating OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24742)
-- Name: detalle_rating_id_rating_seq; Type: SEQUENCE; Schema: productos; Owner: postgres
--

CREATE SEQUENCE productos.detalle_rating_id_rating_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE productos.detalle_rating_id_rating_seq OWNER TO postgres;

--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 232
-- Name: detalle_rating_id_rating_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: postgres
--

ALTER SEQUENCE productos.detalle_rating_id_rating_seq OWNED BY productos.detalle_rating.id_rating;


--
-- TOC entry 231 (class 1259 OID 24741)
-- Name: detalle_rating_id_seq; Type: SEQUENCE; Schema: productos; Owner: postgres
--

CREATE SEQUENCE productos.detalle_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE productos.detalle_rating_id_seq OWNER TO postgres;

--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 231
-- Name: detalle_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: postgres
--

ALTER SEQUENCE productos.detalle_rating_id_seq OWNED BY productos.detalle_rating.id;


--
-- TOC entry 228 (class 1259 OID 24660)
-- Name: producto; Type: TABLE; Schema: productos; Owner: postgres
--

CREATE TABLE productos.producto (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion text NOT NULL,
    precio numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    estado character varying(20) NOT NULL,
    id_categoria integer NOT NULL,
    id_usuario uuid NOT NULL,
    publicado boolean DEFAULT false NOT NULL
);


ALTER TABLE productos.producto OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24728)
-- Name: rating; Type: TABLE; Schema: productos; Owner: postgres
--

CREATE TABLE productos.rating (
    id integer NOT NULL,
    id_producto uuid NOT NULL,
    promedio numeric(1,2) NOT NULL
);


ALTER TABLE productos.rating OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24727)
-- Name: rating_id_seq; Type: SEQUENCE; Schema: productos; Owner: postgres
--

CREATE SEQUENCE productos.rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE productos.rating_id_seq OWNER TO postgres;

--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 229
-- Name: rating_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: postgres
--

ALTER SEQUENCE productos.rating_id_seq OWNED BY productos.rating.id;


--
-- TOC entry 224 (class 1259 OID 24635)
-- Name: persona; Type: TABLE; Schema: usuarios; Owner: postgres
--

CREATE TABLE usuarios.persona (
    dpi character varying(13) NOT NULL,
    nombre character varying(200) NOT NULL,
    direccion character varying(150) NOT NULL,
    correo character varying(100) NOT NULL,
    ganancias numeric(5,2) DEFAULT 0.0 NOT NULL,
    id_usuario uuid NOT NULL
);


ALTER TABLE usuarios.persona OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24648)
-- Name: tarjeta; Type: TABLE; Schema: usuarios; Owner: postgres
--

CREATE TABLE usuarios.tarjeta (
    numero character varying(16) NOT NULL,
    fecha_vencimiento character varying(4) NOT NULL,
    cvv character varying(3) NOT NULL,
    id_usuario uuid NOT NULL,
    nombre character varying(150) NOT NULL
);


ALTER TABLE usuarios.tarjeta OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24581)
-- Name: tipo_usuario; Type: TABLE; Schema: usuarios; Owner: postgres
--

CREATE TABLE usuarios.tipo_usuario (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL
);


ALTER TABLE usuarios.tipo_usuario OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24580)
-- Name: tipo_usuario_id_seq; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE usuarios.tipo_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE usuarios.tipo_usuario_id_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 221
-- Name: tipo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: usuarios; Owner: postgres
--

ALTER SEQUENCE usuarios.tipo_usuario_id_seq OWNED BY usuarios.tipo_usuario.id;


--
-- TOC entry 223 (class 1259 OID 24624)
-- Name: usuario; Type: TABLE; Schema: usuarios; Owner: postgres
--

CREATE TABLE usuarios.usuario (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    usuario character varying(100) NOT NULL,
    salt character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    id_tipo integer NOT NULL
);


ALTER TABLE usuarios.usuario OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 24763)
-- Name: cart; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.cart (
    id integer NOT NULL,
    id_usuario uuid NOT NULL,
    total numeric(10,2) NOT NULL
);


ALTER TABLE ventas.cart OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24762)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.cart_id_seq OWNER TO postgres;

--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 234
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.cart_id_seq OWNED BY ventas.cart.id;


--
-- TOC entry 237 (class 1259 OID 24775)
-- Name: detalle_cart; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.detalle_cart (
    id integer NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    cantidad integer NOT NULL,
    id_producto uuid NOT NULL,
    id_cart integer NOT NULL
);


ALTER TABLE ventas.detalle_cart OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 24774)
-- Name: detalle_cart_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.detalle_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.detalle_cart_id_seq OWNER TO postgres;

--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 236
-- Name: detalle_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.detalle_cart_id_seq OWNED BY ventas.detalle_cart.id;


--
-- TOC entry 240 (class 1259 OID 24822)
-- Name: detalle_pedido; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.detalle_pedido (
    id integer NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    cantidad integer NOT NULL,
    id_producto uuid NOT NULL,
    id_pedido uuid NOT NULL
);


ALTER TABLE ventas.detalle_pedido OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 24821)
-- Name: detalle_pedido_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.detalle_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.detalle_pedido_id_seq OWNER TO postgres;

--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 239
-- Name: detalle_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.detalle_pedido_id_seq OWNED BY ventas.detalle_pedido.id;


--
-- TOC entry 244 (class 1259 OID 24866)
-- Name: estado_pedido; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.estado_pedido (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL
);


ALTER TABLE ventas.estado_pedido OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 24865)
-- Name: estado_pedido_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.estado_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.estado_pedido_id_seq OWNER TO postgres;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 243
-- Name: estado_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.estado_pedido_id_seq OWNED BY ventas.estado_pedido.id;


--
-- TOC entry 242 (class 1259 OID 24842)
-- Name: pago; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.pago (
    id integer NOT NULL,
    cantidad numeric(10,2) NOT NULL,
    id_tarjeta character varying(16) NOT NULL
);


ALTER TABLE ventas.pago OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 24841)
-- Name: pago_id_seq; Type: SEQUENCE; Schema: ventas; Owner: postgres
--

CREATE SEQUENCE ventas.pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ventas.pago_id_seq OWNER TO postgres;

--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 241
-- Name: pago_id_seq; Type: SEQUENCE OWNED BY; Schema: ventas; Owner: postgres
--

ALTER SEQUENCE ventas.pago_id_seq OWNED BY ventas.pago.id;


--
-- TOC entry 238 (class 1259 OID 24806)
-- Name: pedido; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.pedido (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    total numeric(10,2) NOT NULL,
    fecha_envio timestamp with time zone NOT NULL,
    fecha_entrega timestamp with time zone,
    id_usuario uuid NOT NULL,
    id_pago integer NOT NULL,
    id_estado integer NOT NULL
);


ALTER TABLE ventas.pedido OWNER TO postgres;

--
-- TOC entry 4884 (class 2604 OID 24936)
-- Name: entrega id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.entrega ALTER COLUMN id SET DEFAULT nextval('general.entrega_id_seq'::regclass);


--
-- TOC entry 4880 (class 2604 OID 24901)
-- Name: notificacion id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.notificacion ALTER COLUMN id SET DEFAULT nextval('general.notificacion_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 24916)
-- Name: revision_producto id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.revision_producto ALTER COLUMN id SET DEFAULT nextval('general.revision_producto_id_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 24881)
-- Name: sancion id; Type: DEFAULT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.sancion ALTER COLUMN id SET DEFAULT nextval('general.sancion_id_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 24657)
-- Name: categoria_producto id; Type: DEFAULT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.categoria_producto ALTER COLUMN id SET DEFAULT nextval('productos.categoria_producto_id_seq'::regclass);


--
-- TOC entry 4870 (class 2604 OID 24746)
-- Name: detalle_rating id; Type: DEFAULT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.detalle_rating ALTER COLUMN id SET DEFAULT nextval('productos.detalle_rating_id_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 24747)
-- Name: detalle_rating id_rating; Type: DEFAULT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.detalle_rating ALTER COLUMN id_rating SET DEFAULT nextval('productos.detalle_rating_id_rating_seq'::regclass);


--
-- TOC entry 4869 (class 2604 OID 24731)
-- Name: rating id; Type: DEFAULT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.rating ALTER COLUMN id SET DEFAULT nextval('productos.rating_id_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 24584)
-- Name: tipo_usuario id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.tipo_usuario ALTER COLUMN id SET DEFAULT nextval('usuarios.tipo_usuario_id_seq'::regclass);


--
-- TOC entry 4872 (class 2604 OID 24766)
-- Name: cart id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cart ALTER COLUMN id SET DEFAULT nextval('ventas.cart_id_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 24778)
-- Name: detalle_cart id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_cart ALTER COLUMN id SET DEFAULT nextval('ventas.detalle_cart_id_seq'::regclass);


--
-- TOC entry 4875 (class 2604 OID 24825)
-- Name: detalle_pedido id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_pedido ALTER COLUMN id SET DEFAULT nextval('ventas.detalle_pedido_id_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 24869)
-- Name: estado_pedido id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.estado_pedido ALTER COLUMN id SET DEFAULT nextval('ventas.estado_pedido_id_seq'::regclass);


--
-- TOC entry 4876 (class 2604 OID 24845)
-- Name: pago id; Type: DEFAULT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pago ALTER COLUMN id SET DEFAULT nextval('ventas.pago_id_seq'::regclass);


--
-- TOC entry 5129 (class 0 OID 24933)
-- Dependencies: 252
-- Data for Name: entrega; Type: TABLE DATA; Schema: general; Owner: postgres
--

COPY general.entrega (id, comentario, fecha_entrega, id_pedido, id_encargado) FROM stdin;
\.


--
-- TOC entry 5125 (class 0 OID 24898)
-- Dependencies: 248
-- Data for Name: notificacion; Type: TABLE DATA; Schema: general; Owner: postgres
--

COPY general.notificacion (id, tipo, contenido, fecha, id_usuario) FROM stdin;
\.


--
-- TOC entry 5127 (class 0 OID 24913)
-- Dependencies: 250
-- Data for Name: revision_producto; Type: TABLE DATA; Schema: general; Owner: postgres
--

COPY general.revision_producto (id, razon, estado, fecha_solicitud, fecha_revision, id_producto, id_moderador) FROM stdin;
\.


--
-- TOC entry 5123 (class 0 OID 24878)
-- Dependencies: 246
-- Data for Name: sancion; Type: TABLE DATA; Schema: general; Owner: postgres
--

COPY general.sancion (id, estado, razon, fecha_inicio, fecha_fin, id_moderador, id_usuario) FROM stdin;
\.


--
-- TOC entry 5104 (class 0 OID 24654)
-- Dependencies: 227
-- Data for Name: categoria_producto; Type: TABLE DATA; Schema: productos; Owner: postgres
--

COPY productos.categoria_producto (id, nombre) FROM stdin;
1	Tecnologia
2	Hogar
3	Academico
4	Personal
5	Decoracion
6	Otro
\.


--
-- TOC entry 5110 (class 0 OID 24743)
-- Dependencies: 233
-- Data for Name: detalle_rating; Type: TABLE DATA; Schema: productos; Owner: postgres
--

COPY productos.detalle_rating (id, id_rating, id_usuario, valor, comentario) FROM stdin;
\.


--
-- TOC entry 5105 (class 0 OID 24660)
-- Dependencies: 228
-- Data for Name: producto; Type: TABLE DATA; Schema: productos; Owner: postgres
--

COPY productos.producto (id, nombre, descripcion, precio, stock, estado, id_categoria, id_usuario, publicado) FROM stdin;
cc3cd8a1-55a2-403c-a54e-0bcff9c1429c	SSD Crucial MX500 1TB	Unidad de estado sólido SATA 2.5".	850.00	3	Usado	1	c4f8b857-1111-4d1e-9000-000000000010	f
2bde0d15-432f-486b-8eba-96fe367adbb6	Cepillo eléctrico Oral-B Pro 1000	Cabezal redondo rotatorio.	300.00	4	Nuevo	4	c4f8b857-1111-4d1e-9000-000000000010	f
56fecdd6-b7c7-41c1-ac95-062c35032f8e	Billetera Guess original	Cuero genuino marrón.	320.00	2	Usado	4	c4f8b857-1111-4d1e-9000-000000000010	f
6485d606-9201-47fc-b8ab-d2f151654dd9	Crema hidratante Nivea Men 200ml	Protección diaria.	60.00	8	Usado	4	c4f8b857-1111-4d1e-9000-000000000010	f
f1b92a64-5b66-44ae-a9ff-ccdbd0e6f916	Guantes de ciclismo Rockbros	Antideslizantes.	180.00	4	Usado	6	c4f8b857-1111-4d1e-9000-000000000010	f
11dfb297-24c3-4b2d-b2cf-09f9620c137e	Planta artificial decorativa	Maceta cerámica blanca.	180.00	11	Usado	5	c4f8b857-1111-4d1e-9000-000000000010	f
0c9dad69-3445-4051-a72b-234f55c45507	Laptop Lenovo IdeaPad 3	Ryzen 5, 8GB RAM, 512GB SSD.	5200.00	14	Nuevo	1	c4f8b857-1111-4d1e-9000-000000000010	f
18a9b1af-c319-4500-88cd-5d872726475f	Aspiradora Electrolux Pure D9	Filtro HEPA, bolsa de 5L.	1900.00	15	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000010	f
07ce1cfd-5440-4f7b-b3d9-30d686c41559	Ventilador Dyson Cool AM07	Sin aspas, silencioso.	2200.00	3	Usado	2	c4f8b857-1111-4d1e-9000-000000000010	f
f52b3a93-34fc-4adf-9369-2e87994d7643	Microondas Panasonic NN-SN67HS	1.2 pies cúbicos, sensor inverter.	950.00	14	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000010	f
15df52e3-80ec-489d-a559-f5c52210045e	Router ASUS RT-AX55	WiFi 6 Dual Band, 1800 Mbps.	950.00	11	Nuevo	1	c4f8b857-1111-4d1e-9000-000000000011	f
59e53280-b62e-41e7-b8ac-8ab930d6149d	Shampoo Pantene Pro-V 400ml	Fortalece el cabello.	55.00	4	Usado	4	c4f8b857-1111-4d1e-9000-000000000011	f
1d69ff0b-cf72-40c1-ad8d-9aedfc8e5611	Tapete para yoga Manduka	Antideslizante profesional.	420.00	2	Usado	6	c4f8b857-1111-4d1e-9000-000000000011	f
0b55c50a-c841-4de1-a232-952e681723de	Calculadora Texas Instruments TI-84 Plus	Gráfica, con pantalla a color.	900.00	7	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000011	f
9dd3ab55-44ac-4b2d-99ca-af5fa3457c1f	Lentes de sol Ray-Ban Wayfarer	Protección UV400.	950.00	3	Nuevo	4	c4f8b857-1111-4d1e-9000-000000000011	f
bebd4d29-4acf-4cb7-b19f-bfb51abef401	Jarrón de cristal soplado	Diseño elegante transparente.	220.00	2	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000011	f
076b2900-45dc-4908-8e17-b180edc7bef4	Audífonos Logitech G Pro X	Sonido envolvente 7.1 con micrófono desmontable.	950.00	10	Usado	1	c4f8b857-1111-4d1e-9000-000000000011	f
6a84cae6-d13b-4257-813d-d18eb2528f17	Taza térmica Contigo 500ml	Acero inoxidable, hermética.	250.00	3	Usado	4	c4f8b857-1111-4d1e-9000-000000000011	f
9555bd71-179a-4db1-b082-c45e1077a592	Paraguas compacto Columbia	Resistente al viento.	180.00	10	Usado	6	c4f8b857-1111-4d1e-9000-000000000011	f
914bb3b0-09c7-4aca-89f9-d96503de0f83	Teclado mecánico Corsair K68	Teclado mecánico con retroiluminación RGB.	600.00	14	Nuevo	1	c4f8b857-1111-4d1e-9000-000000000011	f
d04b408e-07a4-442e-ab98-1b3e0d46faa8	Libro Álgebra Lineal	Texto universitario clásico.	250.00	10	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000012	f
d161cf6e-ddb4-4237-8b61-1e6ffe44730d	Gorra Nike Sportswear	Algodón, ajustable.	180.00	8	Nuevo	4	c4f8b857-1111-4d1e-9000-000000000012	f
e9763e30-7be5-4c3f-8ea6-74842d2f2297	Maletín Samsonite 20"	Ruedas giratorias, ABS rígido.	950.00	7	Usado	6	c4f8b857-1111-4d1e-9000-000000000012	f
083c1ec7-ebea-4dd7-a4f8-3e0fb1f177c2	Freidora de aire Philips XL	Capacidad de 5.5L, pantalla digital.	1100.00	6	Usado	2	c4f8b857-1111-4d1e-9000-000000000012	f
bbde748f-3315-429f-baf5-86432cbbae04	Set de herramientas Bosch 46 piezas	Brocas, llaves, y maletín.	550.00	4	Usado	6	c4f8b857-1111-4d1e-9000-000000000012	f
0ea7e229-1b5d-40ce-a544-c1fc16d22efd	Mochila Herschel Pop Quiz	Compartimiento acolchado para laptop.	420.00	14	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000012	f
e8fb29d0-8ccd-4f12-bf87-d520eea5567e	Termo Stanley Classic 1L	Mantiene temperatura 24h.	300.00	5	Nuevo	6	c4f8b857-1111-4d1e-9000-000000000012	f
2fe241d5-fdcb-4c58-8679-532176ab3d9b	Alfombra persa 2x3m	Diseño clásico oriental.	950.00	15	Usado	5	c4f8b857-1111-4d1e-9000-000000000012	f
28a10d5b-89ce-4292-b089-a5514b0a7c5a	Bolígrafo Parker Jotter	Acero inoxidable, recargable.	150.00	9	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000012	f
9e0414a7-54a2-47bf-811c-93263d879d37	Vela aromática Yankee Candle	Aroma a vainilla.	120.00	7	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000012	f
ba95fe6e-ddb7-4f0e-b2cd-3b623933b80a	Mouse inalámbrico Razer Pro Click	Mouse ergonómico inalámbrico con sensor óptico.	450.00	7	Usado	1	c4f8b857-1111-4d1e-9000-000000000013	f
c91aa0ff-58c5-446d-a045-bc8dcab4c65b	Horno tostador Hamilton Beach	Capacidad de 6 rebanadas, temporizador.	600.00	15	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000013	f
fdb294d1-3a61-4609-a38c-02dffcb89ff0	Smartwatch Huawei GT3	Reloj inteligente con GPS integrado.	1800.00	15	Usado	1	c4f8b857-1111-4d1e-9000-000000000013	f
4b0371d6-163c-4574-8175-62b9f96cf9b1	Perfume Chanel Bleu 100ml	Fragancia elegante amaderada.	1200.00	5	Usado	4	c4f8b857-1111-4d1e-9000-000000000013	f
1f4d2e87-8166-4dee-ab3b-13338be92024	Libro Estructuras de Datos en Java	4ta edición, Pearson.	350.00	10	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000013	f
3af5c7db-1c27-46ff-99d4-2e60e13af212	Tablet Samsung Galaxy Tab S6 Lite	Pantalla de 10.4", S Pen incluido.	2900.00	11	Nuevo	1	c4f8b857-1111-4d1e-9000-000000000013	f
2165b770-07d5-4693-a4b6-e37271e38014	Calculadora Casio FX-991EX	Pantalla natural, 552 funciones.	300.00	6	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000013	f
d52c852e-828d-4c16-bd42-6acbc267c6d2	Libro Matemáticas Discretas	3ra edición, McGraw-Hill.	280.00	3	Usado	3	c4f8b857-1111-4d1e-9000-000000000013	f
0a64d7ac-759e-420e-a0de-b29bf115dacc	Bicicleta estática Reebok Jet 100	12 programas, pantalla LCD.	2500.00	15	Nuevo	6	c4f8b857-1111-4d1e-9000-000000000013	f
4589bf1c-052d-440d-9954-0782cf795b54	Plancha Oster SteamGlide	Base cerámica, vapor ajustable.	350.00	9	Usado	2	c4f8b857-1111-4d1e-9000-000000000013	f
2c8d9a11-ce7b-4cf1-896e-35b6b0fc1225	Cuadro abstracto moderno	Lienzo 80x60cm, tonos azules.	350.00	2	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000014	f
6c77c958-adfd-4ce2-a247-e14728365203	Monitor Samsung Odyssey 27"	Pantalla curva QHD 144Hz.	2800.00	9	Nuevo	1	c4f8b857-1111-4d1e-9000-000000000014	f
3753731f-f6c7-4589-ba35-bfcb91a73713	Lámpara de pie minimalista	Estructura metálica, luz cálida.	400.00	12	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000014	f
77b51280-3c61-477b-b420-67266d8c583c	Juego de sartenes Tefal Ingenio	Set de 3 piezas antiadherentes.	650.00	6	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000014	f
07673826-6c14-4095-8bb8-0e34c5356d9d	Reloj Casio G-Shock GA2100	Resistente al agua, diseño robusto.	850.00	7	Usado	4	c4f8b857-1111-4d1e-9000-000000000014	f
fdfe10a6-ce76-4102-bf1b-c8ee1174da21	Botella Hydro Flask 1L	Aislamiento al vacío, acero inoxidable.	300.00	11	Nuevo	6	c4f8b857-1111-4d1e-9000-000000000014	f
4c66d39a-a665-4fe7-b367-29d7bbc65f37	Cuaderno Moleskine Classic	Tapa dura, 200 páginas.	180.00	15	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000014	f
6ae7d8ea-1545-4486-92da-5c6b6dd225a7	Set de resaltadores Faber-Castell	6 colores pastel.	80.00	15	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000014	f
ad50e23f-a304-4c57-85a8-1fb3aff88f69	Cuerda para saltar Adidas	Rodamientos de acero.	120.00	13	Usado	6	c4f8b857-1111-4d1e-9000-000000000014	f
28e00aef-a072-46b8-b748-8a09f29f7327	Cámara web AVerMedia PW315	Full HD con autoenfoque.	700.00	11	Nuevo	1	c4f8b857-1111-4d1e-9000-000000000014	f
d5a1d473-39e0-4845-98ce-13716d7eba42	Powerbank Anker 20000mAh	Carga rápida USB-C.	350.00	15	Nuevo	6	c4f8b857-1111-4d1e-9000-000000000015	f
23498df2-692d-4f0e-8bd3-602c54b2d7fd	Reloj de pared vintage	Estilo retro, color bronce.	280.00	4	Usado	5	c4f8b857-1111-4d1e-9000-000000000015	f
d04703a2-e54e-44be-bc3b-d68a28a4764e	Agenda 2025 Oxford	Planificador semanal con tapa flexible.	120.00	7	Usado	3	c4f8b857-1111-4d1e-9000-000000000015	f
7280fdad-8bfc-4cfb-8ad6-6d9d3b5ee3bb	Cortinas blackout grises	2 paneles, 2x2m.	500.00	6	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000015	f
fad863fc-9489-4b22-88da-e22b6effc9c7	Espejo decorativo redondo	Marco dorado, 60cm diámetro.	450.00	12	Usado	5	c4f8b857-1111-4d1e-9000-000000000015	f
d1a2d807-3ce1-4062-9b22-99dc1718f2ee	Set de cuchillos Cuisinart 12 piezas	Acero inoxidable con bloque de madera.	500.00	8	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000015	f
72b53a46-3feb-488e-b3c5-131970f32c12	Perfume Carolina Herrera 212 VIP	Aroma floral oriental.	700.00	11	Usado	4	c4f8b857-1111-4d1e-9000-000000000015	f
e706891a-aa6b-4a41-b490-54de9f760b4d	Cafetera Nespresso Essenza Mini	Compatible con cápsulas Nespresso.	750.00	11	Usado	2	c4f8b857-1111-4d1e-9000-000000000015	f
5ed78473-12ab-4def-b864-204a2a9555b1	Cojín decorativo beige	Tela suave, funda removible.	90.00	4	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000015	f
8182bc67-3e46-455c-9268-b1df13c85baf	Licuadora Oster Reversa 600W	Cuchillas de acero inoxidable, vaso de vidrio.	450.00	13	Usado	2	c4f8b857-1111-4d1e-9000-000000000015	f
38fd6b6f-ebc0-499a-88ae-7d52e969ca5b	SSD Crucial MX500 1TB	Unidad de estado sólido SATA 2.5".	850.00	8	Usado	1	c4f8b857-1111-4d1e-9000-000000000016	f
50cb0193-c1f1-46d0-8cf0-847b5f6f3254	Cepillo eléctrico Oral-B Pro 1000	Cabezal redondo rotatorio.	300.00	8	Usado	4	c4f8b857-1111-4d1e-9000-000000000016	f
9b6cfd6e-3224-4b28-a66f-c26ff222c76c	Billetera Guess original	Cuero genuino marrón.	320.00	7	Usado	4	c4f8b857-1111-4d1e-9000-000000000016	f
4c8c6043-7ae2-44c5-abe3-d0d4d1def431	Crema hidratante Nivea Men 200ml	Protección diaria.	60.00	2	Usado	4	c4f8b857-1111-4d1e-9000-000000000016	f
5309e3b9-98ec-4d48-b321-863ffc88db12	Guantes de ciclismo Rockbros	Antideslizantes.	180.00	13	Usado	6	c4f8b857-1111-4d1e-9000-000000000016	f
58c69c94-3591-45b3-b0f1-379dbfd86241	Planta artificial decorativa	Maceta cerámica blanca.	180.00	10	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000016	f
108fdd1f-7f63-40c5-8ca9-2448388284a1	Laptop Lenovo IdeaPad 3	Ryzen 5, 8GB RAM, 512GB SSD.	5200.00	14	Usado	1	c4f8b857-1111-4d1e-9000-000000000016	f
798d2e47-bb78-4fd3-9d0e-6dd83514c0cc	Aspiradora Electrolux Pure D9	Filtro HEPA, bolsa de 5L.	1900.00	10	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000016	f
4ad304eb-0878-4527-9876-eb048fd03876	Ventilador Dyson Cool AM07	Sin aspas, silencioso.	2200.00	3	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000016	f
dc9ae67e-77cb-43a3-9338-6d026b63a703	Microondas Panasonic NN-SN67HS	1.2 pies cúbicos, sensor inverter.	950.00	7	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000016	f
897d573b-7fc3-4afc-a15a-dbb0e254a67e	Router ASUS RT-AX55	WiFi 6 Dual Band, 1800 Mbps.	950.00	4	Nuevo	1	c4f8b857-1111-4d1e-9000-000000000017	f
68bf1dd6-2e0c-4d6d-a7d3-e8dacabb5636	Shampoo Pantene Pro-V 400ml	Fortalece el cabello.	55.00	15	Nuevo	4	c4f8b857-1111-4d1e-9000-000000000017	f
98c6d2a7-320c-4149-b144-0bd45e064163	Tapete para yoga Manduka	Antideslizante profesional.	420.00	2	Usado	6	c4f8b857-1111-4d1e-9000-000000000017	f
b5796591-d659-4403-bfcd-fc9f5eea7b6e	Calculadora Texas Instruments TI-84 Plus	Gráfica, con pantalla a color.	900.00	11	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000017	f
f50b827c-b4db-4852-9494-c4eab1dee864	Lentes de sol Ray-Ban Wayfarer	Protección UV400.	950.00	2	Usado	4	c4f8b857-1111-4d1e-9000-000000000017	f
c8652a80-afae-47df-8182-0cbc77c8cdae	Jarrón de cristal soplado	Diseño elegante transparente.	220.00	3	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000017	f
0526d89d-192a-41e0-a218-44e935d36b9a	Audífonos Logitech G Pro X	Sonido envolvente 7.1 con micrófono desmontable.	950.00	2	Usado	1	c4f8b857-1111-4d1e-9000-000000000017	f
fc62c3d7-1e00-4341-b0c2-654765466c88	Taza térmica Contigo 500ml	Acero inoxidable, hermética.	250.00	6	Usado	4	c4f8b857-1111-4d1e-9000-000000000017	f
10438913-eede-440b-92d7-b1f82e8f2be4	Paraguas compacto Columbia	Resistente al viento.	180.00	9	Usado	6	c4f8b857-1111-4d1e-9000-000000000017	f
bad32fd5-c71b-4fad-b47c-1613f08f6b56	Teclado mecánico Corsair K68	Teclado mecánico con retroiluminación RGB.	600.00	7	Usado	1	c4f8b857-1111-4d1e-9000-000000000017	f
031308a1-2ad7-414e-820e-c26aaad6db7c	Libro Álgebra Lineal	Texto universitario clásico.	250.00	12	Usado	3	c4f8b857-1111-4d1e-9000-000000000018	f
51b4827c-a604-4606-a180-d8a1e2627849	Gorra Nike Sportswear	Algodón, ajustable.	180.00	11	Usado	4	c4f8b857-1111-4d1e-9000-000000000018	f
024e8af0-10e2-4eb1-9be7-6f8cd44e66b1	Maletín Samsonite 20"	Ruedas giratorias, ABS rígido.	950.00	14	Nuevo	6	c4f8b857-1111-4d1e-9000-000000000018	f
7fc4953c-093c-4395-9385-a1bdade3ea75	Freidora de aire Philips XL	Capacidad de 5.5L, pantalla digital.	1100.00	12	Usado	2	c4f8b857-1111-4d1e-9000-000000000018	f
04d7a401-0311-47f4-86cc-3d8029bf09b9	Set de herramientas Bosch 46 piezas	Brocas, llaves, y maletín.	550.00	15	Usado	6	c4f8b857-1111-4d1e-9000-000000000018	f
2af7b225-90d8-4e20-a167-4569d6f42ab2	Mochila Herschel Pop Quiz	Compartimiento acolchado para laptop.	420.00	11	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000018	f
d64dc1cb-294a-4d3d-a92d-5dee6843f856	Termo Stanley Classic 1L	Mantiene temperatura 24h.	300.00	11	Nuevo	6	c4f8b857-1111-4d1e-9000-000000000018	f
ca8184a9-061a-4333-bc11-9613056d2518	Alfombra persa 2x3m	Diseño clásico oriental.	950.00	12	Usado	5	c4f8b857-1111-4d1e-9000-000000000018	f
f2da7762-76f9-4c6a-8316-3af70e43ccbb	Bolígrafo Parker Jotter	Acero inoxidable, recargable.	150.00	6	Usado	3	c4f8b857-1111-4d1e-9000-000000000018	f
e361c2f6-f5dd-41d6-b894-d995ebe10fa0	Vela aromática Yankee Candle	Aroma a vainilla.	120.00	15	Nuevo	5	c4f8b857-1111-4d1e-9000-000000000018	f
1709ae1b-08c2-482f-bbd0-9c5154448fa7	Mouse inalámbrico Razer Pro Click	Mouse ergonómico inalámbrico con sensor óptico.	450.00	3	Usado	1	c4f8b857-1111-4d1e-9000-000000000019	f
73bfb0b4-ad82-464d-9c66-bb9f0bbd78aa	Horno tostador Hamilton Beach	Capacidad de 6 rebanadas, temporizador.	600.00	4	Usado	2	c4f8b857-1111-4d1e-9000-000000000019	f
8e022fa7-2c07-4eae-a0e9-34f19b7b89d9	Smartwatch Huawei GT3	Reloj inteligente con GPS integrado.	1800.00	12	Usado	1	c4f8b857-1111-4d1e-9000-000000000019	f
1b521855-59bb-451f-9c40-b49f48f76fce	Perfume Chanel Bleu 100ml	Fragancia elegante amaderada.	1200.00	8	Nuevo	4	c4f8b857-1111-4d1e-9000-000000000019	f
d61bbd23-8095-449a-80b1-2b3db5e231e2	Libro Estructuras de Datos en Java	4ta edición, Pearson.	350.00	11	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000019	f
5a116e1f-1de1-46af-a068-d8ff18feb8ff	Tablet Samsung Galaxy Tab S6 Lite	Pantalla de 10.4", S Pen incluido.	2900.00	4	Usado	1	c4f8b857-1111-4d1e-9000-000000000019	f
25e6fb05-40cf-45cf-9d79-f8813733c308	Calculadora Casio FX-991EX	Pantalla natural, 552 funciones.	300.00	10	Usado	3	c4f8b857-1111-4d1e-9000-000000000019	f
4d5bcafc-e8d9-4855-941d-26e0a2d084fc	Libro Matemáticas Discretas	3ra edición, McGraw-Hill.	280.00	10	Nuevo	3	c4f8b857-1111-4d1e-9000-000000000019	f
8efc946a-f1ee-4fa9-9f19-31ce0a29cf34	Bicicleta estática Reebok Jet 100	12 programas, pantalla LCD.	2500.00	8	Nuevo	6	c4f8b857-1111-4d1e-9000-000000000019	f
7a54d5c5-424b-4b4c-b79a-ce414df6fd1a	Plancha Oster SteamGlide	Base cerámica, vapor ajustable.	350.00	12	Nuevo	2	c4f8b857-1111-4d1e-9000-000000000019	f
\.


--
-- TOC entry 5107 (class 0 OID 24728)
-- Dependencies: 230
-- Data for Name: rating; Type: TABLE DATA; Schema: productos; Owner: postgres
--

COPY productos.rating (id, id_producto, promedio) FROM stdin;
\.


--
-- TOC entry 5101 (class 0 OID 24635)
-- Dependencies: 224
-- Data for Name: persona; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

COPY usuarios.persona (dpi, nombre, direccion, correo, ganancias, id_usuario) FROM stdin;
1000000000101	Administrador General	Ciudad de Guatemala	admin@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000001
2000000000101	Moderador 1	Quetzaltenango	mod1@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000002
2000000000102	Moderador 2	Quetzaltenango	mod2@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000003
2000000000103	Moderador 3	Quetzaltenango	mod3@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000004
2000000000104	Moderador 4	Quetzaltenango	mod4@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000005
2000000000105	Moderador 5	Quetzaltenango	mod5@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000006
3000000000101	Logística 1	Ciudad de Guatemala	log1@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000007
3000000000102	Logística 2	Ciudad de Guatemala	log2@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000008
3000000000103	Logística 3	Ciudad de Guatemala	log3@ecommerce.gt	0.00	c4f8b857-1111-4d1e-9000-000000000009
4000000000101	Usuario 1	Quetzaltenango	user1@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000010
4000000000102	Usuario 2	Quetzaltenango	user2@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000011
4000000000103	Usuario 3	Quetzaltenango	user3@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000012
4000000000104	Usuario 4	Quetzaltenango	user4@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000013
4000000000105	Usuario 5	Quetzaltenango	user5@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000014
4000000000106	Usuario 6	Quetzaltenango	user6@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000015
4000000000107	Usuario 7	Quetzaltenango	user7@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000016
4000000000108	Usuario 8	Quetzaltenango	user8@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000017
4000000000109	Usuario 9	Quetzaltenango	user9@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000018
4000000000110	Usuario 10	Quetzaltenango	user10@correo.gt	0.00	c4f8b857-1111-4d1e-9000-000000000019
\.


--
-- TOC entry 5102 (class 0 OID 24648)
-- Dependencies: 225
-- Data for Name: tarjeta; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

COPY usuarios.tarjeta (numero, fecha_vencimiento, cvv, id_usuario, nombre) FROM stdin;
\.


--
-- TOC entry 5099 (class 0 OID 24581)
-- Dependencies: 222
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

COPY usuarios.tipo_usuario (id, nombre) FROM stdin;
1	Administrador
2	Moderador
3	Logistica
4	Comun
\.


--
-- TOC entry 5100 (class 0 OID 24624)
-- Dependencies: 223
-- Data for Name: usuario; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

COPY usuarios.usuario (id, usuario, salt, password, id_tipo) FROM stdin;
c4f8b857-1111-4d1e-9000-000000000001	admin	salt123	admin123	1
c4f8b857-1111-4d1e-9000-000000000002	moderador1	salt123	mod123	2
c4f8b857-1111-4d1e-9000-000000000003	moderador2	salt123	mod123	2
c4f8b857-1111-4d1e-9000-000000000004	moderador3	salt123	mod123	2
c4f8b857-1111-4d1e-9000-000000000005	moderador4	salt123	mod123	2
c4f8b857-1111-4d1e-9000-000000000006	moderador5	salt123	mod123	2
c4f8b857-1111-4d1e-9000-000000000007	logistica1	salt123	log123	3
c4f8b857-1111-4d1e-9000-000000000008	logistica2	salt123	log123	3
c4f8b857-1111-4d1e-9000-000000000009	logistica3	salt123	log123	3
c4f8b857-1111-4d1e-9000-000000000010	usuario1	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000011	usuario2	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000012	usuario3	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000013	usuario4	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000014	usuario5	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000015	usuario6	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000016	usuario7	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000017	usuario8	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000018	usuario9	salt123	user123	4
c4f8b857-1111-4d1e-9000-000000000019	usuario10	salt123	user123	4
\.


--
-- TOC entry 5112 (class 0 OID 24763)
-- Dependencies: 235
-- Data for Name: cart; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.cart (id, id_usuario, total) FROM stdin;
\.


--
-- TOC entry 5114 (class 0 OID 24775)
-- Dependencies: 237
-- Data for Name: detalle_cart; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.detalle_cart (id, subtotal, cantidad, id_producto, id_cart) FROM stdin;
\.


--
-- TOC entry 5117 (class 0 OID 24822)
-- Dependencies: 240
-- Data for Name: detalle_pedido; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.detalle_pedido (id, subtotal, cantidad, id_producto, id_pedido) FROM stdin;
\.


--
-- TOC entry 5121 (class 0 OID 24866)
-- Dependencies: 244
-- Data for Name: estado_pedido; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.estado_pedido (id, nombre) FROM stdin;
\.


--
-- TOC entry 5119 (class 0 OID 24842)
-- Dependencies: 242
-- Data for Name: pago; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.pago (id, cantidad, id_tarjeta) FROM stdin;
\.


--
-- TOC entry 5115 (class 0 OID 24806)
-- Dependencies: 238
-- Data for Name: pedido; Type: TABLE DATA; Schema: ventas; Owner: postgres
--

COPY ventas.pedido (id, total, fecha_envio, fecha_entrega, id_usuario, id_pago, id_estado) FROM stdin;
\.


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 251
-- Name: entrega_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('general.entrega_id_seq', 1, false);


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 247
-- Name: notificacion_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('general.notificacion_id_seq', 1, false);


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 249
-- Name: revision_producto_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('general.revision_producto_id_seq', 1, false);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 245
-- Name: sancion_id_seq; Type: SEQUENCE SET; Schema: general; Owner: postgres
--

SELECT pg_catalog.setval('general.sancion_id_seq', 1, false);


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 226
-- Name: categoria_producto_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: postgres
--

SELECT pg_catalog.setval('productos.categoria_producto_id_seq', 6, true);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 232
-- Name: detalle_rating_id_rating_seq; Type: SEQUENCE SET; Schema: productos; Owner: postgres
--

SELECT pg_catalog.setval('productos.detalle_rating_id_rating_seq', 1, false);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 231
-- Name: detalle_rating_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: postgres
--

SELECT pg_catalog.setval('productos.detalle_rating_id_seq', 1, false);


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 229
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: postgres
--

SELECT pg_catalog.setval('productos.rating_id_seq', 1, false);


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 221
-- Name: tipo_usuario_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios.tipo_usuario_id_seq', 4, true);


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 234
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.cart_id_seq', 1, false);


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 236
-- Name: detalle_cart_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.detalle_cart_id_seq', 1, false);


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 239
-- Name: detalle_pedido_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.detalle_pedido_id_seq', 1, false);


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 243
-- Name: estado_pedido_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.estado_pedido_id_seq', 1, false);


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 241
-- Name: pago_id_seq; Type: SEQUENCE SET; Schema: ventas; Owner: postgres
--

SELECT pg_catalog.setval('ventas.pago_id_seq', 1, false);


--
-- TOC entry 4928 (class 2606 OID 24940)
-- Name: entrega entrega_pkey; Type: CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.entrega
    ADD CONSTRAINT entrega_pkey PRIMARY KEY (id);


--
-- TOC entry 4924 (class 2606 OID 24906)
-- Name: notificacion notificacion_pkey; Type: CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.notificacion
    ADD CONSTRAINT notificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 24921)
-- Name: revision_producto revision_producto_pkey; Type: CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.revision_producto
    ADD CONSTRAINT revision_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4922 (class 2606 OID 24886)
-- Name: sancion sancion_pkey; Type: CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.sancion
    ADD CONSTRAINT sancion_pkey PRIMARY KEY (id);


--
-- TOC entry 4896 (class 2606 OID 24659)
-- Name: categoria_producto categoria_producto_pkey; Type: CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.categoria_producto
    ADD CONSTRAINT categoria_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4904 (class 2606 OID 24751)
-- Name: detalle_rating detalle_rating_pkey; Type: CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.detalle_rating
    ADD CONSTRAINT detalle_rating_pkey PRIMARY KEY (id);


--
-- TOC entry 4898 (class 2606 OID 24726)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4900 (class 2606 OID 24735)
-- Name: rating rating_id_producto_key; Type: CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.rating
    ADD CONSTRAINT rating_id_producto_key UNIQUE (id_producto);


--
-- TOC entry 4902 (class 2606 OID 24733)
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 24717)
-- Name: persona persona_id_usuario_key; Type: CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.persona
    ADD CONSTRAINT persona_id_usuario_key UNIQUE (id_usuario);


--
-- TOC entry 4892 (class 2606 OID 25006)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (dpi);


--
-- TOC entry 4894 (class 2606 OID 24978)
-- Name: tarjeta tarjeta_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY (numero);


--
-- TOC entry 4886 (class 2606 OID 24586)
-- Name: tipo_usuario tipo_usuario_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4888 (class 2606 OID 24629)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4906 (class 2606 OID 24792)
-- Name: cart cart_id_usuario_key; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cart
    ADD CONSTRAINT cart_id_usuario_key UNIQUE (id_usuario);


--
-- TOC entry 4908 (class 2606 OID 24768)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 4910 (class 2606 OID 24780)
-- Name: detalle_cart detalle_cart_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_cart
    ADD CONSTRAINT detalle_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 4916 (class 2606 OID 24827)
-- Name: detalle_pedido detalle_pedido_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4920 (class 2606 OID 24871)
-- Name: estado_pedido estado_pedido_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.estado_pedido
    ADD CONSTRAINT estado_pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4918 (class 2606 OID 24849)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id);


--
-- TOC entry 4912 (class 2606 OID 24857)
-- Name: pedido pedido_id_pago_key; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pedido_id_pago_key UNIQUE (id_pago);


--
-- TOC entry 4914 (class 2606 OID 24810)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- TOC entry 4951 (class 2606 OID 24946)
-- Name: entrega entrega_id_encargado_fkey; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.entrega
    ADD CONSTRAINT entrega_id_encargado_fkey FOREIGN KEY (id_encargado) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4952 (class 2606 OID 24941)
-- Name: entrega entrega_id_pedido_fkey; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.entrega
    ADD CONSTRAINT entrega_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES ventas.pedido(id);


--
-- TOC entry 4948 (class 2606 OID 24907)
-- Name: notificacion notificacion_id_usuario_fkey; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.notificacion
    ADD CONSTRAINT notificacion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4949 (class 2606 OID 24927)
-- Name: revision_producto revision_producto_id_moderador_fkey; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.revision_producto
    ADD CONSTRAINT revision_producto_id_moderador_fkey FOREIGN KEY (id_moderador) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4950 (class 2606 OID 24922)
-- Name: revision_producto revision_producto_id_producto_fkey; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.revision_producto
    ADD CONSTRAINT revision_producto_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES productos.producto(id);


--
-- TOC entry 4946 (class 2606 OID 24887)
-- Name: sancion sancion_id_moderador_fkey; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.sancion
    ADD CONSTRAINT sancion_id_moderador_fkey FOREIGN KEY (id_moderador) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4947 (class 2606 OID 24892)
-- Name: sancion sancion_id_usuario_fkey; Type: FK CONSTRAINT; Schema: general; Owner: postgres
--

ALTER TABLE ONLY general.sancion
    ADD CONSTRAINT sancion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4935 (class 2606 OID 24752)
-- Name: detalle_rating detalle_rating_id_rating_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.detalle_rating
    ADD CONSTRAINT detalle_rating_id_rating_fkey FOREIGN KEY (id_rating) REFERENCES productos.rating(id);


--
-- TOC entry 4936 (class 2606 OID 24757)
-- Name: detalle_rating detalle_rating_id_usuario_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.detalle_rating
    ADD CONSTRAINT detalle_rating_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4932 (class 2606 OID 24665)
-- Name: producto producto_id_categoria_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.producto
    ADD CONSTRAINT producto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES productos.categoria_producto(id);


--
-- TOC entry 4933 (class 2606 OID 24670)
-- Name: producto producto_id_usuario_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.producto
    ADD CONSTRAINT producto_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4934 (class 2606 OID 24736)
-- Name: rating rating_id_producto_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: postgres
--

ALTER TABLE ONLY productos.rating
    ADD CONSTRAINT rating_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES productos.producto(id);


--
-- TOC entry 4931 (class 2606 OID 24972)
-- Name: tarjeta fkeotjren5ys0pqv54katiq8bo9; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.tarjeta
    ADD CONSTRAINT fkeotjren5ys0pqv54katiq8bo9 FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4930 (class 2606 OID 24643)
-- Name: persona persona_id_usuario_fkey; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.persona
    ADD CONSTRAINT persona_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id) NOT VALID;


--
-- TOC entry 4929 (class 2606 OID 24630)
-- Name: usuario usuario_id_tipo_fkey; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios.usuario
    ADD CONSTRAINT usuario_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES usuarios.tipo_usuario(id);


--
-- TOC entry 4937 (class 2606 OID 24769)
-- Name: cart cart_id_usuario_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.cart
    ADD CONSTRAINT cart_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id);


--
-- TOC entry 4938 (class 2606 OID 24786)
-- Name: detalle_cart detalle_cart_id_cart_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_cart
    ADD CONSTRAINT detalle_cart_id_cart_fkey FOREIGN KEY (id_cart) REFERENCES ventas.cart(id);


--
-- TOC entry 4939 (class 2606 OID 24781)
-- Name: detalle_cart detalle_cart_id_producto_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_cart
    ADD CONSTRAINT detalle_cart_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES productos.producto(id);


--
-- TOC entry 4943 (class 2606 OID 24833)
-- Name: detalle_pedido detalle_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_pedido
    ADD CONSTRAINT detalle_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES ventas.pedido(id);


--
-- TOC entry 4944 (class 2606 OID 24828)
-- Name: detalle_pedido detalle_pedido_id_producto_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.detalle_pedido
    ADD CONSTRAINT detalle_pedido_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES productos.producto(id);


--
-- TOC entry 4945 (class 2606 OID 24979)
-- Name: pago pago_id_tarjeta_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pago
    ADD CONSTRAINT pago_id_tarjeta_fkey FOREIGN KEY (id_tarjeta) REFERENCES usuarios.tarjeta(numero);


--
-- TOC entry 4940 (class 2606 OID 24872)
-- Name: pedido pedido_id_estado_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pedido_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES ventas.estado_pedido(id) NOT VALID;


--
-- TOC entry 4941 (class 2606 OID 24858)
-- Name: pedido pedido_id_pago_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pedido_id_pago_fkey FOREIGN KEY (id_pago) REFERENCES ventas.pago(id) NOT VALID;


--
-- TOC entry 4942 (class 2606 OID 24811)
-- Name: pedido pedido_id_usuario_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pedido
    ADD CONSTRAINT pedido_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuarios.usuario(id);


-- Completed on 2025-10-06 16:55:50

--
-- PostgreSQL database dump complete
--

\unrestrict xMBBA3Nf5zNm05W5hULB4hPlun9iqPkLaJztY9vlPiUlUvHjG5bLQ0B4pDZKd0G

