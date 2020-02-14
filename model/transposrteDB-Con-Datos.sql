--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: crea_primary_empresa_has_vehiculo(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crea_primary_empresa_has_vehiculo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.idev:=NEW.idempresa||'_'||NEW.idvehiculo;--Concatenado
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.crea_primary_empresa_has_vehiculo() OWNER TO postgres;

--
-- Name: crea_primary_vehiculo_has_conductor(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crea_primary_vehiculo_has_conductor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.idvc:=NEW.idvehiculo||'_'||NEW.idconductor;--Concatenado
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.crea_primary_vehiculo_has_conductor() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudad (
    idciudad integer NOT NULL,
    iddepartamento integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE ciudad OWNER TO postgres;

--
-- Name: ciudad_idciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudad_idciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudad_idciudad_seq OWNER TO postgres;

--
-- Name: ciudad_idciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudad_idciudad_seq OWNED BY ciudad.idciudad;


--
-- Name: conductor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conductor (
    idconductor bigint NOT NULL,
    idpersona bigint NOT NULL,
    num_licencia character varying NOT NULL
);


ALTER TABLE conductor OWNER TO postgres;

--
-- Name: conductor_idconductor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conductor_idconductor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conductor_idconductor_seq OWNER TO postgres;

--
-- Name: conductor_idconductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conductor_idconductor_seq OWNED BY conductor.idconductor;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamento (
    iddepartamento integer NOT NULL,
    idpais integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE departamento OWNER TO postgres;

--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE departamento_iddepartamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE departamento_iddepartamento_seq OWNER TO postgres;

--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE departamento_iddepartamento_seq OWNED BY departamento.iddepartamento;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empresa (
    idempresa bigint NOT NULL,
    idciudad integer NOT NULL,
    idpersona_representante bigint NOT NULL,
    nombre character varying NOT NULL,
    numdocumento_nit character varying NOT NULL,
    direccion text,
    telefono numeric(13,0),
    tipodocumento character varying,
    CONSTRAINT empresa_tipodocumento_check CHECK (((tipodocumento)::text = ANY (ARRAY[('NIT'::character varying)::text, ('RUT'::character varying)::text])))
);


ALTER TABLE empresa OWNER TO postgres;

--
-- Name: empresa_has_vehiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empresa_has_vehiculo (
    idev character varying NOT NULL,
    idempresa bigint NOT NULL,
    idvehiculo bigint NOT NULL
);


ALTER TABLE empresa_has_vehiculo OWNER TO postgres;

--
-- Name: empresa_idempresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresa_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa_idempresa_seq OWNER TO postgres;

--
-- Name: empresa_idempresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_idempresa_seq OWNED BY empresa.idempresa;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    idpais integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE pais OWNER TO postgres;

--
-- Name: pais_idpais_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pais_idpais_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pais_idpais_seq OWNER TO postgres;

--
-- Name: pais_idpais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pais_idpais_seq OWNED BY pais.idpais;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona (
    idpersona bigint NOT NULL,
    idpais integer NOT NULL,
    idciudad integer NOT NULL,
    nombres character varying NOT NULL,
    apellidos character varying NOT NULL,
    tipodocumento character varying,
    numdocumento numeric(20,0) NOT NULL,
    num_telefono numeric(15,0),
    direccion text,
    CONSTRAINT persona_tipodocumento_check CHECK (((tipodocumento)::text = ANY ((ARRAY['CEDULA'::character varying, 'CED. EXTRANGERIA'::character varying, 'PASAPORTE'::character varying])::text[])))
);


ALTER TABLE persona OWNER TO postgres;

--
-- Name: persona_idpersona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_idpersona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE persona_idpersona_seq OWNER TO postgres;

--
-- Name: persona_idpersona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_idpersona_seq OWNED BY persona.idpersona;


--
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehiculo (
    idvehiculo bigint NOT NULL,
    placa character varying NOT NULL,
    motor character varying NOT NULL,
    chasis character varying NOT NULL,
    modelo integer NOT NULL,
    marca character(20) NOT NULL,
    cantidad_puertas integer NOT NULL,
    fecha_matricula date,
    num_pasa_sentados integer,
    num_pasa_pie integer,
    peso_seco double precision,
    peso_bruto double precision,
    linea character varying
);


ALTER TABLE vehiculo OWNER TO postgres;

--
-- Name: vehiculo_has_conductor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehiculo_has_conductor (
    idvc character varying NOT NULL,
    idvehiculo bigint NOT NULL,
    idconductor bigint NOT NULL
);


ALTER TABLE vehiculo_has_conductor OWNER TO postgres;

--
-- Name: vehiculo_idvehiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehiculo_idvehiculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculo_idvehiculo_seq OWNER TO postgres;

--
-- Name: vehiculo_idvehiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehiculo_idvehiculo_seq OWNED BY vehiculo.idvehiculo;


--
-- Name: idciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad ALTER COLUMN idciudad SET DEFAULT nextval('ciudad_idciudad_seq'::regclass);


--
-- Name: idconductor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conductor ALTER COLUMN idconductor SET DEFAULT nextval('conductor_idconductor_seq'::regclass);


--
-- Name: iddepartamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento ALTER COLUMN iddepartamento SET DEFAULT nextval('departamento_iddepartamento_seq'::regclass);


--
-- Name: idempresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN idempresa SET DEFAULT nextval('empresa_idempresa_seq'::regclass);


--
-- Name: idpais; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais ALTER COLUMN idpais SET DEFAULT nextval('pais_idpais_seq'::regclass);


--
-- Name: idpersona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN idpersona SET DEFAULT nextval('persona_idpersona_seq'::regclass);


--
-- Name: idvehiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo ALTER COLUMN idvehiculo SET DEFAULT nextval('vehiculo_idvehiculo_seq'::regclass);


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (idciudad, iddepartamento, nombre) FROM stdin;
1	1	BOGOTA
6	3	MEDELLIN
3	1	ZIPAQUIRA
2	1	CHIA
7	7	CALI
\.


--
-- Name: ciudad_idciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudad_idciudad_seq', 7, true);


--
-- Data for Name: conductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conductor (idconductor, idpersona, num_licencia) FROM stdin;
1	2	123456
2	3	2132132
3	4	8946544
\.


--
-- Name: conductor_idconductor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conductor_idconductor_seq', 3, true);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departamento (iddepartamento, idpais, nombre) FROM stdin;
1	1	BOGOTA
7	1	VALLE DEL CAUCA
2	1	CUNDINAMARCA
3	1	ANTIOQUIA
\.


--
-- Name: departamento_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('departamento_iddepartamento_seq', 7, true);


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empresa (idempresa, idciudad, idpersona_representante, nombre, numdocumento_nit, direccion, telefono, tipodocumento) FROM stdin;
2	1	1	UBER	900.504.286-7	CARRERA 1 # 2-3	310659844	NIT
\.


--
-- Data for Name: empresa_has_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empresa_has_vehiculo (idev, idempresa, idvehiculo) FROM stdin;
2_1	2	1
2_2	2	2
\.


--
-- Name: empresa_idempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresa_idempresa_seq', 2, true);


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pais (idpais, nombre) FROM stdin;
1	COLOMBIA
2	ECUADOR
3	VENEZUELA
\.


--
-- Name: pais_idpais_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pais_idpais_seq', 3, true);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona (idpersona, idpais, idciudad, nombres, apellidos, tipodocumento, numdocumento, num_telefono, direccion) FROM stdin;
1	1	1	LUIS	OLARTE	CEDULA	1022323265	3112688318	CARRERA 15 # 85 -29
2	1	1	NAPOLEON	AVILA	CEDULA	1018415676	3103106438	CALLE 63 A # 16 -54
3	1	1	CARLOS	CAICEDO	CEDULA	1111111111	1111111111	CALLE PRUEBA 1
4	1	1	JEFERSON	RIVERA	CEDULA	2222222222	222222222	CALLE PRUEBA 2
\.


--
-- Name: persona_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_idpersona_seq', 4, true);


--
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehiculo (idvehiculo, placa, motor, chasis, modelo, marca, cantidad_puertas, fecha_matricula, num_pasa_sentados, num_pasa_pie, peso_seco, peso_bruto, linea) FROM stdin;
1	FIY 846	1796cc	321SAD21	2018	CHEVROLET           	5	2018-01-01	5	0	567.230000000000018	600	\N
2	URQ 256	4000cc	2132QWE7	2010	FORF                	5	2010-01-01	5	0	\N	\N	\N
6	BKZ 181	1300cc	1231ED87	2000	MAZDA               	5	2000-01-01	1	0	\N	\N	\N
\.


--
-- Data for Name: vehiculo_has_conductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehiculo_has_conductor (idvc, idvehiculo, idconductor) FROM stdin;
1_1	1	1
1_3	1	3
2_1	2	1
6_2	6	2
\.


--
-- Name: vehiculo_idvehiculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehiculo_idvehiculo_seq', 6, true);


--
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (idciudad);


--
-- Name: conductor_num_licencia_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conductor
    ADD CONSTRAINT conductor_num_licencia_key UNIQUE (num_licencia);


--
-- Name: conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conductor
    ADD CONSTRAINT conductor_pkey PRIMARY KEY (idconductor);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (iddepartamento);


--
-- Name: empresa_has_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empresa_has_vehiculo
    ADD CONSTRAINT empresa_has_vehiculo_pkey PRIMARY KEY (idev);


--
-- Name: empresa_numdocumento_nit_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_numdocumento_nit_key UNIQUE (numdocumento_nit);


--
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);


--
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (idpais);


--
-- Name: persona_numdocumento_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_numdocumento_key UNIQUE (numdocumento);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (idpersona);


--
-- Name: vehiculo_has_conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculo_has_conductor
    ADD CONSTRAINT vehiculo_has_conductor_pkey PRIMARY KEY (idvc);


--
-- Name: vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (idvehiculo);


--
-- Name: vehiculo_placa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT vehiculo_placa_key UNIQUE (placa);


--
-- Name: tgr_crea_primary_empresa_has_vehiculo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tgr_crea_primary_empresa_has_vehiculo BEFORE INSERT OR UPDATE ON empresa_has_vehiculo FOR EACH ROW EXECUTE PROCEDURE crea_primary_empresa_has_vehiculo();


--
-- Name: tgr_crea_primary_vehiculo_has_conductor; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tgr_crea_primary_vehiculo_has_conductor BEFORE INSERT OR UPDATE ON vehiculo_has_conductor FOR EACH ROW EXECUTE PROCEDURE crea_primary_vehiculo_has_conductor();


--
-- Name: ciudad_iddepartamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: conductor_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conductor
    ADD CONSTRAINT conductor_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES persona(idpersona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: departamento_idpais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_idpais_fkey FOREIGN KEY (idpais) REFERENCES pais(idpais) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: empresa_has_vehiculo_idempresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa_has_vehiculo
    ADD CONSTRAINT empresa_has_vehiculo_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES empresa(idempresa) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: empresa_has_vehiculo_idvehiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa_has_vehiculo
    ADD CONSTRAINT empresa_has_vehiculo_idvehiculo_fkey FOREIGN KEY (idvehiculo) REFERENCES vehiculo(idvehiculo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: empresa_idciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idciudad_fkey FOREIGN KEY (idciudad) REFERENCES ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: empresa_idpersona_representante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idpersona_representante_fkey FOREIGN KEY (idpersona_representante) REFERENCES persona(idpersona) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk7fbkenegc7ikam5r335cl639v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT fk7fbkenegc7ikam5r335cl639v FOREIGN KEY (idpais) REFERENCES pais(idpais);


--
-- Name: fkbp973p66k3a7gby2y5sirt4t5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT fkbp973p66k3a7gby2y5sirt4t5 FOREIGN KEY (idciudad) REFERENCES ciudad(idciudad);


--
-- Name: fkdy1a8nevmhn5obhl3m7pytc1r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT fkdy1a8nevmhn5obhl3m7pytc1r FOREIGN KEY (idpersona_representante) REFERENCES persona(idpersona);


--
-- Name: fkfmelsg21nieitqyv9w2oqmbu9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fkfmelsg21nieitqyv9w2oqmbu9 FOREIGN KEY (idpais) REFERENCES pais(idpais);


--
-- Name: fkgw4gea23qxv2ao7l6q4elejj6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fkgw4gea23qxv2ao7l6q4elejj6 FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento);


--
-- Name: fkkofew1po2j73yb77t0rnl9cv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fkkofew1po2j73yb77t0rnl9cv FOREIGN KEY (idciudad) REFERENCES ciudad(idciudad);


--
-- Name: persona_idciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_idciudad_fkey FOREIGN KEY (idciudad) REFERENCES ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: persona_idpais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_idpais_fkey FOREIGN KEY (idpais) REFERENCES pais(idpais) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: vehiculo_has_conductor_idconductor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo_has_conductor
    ADD CONSTRAINT vehiculo_has_conductor_idconductor_fkey FOREIGN KEY (idconductor) REFERENCES conductor(idconductor) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: vehiculo_has_conductor_idvehiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo_has_conductor
    ADD CONSTRAINT vehiculo_has_conductor_idvehiculo_fkey FOREIGN KEY (idvehiculo) REFERENCES vehiculo(idvehiculo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

