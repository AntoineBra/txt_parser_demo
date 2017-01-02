--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id integer NOT NULL,
    "Num" bigint,
    "UNNRec" text,
    "KorNameOnly" text,
    "Nazn" text,
    "Cod" text,
    "Acc" text,
    "Db" text,
    "DbS" text,
    "Credit" text,
    "CreditS" text,
    "QueuePay" text,
    "VidDoc" text,
    "DocDate" text,
    "DocType" text,
    "DB" text,
    "DBS" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: system_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE system_data (
    id integer NOT NULL,
    "CR" text,
    "CRS" text,
    "DateOut" text,
    "DebOut" text,
    "CrOut" text,
    "RestOutS" text,
    "stampLeft" text,
    "stampRight" text,
    "stampTop" text,
    "stampBottom" text,
    "KOD_SOATO" text,
    "SEAL_NUMBER" text,
    "FILIAL_NAME" text,
    "PODR_NAME" text,
    "DATE_PROV" text,
    "USER" text,
    "USER_KOD" text,
    "Answer" text,
    "AppSign" text,
    "BAppSign" text,
    "FIOSign" text,
    "BFIOSign" text,
    "KeySign" text,
    "BKeySign" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: system_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE system_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: system_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE system_data_id_seq OWNED BY system_data.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_data ALTER COLUMN id SET DEFAULT nextval('system_data_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: system_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY system_data
    ADD CONSTRAINT system_data_pkey PRIMARY KEY (id);


--
-- Name: index_parseddb_fordashing_development_answer; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_parseddb_fordashing_development_answer ON system_data USING btree ("Answer");


--
-- Name: index_parseddb_fordashing_development_num; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_parseddb_fordashing_development_num ON products USING btree ("Num");


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20161206094452'), ('20161209093349'), ('20161220120021');


