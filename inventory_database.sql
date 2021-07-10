--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO alejandrorodriguez;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO alejandrorodriguez;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO alejandrorodriguez;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO alejandrorodriguez;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO alejandrorodriguez;

--
-- Name: audits; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.audits (
    id integer NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.audits OWNER TO alejandrorodriguez;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.audits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audits_id_seq OWNER TO alejandrorodriguez;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: brake_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.brake_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.brake_types OWNER TO alejandrorodriguez;

--
-- Name: brake_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.brake_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brake_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: brake_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.brake_types_id_seq OWNED BY public.brake_types.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    name character varying,
    description character varying,
    city_id integer,
    company_id integer,
    manager_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state_id integer,
    code character varying,
    last_code integer,
    fleet_cost numeric DEFAULT 0
);


ALTER TABLE public.branches OWNER TO alejandrorodriguez;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO alejandrorodriguez;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    model_part character varying,
    status boolean
);


ALTER TABLE public.brands OWNER TO alejandrorodriguez;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO alejandrorodriguez;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: capacities; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.capacities (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.capacities OWNER TO alejandrorodriguez;

--
-- Name: capacities_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.capacities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capacities_id_seq OWNER TO alejandrorodriguez;

--
-- Name: capacities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.capacities_id_seq OWNED BY public.capacities.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying,
    description text,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_id integer
);


ALTER TABLE public.categories OWNER TO alejandrorodriguez;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO alejandrorodriguez;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying,
    state_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO alejandrorodriguez;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO alejandrorodriguez;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    name character varying,
    last_name character varying,
    maiden_name character varying,
    address character varying,
    postal_code character varying,
    email character varying,
    phone_number character varying,
    cellphone character varying,
    contact character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rfc character varying,
    suburb character varying,
    state_id bigint,
    city_id bigint,
    company character varying
);


ALTER TABLE public.clients OWNER TO alejandrorodriguez;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO alejandrorodriguez;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.colors (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.colors OWNER TO alejandrorodriguez;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO alejandrorodriguez;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying,
    description text,
    logo character varying,
    manager character varying,
    address character varying,
    phone character varying,
    email character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.companies OWNER TO alejandrorodriguez;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO alejandrorodriguez;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.countries OWNER TO alejandrorodriguez;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO alejandrorodriguez;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying,
    description text,
    branch_id integer,
    manager_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    sequence integer,
    last_code character varying
);


ALTER TABLE public.departments OWNER TO alejandrorodriguez;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO alejandrorodriguez;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: divition_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.divition_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.divition_types OWNER TO alejandrorodriguez;

--
-- Name: divition_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.divition_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divition_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: divition_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.divition_types_id_seq OWNED BY public.divition_types.id;


--
-- Name: fender_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.fender_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.fender_types OWNER TO alejandrorodriguez;

--
-- Name: fender_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.fender_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fender_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: fender_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.fender_types_id_seq OWNED BY public.fender_types.id;


--
-- Name: fiscal_vouchers; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.fiscal_vouchers (
    id bigint NOT NULL,
    name character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.fiscal_vouchers OWNER TO alejandrorodriguez;

--
-- Name: fiscal_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.fiscal_vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiscal_vouchers_id_seq OWNER TO alejandrorodriguez;

--
-- Name: fiscal_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.fiscal_vouchers_id_seq OWNED BY public.fiscal_vouchers.id;


--
-- Name: floor_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.floor_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.floor_types OWNER TO alejandrorodriguez;

--
-- Name: floor_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.floor_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.floor_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: floor_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.floor_types_id_seq OWNED BY public.floor_types.id;


--
-- Name: hydraulic_jacks; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.hydraulic_jacks (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.hydraulic_jacks OWNER TO alejandrorodriguez;

--
-- Name: hydraulic_jacks_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.hydraulic_jacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hydraulic_jacks_id_seq OWNER TO alejandrorodriguez;

--
-- Name: hydraulic_jacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.hydraulic_jacks_id_seq OWNED BY public.hydraulic_jacks.id;


--
-- Name: item_files; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.item_files (
    id integer NOT NULL,
    item_id integer,
    file character varying,
    file_type integer,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.item_files OWNER TO alejandrorodriguez;

--
-- Name: item_files_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.item_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_files_id_seq OWNER TO alejandrorodriguez;

--
-- Name: item_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.item_files_id_seq OWNED BY public.item_files.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying,
    description text,
    model character varying,
    serial_number character varying,
    purchased_date date,
    in_service_date date,
    time_unit_service integer,
    time_quantity_service numeric,
    price numeric,
    time_unit_depreciation integer,
    time_quantity_depreciation numeric,
    sub_category_id integer,
    provider_id integer,
    department_id integer,
    user_id integer,
    brand_id integer,
    status_item_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    image character varying,
    maintenance_date date,
    maintenance_done boolean,
    branch_id integer,
    category_id integer,
    to_assing boolean,
    sale_price numeric,
    remission character varying,
    accessory character varying,
    acquisition_date date,
    trailer_id bigint,
    client_id bigint,
    payment_type integer,
    fiscal_voucher_id bigint,
    advance_payment numeric,
    status_shipping_id bigint,
    color character varying,
    trailer_length_id bigint,
    trailer_height_id bigint,
    ramp_type_id bigint,
    redila_type_id bigint,
    trailer_type_id bigint,
    floor_type_id bigint,
    capacity_id bigint,
    duck_tail boolean,
    gooseneck boolean,
    trailer_width_id bigint,
    color_id bigint,
    hydraulic_jack_id bigint,
    pull_type_id bigint,
    brake_type_id bigint,
    reinforcement_type_id bigint,
    fender_type_id bigint,
    turn_type_id bigint,
    divition_type_id bigint,
    suspension_type_id bigint,
    roof_type_id bigint,
    categories_description text,
    seller_percentage numeric,
    planet_percentage numeric,
    branch_percentage numeric
);


ALTER TABLE public.items OWNER TO alejandrorodriguez;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO alejandrorodriguez;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: items_maintenances; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.items_maintenances (
    id integer NOT NULL,
    item_id integer,
    file character varying,
    maintenance_id integer,
    description text,
    price numeric,
    provider character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.items_maintenances OWNER TO alejandrorodriguez;

--
-- Name: items_maintenances_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.items_maintenances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_maintenances_id_seq OWNER TO alejandrorodriguez;

--
-- Name: items_maintenances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.items_maintenances_id_seq OWNED BY public.items_maintenances.id;


--
-- Name: maintenances; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.maintenances (
    id integer NOT NULL,
    name character varying,
    description text,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.maintenances OWNER TO alejandrorodriguez;

--
-- Name: maintenances_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.maintenances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintenances_id_seq OWNER TO alejandrorodriguez;

--
-- Name: maintenances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.maintenances_id_seq OWNED BY public.maintenances.id;


--
-- Name: offices; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.offices (
    id integer NOT NULL,
    name character varying,
    description text,
    department_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.offices OWNER TO alejandrorodriguez;

--
-- Name: offices_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.offices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offices_id_seq OWNER TO alejandrorodriguez;

--
-- Name: offices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.offices_id_seq OWNED BY public.offices.id;


--
-- Name: permission_roles; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.permission_roles (
    id integer NOT NULL,
    role_id integer,
    permission_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permission_roles OWNER TO alejandrorodriguez;

--
-- Name: permission_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.permission_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_roles_id_seq OWNER TO alejandrorodriguez;

--
-- Name: permission_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.permission_roles_id_seq OWNED BY public.permission_roles.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying,
    description character varying,
    action character varying,
    controller character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO alejandrorodriguez;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO alejandrorodriguez;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: plutus_accounts; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.plutus_accounts (
    id integer NOT NULL,
    name character varying,
    type character varying,
    contra boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.plutus_accounts OWNER TO alejandrorodriguez;

--
-- Name: plutus_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.plutus_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plutus_accounts_id_seq OWNER TO alejandrorodriguez;

--
-- Name: plutus_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.plutus_accounts_id_seq OWNED BY public.plutus_accounts.id;


--
-- Name: plutus_amounts; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.plutus_amounts (
    id integer NOT NULL,
    type character varying,
    account_id integer,
    entry_id integer,
    amount numeric(20,10)
);


ALTER TABLE public.plutus_amounts OWNER TO alejandrorodriguez;

--
-- Name: plutus_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.plutus_amounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plutus_amounts_id_seq OWNER TO alejandrorodriguez;

--
-- Name: plutus_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.plutus_amounts_id_seq OWNED BY public.plutus_amounts.id;


--
-- Name: plutus_entries; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.plutus_entries (
    id integer NOT NULL,
    description character varying,
    date date,
    commercial_document_id integer,
    commercial_document_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.plutus_entries OWNER TO alejandrorodriguez;

--
-- Name: plutus_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.plutus_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plutus_entries_id_seq OWNER TO alejandrorodriguez;

--
-- Name: plutus_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.plutus_entries_id_seq OWNED BY public.plutus_entries.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.providers (
    id integer NOT NULL,
    name character varying,
    description text,
    contact character varying,
    phone character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.providers OWNER TO alejandrorodriguez;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.providers_id_seq OWNER TO alejandrorodriguez;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: pull_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.pull_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pull_types OWNER TO alejandrorodriguez;

--
-- Name: pull_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.pull_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pull_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: pull_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.pull_types_id_seq OWNED BY public.pull_types.id;


--
-- Name: quotations; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.quotations (
    id bigint NOT NULL,
    user_id bigint,
    price numeric,
    model character varying,
    client_id bigint,
    branch_id bigint,
    department_id bigint,
    trailer_type_id bigint,
    brake_type_id bigint,
    trailer_width_id bigint,
    color_id bigint,
    trailer_length_id bigint,
    divition_type_id bigint,
    floor_type_id bigint,
    fender_type_id bigint,
    ramp_type_id bigint,
    hydraulic_jack_id bigint,
    capacity_id bigint,
    pull_type_id bigint,
    redila_type_id bigint,
    brand_id bigint,
    roof_type_id bigint,
    suspension_type_id bigint,
    turn_type_id bigint,
    accessory character varying,
    categories_description character varying,
    catalog integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotations OWNER TO alejandrorodriguez;

--
-- Name: quotations_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.quotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotations_id_seq OWNER TO alejandrorodriguez;

--
-- Name: quotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.quotations_id_seq OWNED BY public.quotations.id;


--
-- Name: ramp_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.ramp_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ramp_types OWNER TO alejandrorodriguez;

--
-- Name: ramp_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.ramp_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ramp_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: ramp_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.ramp_types_id_seq OWNED BY public.ramp_types.id;


--
-- Name: redila_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.redila_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.redila_types OWNER TO alejandrorodriguez;

--
-- Name: redila_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.redila_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redila_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: redila_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.redila_types_id_seq OWNED BY public.redila_types.id;


--
-- Name: reinforcement_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.reinforcement_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.reinforcement_types OWNER TO alejandrorodriguez;

--
-- Name: reinforcement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.reinforcement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reinforcement_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: reinforcement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.reinforcement_types_id_seq OWNED BY public.reinforcement_types.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying,
    key character varying,
    description text,
    scope integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO alejandrorodriguez;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO alejandrorodriguez;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roof_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.roof_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roof_types OWNER TO alejandrorodriguez;

--
-- Name: roof_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.roof_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roof_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: roof_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.roof_types_id_seq OWNED BY public.roof_types.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO alejandrorodriguez;

--
-- Name: states; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.states OWNER TO alejandrorodriguez;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO alejandrorodriguez;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: status_items; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.status_items (
    id integer NOT NULL,
    name character varying,
    description text,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    key character varying
);


ALTER TABLE public.status_items OWNER TO alejandrorodriguez;

--
-- Name: status_items_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.status_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_items_id_seq OWNER TO alejandrorodriguez;

--
-- Name: status_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.status_items_id_seq OWNED BY public.status_items.id;


--
-- Name: status_shippings; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.status_shippings (
    id bigint NOT NULL,
    name character varying,
    description text,
    status boolean,
    key character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.status_shippings OWNER TO alejandrorodriguez;

--
-- Name: status_shippings_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.status_shippings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_shippings_id_seq OWNER TO alejandrorodriguez;

--
-- Name: status_shippings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.status_shippings_id_seq OWNED BY public.status_shippings.id;


--
-- Name: sub_categories; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.sub_categories (
    id integer NOT NULL,
    name character varying,
    description text,
    status boolean,
    category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sub_categories OWNER TO alejandrorodriguez;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.sub_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_categories_id_seq OWNER TO alejandrorodriguez;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.sub_categories_id_seq OWNED BY public.sub_categories.id;


--
-- Name: suspension_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.suspension_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.suspension_types OWNER TO alejandrorodriguez;

--
-- Name: suspension_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.suspension_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suspension_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: suspension_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.suspension_types_id_seq OWNED BY public.suspension_types.id;


--
-- Name: trailer_categories; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.trailer_categories (
    id bigint NOT NULL,
    trailer_id bigint,
    trailer_length_id bigint,
    trailer_height_id bigint,
    ramp_type_id bigint,
    redila_type_id bigint,
    trailer_type_id bigint,
    floor_type_id bigint,
    capacity_id bigint,
    trailer_width_id bigint,
    color_id bigint,
    hydraulic_jack_id bigint,
    pull_type_id bigint,
    brake_type_id bigint,
    reinforcement_type_id bigint,
    fender_type_id bigint,
    turn_type_id bigint,
    divition_type_id bigint,
    suspension_type_id bigint,
    roof_type_id bigint,
    brand_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    key character varying
);


ALTER TABLE public.trailer_categories OWNER TO alejandrorodriguez;

--
-- Name: trailer_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.trailer_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_categories_id_seq OWNER TO alejandrorodriguez;

--
-- Name: trailer_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.trailer_categories_id_seq OWNED BY public.trailer_categories.id;


--
-- Name: trailer_heights; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.trailer_heights (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trailer_heights OWNER TO alejandrorodriguez;

--
-- Name: trailer_heights_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.trailer_heights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_heights_id_seq OWNER TO alejandrorodriguez;

--
-- Name: trailer_heights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.trailer_heights_id_seq OWNED BY public.trailer_heights.id;


--
-- Name: trailer_lengths; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.trailer_lengths (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trailer_lengths OWNER TO alejandrorodriguez;

--
-- Name: trailer_lengths_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.trailer_lengths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_lengths_id_seq OWNER TO alejandrorodriguez;

--
-- Name: trailer_lengths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.trailer_lengths_id_seq OWNED BY public.trailer_lengths.id;


--
-- Name: trailer_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.trailer_types (
    id bigint NOT NULL,
    name character varying,
    image character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    model_part character varying
);


ALTER TABLE public.trailer_types OWNER TO alejandrorodriguez;

--
-- Name: trailer_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.trailer_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: trailer_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.trailer_types_id_seq OWNED BY public.trailer_types.id;


--
-- Name: trailer_widths; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.trailer_widths (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trailer_widths OWNER TO alejandrorodriguez;

--
-- Name: trailer_widths_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.trailer_widths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_widths_id_seq OWNER TO alejandrorodriguez;

--
-- Name: trailer_widths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.trailer_widths_id_seq OWNED BY public.trailer_widths.id;


--
-- Name: trailers; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.trailers (
    id bigint NOT NULL,
    name character varying,
    model character varying,
    photo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint,
    sub_category_id bigint,
    image character varying,
    status boolean,
    trailer_type_id bigint,
    trailer_length_id bigint,
    trailer_height_id bigint,
    trailer_width_id bigint,
    ramp_type_id bigint,
    redila_type_id bigint,
    floor_type_id bigint,
    capacity_id bigint,
    color_id bigint,
    hydraulic_jack_id bigint,
    pull_type_id bigint,
    brake_type_id bigint,
    reinforcement_type_id bigint,
    fender_type_id bigint,
    turn_type_id bigint,
    divition_type_id bigint,
    suspension_type_id bigint,
    roof_type_id bigint,
    brand_id bigint
);


ALTER TABLE public.trailers OWNER TO alejandrorodriguez;

--
-- Name: trailers_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.trailers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailers_id_seq OWNER TO alejandrorodriguez;

--
-- Name: trailers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.trailers_id_seq OWNED BY public.trailers.id;


--
-- Name: turn_types; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.turn_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.turn_types OWNER TO alejandrorodriguez;

--
-- Name: turn_types_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.turn_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.turn_types_id_seq OWNER TO alejandrorodriguez;

--
-- Name: turn_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.turn_types_id_seq OWNED BY public.turn_types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    role_id integer,
    first_name character varying,
    last_name character varying,
    maiden_name character varying,
    username character varying,
    avatar character varying,
    department_id integer,
    employee_number integer,
    received_file character varying,
    current_company integer,
    token character varying
);


ALTER TABLE public.users OWNER TO alejandrorodriguez;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO alejandrorodriguez;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_work_articles; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.users_work_articles (
    id integer NOT NULL,
    user_id integer,
    work_article_id integer,
    reception_status integer,
    delivery_status integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users_work_articles OWNER TO alejandrorodriguez;

--
-- Name: users_work_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.users_work_articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_work_articles_id_seq OWNER TO alejandrorodriguez;

--
-- Name: users_work_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.users_work_articles_id_seq OWNED BY public.users_work_articles.id;


--
-- Name: work_articles; Type: TABLE; Schema: public; Owner: alejandrorodriguez
--

CREATE TABLE public.work_articles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.work_articles OWNER TO alejandrorodriguez;

--
-- Name: work_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: alejandrorodriguez
--

CREATE SEQUENCE public.work_articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_articles_id_seq OWNER TO alejandrorodriguez;

--
-- Name: work_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandrorodriguez
--

ALTER SEQUENCE public.work_articles_id_seq OWNED BY public.work_articles.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: brake_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.brake_types ALTER COLUMN id SET DEFAULT nextval('public.brake_types_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: capacities id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.capacities ALTER COLUMN id SET DEFAULT nextval('public.capacities_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: divition_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.divition_types ALTER COLUMN id SET DEFAULT nextval('public.divition_types_id_seq'::regclass);


--
-- Name: fender_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.fender_types ALTER COLUMN id SET DEFAULT nextval('public.fender_types_id_seq'::regclass);


--
-- Name: fiscal_vouchers id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.fiscal_vouchers ALTER COLUMN id SET DEFAULT nextval('public.fiscal_vouchers_id_seq'::regclass);


--
-- Name: floor_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.floor_types ALTER COLUMN id SET DEFAULT nextval('public.floor_types_id_seq'::regclass);


--
-- Name: hydraulic_jacks id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.hydraulic_jacks ALTER COLUMN id SET DEFAULT nextval('public.hydraulic_jacks_id_seq'::regclass);


--
-- Name: item_files id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.item_files ALTER COLUMN id SET DEFAULT nextval('public.item_files_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: items_maintenances id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items_maintenances ALTER COLUMN id SET DEFAULT nextval('public.items_maintenances_id_seq'::regclass);


--
-- Name: maintenances id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.maintenances ALTER COLUMN id SET DEFAULT nextval('public.maintenances_id_seq'::regclass);


--
-- Name: offices id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.offices ALTER COLUMN id SET DEFAULT nextval('public.offices_id_seq'::regclass);


--
-- Name: permission_roles id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.permission_roles ALTER COLUMN id SET DEFAULT nextval('public.permission_roles_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: plutus_accounts id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.plutus_accounts ALTER COLUMN id SET DEFAULT nextval('public.plutus_accounts_id_seq'::regclass);


--
-- Name: plutus_amounts id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.plutus_amounts ALTER COLUMN id SET DEFAULT nextval('public.plutus_amounts_id_seq'::regclass);


--
-- Name: plutus_entries id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.plutus_entries ALTER COLUMN id SET DEFAULT nextval('public.plutus_entries_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- Name: pull_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.pull_types ALTER COLUMN id SET DEFAULT nextval('public.pull_types_id_seq'::regclass);


--
-- Name: quotations id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations ALTER COLUMN id SET DEFAULT nextval('public.quotations_id_seq'::regclass);


--
-- Name: ramp_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.ramp_types ALTER COLUMN id SET DEFAULT nextval('public.ramp_types_id_seq'::regclass);


--
-- Name: redila_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.redila_types ALTER COLUMN id SET DEFAULT nextval('public.redila_types_id_seq'::regclass);


--
-- Name: reinforcement_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.reinforcement_types ALTER COLUMN id SET DEFAULT nextval('public.reinforcement_types_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: roof_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.roof_types ALTER COLUMN id SET DEFAULT nextval('public.roof_types_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: status_items id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.status_items ALTER COLUMN id SET DEFAULT nextval('public.status_items_id_seq'::regclass);


--
-- Name: status_shippings id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.status_shippings ALTER COLUMN id SET DEFAULT nextval('public.status_shippings_id_seq'::regclass);


--
-- Name: sub_categories id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.sub_categories ALTER COLUMN id SET DEFAULT nextval('public.sub_categories_id_seq'::regclass);


--
-- Name: suspension_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.suspension_types ALTER COLUMN id SET DEFAULT nextval('public.suspension_types_id_seq'::regclass);


--
-- Name: trailer_categories id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories ALTER COLUMN id SET DEFAULT nextval('public.trailer_categories_id_seq'::regclass);


--
-- Name: trailer_heights id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_heights ALTER COLUMN id SET DEFAULT nextval('public.trailer_heights_id_seq'::regclass);


--
-- Name: trailer_lengths id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_lengths ALTER COLUMN id SET DEFAULT nextval('public.trailer_lengths_id_seq'::regclass);


--
-- Name: trailer_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_types ALTER COLUMN id SET DEFAULT nextval('public.trailer_types_id_seq'::regclass);


--
-- Name: trailer_widths id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_widths ALTER COLUMN id SET DEFAULT nextval('public.trailer_widths_id_seq'::regclass);


--
-- Name: trailers id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers ALTER COLUMN id SET DEFAULT nextval('public.trailers_id_seq'::regclass);


--
-- Name: turn_types id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.turn_types ALTER COLUMN id SET DEFAULT nextval('public.turn_types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_work_articles id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users_work_articles ALTER COLUMN id SET DEFAULT nextval('public.users_work_articles_id_seq'::regclass);


--
-- Name: work_articles id; Type: DEFAULT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.work_articles ALTER COLUMN id SET DEFAULT nextval('public.work_articles_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	image	Trailer	1	1	2020-09-25 03:17:17.135734
2	image	Trailer	2	2	2020-09-25 03:30:30.814695
3	image	Item	11	3	2020-10-15 20:44:55.20102
4	image	Item	14	4	2020-10-15 21:29:04.787047
6	image	Item	16	6	2020-10-15 21:56:24.506279
7	image	Item	15	7	2020-10-19 21:49:30.747497
10	image	Item	9	10	2020-10-27 01:18:22.505279
11	image	TrailerType	1	11	2020-11-03 01:46:27.690308
12	image	Item	18	12	2020-11-09 21:45:12.926938
13	image	Trailer	3	13	2020-11-26 02:48:33.183904
15	image	Item	17	15	2020-11-27 01:43:34.588767
26	image	Item	3	26	2020-12-09 21:25:33.571501
27	image	Item	6	27	2021-03-09 00:38:33.403941
28	image	Item	5	28	2021-03-09 01:22:06.093339
29	image	Item	1	29	2021-03-09 03:33:20.320445
30	image	Item	2	30	2021-03-09 03:51:35.087978
31	image	Item	19	31	2021-03-09 22:11:51.37546
32	image	Item	20	32	2021-03-09 22:18:06.074804
33	image	Item	21	33	2021-03-09 22:23:53.20366
34	image	Item	22	34	2021-03-09 22:26:05.539323
35	image	Item	23	35	2021-03-09 22:29:26.224051
36	image	Item	24	36	2021-03-09 22:33:01.051916
37	image	Item	25	37	2021-03-10 04:29:28.705977
38	image	Item	26	38	2021-03-10 17:05:15.902019
39	image	Item	27	39	2021-03-10 17:10:13.380655
40	image	Item	28	40	2021-03-10 17:15:48.941305
41	image	Item	29	41	2021-03-10 17:22:10.700126
42	image	Item	30	42	2021-03-10 17:30:55.589403
43	image	Item	31	43	2021-03-10 17:34:47.199093
44	image	Item	32	44	2021-03-10 17:45:21.036868
45	image	Item	33	45	2021-03-10 17:52:34.843392
46	image	Item	34	46	2021-03-10 17:55:14.105269
47	image	Item	35	47	2021-03-10 18:02:01.056964
48	image	Item	36	48	2021-03-10 21:05:14.99613
49	image	Item	37	49	2021-03-10 21:08:53.705864
50	image	Item	39	50	2021-03-10 21:10:20.507715
51	image	TrailerType	2	51	2021-03-22 21:47:11.562697
52	image	Item	42	52	2021-03-24 01:50:39.809903
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
1	MAV5wKLPbBswzhwtwEj8dMX6	horario.pdf	application/pdf	{"identified":true,"analyzed":true}	1492	Myh3p4F0OiliRWU9N7VWIA==	2020-09-25 03:17:17.037392
2	yVHLb5LqCM7ac3i2Q8ayPta1	udemy-icon.png	image/png	{"identified":true}	19420	BscKsEmqgm7OliNvaceBRA==	2020-09-25 03:30:30.780864
3	acrzKrfEGTixV4fDSQEeARRW	Captura de pantalla 2020-10-12 a la(s) 18.40.45.png	image/png	{"identified":true}	886	s0zXAIocYWasW/iFzXZexA==	2020-10-15 20:44:55.157721
4	yoRQ2LCA1PmS3PM9dDMgBKSZ	Captura de pantalla 2020-10-13 a la(s) 10.49.41.png	image/png	{"identified":true}	28545	Pe8bUfDTGpSznIxxoCZdWA==	2020-10-15 21:29:04.783907
5	m6ReQCh1fi3bVHJrgTKKYSZ1	Captura de pantalla 2020-10-07 a la(s) 20.50.43.png	image/png	{"identified":true}	75371	sSv+3RN5WlLx4vYA2IKWZQ==	2020-10-15 21:56:04.729554
6	Z9wE64STHGmUgn6HFq27cLE8	Captura de pantalla 2020-10-13 a la(s) 10.49.41.png	image/png	{"identified":true}	28545	Pe8bUfDTGpSznIxxoCZdWA==	2020-10-15 21:56:24.501263
7	qoFtmXoXMEe8ioBXmf6hDWYd	Captura de pantalla 2020-10-12 a la(s) 22.02.02.png	image/png	{"identified":true}	19603	besz4N64X7d84xHctWF+jA==	2020-10-19 21:49:30.706869
8	YrZxD8KVpfJLg83324UjfTD7	Captura de pantalla 2020-10-12 a la(s) 18.40.45.png	image/png	{"identified":true}	886	s0zXAIocYWasW/iFzXZexA==	2020-10-19 21:51:24.153137
10	AVJKSYCUZ9DDjRdZHpXYbjaa	Captura de pantalla 2020-10-19 a la(s) 11.28.59.png	image/png	{"identified":true}	47099	GHNKMg+rheu42TLoJ8P5AA==	2020-10-27 01:18:22.480567
11	AGp2r5LwrvHicp3eJjXkStux	Captura de pantalla 2020-10-14 a la(s) 12.57.32.png	image/png	{"identified":true}	47314	QrxEcxHFw3DNCWyA9HY2rw==	2020-11-03 01:46:27.643268
12	9KeXe46JAsKpftAH4sa949L3	Captura de pantalla 2020-10-26 a la(s) 09.43.02.png	image/png	{"identified":true}	20115	R8Ub3hp3JulpNJlb76s5Tw==	2020-11-09 21:45:12.898127
13	eaL91sd6pY8JFYirMo48H1st	Captura de pantalla 2020-10-14 a la(s) 12.57.32.png	image/png	{"identified":true}	47314	QrxEcxHFw3DNCWyA9HY2rw==	2020-11-26 02:48:33.141237
14	cLGJvhjfb99Wf2y68UwjJU4g	Captura de pantalla 2020-10-19 a la(s) 11.28.59.png	image/png	{"identified":true}	47099	GHNKMg+rheu42TLoJ8P5AA==	2020-11-27 01:35:10.967655
15	q3W5njMZmeUCDPTdZX6KiAXv	Captura de pantalla 2020-11-09 a la(s) 13.58.04.png	image/png	{"identified":true}	87629	yEd3tpcg+lMyCvln/PnUGQ==	2020-11-27 01:43:34.581507
17	pvZmTJ4QvR96yJ8z3KjzqT8N	Captura de pantalla 2020-12-03 a la(s) 13.41.31.png	image/png	{"identified":true}	71687	PSgB+DqIVP+xlZ/w86wVHg==	2020-12-09 19:28:42.07799
18	3pSEpH5pDXqxDk9oMFywgCJC	Captura de pantalla 2020-12-03 a la(s) 13.41.31.png	image/png	{"identified":true}	71687	PSgB+DqIVP+xlZ/w86wVHg==	2020-12-09 19:41:28.853801
19	cHvW8zAGDA5f5CGcJxYq343r	Captura de pantalla 2020-12-03 a la(s) 17.23.09.png	image/png	{"identified":true}	47492	3dDH0pRx8NRmGEnWwAyVdg==	2020-12-09 19:44:34.961277
20	SBACjAanw2S5Cq99moBw4pSU	Captura de pantalla 2020-12-03 a la(s) 17.23.09.png	image/png	{"identified":true}	47492	3dDH0pRx8NRmGEnWwAyVdg==	2020-12-09 19:49:14.259704
21	sA8B4gNgTfoQp5v8tbf5hpBW	Captura de pantalla 2020-12-03 a la(s) 13.41.31.png	image/png	{"identified":true}	71687	PSgB+DqIVP+xlZ/w86wVHg==	2020-12-09 19:51:56.873988
22	gYD6YnXNrZtqmYW68Ry4CqXG	Captura de pantalla 2020-12-03 a la(s) 17.23.09.png	image/png	{"identified":true}	47492	3dDH0pRx8NRmGEnWwAyVdg==	2020-12-09 20:16:01.007739
23	Ebd52VuzTX6Xa1WCQwPzP1uF	Captura de pantalla 2020-12-03 a la(s) 12.12.48.png	image/png	{"identified":true}	65711	pA8XiQQS4ky+T1sJgfMyFg==	2020-12-09 20:22:18.437233
24	NzX3EJhNFjMRrDaq7hxZDMxv	Captura de pantalla 2020-12-03 a la(s) 22.48.40.png	image/png	{"identified":true}	46006	JRmakURiElhIxiGmITzrDA==	2020-12-09 21:12:46.75357
25	YKNh45pstEWXmm2e6GRxMAds	Captura de pantalla 2020-12-03 a la(s) 12.12.48.png	image/png	{"identified":true}	65711	pA8XiQQS4ky+T1sJgfMyFg==	2020-12-09 21:14:10.367341
26	n3wPQQqGutukGDtSensL8JsB	Captura de pantalla 2020-12-03 a la(s) 13.41.31.png	image/png	{"identified":true}	71687	PSgB+DqIVP+xlZ/w86wVHg==	2020-12-09 21:25:33.465777
27	h2G9ttkurgd4JfCsdAcSBvaz	Captura de pantalla 2021-01-08 a la(s) 10.28.39.png	image/png	{"identified":true,"width":767,"height":232,"analyzed":true}	96172	zRMvMkCzfodaY12uyHqjYg==	2021-03-09 00:38:33.357685
28	6coiZqFRxb5n56m7EGJXig2t	Captura de pantalla 2021-01-08 a la(s) 10.28.39.png	image/png	{"identified":true,"width":767,"height":232,"analyzed":true}	96172	zRMvMkCzfodaY12uyHqjYg==	2021-03-09 01:22:06.069364
29	yopZdSLf1KL8MWuiVG483Qim	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-09 03:33:20.29193
30	QQ1dJozHZy6AWj64n17JaSnN	Captura de pantalla 2021-03-08 a la(s) 17.46.50.png	image/png	{"identified":true,"width":733,"height":408,"analyzed":true}	38243	9hvmtfVByrxuE4CbIwPKGQ==	2021-03-09 03:51:35.08399
31	Mw1MSaonS8kMXqu8rnDiWirS	Captura de pantalla 2021-03-08 a la(s) 17.46.50.png	image/png	{"identified":true,"width":733,"height":408,"analyzed":true}	38243	9hvmtfVByrxuE4CbIwPKGQ==	2021-03-09 22:11:51.371745
32	pTjYpPR2A7FsGwFtJbBX9uP8	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-09 22:18:06.059337
33	93YeDmVTfoAod5H8N3VrSeLV	Captura de pantalla 2021-03-08 a la(s) 17.46.50.png	image/png	{"identified":true,"width":733,"height":408,"analyzed":true}	38243	9hvmtfVByrxuE4CbIwPKGQ==	2021-03-09 22:23:53.178921
34	6kaJL2pL2cHZEqLcCSCnMUe8	Captura de pantalla 2021-03-08 a la(s) 17.46.50.png	image/png	{"identified":true,"width":733,"height":408,"analyzed":true}	38243	9hvmtfVByrxuE4CbIwPKGQ==	2021-03-09 22:26:05.533834
35	HjmuKb6BvBq3Tftrj9eVNDP1	Captura de pantalla 2021-03-08 a la(s) 17.46.50.png	image/png	{"identified":true,"width":733,"height":408,"analyzed":true}	38243	9hvmtfVByrxuE4CbIwPKGQ==	2021-03-09 22:29:26.21724
36	TLqRquy5DSVztEWVgWzUYezD	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-09 22:33:00.972491
37	TSUAytVhQRSV6rJQdQ9Utehv	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-10 04:29:28.690099
38	X7er5fKwMMvUeq4sC3qSorAD	Captura de pantalla 2021-03-09 a la(s) 13.39.47.png	image/png	{"identified":true,"width":477,"height":554,"analyzed":true}	51565	r96iikLwe8PIXs6he8kDpA==	2021-03-10 17:05:15.890986
39	wsDQ6x7dfBExTuYaYKCNVZjw	Captura de pantalla 2021-03-08 a la(s) 17.46.50.png	image/png	{"identified":true,"width":733,"height":408,"analyzed":true}	38243	9hvmtfVByrxuE4CbIwPKGQ==	2021-03-10 17:10:13.368724
40	ne1tTpyGmKCaC9DvxuNrdCw1	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-10 17:15:48.937496
41	HaUo9WyVXHhNSPbyHmPjno19	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-10 17:22:10.680634
42	4yEfESrtuUtMtnCL9PeGZWp8	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-10 17:30:55.573667
43	auk33xS6Cf6RfbGDEx9PtfPh	Captura de pantalla 2021-03-09 a la(s) 13.39.47.png	image/png	{"identified":true,"width":477,"height":554,"analyzed":true}	51565	r96iikLwe8PIXs6he8kDpA==	2021-03-10 17:34:47.181889
44	YFeLHiG4ot7UusEaQzf8xLTn	Captura de pantalla 2021-03-08 a la(s) 17.46.50.png	image/png	{"identified":true,"width":733,"height":408,"analyzed":true}	38243	9hvmtfVByrxuE4CbIwPKGQ==	2021-03-10 17:45:21.011499
45	S3Ca3ETAre3YinBGxDnfhjok	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-10 17:52:34.82728
46	LBD1vtheAjn8YSV2d4ezZQ2Y	Captura de pantalla 2021-03-09 a la(s) 13.39.47.png	image/png	{"identified":true,"width":477,"height":554,"analyzed":true}	51565	r96iikLwe8PIXs6he8kDpA==	2021-03-10 17:55:14.08834
47	bR5uPxGwPtCqfizxtaYQe69g	Captura de pantalla 2021-03-08 a la(s) 18.57.03.png	image/png	{"identified":true,"width":1079,"height":203,"analyzed":true}	35093	yOVlTQKl/28n/VcOYWXv5w==	2021-03-10 18:02:01.034744
48	eEQBtBj6CmfTGqJG9RLGs3uj	Captura de pantalla 2021-03-09 a la(s) 13.39.47.png	image/png	{"identified":true,"width":477,"height":554,"analyzed":true}	51565	r96iikLwe8PIXs6he8kDpA==	2021-03-10 21:05:14.979483
49	6GZ44pa7p8gjX9becmMaU481	Captura de pantalla 2021-03-09 a la(s) 13.39.47.png	image/png	{"identified":true,"width":477,"height":554,"analyzed":true}	51565	r96iikLwe8PIXs6he8kDpA==	2021-03-10 21:08:53.702028
50	CEWA1dRzaAiCb24jooTm5Kbk	Captura de pantalla 2021-03-09 a la(s) 13.39.47.png	image/png	{"identified":true,"width":477,"height":554,"analyzed":true}	51565	r96iikLwe8PIXs6he8kDpA==	2021-03-10 21:10:20.504595
51	gM7ZuRhgX1G9oBJypKSHRGn2	declaracionPersonal - 2019-10-23T140136.580.pdf	application/pdf	{"identified":true,"analyzed":true}	11345	fx69s2I0YtPkfBJ10Sjrgg==	2021-03-22 21:47:11.43259
52	hob2FWA1LLWJCApKhZNB3KQX	Captura de pantalla 2021-03-17 a la(s) 13.02.27.png	image/png	{"identified":true,"width":782,"height":366,"analyzed":true}	408474	TV1hct5LIlg+fPtH9CgHlQ==	2021-03-24 01:50:39.776883
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-09-25 01:50:34.014488	2020-09-25 01:50:34.014488
\.


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
1	1	Client	\N	\N	1	User	\N	create	---\nname: Emma\nlast_name: Rodriguez\nmaiden_name: Gonzalez\naddress: Sierra cristal\npostal_code: '31123'\nemail: emma@gmail.com\nphone_number: '6141109517'\ncellphone: '6141109517'\ncontact: Emmanuel\n	1	\N	::1	1e1869fc-9c1f-4865-a7a5-c3a9dd04f5c7	2020-09-30 04:18:23.716648
2	1	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 2\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: todos\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.1e4\n	1	\N	::1	7ea8aa9b-565a-4e24-9585-f85c41435ff6	2020-09-30 04:29:03.950751
3	2	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 2\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: todos\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.1e4\n	1	\N	::1	45686810-3e90-4700-bce2-c21485ecd01b	2020-09-30 04:30:20.520864
4	3	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 2\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Muchos\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.3e4\n	1	\N	::1	34946608-3e85-4ed1-9d54-44cdd8bf22e9	2020-09-30 04:43:06.600816
5	4	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 2\nbrand_id: \nstatus_item_id: 3\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Todos\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.1e6\npayment_type: \nfiscal_voucher_id: \n	1	\N	::1	cdaf2c01-1156-4647-b8bd-b467da8ac01f	2020-10-02 01:20:12.237339
6	5	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 2\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Todos\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.1e5\npayment_type: \nfiscal_voucher_id: \n	1	\N	::1	7e720b8d-c925-4200-bbb9-685f6289672e	2020-10-02 01:23:09.181315
7	6	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 2\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Todos\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.1e5\npayment_type: \nfiscal_voucher_id: \n	1	\N	::1	219af55c-537f-4446-b031-b6a6e2d08362	2020-10-02 01:24:03.934094
8	1	Item	\N	\N	1	User	\N	update	---\nuser_id:\n- 2\n- 3\naccessory:\n- todos\n- Probando editar\ntrailer_id:\n- 1\n- 2\nadvance_payment:\n- !ruby/object:BigDecimal 18:0.1e4\n- !ruby/object:BigDecimal 18:0.10001e5\n	2	\N	::1	b14abef4-f3f7-4b41-b1f8-9d393ad9edc5	2020-10-02 19:54:52.878911
9	7	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 3\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Probando new\nacquisition_date: \ntrailer_id: 2\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.2e4\npayment_type: \nfiscal_voucher_id: \n	1	\N	::1	12afdbfd-de47-4c58-8d41-2af498bcde3e	2020-10-02 22:27:09.7023
10	7	Item	\N	\N	1	User	\N	destroy	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: \nuser_id: 3\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Probando new\nacquisition_date: \ntrailer_id: 2\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.2e4\npayment_type: \nfiscal_voucher_id: \n	2	\N	::1	0445c0c3-0ee9-42c2-a9a5-c45ff4c9f2de	2020-10-02 22:37:40.773072
11	8	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: '1235888'\npurchased_date: 15/10/2020\nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: 1234Folio\nmaintenance_date: \nmaintenance_done: true\nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: Remision\naccessory: \nacquisition_date: \ntrailer_id: 2\nclient_id: \nadvance_payment: \npayment_type: \nfiscal_voucher_id: \n	1	\N	::1	c761e106-ce62-4c82-9366-cf9ead62416d	2020-10-05 23:49:59.607231
12	8	Item	\N	\N	1	User	\N	update	---\ncode:\n- 1234Folio\n- 1234Folio4\nremission:\n- Remision\n- Remision3\ntrailer_id:\n- 2\n- 1\n	2	\N	::1	f04a2735-62b8-4ccd-b350-07878573c952	2020-10-05 23:57:59.679289
13	1	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n- 2\n- 1\n	3	\N	\N	d3586ff9-0fc0-4107-8916-1de19b4a8da0	2020-10-06 22:13:02.675763
14	1	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n- 1\n- 2\n	4	\N	\N	15421e28-2fb7-4a81-82d5-6971aa8c6b0c	2020-10-06 22:13:51.69788
15	2	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n- 1\n- 2\n	2	\N	\N	4112e9b4-8594-4676-9a0c-9b96d1beb066	2020-10-06 22:14:39.702694
16	2	Item	\N	\N	1	User	\N	update	---\ncode:\n- \n- Folio nuevo\nserial_number:\n- \n- '98765'\npurchased_date:\n- \n- 14/10/2020\nprice:\n- \n- !ruby/object:BigDecimal 18:0.1e5\ndepartment_id:\n- \n- 1\nstatus_item_id:\n- 5\n- 2\nbranch_id:\n- \n- 1\nremission:\n- \n- remision probando estatus\n	3	\N	::1	5452a17f-f33d-4704-888a-b0e6bf2e3f81	2020-10-06 22:18:08.32136
17	3	Item	\N	\N	1	User	\N	update	---\ncode:\n- \n- 123cuau\nserial_number:\n- \n- '87654'\npurchased_date:\n- \n- 15/10/2020\nprice:\n- \n- !ruby/object:BigDecimal 18:0.1e9\ndepartment_id:\n- \n- 1\nstatus_item_id:\n- 5\n- 2\nstatus_shipping_id:\n- \n- 3\nbranch_id:\n- \n- 1\nremission:\n- \n- remcuau\n	2	\N	::1	cec2017f-3669-4c87-be55-14c7cda48930	2020-10-07 01:57:41.662354
71	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	11	\N	\N	00f041c8-0031-46bd-b712-f56d42f92991	2020-11-27 01:57:38.713847
18	6	Item	\N	\N	1	User	\N	update	---\ncode:\n- \n- chih123\nserial_number:\n- \n- '87777'\npurchased_date:\n- \n- 21/10/2020\nprice:\n- \n- !ruby/object:BigDecimal 18:0.2e6\ndepartment_id:\n- \n- 2\nstatus_item_id:\n- 5\n- 2\nstatus_shipping_id:\n- \n- 2\nbranch_id:\n- \n- 2\nremission:\n- \n- remchih\n	2	\N	::1	38e88d23-98e9-4493-9d7a-7d64dcd2c594	2020-10-07 02:00:16.727861
19	6	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	3	\N	::1	62bb37c3-4464-44d8-a5cf-5bbe18acf210	2020-10-07 02:31:21.031605
20	8	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n- \n- 1\n	3	\N	\N	653f2f59-f18b-4f8a-a1c2-182163c5967f	2020-10-08 03:48:45.879733
21	9	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: 3\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Varios\nacquisition_date: \ntrailer_id: 2\nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.3e5\nstatus_shipping_id: 1\n	1	\N	::1	b75a980f-2ff9-4f30-b8f4-311497c69d31	2020-10-08 20:02:39.84019
22	9	Item	\N	\N	1	User	\N	update	---\ncode:\n- \n- 1234Folio\nserial_number:\n- \n- '3455665'\npurchased_date:\n- \n- 15/10/2020\nprice:\n- \n- !ruby/object:BigDecimal 18:0.1e7\nstatus_item_id:\n- 5\n- 2\nstatus_shipping_id:\n- 1\n- 2\nbranch_id:\n- \n- 2\nremission:\n- \n- remisison 2020\n	2	\N	::1	7812fc7c-fc13-487a-9767-81c43ece5ca7	2020-10-08 20:20:23.936904
23	9	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	3	\N	::1	64f52579-4c63-4e7f-92ac-7e1eac567421	2020-10-08 20:20:42.808671
24	10	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: 3\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: true\nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Accesorio\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.2e4\nstatus_shipping_id: 1\n	1	\N	::1	a45db449-1205-4712-8bca-f3eb4dd9fd46	2020-10-10 22:45:12.103352
25	10	Item	\N	\N	1	User	\N	update	---\ncode:\n- \n- '2349'\nserial_number:\n- \n- '3444'\npurchased_date:\n- \n- 02/10/2020\nprice:\n- \n- !ruby/object:BigDecimal 18:0.1e4\nstatus_item_id:\n- 5\n- 2\nstatus_shipping_id:\n- 1\n- 2\nbranch_id:\n- \n- 2\nremission:\n- \n- emisimnn\n	2	\N	::1	a5f5d461-3ab2-41cb-b686-4f7e80c088b7	2020-10-10 22:51:15.238933
26	10	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	3	\N	::1	789d43e5-6c2e-454e-941f-a3ca29621f3d	2020-10-10 22:51:21.421306
27	11	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: '3333444'\npurchased_date: '08/10/2020'\nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.2e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: chih123rw\nmaintenance_date: \nmaintenance_done: true\nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: fffremison\naccessory: \nacquisition_date: \ntrailer_id: 2\nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 2\n	1	\N	::1	07bcd8e9-094a-4fcb-a0c9-af0302ebeaa2	2020-10-10 22:52:18.461504
28	11	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	2	\N	::1	ba922e4b-24b9-4471-9f11-cb27d9a1bca5	2020-10-10 22:52:36.813693
29	12	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: '3455'\npurchased_date: 29/10/2020\nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e7\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: '009999'\nmaintenance_date: \nmaintenance_done: true\nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: remisisi\naccessory: \nacquisition_date: \ntrailer_id: 2\nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\n	1	\N	::1	3d42b96a-0919-445a-9ce4-8968409e430d	2020-10-10 23:37:44.627959
30	12	Item	\N	\N	1	User	\N	update	---\nremission:\n- remisisi\n- remisisi88\n	2	\N	::1	be9de1ec-af05-4cbc-906e-e9b368697fd4	2020-10-10 23:39:53.054216
31	8	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	4	\N	\N	aa987c77-f2dd-4546-8de0-80d1690b3598	2020-10-12 22:10:35.138719
32	12	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	3	\N	\N	97d4137b-4147-4f9b-9dc0-e80099dcaaba	2020-10-12 22:11:57.429727
33	13	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: 4\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ACcesorios\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.3e5\nstatus_shipping_id: 1\n	1	\N	::1	ae599c0e-7039-464d-b286-15321d4cc6cf	2020-10-13 00:26:22.401211
34	10	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	4	\N	\N	b62832ac-baf0-409d-822f-8876b4b60750	2020-10-13 01:52:18.382861
35	13	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 5\n- 3\n	2	\N	\N	c64cd9a7-59b2-43d4-b8d3-d073c3492523	2020-10-14 04:19:54.741278
36	14	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: 4\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Grande\nacquisition_date: \ntrailer_id: 1\nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.1e5\nstatus_shipping_id: 1\n	1	\N	::1	5d11555f-229c-4a8e-9678-4f8ca35e2037	2020-10-14 16:42:02.45669
37	14	Item	\N	\N	2	User	\N	update	---\ncode:\n- \n- 1234Folio\nserial_number:\n- \n- '12355'\nprice:\n- \n- !ruby/object:BigDecimal 18:0.1e5\nstatus_item_id:\n- 5\n- 2\nstatus_shipping_id:\n- 1\n- 2\nbranch_id:\n- \n- 2\nremission:\n- \n- Remision123\nacquisition_date:\n- \n- 15/10/2020\n	2	\N	::1	a9728b80-3c43-4c3e-8bc4-de3018665933	2020-10-14 16:46:44.664271
38	14	Item	\N	\N	4	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	3	\N	::1	48c2079d-8e95-4761-b148-1ac60344064c	2020-10-14 18:21:04.973804
39	15	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: '3333'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.123e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: 1234Folio\nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: 123Folio\naccessory: \nacquisition_date: '08/10/2020'\ntrailer_id: 2\nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\n	1	\N	::1	0b5677c5-7650-411b-813f-fc88f65d99da	2020-10-14 18:33:38.125628
40	11	Item	\N	\N	4	User	\N	update	---\ndescription:\n- \n- Falta factura\nuser_id:\n- \n- 4\nstatus_item_id:\n- 2\n- 3\nclient_id:\n- \n- 1\nfiscal_voucher_id:\n- \n- 6\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	3	\N	::1	db7163aa-bb1b-47dd-9ee3-c9253a209cbc	2020-10-15 20:37:49.702445
41	11	Item	\N	\N	4	User	\N	update	---\nstatus_item_id:\n- 3\n- 1\n	4	\N	::1	7b18599f-41a8-44bc-9e25-1b0a11d86358	2020-10-15 20:44:55.224083
42	11	Item	\N	\N	4	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	5	\N	::1	4e46c7a6-a884-4f2b-8f41-be94a8245970	2020-10-15 21:00:29.49643
43	14	Item	\N	\N	4	User	\N	update	---\ndescription:\n- \n- faltaa factura\nstatus_item_id:\n- 2\n- 3\nfiscal_voucher_id:\n- \n- 7\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	4	\N	::1	f11ba380-d262-4f00-a410-2e2909f48be9	2020-10-15 21:22:57.989408
44	14	Item	\N	\N	4	User	\N	update	---\nstatus_item_id:\n- 3\n- 1\n	5	\N	::1	f85b4330-e394-40f5-a649-0fe2ca1793ee	2020-10-15 21:29:04.796336
45	14	Item	\N	\N	4	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	6	\N	::1	1ae7a987-01ed-4e12-9285-777a86dc9ea6	2020-10-15 21:29:11.218091
46	16	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: '34455'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e7\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: '87655'\nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: '899990'\naccessory: \nacquisition_date: '08/10/2020'\ntrailer_id: 2\nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \n	1	\N	::1	265b0cf2-9773-479e-976f-c1f8c513c0b3	2020-10-15 21:55:37.842223
47	16	Item	\N	\N	2	User	\N	update	---\nuser_id:\n- \n- 2\nstatus_item_id:\n- 2\n- 1\npayment_type:\n- \n- 3\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.39999e5\n	2	\N	::1	fa894681-610a-4c9c-bc29-de1a92d4d86a	2020-10-15 21:56:04.743125
48	16	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	3	\N	::1	3409d6a6-ad14-4b11-bb1a-eeb7e805daea	2020-10-15 21:56:36.01547
49	17	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: \nserial_number: '123567'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.133333e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: nuevoarticulofolio\nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: '123'\naccessory: \nacquisition_date: 15/10/2020\ntrailer_id: 2\nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: negro\n	1	\N	::1	7d5dba91-ed6c-4766-a5d6-ab1883e16d47	2020-10-16 18:03:54.504996
50	2	Client	\N	\N	2	User	\N	create	---\nname: Rodrigo\nlast_name: Ramos\nmaiden_name: Najera\naddress: Santo niño\npostal_code: '31220'\nemail: rodrigo@gmail.com\nphone_number: '6148900000'\ncellphone: '614367889'\ncontact: Rodri\nrfc: rona7890000\n	1	\N	::1	3152f32e-62fa-448d-bf92-9839133b6319	2020-10-16 18:20:41.823084
51	15	Item	\N	\N	1	User	\N	update	---\nuser_id:\n- \n- 1\nstatus_item_id:\n- 2\n- 1\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	2	\N	::1	6260f918-838a-4fd0-b541-ff08e9abe0c2	2020-10-19 21:49:30.890267
52	15	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	3	\N	::1	22fefcca-4632-4a09-b05e-a9d6fc1c910f	2020-10-19 21:50:02.953013
53	9	Item	\N	\N	1	User	\N	update	---\ndescription:\n- \n- obs\nuser_id:\n- 3\n- 1\nstatus_item_id:\n- 2\n- 3\nfiscal_voucher_id:\n- \n- 6\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e6\n	4	\N	::1	6059a30b-3c8f-4aa5-a941-2a830520cd0b	2020-10-19 21:51:05.185101
54	9	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 3\n- 1\n	5	\N	::1	9f73bede-3ace-4eb4-bdc9-3d15b398e19b	2020-10-19 21:51:24.181201
55	18	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: undefined1234561238761231238865765\nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: 4\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: accesorio\nacquisition_date: \ntrailer_id: \nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.12e6\nstatus_shipping_id: 1\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\n	1	\N	::1	ebcd789a-8b23-4755-839d-32f33e9ae8a4	2020-11-03 01:51:33.385885
56	18	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n- \n- 1\n	2	\N	\N	3f553c0f-753a-49d0-9731-fe8fee16e591	2020-11-03 02:00:10.240384
57	18	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n- 1\n- \n	3	\N	\N	359b018b-5812-436e-91c6-06798d3eba7e	2020-11-03 02:49:06.16545
58	18	Item	\N	\N	1	User	\N	update	---\ncode:\n- \n- 1234Folio\nmodel:\n- undefined1234561238761231238865765\n- '123456'\nserial_number:\n- \n- '123987'\nprice:\n- \n- !ruby/object:BigDecimal 18:0.1e6\nstatus_item_id:\n- 5\n- 2\nstatus_shipping_id:\n- 1\n- 2\nbranch_id:\n- \n- 2\nremission:\n- \n- Remision123\ncolor:\n- \n- negro\nacquisition_date:\n- \n- 25/11/2020\n	4	\N	::1	243f2509-9278-40d7-9794-188592697843	2020-11-03 04:24:16.214188
59	18	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	5	\N	::1	557a15b3-2d10-4982-802c-145239b8ca19	2020-11-09 21:44:33.01558
60	18	Item	\N	\N	1	User	\N	update	---\nuser_id:\n- 4\n- 1\nstatus_item_id:\n- 2\n- 1\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	6	\N	::1	e4bbbcb8-f585-4fb2-ae8e-8a2465530b97	2020-11-09 21:45:12.959381
61	18	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	7	\N	::1	bfd3b74c-9a8d-479b-814f-f52728d35f4e	2020-11-09 21:45:19.998549
62	17	Item	\N	\N	\N	\N	\N	update	---\ncategories_description:\n- \n- Descripcion\n	2	\N	\N	6956e32a-6303-4722-b9dc-c52b1c240259	2020-11-26 02:53:01.395967
63	17	Item	\N	\N	\N	\N	\N	update	---\nclient_id:\n- \n- 1\n	3	\N	\N	11f823fb-e859-4677-bb09-3ca0b9f5fca9	2020-11-26 02:53:42.477209
64	17	Item	\N	\N	1	User	\N	update	---\ndescription:\n- \n- observacon\nuser_id:\n- \n- 1\nstatus_item_id:\n- 2\n- 3\nfiscal_voucher_id:\n- \n- 5\npayment_type:\n- \n- 1\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.0\n	4	\N	::1	99326bdb-90ab-4d61-bf3c-8991ceff7065	2020-11-26 02:56:50.514372
65	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	5	\N	\N	d056377d-172e-4b7d-868b-d77f3adbf496	2020-11-27 01:31:58.702058
66	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npayment_type:\n- 1\n- 2\nsale_price:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.0\n	6	\N	::1	ec733b0d-679d-4e08-8d18-5184c032bb5a	2020-11-27 01:35:11.02097
67	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	7	\N	\N	270e378f-7c7d-446f-a663-c43999719d8e	2020-11-27 01:42:22.324099
68	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\nsale_price:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.4e4\n	8	\N	::1	c894b6c2-c357-42c9-875a-c0b77816fbc7	2020-11-27 01:43:34.630178
69	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	9	\N	\N	b543d504-a665-4a1d-ae93-1ab417b0d67b	2020-11-27 01:55:44.011051
70	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	10	\N	::1	51f26970-eeda-487e-bec2-c1d10a8e8bab	2020-11-27 01:57:00.100922
72	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	12	\N	::1	f89fd328-0531-42e5-9971-19ec2a551cc6	2020-11-28 02:16:08.519844
73	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	13	\N	\N	3d0c9d85-38f1-400f-a175-58a74d2c2b64	2020-11-28 02:24:14.405848
74	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	14	\N	::1	79d1cee5-d2e7-4151-afdc-2febc57d99e5	2020-11-28 02:24:34.095497
75	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	15	\N	\N	7b5c972c-dc97-40e9-ba42-21f44f707489	2020-11-28 02:24:46.374799
76	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	16	\N	::1	af633684-5f1f-45b3-9be5-6913faf7a2c7	2020-11-28 02:28:21.257644
77	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	17	\N	\N	bcbf401e-a369-4c52-89d0-652234c91ea6	2020-11-28 02:30:31.872271
78	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	18	\N	::1	9ec4bc44-7a4c-4f21-a49c-45691d570888	2020-11-28 02:31:53.395306
79	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	19	\N	\N	a751f3d5-a2f8-4c9a-b562-516419ae5b0a	2020-11-28 02:34:54.488063
80	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	20	\N	::1	df7ebc64-aca7-4d3d-8d4b-08f9092741b1	2020-11-28 02:35:29.662903
81	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	21	\N	\N	0fae08d1-2bd9-4685-8db6-83977c6446dd	2020-11-28 02:38:32.620177
82	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	22	\N	::1	bcc6f2e4-0515-464b-8bbf-781d5dbb5506	2020-11-28 02:38:59.268459
83	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	23	\N	\N	66dd4d2b-ca12-4437-848c-ba3e03a68516	2020-11-28 02:41:23.779881
84	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	24	\N	::1	530ffafb-de2a-43c5-ba48-b6d4e6851351	2020-11-28 02:41:47.827214
85	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	25	\N	\N	ba653263-eedf-4238-90ae-fafb172b96e7	2020-11-28 02:42:44.641512
86	17	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\n	26	\N	::1	3380306c-40c2-44e3-8314-441741742195	2020-11-28 02:43:02.512215
87	17	Item	\N	\N	\N	\N	\N	update	---\nbranch_id:\n- 2\n- 1\n	27	\N	\N	b2399010-5668-43f5-8371-c0c25d221f96	2020-12-08 21:16:54.705815
88	17	Item	\N	\N	2	User	\N	update	---\nplanet_percentage:\n- \n- !ruby/object:BigDecimal 18:0.5e2\nbranch_percentage:\n- \n- !ruby/object:BigDecimal 18:0.5e2\n	28	\N	::1	e116af0f-36b2-4fce-896f-9828f62587f6	2020-12-08 23:46:23.870651
89	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	3	\N	::1	4f6937f9-c9b6-47fe-977b-c92d2844153a	2020-12-09 19:19:38.202999
90	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	4	\N	\N	a9c5bc28-73b0-4845-84a9-b71fcef39871	2020-12-09 19:27:27.222489
91	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	5	\N	::1	47d80b17-aa81-4817-b7f5-5e1b2f13002d	2020-12-09 19:28:42.154581
92	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	6	\N	\N	c3642acb-b05a-4bac-8716-e3e3d765361e	2020-12-09 19:29:56.408801
93	3	Item	\N	\N	2	User	\N	update	---\ndescription:\n- \n- observacon\nstatus_item_id:\n- 2\n- 3\n	7	\N	::1	761a9453-3a8d-4e0e-8c57-60add704c65b	2020-12-09 19:30:30.515092
94	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	8	\N	\N	7c1bc141-b6ad-4d2a-bd82-ea52aad2af83	2020-12-09 19:33:52.190642
95	3	Item	\N	\N	2	User	\N	update	---\ndescription:\n- observacon\n- observaconasd\nstatus_item_id:\n- 2\n- 3\n	9	\N	::1	4cb0f81b-c053-4934-9091-1dcb5d30293c	2020-12-09 19:38:44.497751
96	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 3\n- 2\n	10	\N	\N	9c00cae7-3e60-46e5-953b-fc4f6335ecf2	2020-12-09 19:40:05.880881
97	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	11	\N	::1	c25398ad-ee29-47cd-8307-63ca05230c87	2020-12-09 19:41:28.93785
98	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	12	\N	\N	54ba32f9-2127-4ccf-bc56-101c9b20543c	2020-12-09 19:43:56.66996
99	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	13	\N	::1	e6645436-5acc-4dd2-9f12-a8a2b7e2e0c0	2020-12-09 19:44:35.025776
100	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	14	\N	\N	9af99883-02fc-46d8-ae99-3de9a227d9c2	2020-12-09 19:46:19.756257
101	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	15	\N	::1	97d297c5-4f30-4c32-9930-34dcb4fe56fc	2020-12-09 19:49:14.556521
102	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	16	\N	\N	bd05fe47-caff-4f71-a763-05c6e642cd79	2020-12-09 19:51:19.584392
103	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	17	\N	::1	16d75127-fc08-4f06-bb3c-99788a811bc9	2020-12-09 19:51:56.954072
104	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	18	\N	\N	7a652469-cb04-48fe-8796-b148b0ee2cbb	2020-12-09 20:15:36.775841
105	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	19	\N	::1	0d176bce-00af-424c-b994-c05ef0934d0a	2020-12-09 20:16:01.151956
106	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	20	\N	\N	e7766075-c96e-4843-ae73-391cea235eeb	2020-12-09 20:21:15.057736
107	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	21	\N	::1	9411e553-4ec6-4c67-beb8-9d1e16d20074	2020-12-09 20:22:18.55658
108	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	22	\N	\N	a76395f5-d6cf-4fac-a160-710f8df4dec9	2020-12-09 21:11:42.185701
109	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	23	\N	::1	4cf2c145-7f06-4665-a2c6-f6eb76c8cd72	2020-12-09 21:12:46.8497
110	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	24	\N	\N	cf20c09b-2496-4084-adbc-4cc4fab25026	2020-12-09 21:13:15.356107
111	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	25	\N	::1	ab55966c-8787-440d-9ba7-848d79cdcbc4	2020-12-09 21:14:10.482426
112	3	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- \n- blabla\n	26	\N	\N	bf875765-87b9-40ca-bd09-80546ee32f31	2020-12-09 21:24:53.011262
113	3	Item	\N	\N	\N	\N	\N	update	---\ncategories_description:\n- \n- categoria\n	27	\N	\N	936e1109-f9be-4865-9e35-e35e8e1464a5	2020-12-09 21:25:10.72557
114	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	28	\N	\N	4c6e8ffd-2298-4421-87ea-5ca594a4ccdc	2020-12-09 21:25:19.047431
115	3	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\n	29	\N	::1	efdb5222-e824-460c-bdf3-b0ce9f8a99fa	2020-12-09 21:25:33.700105
116	17	Item	\N	\N	\N	\N	\N	update	---\nuser_id:\n- 1\n- 4\n	29	\N	\N	626bd91e-e8e2-4ffc-8093-b68d926b2220	2020-12-19 00:32:41.519598
117	17	Item	\N	\N	\N	\N	\N	update	---\nplanet_percentage:\n- !ruby/object:BigDecimal 18:0.5e2\n- \n	30	\N	\N	aae48b8d-b33a-4243-b568-a5e81c3d37fd	2020-12-22 03:07:35.122469
118	17	Item	\N	\N	\N	\N	\N	update	---\nbranch_percentage:\n- !ruby/object:BigDecimal 18:0.5e2\n- \n	31	\N	\N	4b652d83-85b4-4d16-80d1-abfcb6f5538e	2020-12-22 03:07:45.22577
119	18	Item	\N	\N	\N	\N	\N	update	---\ncategories_description:\n- \n- Categoria de decripcion bla bla\n	8	\N	\N	ef577c45-8423-4f34-9968-4098fcb996e9	2021-01-04 21:07:09.586124
120	18	Item	\N	\N	\N	\N	\N	update	---\ncategories_description:\n- Categoria de decripcion bla bla\n- Categoria de decripcion bla bla asdkljfhaskfgafgdkhsafgkasdhfgaskhdfgaskfgkasfgasydufgsafsa\n	9	\N	\N	f6f27ded-84cd-45be-ac61-44589800e88f	2021-01-04 21:34:59.608557
121	17	Item	\N	\N	\N	\N	\N	update	---\nbranch_id:\n- 1\n- 2\n	32	\N	\N	f6e396ca-a7a1-4bea-84de-cce75619072d	2021-01-09 04:34:02.737498
122	17	Item	\N	\N	\N	\N	\N	update	---\nbranch_id:\n- 2\n- 1\n	33	\N	\N	a2bb554e-0413-4ea9-aa02-075cc129dece	2021-01-19 22:31:17.696371
123	17	Item	\N	\N	1	User	\N	update	---\nseller_percentage:\n- \n- !ruby/object:BigDecimal 18:0.11e2\nplanet_percentage:\n- \n- !ruby/object:BigDecimal 18:0.78e2\nbranch_percentage:\n- \n- !ruby/object:BigDecimal 18:0.11e2\n	34	\N	::1	2526fe43-3a1d-40a7-b368-a94c679b594b	2021-01-19 22:31:42.166567
124	2	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- \n- B\n	4	\N	\N	be71af13-89f9-48d8-8a3d-2d313873c4ba	2021-01-20 21:58:08.090686
125	6	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- \n- A\n	4	\N	\N	51c84da7-832a-4c14-a459-6fa72e1f8b78	2021-01-20 21:58:27.802173
126	2	Item	\N	\N	\N	\N	\N	update	---\ncategories_description:\n- \n- B\n	5	\N	\N	253cb303-d309-4252-a535-9df6ca490889	2021-01-20 22:00:02.839842
127	3	Item	\N	\N	\N	\N	\N	update	---\ncategories_description:\n- categoria\n- A\n	30	\N	\N	1522169c-9634-455c-87b9-e04c9958b56a	2021-01-20 22:00:08.13824
128	6	Item	\N	\N	\N	\N	\N	update	---\ncategories_description:\n- \n- A\n	5	\N	\N	88cf938d-658c-4b73-9ed6-87fe48058836	2021-01-20 22:00:11.699606
129	2	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- B\n- C\n	6	\N	\N	3b73934c-6f87-4b3c-9b88-73c14204a495	2021-01-21 01:58:51.486456
130	2	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- C\n- B\n	7	\N	\N	349eea33-7f3a-43d5-a28b-550585cca05b	2021-01-21 01:59:02.264098
131	6	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- A\n- B\n	6	\N	\N	aa9b6d36-5116-4d25-9eea-f9e0e797e98e	2021-01-21 01:59:05.528523
132	6	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- B\n- C\n	7	\N	\N	78a73146-4e83-4f0d-8a95-c855d666a911	2021-01-21 01:59:14.355267
133	6	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- C\n- A\n	8	\N	\N	db0cdb96-eb1e-4e16-bbac-4eb98d5f5120	2021-01-21 01:59:36.687765
134	5	Item	\N	\N	\N	\N	\N	update	---\ntrailer_type_id:\n- \n- 1\n	2	\N	\N	1491d56c-3f26-44bc-b123-eea43c7a95ec	2021-01-21 04:06:23.431801
135	1	Item	\N	\N	\N	\N	\N	update	---\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.1e3\n	5	\N	\N	8a51edae-5318-4629-a177-439a7fd45a1e	2021-01-21 04:25:44.20286
136	5	Item	\N	\N	\N	\N	\N	update	---\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.9e2\n	3	\N	\N	ec066dcf-59d7-4367-b6cf-3f076386e353	2021-01-21 04:31:25.930503
137	8	Item	\N	\N	1	User	\N	update	---\nplanet_percentage:\n- \n- !ruby/object:BigDecimal 18:0.1e2\nbranch_percentage:\n- \n- !ruby/object:BigDecimal 18:0.9e2\n	5	\N	::1	89495302-b9b7-4740-ac44-7b357e38ffa7	2021-01-21 17:58:13.094311
138	10	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- \n- A\n	5	\N	\N	a6d08803-3ad0-40bf-9c99-4f94333bc669	2021-01-21 18:01:32.723188
139	1	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- \n- A\n	6	\N	\N	c4eff267-8067-4e3c-a1a5-b003c8f3c7cd	2021-01-21 18:02:02.609714
140	5	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- \n- B\n	4	\N	\N	6b9faf3a-2259-4e08-badb-0abf17589b60	2021-01-21 18:02:31.012097
141	1	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 5\n- 2\nmodel:\n- A\n- ''\nserial_number:\n- \n- '12345'\nprice:\n- \n- !ruby/object:BigDecimal 18:0.3e6\ndepartment_id:\n- \n- 1\nstatus_shipping_id:\n- \n- 3\nbranch_id:\n- \n- 1\nacquisition_date:\n- \n- 19/01/2021\ncategories_description:\n- \n- ''\n	7	\N	::1	7446d7ec-9967-4c62-81ca-9789b47a1a32	2021-01-24 02:54:54.076936
142	5	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 5\n- 2\nmodel:\n- B\n- ''\nserial_number:\n- \n- '7655'\nprice:\n- \n- !ruby/object:BigDecimal 18:0.2e5\ndepartment_id:\n- \n- 2\nstatus_shipping_id:\n- \n- 2\nbranch_id:\n- \n- 2\nacquisition_date:\n- \n- 19/01/2021\ntrailer_type_id:\n- 1\n- \ncategories_description:\n- \n- ''\n	5	\N	::1	b58bc27f-a8f5-4375-9434-41faa62264a8	2021-01-24 02:55:37.812459
143	1	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- ''\n- modelo1\n	8	\N	\N	930d1f67-93d5-43ca-9e4e-4bfcf924d04d	2021-01-24 02:56:09.72339
144	5	Item	\N	\N	\N	\N	\N	update	---\nmodel:\n- ''\n- modelo4\n	6	\N	\N	1c144234-af02-4243-8b24-237803153506	2021-01-24 02:56:19.081975
145	1	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n- 3\n- 2\n	9	\N	\N	e188cbdd-3107-4059-8b13-93d66b7ce43e	2021-01-24 03:05:35.812198
146	8	Item	\N	\N	\N	\N	\N	update	---\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e8\n	6	\N	\N	82f183d6-51da-4745-90c2-07319f8939b7	2021-03-08 20:16:49.774698
147	10	Item	\N	\N	\N	\N	\N	update	---\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e8\n	6	\N	\N	e06bdeb0-7f60-478c-a100-f2abeff1f6ae	2021-03-08 20:17:08.815143
148	12	Item	\N	\N	\N	\N	\N	update	---\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e8\n	4	\N	\N	a1e80069-1c50-4d0f-a470-196e84188ecc	2021-03-08 20:17:17.514418
149	13	Item	\N	\N	\N	\N	\N	update	---\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e8\n	3	\N	\N	535d883e-bc56-4f7e-8b5b-baf03b1b6e37	2021-03-08 20:17:41.010104
150	6	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npurchased_date:\n- 21/10/2020\n- '09/03/2021'\nuser_id:\n- 2\n- 1\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	9	\N	::1	3de0a619-3bbb-481d-a250-28be22161077	2021-03-09 00:38:33.418253
151	5	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	7	\N	::1	43b1004d-871a-49b7-ba0d-22bceed022de	2021-03-09 00:46:37.554536
152	5	Item	\N	\N	1	User	\N	update	---\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- 2\n- 1\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	8	\N	::1	e76faf46-00b5-47e1-ae56-25f03344aac3	2021-03-09 01:22:06.105249
153	5	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\n	9	\N	::1	72d9430c-6959-41a7-9000-749ea6b31299	2021-03-09 01:24:44.938149
154	1	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	10	\N	::1	40d9948c-5fd3-44d3-9881-6e66fd434ef2	2021-03-09 03:32:26.497325
155	1	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\ndescription:\n- \n- Sin comprobante\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- 3\n- 1\nfiscal_voucher_id:\n- \n- 6\npayment_type:\n- \n- 3\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	11	\N	::1	6ce0a8a3-9719-42fc-8e27-ff3caa7d48fd	2021-03-09 03:32:49.713591
156	1	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 3\n- 1\n	12	\N	::1	579520c9-5c73-4094-9a16-43e8f9f87ce3	2021-03-09 03:33:20.334841
157	1	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	13	\N	::1	ec368577-db74-47c4-8158-cbd30d52e3c3	2021-03-09 03:33:32.788989
158	2	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n- \n- 3\n	8	\N	\N	d9ffaed4-b126-4575-8382-65954dbaa1ac	2021-03-09 03:51:00.874929
159	2	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npurchased_date:\n- 14/10/2020\n- '09/03/2021'\nuser_id:\n- 2\n- 1\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	9	\N	::1	fda8d023-2323-4f1d-a5c4-ef1d862e29bc	2021-03-09 03:51:35.101918
160	2	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	10	\N	::1	cb9b630e-ed1a-4655-b647-1e14f0bb8b9c	2021-03-09 03:51:46.586064
161	19	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: oiuytr\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Ninguno\nacquisition_date: 10/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	6b8a1c6e-bb7d-451e-acda-6e4d484e218d	2021-03-09 22:10:28.639733
162	19	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.1e4\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e5\n	2	\N	::1	b3c22db8-f734-43b5-8c2b-b4e408f230e8	2021-03-09 22:11:51.397289
163	20	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: kuytf\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ninguno\nacquisition_date: 16/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	c1013749-871c-484a-9b03-874d070068b5	2021-03-09 22:17:31.813653
164	20	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.2e5\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	2	\N	::1	ce18cdcc-978d-45ab-bf2d-fbdd63f6dcd5	2021-03-09 22:18:06.08626
165	21	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: '098765'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ninguno\nacquisition_date: 17/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: \npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	931fb2be-b6b4-46f2-980e-7a302da8f80b	2021-03-09 22:23:06.762064
166	21	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.1e4\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.0\n	2	\N	::1	b388952a-6450-41c3-a95a-d5fdc8852dd8	2021-03-09 22:23:53.256252
167	22	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: poiuyt\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e8\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ninguno\nacquisition_date: 10/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	b192ae2f-ed2c-4c33-9d7a-95a680149c0c	2021-03-09 22:25:34.80022
168	22	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.87777e5\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.67e5\n	2	\N	::1	162db603-325e-49b5-b3dc-66ef1e1739bd	2021-03-09 22:26:05.557301
169	22	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 6\n- 2\n	3	\N	\N	1da90618-de3d-42c5-8823-da4ab35f34f4	2021-03-09 22:27:13.733656
170	22	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\n	4	\N	::1	2e4b1c7b-5547-4a21-ae73-1912e19a7eee	2021-03-09 22:27:38.514374
171	23	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: po87ytr\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.6e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ninguno\nacquisition_date: 17/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	6a4dc678-4fd7-49be-9496-277670595249	2021-03-09 22:28:54.532937
172	23	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.7e6\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.5e6\n	2	\N	::1	beef5b8c-9e9e-4417-ba75-2b19aa73415f	2021-03-09 22:29:26.238979
173	24	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: p'0uygv\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e8\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ninguno\nacquisition_date: 10/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	f730a9b8-6a81-46ee-8d96-0ae0d85a179e	2021-03-09 22:32:18.817918
174	24	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- '09/03/2021'\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.1e4\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e4\n	2	\N	::1	8daee720-4e2f-41ad-a731-6a4450a3be38	2021-03-09 22:33:01.287226
175	25	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: oiuytfvb\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e7\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Ninguno\nacquisition_date: '09/03/2021'\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	2f08dc96-852c-4fa6-bc31-63678c2c9cf1	2021-03-10 04:28:39.771723
176	25	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.5e5\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	2	\N	::1	11aa7200-5f0a-4656-ae5a-d4a3ece9260b	2021-03-10 04:29:28.757461
177	26	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: poiuytfdc\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.2e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Ninnungo\nacquisition_date: '09/03/2021'\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: \npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	213c5c0e-ac4b-47c9-a1c8-81381fcbd47b	2021-03-10 17:04:35.142926
178	26	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.2e6\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e8\n	2	\N	::1	eb05d5ff-855b-4fc2-add6-e9726451f2bc	2021-03-10 17:05:15.915998
179	27	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: '09876rdvbn'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.4e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: none\nacquisition_date: \ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	298f4aa5-858a-4806-8e6a-af0bd64d6633	2021-03-10 17:09:46.588927
180	27	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.28888e5\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e8\n	2	\N	::1	27187a6d-6971-4bd7-b11c-3ef29d6b94b0	2021-03-10 17:10:13.394587
181	28	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: u87ytgh\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: None\nacquisition_date: \ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: \npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	77dc4f19-5fc4-4499-996b-d3410b1295a9	2021-03-10 17:15:07.325297
182	28	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.2e3\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	2	\N	::1	c93fa1c5-9d9d-44c5-81eb-b1f80e814d0b	2021-03-10 17:15:48.951555
183	29	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: wefsa\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: none\nacquisition_date: 11/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	a88046d2-5087-416c-9542-c89e219d124b	2021-03-10 17:21:35.129515
184	29	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.1e3\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	2	\N	::1	667972a3-d1ff-4a87-938f-f8e3e346a659	2021-03-10 17:22:10.810304
185	30	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: oiuytgb\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.5e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: onj\nacquisition_date: 24/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: \npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	c5cd3c29-05e9-4acc-ab43-f5c52577a461	2021-03-10 17:30:34.277627
186	30	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.6e2\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.7e4\n	2	\N	::1	967399b5-e9bc-41bc-98f7-5053e774822b	2021-03-10 17:30:55.638325
187	31	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: '0999'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.2e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ninguno\nacquisition_date: 24/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	0bcb5617-fb90-4227-9585-be5557953004	2021-03-10 17:34:19.748572
188	31	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.1e3\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e5\n	2	\N	::1	9633d33a-125b-4eb8-9b0f-42b2a47c6d8a	2021-03-10 17:34:47.303337
189	32	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: poiuyg\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.69e2\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: 'on'\nacquisition_date: 16/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: \npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	af018203-7062-41a8-92d0-4fcc8f483cb1	2021-03-10 17:44:57.697511
190	32	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.9876e4\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.7654e4\n	2	\N	::1	d3e36826-14c5-4fc5-a01b-e4abc2cdedfc	2021-03-10 17:45:21.147438
191	33	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: '0987y'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: pokj\nacquisition_date: \ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: \npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	d73d5605-5679-44e4-9e12-dc7e29d3b8e5	2021-03-10 17:52:13.880273
192	33	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	2	\N	::1	d9900b07-3754-4801-b3e6-37818048d876	2021-03-10 17:52:34.90465
193	34	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: '087'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.7888e4\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: nnn\nacquisition_date: 16/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	5ff20b3c-e767-4f59-a4eb-708b134a7209	2021-03-10 17:54:50.890691
194	34	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\npayment_type:\n- \n- 3\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	2	\N	::1	18daafdd-44e3-4393-acb7-2dfad43b9224	2021-03-10 17:55:14.116013
195	35	Item	\N	\N	2	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: '098u'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e6\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: asdf\nacquisition_date: 23/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	2dfea9e2-ea9b-4f86-8907-889b2c3316c1	2021-03-10 18:01:37.096158
196	35	Item	\N	\N	2	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 2\npayment_type:\n- \n- 3\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	2	\N	::1	30439d0a-537a-4299-9273-39159a367046	2021-03-10 18:02:01.164473
197	36	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: o9uyg\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.67877e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: jhgf\nacquisition_date: 17/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	d1454a84-9a9a-446c-8d57-dbf25aeadb96	2021-03-10 21:04:51.869569
198	36	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 1\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.1e4\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.2e4\n	2	\N	::1	217670d2-3708-46a7-af81-3947dccf49e3	2021-03-10 21:05:15.015465
199	37	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: 98ygbn\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: None\nacquisition_date: 02/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	a693aa32-1e13-49c7-b3e0-abcaea85c53e	2021-03-10 21:08:33.97696
200	37	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 1\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.4e4\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	2	\N	::1	25dd7d00-b6fc-4824-b096-4832b3b52bcd	2021-03-10 21:08:53.716706
201	38	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: ouygbn\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e4\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: obas\nacquisition_date: 17/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	daf6a71a-04b6-4316-aedd-1a3a1355ab6c	2021-03-10 21:09:19.801781
202	38	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\ndescription:\n- \n- obs\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 1\nclient_id:\n- \n- 1\nfiscal_voucher_id:\n- \n- 7\npayment_type:\n- \n- 3\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	2	\N	::1	8a6bea51-20f0-418c-9588-abdad6d670db	2021-03-10 21:09:34.423429
203	39	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: ''\nserial_number: numserie\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: accs\nacquisition_date: '09/03/2021'\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: \nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: ''\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	ab7ce89e-ee63-4c80-81fc-bf8c424c203e	2021-03-10 21:10:00.854197
204	39	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npurchased_date:\n- \n- 10/03/2021\nuser_id:\n- \n- 1\npayment_type:\n- \n- 2\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e4\n	2	\N	::1	56d1979d-65a3-47d6-a942-d5fb712c69c1	2021-03-10 21:10:20.51673
205	40	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgnullmodel234\nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: 1\nbrand_id: 8\nstatus_item_id: 7\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: ninguno\nacquisition_date: \ntrailer_id: \nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.2e5\nstatus_shipping_id: \ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 1\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: 1\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: 1\ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: 1\ncategories_description: \nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	0f47bd39-31a6-4127-96b3-515562191ea5	2021-03-11 04:01:46.732023
206	34	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	3	\N	::1	b62ec410-4b62-4ff9-9619-6d6eacbe82ef	2021-03-16 02:26:15.96205
207	41	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: '123456'\nserial_number: '1235'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Accesorio\nacquisition_date: 17/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: \nredila_type_id: \ntrailer_type_id: 1\nfloor_type_id: \ncapacity_id: \nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: \nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: 'TRAILER: Una cabina. '\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	589fa7cf-6d65-4693-99ef-1ceb6b1e9f74	2021-03-22 21:48:11.897719
208	42	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: 123456modelo1238865sdfh777\nserial_number: '9998888'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.1e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 2\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Ninungo\nacquisition_date: 10/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: \ntrailer_type_id: 2\nfloor_type_id: \ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: 'TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER:\n  Nuevo Fender. '\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	3c5745f0-77e8-4d1b-a35f-077351cf29cc	2021-03-23 01:17:40.23618
209	43	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234\nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: 1\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Ningun accesorio\nacquisition_date: \ntrailer_id: \nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.25e5\nstatus_shipping_id: 1\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 3\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: 1\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: 1\ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: 1\ncategories_description: \nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	0c729f34-f997-463c-beda-b29267fa8254	2021-03-23 17:47:13.130587
210	44	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234\nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: 1\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Accesorios\nacquisition_date: \ntrailer_id: \nclient_id: 2\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.35e5\nstatus_shipping_id: 1\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 3\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: 1\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: 1\ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: 1\ncategories_description: \nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	cf4cb989-8b9e-4786-92a4-6e285d209cf8	2021-03-23 18:05:36.833383
211	44	Item	\N	\N	1	User	\N	update	---\nuser_id:\n- 1\n- 7\n	2	\N	::1	a0e169fc-bf08-482a-802b-135e8e06b946	2021-03-23 18:16:12.407319
212	45	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: 123456modelo1238865sdfh777\nserial_number: '9876'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.35e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: Accesorio nuevo\nacquisition_date: 17/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: \ntrailer_type_id: 2\nfloor_type_id: \ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: 'TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER:\n  Nuevo Fender. '\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	b46e1f50-cb15-4d9a-b6aa-cbf0a5e690bf	2021-03-24 00:02:59.516074
213	41	Item	\N	\N	1	User	\N	update	---\nmodel:\n- '123456'\n- 123456modelo1238865sdfh777\nramp_type_id:\n- \n- 1\ntrailer_type_id:\n- 1\n- 2\ncapacity_id:\n- \n- 1\nfender_type_id:\n- \n- 1\ncategories_description:\n- 'TRAILER: Una cabina. '\n- 'TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER: Nuevo Fender. '\n	2	\N	::1	142babfc-3b75-4ec0-9fb6-fa37137e92d7	2021-03-24 00:24:56.042836
214	42	Item	\N	\N	1	User	\N	update	---\nmodel:\n- 123456modelo1238865sdfh777\n- 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234\ntrailer_length_id:\n- \n- 1\nredila_type_id:\n- \n- 1\ntrailer_type_id:\n- 2\n- 3\nfloor_type_id:\n- \n- 1\nbrake_type_id:\n- \n- 1\ncolor_id:\n- \n- 1\ndivition_type_id:\n- \n- 1\nhydraulic_jack_id:\n- \n- 1\npull_type_id:\n- \n- 1\nroof_type_id:\n- \n- 1\nsuspension_type_id:\n- \n- 1\nturn_type_id:\n- \n- 1\ntrailer_width_id:\n- \n- 1\ncategories_description:\n- 'TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER: Nuevo Fender. '\n- 'TRAILER: Trailer grane. ANCHO: 5. LARGO: 6. PISO: plano. RAMPA: RAmpa. CAPACIDAD:\n  100. REDILA: Redila. TECHO: Techo nuevo. VOLTEO: Volteo. FRENO: Freno nuevo. COLOR:\n  Negro. DIVISION: Nueva division. FENDER: Nuevo Fender. GATO HIDRAULICO: Nuevo Gato\n  hidraulico. JALON: Jalon Nuevo. SUSPENSION: Nueva suspension. '\n	2	\N	::1	bc1ab638-3dd9-4d61-97e9-00a4952c3068	2021-03-24 01:17:21.244651
215	42	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n- \n- 24/03/2021\nuser_id:\n- \n- 1\nadvance_payment:\n- \n- !ruby/object:BigDecimal 18:0.2e4\npayment_type:\n- \n- 4\nsale_price:\n- \n- !ruby/object:BigDecimal 18:0.1e5\n	3	\N	::1	96d044c6-69d6-49b3-8b2e-75923a55e46a	2021-03-24 01:50:39.821572
216	44	Item	\N	\N	1	User	\N	update	---\nmodel:\n- 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234\n- 123456modelo1238865sdfh777\ntrailer_length_id:\n- 1\n- \nredila_type_id:\n- 1\n- \ntrailer_type_id:\n- 3\n- 2\nfloor_type_id:\n- 1\n- \nbrake_type_id:\n- 1\n- \ncolor_id:\n- 1\n- \ndivition_type_id:\n- 1\n- \nhydraulic_jack_id:\n- 1\n- \npull_type_id:\n- 1\n- \nroof_type_id:\n- 1\n- \nsuspension_type_id:\n- 1\n- \nturn_type_id:\n- 1\n- \ntrailer_width_id:\n- 1\n- \n	3	\N	::1	9383081a-60e3-47f6-b4cc-4aee17a5087c	2021-03-24 02:50:46.652912
217	46	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: 123456modelo1238865sdfh777\nserial_number: '10097654'\npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: !ruby/object:BigDecimal 18:0.6e5\ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 1\nuser_id: \nbrand_id: \nstatus_item_id: 2\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: 1\ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: 60 mil\nacquisition_date: 18/03/2021\ntrailer_id: \nclient_id: \npayment_type: \nfiscal_voucher_id: \nadvance_payment: \nstatus_shipping_id: 3\ncolor: \ntrailer_length_id: \ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: \ntrailer_type_id: 2\nfloor_type_id: \ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: \ncolor_id: \nhydraulic_jack_id: \npull_type_id: \nbrake_type_id: \nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: \ndivition_type_id: \nsuspension_type_id: \nroof_type_id: \ncategories_description: 'TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER:\n  Nuevo Fender. '\nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	7a9f31bd-f087-4751-9d28-02f80a6a9ada	2021-03-24 21:08:15.598094
218	46	Item	\N	\N	1	User	\N	update	---\nmodel:\n- 123456modelo1238865sdfh777\n- 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234\nserial_number:\n- '10097654'\n- '10097654888'\ntrailer_length_id:\n- \n- 1\nredila_type_id:\n- \n- 1\ntrailer_type_id:\n- 2\n- 3\nfloor_type_id:\n- \n- 1\nbrake_type_id:\n- \n- 1\ncolor_id:\n- \n- 1\ndivition_type_id:\n- \n- 1\nhydraulic_jack_id:\n- \n- 1\npull_type_id:\n- \n- 1\nroof_type_id:\n- \n- 1\nsuspension_type_id:\n- \n- 1\nturn_type_id:\n- \n- 1\ntrailer_width_id:\n- \n- 1\ncategories_description:\n- 'TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER: Nuevo Fender. '\n- 'TRAILER: Trailer grane. ANCHO: 5. LARGO: 6. PISO: plano. RAMPA: RAmpa. CAPACIDAD:\n  100. REDILA: Redila. TECHO: Techo nuevo. VOLTEO: Volteo. FRENO: Freno nuevo. COLOR:\n  Negro. DIVISION: Nueva division. FENDER: Nuevo Fender. GATO HIDRAULICO: Nuevo Gato\n  hidraulico. JALON: Jalon Nuevo. SUSPENSION: Nueva suspension. '\n	2	\N	::1	af4adfc2-b78a-4cec-adeb-faeaba05fe33	2021-03-24 21:09:02.773919
219	47	Item	\N	\N	1	User	\N	create	---\nname: \ndescription: \nmodel: 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234\nserial_number: \npurchased_date: \nin_service_date: \ntime_unit_service: \ntime_quantity_service: \nprice: \ntime_unit_depreciation: \ntime_quantity_depreciation: \nsub_category_id: \nprovider_id: \ndepartment_id: 2\nuser_id: 3\nbrand_id: \nstatus_item_id: 5\ncode: \nmaintenance_date: \nmaintenance_done: \nbranch_id: \ncategory_id: \nto_assing: \nsale_price: \nremission: \naccessory: todos\nacquisition_date: \ntrailer_id: \nclient_id: 1\npayment_type: \nfiscal_voucher_id: \nadvance_payment: !ruby/object:BigDecimal 18:0.5e5\nstatus_shipping_id: 1\ncolor: \ntrailer_length_id: 1\ntrailer_height_id: \nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 3\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail: \ngooseneck: \ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: 1\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: \nfender_type_id: 1\nturn_type_id: 1\ndivition_type_id: 1\nsuspension_type_id: 1\nroof_type_id: 1\ncategories_description: \nseller_percentage: \nplanet_percentage: \nbranch_percentage: \n	1	\N	::1	a22a6f41-cd71-419f-8aab-23fadb9a7105	2021-03-24 21:10:08.204221
220	47	Item	\N	\N	1	User	\N	update	---\nmodel:\n- 1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234\n- 123456modelo\ntrailer_length_id:\n- 1\n- \nramp_type_id:\n- 1\n- \nredila_type_id:\n- 1\n- \ntrailer_type_id:\n- 3\n- 2\nfloor_type_id:\n- 1\n- \ncapacity_id:\n- 1\n- \nbrake_type_id:\n- 1\n- \ncolor_id:\n- 1\n- \ndivition_type_id:\n- 1\n- \nfender_type_id:\n- 1\n- \nhydraulic_jack_id:\n- 1\n- \npull_type_id:\n- 1\n- \nroof_type_id:\n- 1\n- \nsuspension_type_id:\n- 1\n- \nturn_type_id:\n- 1\n- \ntrailer_width_id:\n- 1\n- \n	2	\N	::1	6d39770c-cdaf-4903-b7f3-8c24c847b318	2021-03-24 21:11:26.602165
221	47	Item	\N	\N	1	User	\N	update	---\nmodel:\n- 123456modelo\n- 123456modelo1238865sdfh777\nramp_type_id:\n- \n- 1\ncapacity_id:\n- \n- 1\nfender_type_id:\n- \n- 1\n	3	\N	::1	f36a20af-d77b-46ad-9968-ed4aa60b287d	2021-03-24 21:11:37.764705
\.


--
-- Data for Name: brake_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.brake_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Freno nuevo	0987yhjk	t	2020-11-26 02:36:21.429693	2020-11-26 02:36:21.429693
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.branches (id, name, description, city_id, company_id, manager_id, created_at, updated_at, state_id, code, last_code, fleet_cost) FROM stdin;
1	Cuauhtemoc	Cuauhtemoc	199	1	3	2020-09-29 00:18:45.515677	2020-10-07 01:46:24.110151	8	S1	\N	0
2	Chihuahua	\N	199	1	2	2020-10-07 01:53:06.890103	2021-03-23 01:14:48.786735	8	123455	\N	20.0
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.brands (id, name, description, created_at, updated_at, model_part, status) FROM stdin;
1	ATOMICTHREE	ATOMICTHREE	2020-09-25 01:51:06.283561	2020-09-25 01:51:06.283561	\N	\N
2	BEST HOME	BEST HOME	2020-09-25 01:51:06.29134	2020-09-25 01:51:06.29134	\N	\N
3	AJHUA TECNOLOGIC	AJHUA TECNOLOGIC	2020-09-25 01:51:06.295263	2020-09-25 01:51:06.295263	\N	\N
4	DAHUA	DAHUA	2020-09-25 01:51:06.299785	2020-09-25 01:51:06.299785	\N	\N
5	DAEVON	DAEVON	2020-09-25 01:51:06.302411	2020-09-25 01:51:06.302411	\N	\N
6	ECONOSILLA	ECONOSILLA	2020-09-25 01:51:06.306738	2020-09-25 01:51:06.306738	\N	\N
7	EPCOM	EPCOM	2020-09-25 01:51:06.309811	2020-09-25 01:51:06.309811	\N	\N
8	GALES	GALES	2020-09-25 01:51:06.313488	2020-09-25 01:51:06.313488	\N	\N
9	GEBESA	GEBESA	2020-09-25 01:51:06.31701	2020-09-25 01:51:06.31701	\N	\N
10	GENERAL ELECTRIC	GENERAL ELECTRIC	2020-09-25 01:51:06.319845	2020-09-25 01:51:06.319845	\N	\N
11	GENOVA	GENOVA	2020-09-25 01:51:06.322485	2020-09-25 01:51:06.322485	\N	\N
12	HIKVISION	HIKVISION	2020-09-25 01:51:06.325612	2020-09-25 01:51:06.325612	\N	\N
13	IEM	IEM	2020-09-25 01:51:06.329778	2020-09-25 01:51:06.329778	\N	\N
14	KOOL TEK	KOOL TEK	2020-09-25 01:51:06.332317	2020-09-25 01:51:06.332317	\N	\N
15	LASKO	LASKO	2020-09-25 01:51:06.334439	2020-09-25 01:51:06.334439	\N	\N
16	LG	LG	2020-09-25 01:51:06.336378	2020-09-25 01:51:06.336378	\N	\N
17	LIFETIME	LIFETIME	2020-09-25 01:51:06.338384	2020-09-25 01:51:06.338384	\N	\N
18	MASTER	MASTER	2020-09-25 01:51:06.341096	2020-09-25 01:51:06.341096	\N	\N
19	MILFORD	MILFORD	2020-09-25 01:51:06.344787	2020-09-25 01:51:06.344787	\N	\N
20	MIRAGE	MIRAGE	2020-09-25 01:51:06.347964	2020-09-25 01:51:06.347964	\N	\N
21	MOTOROLA	MOTOROLA	2020-09-25 01:51:06.350897	2020-09-25 01:51:06.350897	\N	\N
22	N/A	N/A	2020-09-25 01:51:06.353764	2020-09-25 01:51:06.353764	\N	\N
23	MABE	MABE	2020-09-25 01:51:06.356308	2020-09-25 01:51:06.356308	\N	\N
24	MYTEC	MYTEC	2020-09-25 01:51:06.358755	2020-09-25 01:51:06.358755	\N	\N
25	NY	NY	2020-09-25 01:51:06.364104	2020-09-25 01:51:06.364104	\N	\N
26	OFFICE DEPOT	OFFICE DEPOT	2020-09-25 01:51:06.367253	2020-09-25 01:51:06.367253	\N	\N
27	OFFICE DESIGNS	OFFICE DESIGNS	2020-09-25 01:51:06.370326	2020-09-25 01:51:06.370326	\N	\N
28	OFFICE MAX	OFFICE MAX	2020-09-25 01:51:06.372452	2020-09-25 01:51:06.372452	\N	\N
29	PRIME	PRIME	2020-09-25 01:51:06.375458	2020-09-25 01:51:06.375458	\N	\N
30	PRINTAFORM	PRINTAFORM	2020-09-25 01:51:06.378467	2020-09-25 01:51:06.378467	\N	\N
31	RED TOP	RED TOP	2020-09-25 01:51:06.380807	2020-09-25 01:51:06.380807	\N	\N
32	RENZOR	RENZOR	2020-09-25 01:51:06.382782	2020-09-25 01:51:06.382782	\N	\N
33	SAMSUNG	SAMSUNG	2020-09-25 01:51:06.384547	2020-09-25 01:51:06.384547	\N	\N
34	SHARP	SHARP	2020-09-25 01:51:06.386277	2020-09-25 01:51:06.386277	\N	\N
35	STEREN	STEREN	2020-09-25 01:51:06.388141	2020-09-25 01:51:06.388141	\N	\N
36	SUPERMATIC	SUPERMATIC	2020-09-25 01:51:06.390403	2020-09-25 01:51:06.390403	\N	\N
37	TAM-MEX	TAM-MEX	2020-09-25 01:51:06.392937	2020-09-25 01:51:06.392937	\N	\N
38	TRANE-MIRAGE	TRANE-MIRAGE	2020-09-25 01:51:06.39584	2020-09-25 01:51:06.39584	\N	\N
39	VELVET	VELVET	2020-09-25 01:51:06.397991	2020-09-25 01:51:06.397991	\N	\N
40	VIDRIO PULIDO	VIDRIO PULIDO	2020-09-25 01:51:06.400055	2020-09-25 01:51:06.400055	\N	\N
41	VTECH	VTECH	2020-09-25 01:51:06.402227	2020-09-25 01:51:06.402227	\N	\N
42	WATERFRESH	WATERFRESH	2020-09-25 01:51:06.404237	2020-09-25 01:51:06.404237	\N	\N
43	WIRLPOOL	WIRLPOOL	2020-09-25 01:51:06.406212	2020-09-25 01:51:06.406212	\N	\N
44	YORK	YORK	2020-09-25 01:51:06.408088	2020-09-25 01:51:06.408088	\N	\N
45	VARIAS	VARIAS	2020-09-25 01:51:06.409905	2020-09-25 01:51:06.409905	\N	\N
46	VELVET	VELVET	2020-09-25 01:51:06.412466	2020-09-25 01:51:06.412466	\N	\N
47	VENCOL	VENCOL	2020-09-25 01:51:06.415545	2020-09-25 01:51:06.415545	\N	\N
\.


--
-- Data for Name: capacities; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.capacities (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	100	65	t	2020-11-03 01:47:52.094475	2020-11-03 01:47:52.094475
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.categories (id, name, description, status, created_at, updated_at, company_id) FROM stdin;
1	Nueva categoria	\N	t	2020-09-25 02:24:41.92341	2020-09-25 02:24:41.92341	1
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.cities (id, name, state_id, created_at, updated_at) FROM stdin;
1	Aguascalientes	1	2020-09-25 01:51:08.374032	2020-09-25 01:51:08.374032
2	San Francisco de los Romo	1	2020-09-25 01:51:08.379443	2020-09-25 01:51:08.379443
3	El Llano	1	2020-09-25 01:51:08.382128	2020-09-25 01:51:08.382128
4	Rincón de Romos	1	2020-09-25 01:51:08.384727	2020-09-25 01:51:08.384727
5	Cosío	1	2020-09-25 01:51:08.387469	2020-09-25 01:51:08.387469
6	San José de Gracia	1	2020-09-25 01:51:08.390646	2020-09-25 01:51:08.390646
7	Tepezalá	1	2020-09-25 01:51:08.393975	2020-09-25 01:51:08.393975
8	Pabellón de Arteaga	1	2020-09-25 01:51:08.396553	2020-09-25 01:51:08.396553
9	Asientos	1	2020-09-25 01:51:08.399004	2020-09-25 01:51:08.399004
10	Calvillo	1	2020-09-25 01:51:08.401726	2020-09-25 01:51:08.401726
11	Jesús María	1	2020-09-25 01:51:08.404419	2020-09-25 01:51:08.404419
12	Mexicali	2	2020-09-25 01:51:08.40813	2020-09-25 01:51:08.40813
13	Tecate	2	2020-09-25 01:51:08.411357	2020-09-25 01:51:08.411357
14	Tijuana	2	2020-09-25 01:51:08.414133	2020-09-25 01:51:08.414133
15	Playas de Rosarito	2	2020-09-25 01:51:08.416512	2020-09-25 01:51:08.416512
16	Ensenada	2	2020-09-25 01:51:08.418993	2020-09-25 01:51:08.418993
17	La Paz	3	2020-09-25 01:51:08.421624	2020-09-25 01:51:08.421624
18	Los Cabos	3	2020-09-25 01:51:08.425538	2020-09-25 01:51:08.425538
19	Comondú	3	2020-09-25 01:51:08.428489	2020-09-25 01:51:08.428489
20	Loreto	3	2020-09-25 01:51:08.431321	2020-09-25 01:51:08.431321
21	Mulegé	3	2020-09-25 01:51:08.433973	2020-09-25 01:51:08.433973
22	Campeche	4	2020-09-25 01:51:08.436493	2020-09-25 01:51:08.436493
23	Carmen	4	2020-09-25 01:51:08.438938	2020-09-25 01:51:08.438938
24	Palizada	4	2020-09-25 01:51:08.441915	2020-09-25 01:51:08.441915
25	Candelaria	4	2020-09-25 01:51:08.444588	2020-09-25 01:51:08.444588
26	Escárcega	4	2020-09-25 01:51:08.447146	2020-09-25 01:51:08.447146
27	Champotón	4	2020-09-25 01:51:08.449938	2020-09-25 01:51:08.449938
28	Hopelchén	4	2020-09-25 01:51:08.452618	2020-09-25 01:51:08.452618
29	Calakmul	4	2020-09-25 01:51:08.455135	2020-09-25 01:51:08.455135
30	Tenabo	4	2020-09-25 01:51:08.458542	2020-09-25 01:51:08.458542
31	Hecelchakán	4	2020-09-25 01:51:08.461715	2020-09-25 01:51:08.461715
32	Calkiní	4	2020-09-25 01:51:08.464629	2020-09-25 01:51:08.464629
33	Saltillo	5	2020-09-25 01:51:08.467283	2020-09-25 01:51:08.467283
34	Arteaga	5	2020-09-25 01:51:08.469787	2020-09-25 01:51:08.469787
35	Juárez	5	2020-09-25 01:51:08.473001	2020-09-25 01:51:08.473001
36	Progreso	5	2020-09-25 01:51:08.477064	2020-09-25 01:51:08.477064
37	Escobedo	5	2020-09-25 01:51:08.479938	2020-09-25 01:51:08.479938
38	San Buenaventura	5	2020-09-25 01:51:08.482671	2020-09-25 01:51:08.482671
39	Abasolo	5	2020-09-25 01:51:08.485213	2020-09-25 01:51:08.485213
40	Candela	5	2020-09-25 01:51:08.487887	2020-09-25 01:51:08.487887
41	Frontera	5	2020-09-25 01:51:08.49418	2020-09-25 01:51:08.49418
42	Monclova	5	2020-09-25 01:51:08.497182	2020-09-25 01:51:08.497182
43	Castaños	5	2020-09-25 01:51:08.499767	2020-09-25 01:51:08.499767
44	Ramos Arizpe	5	2020-09-25 01:51:08.502277	2020-09-25 01:51:08.502277
45	General Cepeda	5	2020-09-25 01:51:08.504962	2020-09-25 01:51:08.504962
46	Piedras Negras	5	2020-09-25 01:51:08.508947	2020-09-25 01:51:08.508947
47	Nava	5	2020-09-25 01:51:08.511939	2020-09-25 01:51:08.511939
48	Acuña	5	2020-09-25 01:51:08.514758	2020-09-25 01:51:08.514758
49	Múzquiz	5	2020-09-25 01:51:08.517406	2020-09-25 01:51:08.517406
50	Jiménez	5	2020-09-25 01:51:08.519798	2020-09-25 01:51:08.519798
51	Zaragoza	5	2020-09-25 01:51:08.522679	2020-09-25 01:51:08.522679
52	Morelos	5	2020-09-25 01:51:08.526428	2020-09-25 01:51:08.526428
53	Allende	5	2020-09-25 01:51:08.528928	2020-09-25 01:51:08.528928
54	Villa Unión	5	2020-09-25 01:51:08.531612	2020-09-25 01:51:08.531612
55	Guerrero	5	2020-09-25 01:51:08.534213	2020-09-25 01:51:08.534213
56	Hidalgo	5	2020-09-25 01:51:08.536881	2020-09-25 01:51:08.536881
57	Sabinas	5	2020-09-25 01:51:08.539724	2020-09-25 01:51:08.539724
58	San Juan de Sabinas	5	2020-09-25 01:51:08.543412	2020-09-25 01:51:08.543412
59	Torreón	5	2020-09-25 01:51:08.546303	2020-09-25 01:51:08.546303
60	Matamoros	5	2020-09-25 01:51:08.549158	2020-09-25 01:51:08.549158
61	Viesca	5	2020-09-25 01:51:08.551977	2020-09-25 01:51:08.551977
62	Ocampo	5	2020-09-25 01:51:08.554605	2020-09-25 01:51:08.554605
63	Nadadores	5	2020-09-25 01:51:08.558444	2020-09-25 01:51:08.558444
64	Sierra Mojada	5	2020-09-25 01:51:08.561635	2020-09-25 01:51:08.561635
65	Cuatro Ciénegas	5	2020-09-25 01:51:08.564692	2020-09-25 01:51:08.564692
66	Lamadrid	5	2020-09-25 01:51:08.567475	2020-09-25 01:51:08.567475
67	Sacramento	5	2020-09-25 01:51:08.57016	2020-09-25 01:51:08.57016
68	San Pedro	5	2020-09-25 01:51:08.573178	2020-09-25 01:51:08.573178
69	Francisco I. Madero	5	2020-09-25 01:51:08.576516	2020-09-25 01:51:08.576516
70	Parras	5	2020-09-25 01:51:08.579789	2020-09-25 01:51:08.579789
71	Colima	6	2020-09-25 01:51:08.582673	2020-09-25 01:51:08.582673
72	Tecomán	6	2020-09-25 01:51:08.585489	2020-09-25 01:51:08.585489
73	Manzanillo	6	2020-09-25 01:51:08.588144	2020-09-25 01:51:08.588144
74	Armería	6	2020-09-25 01:51:08.59182	2020-09-25 01:51:08.59182
75	Coquimatlán	6	2020-09-25 01:51:08.594967	2020-09-25 01:51:08.594967
76	Comala	6	2020-09-25 01:51:08.597751	2020-09-25 01:51:08.597751
77	Cuauhtémoc	6	2020-09-25 01:51:08.600644	2020-09-25 01:51:08.600644
78	Ixtlahuacán	6	2020-09-25 01:51:08.603361	2020-09-25 01:51:08.603361
79	Minatitlán	6	2020-09-25 01:51:08.606175	2020-09-25 01:51:08.606175
80	Villa de Álvarez	6	2020-09-25 01:51:08.60937	2020-09-25 01:51:08.60937
81	Tuxtla Gutiérrez	7	2020-09-25 01:51:08.612283	2020-09-25 01:51:08.612283
82	San Fernando	7	2020-09-25 01:51:08.614978	2020-09-25 01:51:08.614978
83	Berriozábal	7	2020-09-25 01:51:08.617776	2020-09-25 01:51:08.617776
84	Ocozocoautla de Espinosa	7	2020-09-25 01:51:08.620823	2020-09-25 01:51:08.620823
85	Suchiapa	7	2020-09-25 01:51:08.624824	2020-09-25 01:51:08.624824
86	Chiapa de Corzo	7	2020-09-25 01:51:08.627958	2020-09-25 01:51:08.627958
87	Osumacinta	7	2020-09-25 01:51:08.630875	2020-09-25 01:51:08.630875
88	San Cristóbal de las Casas	7	2020-09-25 01:51:08.633639	2020-09-25 01:51:08.633639
89	Chamula	7	2020-09-25 01:51:08.636234	2020-09-25 01:51:08.636234
90	Ixtapa	7	2020-09-25 01:51:08.638854	2020-09-25 01:51:08.638854
91	Zinacantán	7	2020-09-25 01:51:08.642827	2020-09-25 01:51:08.642827
92	Acala	7	2020-09-25 01:51:08.645943	2020-09-25 01:51:08.645943
93	Chiapilla	7	2020-09-25 01:51:08.64878	2020-09-25 01:51:08.64878
94	San Lucas	7	2020-09-25 01:51:08.651701	2020-09-25 01:51:08.651701
95	Teopisca	7	2020-09-25 01:51:08.654514	2020-09-25 01:51:08.654514
96	Amatenango del Valle	7	2020-09-25 01:51:08.658361	2020-09-25 01:51:08.658361
97	Chanal	7	2020-09-25 01:51:08.661559	2020-09-25 01:51:08.661559
98	Oxchuc	7	2020-09-25 01:51:08.664591	2020-09-25 01:51:08.664591
99	Huixtán	7	2020-09-25 01:51:08.667417	2020-09-25 01:51:08.667417
100	Tenejapa	7	2020-09-25 01:51:08.670209	2020-09-25 01:51:08.670209
101	Mitontic	7	2020-09-25 01:51:08.673755	2020-09-25 01:51:08.673755
102	Reforma	7	2020-09-25 01:51:08.681367	2020-09-25 01:51:08.681367
103	Juárez	7	2020-09-25 01:51:08.684416	2020-09-25 01:51:08.684416
104	Pichucalco	7	2020-09-25 01:51:08.687089	2020-09-25 01:51:08.687089
105	Sunuapa	7	2020-09-25 01:51:08.690512	2020-09-25 01:51:08.690512
106	Ostuacán	7	2020-09-25 01:51:08.69346	2020-09-25 01:51:08.69346
107	Francisco León	7	2020-09-25 01:51:08.696131	2020-09-25 01:51:08.696131
108	Ixtacomitán	7	2020-09-25 01:51:08.698696	2020-09-25 01:51:08.698696
109	Solosuchiapa	7	2020-09-25 01:51:08.701266	2020-09-25 01:51:08.701266
110	Ixtapangajoya	7	2020-09-25 01:51:08.704282	2020-09-25 01:51:08.704282
111	Tecpatán	7	2020-09-25 01:51:08.709028	2020-09-25 01:51:08.709028
112	Copainalá	7	2020-09-25 01:51:08.711959	2020-09-25 01:51:08.711959
113	Chicoasén	7	2020-09-25 01:51:08.714616	2020-09-25 01:51:08.714616
114	Coapilla	7	2020-09-25 01:51:08.717232	2020-09-25 01:51:08.717232
115	Pantepec	7	2020-09-25 01:51:08.719959	2020-09-25 01:51:08.719959
116	Tapalapa	7	2020-09-25 01:51:08.722667	2020-09-25 01:51:08.722667
117	Ocotepec	7	2020-09-25 01:51:08.726125	2020-09-25 01:51:08.726125
118	Chapultenango	7	2020-09-25 01:51:08.729076	2020-09-25 01:51:08.729076
119	Amatán	7	2020-09-25 01:51:08.732018	2020-09-25 01:51:08.732018
120	Huitiupán	7	2020-09-25 01:51:08.735019	2020-09-25 01:51:08.735019
121	Ixhuatán	7	2020-09-25 01:51:08.737805	2020-09-25 01:51:08.737805
122	Tapilula	7	2020-09-25 01:51:08.741699	2020-09-25 01:51:08.741699
123	Rayón	7	2020-09-25 01:51:08.746575	2020-09-25 01:51:08.746575
124	Pueblo Nuevo Solistahuacán	7	2020-09-25 01:51:08.749699	2020-09-25 01:51:08.749699
125	Jitotol	7	2020-09-25 01:51:08.752377	2020-09-25 01:51:08.752377
126	Bochil	7	2020-09-25 01:51:08.755967	2020-09-25 01:51:08.755967
127	Soyaló	7	2020-09-25 01:51:08.759305	2020-09-25 01:51:08.759305
128	San Juan Cancuc	7	2020-09-25 01:51:08.76216	2020-09-25 01:51:08.76216
129	Sabanilla	7	2020-09-25 01:51:08.764882	2020-09-25 01:51:08.764882
130	Simojovel	7	2020-09-25 01:51:08.767531	2020-09-25 01:51:08.767531
131	San Andrés Duraznal	7	2020-09-25 01:51:08.770271	2020-09-25 01:51:08.770271
132	El Bosque	7	2020-09-25 01:51:08.773359	2020-09-25 01:51:08.773359
133	Chalchihuitán	7	2020-09-25 01:51:08.776377	2020-09-25 01:51:08.776377
134	Larráinzar	7	2020-09-25 01:51:08.77913	2020-09-25 01:51:08.77913
135	Santiago el Pinar	7	2020-09-25 01:51:08.781616	2020-09-25 01:51:08.781616
136	Chenalhó	7	2020-09-25 01:51:08.784175	2020-09-25 01:51:08.784175
137	Aldama	7	2020-09-25 01:51:08.78666	2020-09-25 01:51:08.78666
138	Pantelhó	7	2020-09-25 01:51:08.789488	2020-09-25 01:51:08.789488
139	Sitalá	7	2020-09-25 01:51:08.792559	2020-09-25 01:51:08.792559
140	Salto de Agua	7	2020-09-25 01:51:08.795559	2020-09-25 01:51:08.795559
141	Tila	7	2020-09-25 01:51:08.798161	2020-09-25 01:51:08.798161
142	Tumbalá	7	2020-09-25 01:51:08.800761	2020-09-25 01:51:08.800761
143	Yajalón	7	2020-09-25 01:51:08.803318	2020-09-25 01:51:08.803318
144	Ocosingo	7	2020-09-25 01:51:08.807236	2020-09-25 01:51:08.807236
145	Chilón	7	2020-09-25 01:51:08.810615	2020-09-25 01:51:08.810615
146	Benemérito de las Américas	7	2020-09-25 01:51:08.813681	2020-09-25 01:51:08.813681
147	Marqués de Comillas	7	2020-09-25 01:51:08.816479	2020-09-25 01:51:08.816479
148	Palenque	7	2020-09-25 01:51:08.819207	2020-09-25 01:51:08.819207
149	La Libertad	7	2020-09-25 01:51:08.822413	2020-09-25 01:51:08.822413
150	Catazajá	7	2020-09-25 01:51:08.826863	2020-09-25 01:51:08.826863
151	Comitán de Domínguez	7	2020-09-25 01:51:08.830143	2020-09-25 01:51:08.830143
152	Tzimol	7	2020-09-25 01:51:08.833084	2020-09-25 01:51:08.833084
153	Chicomuselo	7	2020-09-25 01:51:08.835838	2020-09-25 01:51:08.835838
154	Bella Vista	7	2020-09-25 01:51:08.838899	2020-09-25 01:51:08.838899
155	Frontera Comalapa	7	2020-09-25 01:51:08.842452	2020-09-25 01:51:08.842452
156	La Trinitaria	7	2020-09-25 01:51:08.845231	2020-09-25 01:51:08.845231
157	La Independencia	7	2020-09-25 01:51:08.847784	2020-09-25 01:51:08.847784
158	Maravilla Tenejapa	7	2020-09-25 01:51:08.850358	2020-09-25 01:51:08.850358
159	Las Margaritas	7	2020-09-25 01:51:08.85324	2020-09-25 01:51:08.85324
160	Altamirano	7	2020-09-25 01:51:08.857293	2020-09-25 01:51:08.857293
161	Venustiano Carranza	7	2020-09-25 01:51:08.860478	2020-09-25 01:51:08.860478
162	Totolapa	7	2020-09-25 01:51:08.863221	2020-09-25 01:51:08.863221
163	Nicolás Ruíz	7	2020-09-25 01:51:08.865797	2020-09-25 01:51:08.865797
164	Las Rosas	7	2020-09-25 01:51:08.868362	2020-09-25 01:51:08.868362
165	La Concordia	7	2020-09-25 01:51:08.871023	2020-09-25 01:51:08.871023
166	Angel Albino Corzo	7	2020-09-25 01:51:08.874059	2020-09-25 01:51:08.874059
167	Montecristo de Guerrero	7	2020-09-25 01:51:08.876873	2020-09-25 01:51:08.876873
168	Socoltenango	7	2020-09-25 01:51:08.879617	2020-09-25 01:51:08.879617
169	Cintalapa	7	2020-09-25 01:51:08.882222	2020-09-25 01:51:08.882222
170	Jiquipilas	7	2020-09-25 01:51:08.884856	2020-09-25 01:51:08.884856
171	Arriaga	7	2020-09-25 01:51:08.887438	2020-09-25 01:51:08.887438
172	Villaflores	7	2020-09-25 01:51:08.891316	2020-09-25 01:51:08.891316
173	Tonalá	7	2020-09-25 01:51:08.894149	2020-09-25 01:51:08.894149
174	Villa Corzo	7	2020-09-25 01:51:08.896861	2020-09-25 01:51:08.896861
175	Pijijiapan	7	2020-09-25 01:51:08.899704	2020-09-25 01:51:08.899704
176	Mapastepec	7	2020-09-25 01:51:08.902343	2020-09-25 01:51:08.902343
177	Acapetahua	7	2020-09-25 01:51:08.904981	2020-09-25 01:51:08.904981
178	Acacoyagua	7	2020-09-25 01:51:08.908124	2020-09-25 01:51:08.908124
179	Escuintla	7	2020-09-25 01:51:08.910963	2020-09-25 01:51:08.910963
180	Villa Comaltitlán	7	2020-09-25 01:51:08.913712	2020-09-25 01:51:08.913712
181	Huixtla	7	2020-09-25 01:51:08.916391	2020-09-25 01:51:08.916391
182	Mazatán	7	2020-09-25 01:51:08.919091	2020-09-25 01:51:08.919091
183	Huehuetán	7	2020-09-25 01:51:08.921997	2020-09-25 01:51:08.921997
184	Tuzantán	7	2020-09-25 01:51:08.927135	2020-09-25 01:51:08.927135
185	Tapachula	7	2020-09-25 01:51:08.930174	2020-09-25 01:51:08.930174
186	Suchiate	7	2020-09-25 01:51:08.932943	2020-09-25 01:51:08.932943
187	Frontera Hidalgo	7	2020-09-25 01:51:08.935546	2020-09-25 01:51:08.935546
188	Metapa	7	2020-09-25 01:51:08.938207	2020-09-25 01:51:08.938207
189	Tuxtla Chico	7	2020-09-25 01:51:08.941944	2020-09-25 01:51:08.941944
190	Unión Juárez	7	2020-09-25 01:51:08.944814	2020-09-25 01:51:08.944814
191	Cacahoatán	7	2020-09-25 01:51:08.94754	2020-09-25 01:51:08.94754
192	Motozintla	7	2020-09-25 01:51:08.950162	2020-09-25 01:51:08.950162
193	Mazapa de Madero	7	2020-09-25 01:51:08.95278	2020-09-25 01:51:08.95278
194	Amatenango de la Frontera	7	2020-09-25 01:51:08.956391	2020-09-25 01:51:08.956391
195	Bejucal de Ocampo	7	2020-09-25 01:51:08.959275	2020-09-25 01:51:08.959275
196	La Grandeza	7	2020-09-25 01:51:08.962235	2020-09-25 01:51:08.962235
197	El Porvenir	7	2020-09-25 01:51:08.964975	2020-09-25 01:51:08.964975
198	Siltepec	7	2020-09-25 01:51:08.967607	2020-09-25 01:51:08.967607
199	Chihuahua	8	2020-09-25 01:51:08.970468	2020-09-25 01:51:08.970468
200	Cuauhtémoc	8	2020-09-25 01:51:08.977535	2020-09-25 01:51:08.977535
201	Riva Palacio	8	2020-09-25 01:51:08.980982	2020-09-25 01:51:08.980982
202	Aquiles Serdán	8	2020-09-25 01:51:08.983746	2020-09-25 01:51:08.983746
203	Bachíniva	8	2020-09-25 01:51:08.98649	2020-09-25 01:51:08.98649
204	Guerrero	8	2020-09-25 01:51:08.989966	2020-09-25 01:51:08.989966
205	Nuevo Casas Grandes	8	2020-09-25 01:51:08.992948	2020-09-25 01:51:08.992948
206	Ascensión	8	2020-09-25 01:51:08.995563	2020-09-25 01:51:08.995563
207	Janos	8	2020-09-25 01:51:08.998157	2020-09-25 01:51:08.998157
208	Casas Grandes	8	2020-09-25 01:51:09.000698	2020-09-25 01:51:09.000698
209	Galeana	8	2020-09-25 01:51:09.003583	2020-09-25 01:51:09.003583
210	Buenaventura	8	2020-09-25 01:51:09.008671	2020-09-25 01:51:09.008671
211	Gómez Farías	8	2020-09-25 01:51:09.011939	2020-09-25 01:51:09.011939
212	Ignacio Zaragoza	8	2020-09-25 01:51:09.014693	2020-09-25 01:51:09.014693
213	Madera	8	2020-09-25 01:51:09.01733	2020-09-25 01:51:09.01733
214	Namiquipa	8	2020-09-25 01:51:09.020176	2020-09-25 01:51:09.020176
215	Temósachic	8	2020-09-25 01:51:09.022948	2020-09-25 01:51:09.022948
216	Matachí	8	2020-09-25 01:51:09.025924	2020-09-25 01:51:09.025924
217	Juárez	8	2020-09-25 01:51:09.028652	2020-09-25 01:51:09.028652
218	Guadalupe	8	2020-09-25 01:51:09.031216	2020-09-25 01:51:09.031216
219	Praxedis G. Guerrero	8	2020-09-25 01:51:09.034126	2020-09-25 01:51:09.034126
220	Ahumada	8	2020-09-25 01:51:09.036817	2020-09-25 01:51:09.036817
221	Coyame del Sotol	8	2020-09-25 01:51:09.039965	2020-09-25 01:51:09.039965
222	Ojinaga	8	2020-09-25 01:51:09.042733	2020-09-25 01:51:09.042733
223	Aldama	8	2020-09-25 01:51:09.045518	2020-09-25 01:51:09.045518
224	Julimes	8	2020-09-25 01:51:09.048307	2020-09-25 01:51:09.048307
225	Manuel Benavides	8	2020-09-25 01:51:09.050997	2020-09-25 01:51:09.050997
226	Delicias	8	2020-09-25 01:51:09.053464	2020-09-25 01:51:09.053464
227	Rosales	8	2020-09-25 01:51:09.057194	2020-09-25 01:51:09.057194
228	Meoqui	8	2020-09-25 01:51:09.060874	2020-09-25 01:51:09.060874
229	Dr. Belisario Domínguez	8	2020-09-25 01:51:09.063819	2020-09-25 01:51:09.063819
230	Satevó	8	2020-09-25 01:51:09.06663	2020-09-25 01:51:09.06663
231	San Francisco de Borja	8	2020-09-25 01:51:09.069424	2020-09-25 01:51:09.069424
232	Nonoava	8	2020-09-25 01:51:09.072557	2020-09-25 01:51:09.072557
233	Guachochi	8	2020-09-25 01:51:09.07546	2020-09-25 01:51:09.07546
234	Bocoyna	8	2020-09-25 01:51:09.078004	2020-09-25 01:51:09.078004
235	Cusihuiriachi	8	2020-09-25 01:51:09.080719	2020-09-25 01:51:09.080719
236	Gran Morelos	8	2020-09-25 01:51:09.083316	2020-09-25 01:51:09.083316
237	Santa Isabel	8	2020-09-25 01:51:09.08585	2020-09-25 01:51:09.08585
238	Carichí	8	2020-09-25 01:51:09.089888	2020-09-25 01:51:09.089888
239	Uruachi	8	2020-09-25 01:51:09.094015	2020-09-25 01:51:09.094015
240	Ocampo	8	2020-09-25 01:51:09.097154	2020-09-25 01:51:09.097154
241	Moris	8	2020-09-25 01:51:09.099881	2020-09-25 01:51:09.099881
242	Chínipas	8	2020-09-25 01:51:09.102499	2020-09-25 01:51:09.102499
243	Maguarichi	8	2020-09-25 01:51:09.105409	2020-09-25 01:51:09.105409
244	Guazapares	8	2020-09-25 01:51:09.1082	2020-09-25 01:51:09.1082
245	Batopilas	8	2020-09-25 01:51:09.11108	2020-09-25 01:51:09.11108
246	Urique	8	2020-09-25 01:51:09.113615	2020-09-25 01:51:09.113615
247	Morelos	8	2020-09-25 01:51:09.116207	2020-09-25 01:51:09.116207
248	Guadalupe y Calvo	8	2020-09-25 01:51:09.118745	2020-09-25 01:51:09.118745
249	San Francisco del Oro	8	2020-09-25 01:51:09.121682	2020-09-25 01:51:09.121682
250	Rosario	8	2020-09-25 01:51:09.124545	2020-09-25 01:51:09.124545
251	Huejotitán	8	2020-09-25 01:51:09.127219	2020-09-25 01:51:09.127219
252	El Tule	8	2020-09-25 01:51:09.129683	2020-09-25 01:51:09.129683
253	Balleza	8	2020-09-25 01:51:09.133288	2020-09-25 01:51:09.133288
254	Santa Bárbara	8	2020-09-25 01:51:09.136274	2020-09-25 01:51:09.136274
255	Camargo	8	2020-09-25 01:51:09.140126	2020-09-25 01:51:09.140126
256	Saucillo	8	2020-09-25 01:51:09.143342	2020-09-25 01:51:09.143342
257	Valle de Zaragoza	8	2020-09-25 01:51:09.146239	2020-09-25 01:51:09.146239
258	La Cruz	8	2020-09-25 01:51:09.149185	2020-09-25 01:51:09.149185
259	San Francisco de Conchos	8	2020-09-25 01:51:09.152337	2020-09-25 01:51:09.152337
260	Hidalgo del Parral	8	2020-09-25 01:51:09.155304	2020-09-25 01:51:09.155304
261	Allende	8	2020-09-25 01:51:09.159018	2020-09-25 01:51:09.159018
262	López	8	2020-09-25 01:51:09.161909	2020-09-25 01:51:09.161909
263	Matamoros	8	2020-09-25 01:51:09.164746	2020-09-25 01:51:09.164746
264	Jiménez	8	2020-09-25 01:51:09.167532	2020-09-25 01:51:09.167532
265	Coronado	8	2020-09-25 01:51:09.170443	2020-09-25 01:51:09.170443
266	Álvaro Obregón	9	2020-09-25 01:51:09.175024	2020-09-25 01:51:09.175024
267	Azcapotzalco	9	2020-09-25 01:51:09.178212	2020-09-25 01:51:09.178212
268	Benito Juárez	9	2020-09-25 01:51:09.181057	2020-09-25 01:51:09.181057
269	Coyoacán	9	2020-09-25 01:51:09.184322	2020-09-25 01:51:09.184322
270	Cuajimalpa de Morelos	9	2020-09-25 01:51:09.187323	2020-09-25 01:51:09.187323
271	Cuauhtémoc	9	2020-09-25 01:51:09.191232	2020-09-25 01:51:09.191232
272	Gustavo A. Madero	9	2020-09-25 01:51:09.194279	2020-09-25 01:51:09.194279
273	Iztacalco	9	2020-09-25 01:51:09.197294	2020-09-25 01:51:09.197294
274	Iztapalapa	9	2020-09-25 01:51:09.200051	2020-09-25 01:51:09.200051
275	La Magdalena Contreras	9	2020-09-25 01:51:09.20275	2020-09-25 01:51:09.20275
276	Miguel Hidalgo	9	2020-09-25 01:51:09.205681	2020-09-25 01:51:09.205681
277	Milpa Alta	9	2020-09-25 01:51:09.208456	2020-09-25 01:51:09.208456
278	Tláhuac	9	2020-09-25 01:51:09.211241	2020-09-25 01:51:09.211241
279	Tlalpan	9	2020-09-25 01:51:09.213896	2020-09-25 01:51:09.213896
280	Venustiano Carranza	9	2020-09-25 01:51:09.216549	2020-09-25 01:51:09.216549
281	Xochimilco	9	2020-09-25 01:51:09.219084	2020-09-25 01:51:09.219084
282	Durango	10	2020-09-25 01:51:09.222691	2020-09-25 01:51:09.222691
283	Canatlán	10	2020-09-25 01:51:09.226423	2020-09-25 01:51:09.226423
284	Nuevo Ideal	10	2020-09-25 01:51:09.229233	2020-09-25 01:51:09.229233
285	Coneto de Comonfort	10	2020-09-25 01:51:09.231952	2020-09-25 01:51:09.231952
286	San Juan del Río	10	2020-09-25 01:51:09.234615	2020-09-25 01:51:09.234615
287	Canelas	10	2020-09-25 01:51:09.237459	2020-09-25 01:51:09.237459
288	Topia	10	2020-09-25 01:51:09.240374	2020-09-25 01:51:09.240374
289	Tamazula	10	2020-09-25 01:51:09.243264	2020-09-25 01:51:09.243264
290	Santiago Papasquiaro	10	2020-09-25 01:51:09.246065	2020-09-25 01:51:09.246065
291	Otáez	10	2020-09-25 01:51:09.248706	2020-09-25 01:51:09.248706
292	San Dimas	10	2020-09-25 01:51:09.251406	2020-09-25 01:51:09.251406
293	Guadalupe Victoria	10	2020-09-25 01:51:09.254212	2020-09-25 01:51:09.254212
294	Peñón Blanco	10	2020-09-25 01:51:09.259122	2020-09-25 01:51:09.259122
295	Pánuco de Coronado	10	2020-09-25 01:51:09.262422	2020-09-25 01:51:09.262422
296	Poanas	10	2020-09-25 01:51:09.265295	2020-09-25 01:51:09.265295
297	Nombre de Dios	10	2020-09-25 01:51:09.268033	2020-09-25 01:51:09.268033
298	Vicente Guerrero	10	2020-09-25 01:51:09.270925	2020-09-25 01:51:09.270925
299	Súchil	10	2020-09-25 01:51:09.274963	2020-09-25 01:51:09.274963
300	Pueblo Nuevo	10	2020-09-25 01:51:09.278345	2020-09-25 01:51:09.278345
301	Mezquital	10	2020-09-25 01:51:09.28788	2020-09-25 01:51:09.28788
302	Gómez Palacio	10	2020-09-25 01:51:09.290848	2020-09-25 01:51:09.290848
303	Lerdo	10	2020-09-25 01:51:09.293432	2020-09-25 01:51:09.293432
304	Mapimí	10	2020-09-25 01:51:09.296083	2020-09-25 01:51:09.296083
305	Tlahualilo	10	2020-09-25 01:51:09.298533	2020-09-25 01:51:09.298533
306	Hidalgo	10	2020-09-25 01:51:09.301059	2020-09-25 01:51:09.301059
307	Ocampo	10	2020-09-25 01:51:09.304707	2020-09-25 01:51:09.304707
308	Guanaceví	10	2020-09-25 01:51:09.307966	2020-09-25 01:51:09.307966
309	San Bernardo	10	2020-09-25 01:51:09.310807	2020-09-25 01:51:09.310807
310	Indé	10	2020-09-25 01:51:09.313502	2020-09-25 01:51:09.313502
311	San Pedro del Gallo	10	2020-09-25 01:51:09.316249	2020-09-25 01:51:09.316249
312	Tepehuanes	10	2020-09-25 01:51:09.318819	2020-09-25 01:51:09.318819
313	El Oro	10	2020-09-25 01:51:09.322226	2020-09-25 01:51:09.322226
314	Nazas	10	2020-09-25 01:51:09.325601	2020-09-25 01:51:09.325601
315	San Luis del Cordero	10	2020-09-25 01:51:09.328222	2020-09-25 01:51:09.328222
316	Rodeo	10	2020-09-25 01:51:09.330841	2020-09-25 01:51:09.330841
317	Cuencamé	10	2020-09-25 01:51:09.333673	2020-09-25 01:51:09.333673
318	Santa Clara	10	2020-09-25 01:51:09.336652	2020-09-25 01:51:09.336652
319	San Juan de Guadalupe	10	2020-09-25 01:51:09.341565	2020-09-25 01:51:09.341565
320	General Simón Bolívar	10	2020-09-25 01:51:09.344434	2020-09-25 01:51:09.344434
321	Guanajuato	11	2020-09-25 01:51:09.34725	2020-09-25 01:51:09.34725
322	Silao de la Victoria	11	2020-09-25 01:51:09.349904	2020-09-25 01:51:09.349904
323	Romita	11	2020-09-25 01:51:09.352437	2020-09-25 01:51:09.352437
324	San Francisco del Rincón	11	2020-09-25 01:51:09.355029	2020-09-25 01:51:09.355029
325	Purísima del Rincón	11	2020-09-25 01:51:09.358242	2020-09-25 01:51:09.358242
326	Manuel Doblado	11	2020-09-25 01:51:09.36097	2020-09-25 01:51:09.36097
327	Irapuato	11	2020-09-25 01:51:09.363893	2020-09-25 01:51:09.363893
328	Salamanca	11	2020-09-25 01:51:09.366457	2020-09-25 01:51:09.366457
329	Pueblo Nuevo	11	2020-09-25 01:51:09.369367	2020-09-25 01:51:09.369367
330	Pénjamo	11	2020-09-25 01:51:09.373653	2020-09-25 01:51:09.373653
331	Cuerámaro	11	2020-09-25 01:51:09.376573	2020-09-25 01:51:09.376573
332	Abasolo	11	2020-09-25 01:51:09.37939	2020-09-25 01:51:09.37939
333	Huanímaro	11	2020-09-25 01:51:09.382008	2020-09-25 01:51:09.382008
334	León	11	2020-09-25 01:51:09.384524	2020-09-25 01:51:09.384524
335	San Felipe	11	2020-09-25 01:51:09.387305	2020-09-25 01:51:09.387305
336	Ocampo	11	2020-09-25 01:51:09.391499	2020-09-25 01:51:09.391499
337	San Miguel de Allende	11	2020-09-25 01:51:09.394601	2020-09-25 01:51:09.394601
338	Dolores Hidalgo Cuna de la Independencia Nacional	11	2020-09-25 01:51:09.397372	2020-09-25 01:51:09.397372
339	San Diego de la Unión	11	2020-09-25 01:51:09.400253	2020-09-25 01:51:09.400253
340	San Luis de la Paz	11	2020-09-25 01:51:09.40289	2020-09-25 01:51:09.40289
341	Victoria	11	2020-09-25 01:51:09.406314	2020-09-25 01:51:09.406314
342	Xichú	11	2020-09-25 01:51:09.409354	2020-09-25 01:51:09.409354
343	Atarjea	11	2020-09-25 01:51:09.41218	2020-09-25 01:51:09.41218
344	Santa Catarina	11	2020-09-25 01:51:09.414843	2020-09-25 01:51:09.414843
345	Doctor Mora	11	2020-09-25 01:51:09.417403	2020-09-25 01:51:09.417403
346	Tierra Blanca	11	2020-09-25 01:51:09.421251	2020-09-25 01:51:09.421251
347	San José Iturbide	11	2020-09-25 01:51:09.425388	2020-09-25 01:51:09.425388
348	Celaya	11	2020-09-25 01:51:09.428132	2020-09-25 01:51:09.428132
349	Apaseo el Grande	11	2020-09-25 01:51:09.430962	2020-09-25 01:51:09.430962
350	Comonfort	11	2020-09-25 01:51:09.433696	2020-09-25 01:51:09.433696
351	Santa Cruz de Juventino Rosas	11	2020-09-25 01:51:09.436363	2020-09-25 01:51:09.436363
352	Villagrán	11	2020-09-25 01:51:09.439151	2020-09-25 01:51:09.439151
353	Cortazar	11	2020-09-25 01:51:09.441773	2020-09-25 01:51:09.441773
354	Valle de Santiago	11	2020-09-25 01:51:09.444496	2020-09-25 01:51:09.444496
355	Jaral del Progreso	11	2020-09-25 01:51:09.447215	2020-09-25 01:51:09.447215
356	Apaseo el Alto	11	2020-09-25 01:51:09.450026	2020-09-25 01:51:09.450026
357	Jerécuaro	11	2020-09-25 01:51:09.452998	2020-09-25 01:51:09.452998
358	Coroneo	11	2020-09-25 01:51:09.456369	2020-09-25 01:51:09.456369
359	Acámbaro	11	2020-09-25 01:51:09.45927	2020-09-25 01:51:09.45927
360	Tarimoro	11	2020-09-25 01:51:09.461982	2020-09-25 01:51:09.461982
361	Tarandacuao	11	2020-09-25 01:51:09.464478	2020-09-25 01:51:09.464478
362	Moroleón	11	2020-09-25 01:51:09.467149	2020-09-25 01:51:09.467149
363	Salvatierra	11	2020-09-25 01:51:09.469631	2020-09-25 01:51:09.469631
364	Yuriria	11	2020-09-25 01:51:09.473999	2020-09-25 01:51:09.473999
365	Santiago Maravatío	11	2020-09-25 01:51:09.477223	2020-09-25 01:51:09.477223
366	Uriangato	11	2020-09-25 01:51:09.479835	2020-09-25 01:51:09.479835
367	Chilpancingo de los Bravo	12	2020-09-25 01:51:09.482575	2020-09-25 01:51:09.482575
368	General Heliodoro Castillo	12	2020-09-25 01:51:09.485381	2020-09-25 01:51:09.485381
369	Leonardo Bravo	12	2020-09-25 01:51:09.488463	2020-09-25 01:51:09.488463
370	Tixtla de Guerrero	12	2020-09-25 01:51:09.494205	2020-09-25 01:51:09.494205
371	Ayutla de los Libres	12	2020-09-25 01:51:09.497289	2020-09-25 01:51:09.497289
372	Mochitlán	12	2020-09-25 01:51:09.499942	2020-09-25 01:51:09.499942
373	Quechultenango	12	2020-09-25 01:51:09.502968	2020-09-25 01:51:09.502968
374	Tecoanapa	12	2020-09-25 01:51:09.507415	2020-09-25 01:51:09.507415
375	Acapulco	12	2020-09-25 01:51:09.510609	2020-09-25 01:51:09.510609
376	Juan R. Escudero	12	2020-09-25 01:51:09.513416	2020-09-25 01:51:09.513416
377	San Marcos	12	2020-09-25 01:51:09.516082	2020-09-25 01:51:09.516082
378	Iguala de la Independencia	12	2020-09-25 01:51:09.518975	2020-09-25 01:51:09.518975
379	Huitzuco de los Figueroa	12	2020-09-25 01:51:09.522262	2020-09-25 01:51:09.522262
380	Tepecoacuilco de Trujano	12	2020-09-25 01:51:09.524964	2020-09-25 01:51:09.524964
381	Eduardo Neri	12	2020-09-25 01:51:09.527642	2020-09-25 01:51:09.527642
382	Taxco de Alarcón	12	2020-09-25 01:51:09.530216	2020-09-25 01:51:09.530216
383	Buenavista de Cuéllar	12	2020-09-25 01:51:09.532814	2020-09-25 01:51:09.532814
384	Tetipac	12	2020-09-25 01:51:09.535372	2020-09-25 01:51:09.535372
385	Pilcaya	12	2020-09-25 01:51:09.53839	2020-09-25 01:51:09.53839
386	Teloloapan	12	2020-09-25 01:51:09.541415	2020-09-25 01:51:09.541415
387	Ixcateopan de Cuauhtémoc	12	2020-09-25 01:51:09.544497	2020-09-25 01:51:09.544497
388	Pedro Ascencio Alquisiras	12	2020-09-25 01:51:09.547131	2020-09-25 01:51:09.547131
389	General Canuto A. Neri	12	2020-09-25 01:51:09.549748	2020-09-25 01:51:09.549748
390	Arcelia	12	2020-09-25 01:51:09.552492	2020-09-25 01:51:09.552492
391	Apaxtla	12	2020-09-25 01:51:09.556619	2020-09-25 01:51:09.556619
392	Cuetzala del Progreso	12	2020-09-25 01:51:09.560065	2020-09-25 01:51:09.560065
393	Cocula	12	2020-09-25 01:51:09.563026	2020-09-25 01:51:09.563026
394	Tlapehuala	12	2020-09-25 01:51:09.56577	2020-09-25 01:51:09.56577
395	Cutzamala de Pinzón	12	2020-09-25 01:51:09.568582	2020-09-25 01:51:09.568582
396	Pungarabato	12	2020-09-25 01:51:09.571406	2020-09-25 01:51:09.571406
397	Tlalchapa	12	2020-09-25 01:51:09.575446	2020-09-25 01:51:09.575446
398	Coyuca de Catalán	12	2020-09-25 01:51:09.578549	2020-09-25 01:51:09.578549
399	Ajuchitlán del Progreso	12	2020-09-25 01:51:09.581664	2020-09-25 01:51:09.581664
400	Zirándaro	12	2020-09-25 01:51:09.584386	2020-09-25 01:51:09.584386
401	San Miguel Totolapan	12	2020-09-25 01:51:09.588268	2020-09-25 01:51:09.588268
402	La Unión de Isidoro Montes de Oca	12	2020-09-25 01:51:09.592252	2020-09-25 01:51:09.592252
403	Petatlán	12	2020-09-25 01:51:09.595343	2020-09-25 01:51:09.595343
404	Coahuayutla de José María Izazaga	12	2020-09-25 01:51:09.598106	2020-09-25 01:51:09.598106
405	Zihuatanejo de Azueta	12	2020-09-25 01:51:09.600861	2020-09-25 01:51:09.600861
406	Técpan de Galeana	12	2020-09-25 01:51:09.60486	2020-09-25 01:51:09.60486
407	Atoyac de Álvarez	12	2020-09-25 01:51:09.6079	2020-09-25 01:51:09.6079
408	Benito Juárez	12	2020-09-25 01:51:09.610752	2020-09-25 01:51:09.610752
409	Coyuca de Benítez	12	2020-09-25 01:51:09.615011	2020-09-25 01:51:09.615011
410	Olinalá	12	2020-09-25 01:51:09.617712	2020-09-25 01:51:09.617712
411	Atenango del Río	12	2020-09-25 01:51:09.620436	2020-09-25 01:51:09.620436
412	Copalillo	12	2020-09-25 01:51:09.62348	2020-09-25 01:51:09.62348
413	Cualác	12	2020-09-25 01:51:09.626207	2020-09-25 01:51:09.626207
414	Chilapa de Álvarez	12	2020-09-25 01:51:09.628763	2020-09-25 01:51:09.628763
415	José Joaquín de Herrera	12	2020-09-25 01:51:09.631842	2020-09-25 01:51:09.631842
416	Ahuacuotzingo	12	2020-09-25 01:51:09.634381	2020-09-25 01:51:09.634381
417	Zitlala	12	2020-09-25 01:51:09.637799	2020-09-25 01:51:09.637799
418	Mártir de Cuilapan	12	2020-09-25 01:51:09.641305	2020-09-25 01:51:09.641305
419	Huamuxtitlán	12	2020-09-25 01:51:09.644672	2020-09-25 01:51:09.644672
420	Xochihuehuetlán	12	2020-09-25 01:51:09.647739	2020-09-25 01:51:09.647739
421	Alpoyeca	12	2020-09-25 01:51:09.650531	2020-09-25 01:51:09.650531
422	Tlapa de Comonfort	12	2020-09-25 01:51:09.653354	2020-09-25 01:51:09.653354
423	Tlalixtaquilla de Maldonado	12	2020-09-25 01:51:09.656036	2020-09-25 01:51:09.656036
424	Xalpatláhuac	12	2020-09-25 01:51:09.658723	2020-09-25 01:51:09.658723
425	Zapotitlán Tablas	12	2020-09-25 01:51:09.661584	2020-09-25 01:51:09.661584
426	Acatepec	12	2020-09-25 01:51:09.664881	2020-09-25 01:51:09.664881
427	Atlixtac	12	2020-09-25 01:51:09.667756	2020-09-25 01:51:09.667756
428	Copanatoyac	12	2020-09-25 01:51:09.672272	2020-09-25 01:51:09.672272
429	Malinaltepec	12	2020-09-25 01:51:09.6761	2020-09-25 01:51:09.6761
430	Iliatenco	12	2020-09-25 01:51:09.679018	2020-09-25 01:51:09.679018
431	Tlacoapa	12	2020-09-25 01:51:09.681843	2020-09-25 01:51:09.681843
432	Atlamajalcingo del Monte	12	2020-09-25 01:51:09.684489	2020-09-25 01:51:09.684489
433	San Luis Acatlán	12	2020-09-25 01:51:09.687427	2020-09-25 01:51:09.687427
434	Metlatónoc	12	2020-09-25 01:51:09.690281	2020-09-25 01:51:09.690281
435	Cochoapa el Grande	12	2020-09-25 01:51:09.693113	2020-09-25 01:51:09.693113
436	Alcozauca de Guerrero	12	2020-09-25 01:51:09.695906	2020-09-25 01:51:09.695906
437	Ometepec	12	2020-09-25 01:51:09.698496	2020-09-25 01:51:09.698496
438	Tlacoachistlahuaca	12	2020-09-25 01:51:09.701086	2020-09-25 01:51:09.701086
439	Xochistlahuaca	12	2020-09-25 01:51:09.703977	2020-09-25 01:51:09.703977
440	Florencio Villarreal	12	2020-09-25 01:51:09.707168	2020-09-25 01:51:09.707168
441	Cuautepec	12	2020-09-25 01:51:09.710061	2020-09-25 01:51:09.710061
442	Copala	12	2020-09-25 01:51:09.712817	2020-09-25 01:51:09.712817
443	Azoyú	12	2020-09-25 01:51:09.715427	2020-09-25 01:51:09.715427
444	Juchitán	12	2020-09-25 01:51:09.718153	2020-09-25 01:51:09.718153
445	Marquelia	12	2020-09-25 01:51:09.721671	2020-09-25 01:51:09.721671
446	Cuajinicuilapa	12	2020-09-25 01:51:09.725276	2020-09-25 01:51:09.725276
447	Igualapa	12	2020-09-25 01:51:09.728405	2020-09-25 01:51:09.728405
448	Pachuca de Soto	13	2020-09-25 01:51:09.731297	2020-09-25 01:51:09.731297
449	Mineral del Chico	13	2020-09-25 01:51:09.734217	2020-09-25 01:51:09.734217
450	Mineral del Monte	13	2020-09-25 01:51:09.736997	2020-09-25 01:51:09.736997
451	Ajacuba	13	2020-09-25 01:51:09.739935	2020-09-25 01:51:09.739935
452	San Agustín Tlaxiaca	13	2020-09-25 01:51:09.742672	2020-09-25 01:51:09.742672
453	Mineral de la Reforma	13	2020-09-25 01:51:09.745226	2020-09-25 01:51:09.745226
454	Zapotlán de Juárez	13	2020-09-25 01:51:09.747836	2020-09-25 01:51:09.747836
455	Jacala de Ledezma	13	2020-09-25 01:51:09.750367	2020-09-25 01:51:09.750367
456	Pisaflores	13	2020-09-25 01:51:09.755301	2020-09-25 01:51:09.755301
457	Pacula	13	2020-09-25 01:51:09.758857	2020-09-25 01:51:09.758857
458	La Misión	13	2020-09-25 01:51:09.761719	2020-09-25 01:51:09.761719
459	Chapulhuacán	13	2020-09-25 01:51:09.764459	2020-09-25 01:51:09.764459
460	Ixmiquilpan	13	2020-09-25 01:51:09.767214	2020-09-25 01:51:09.767214
461	Zimapán	13	2020-09-25 01:51:09.769872	2020-09-25 01:51:09.769872
462	Nicolás Flores	13	2020-09-25 01:51:09.772927	2020-09-25 01:51:09.772927
463	Cardonal	13	2020-09-25 01:51:09.776291	2020-09-25 01:51:09.776291
464	Tasquillo	13	2020-09-25 01:51:09.778987	2020-09-25 01:51:09.778987
465	Alfajayucan	13	2020-09-25 01:51:09.781814	2020-09-25 01:51:09.781814
466	Huichapan	13	2020-09-25 01:51:09.784684	2020-09-25 01:51:09.784684
467	Tecozautla	13	2020-09-25 01:51:09.78795	2020-09-25 01:51:09.78795
468	Nopala de Villagrán	13	2020-09-25 01:51:09.790868	2020-09-25 01:51:09.790868
469	Actopan	13	2020-09-25 01:51:09.793971	2020-09-25 01:51:09.793971
470	Santiago de Anaya	13	2020-09-25 01:51:09.79687	2020-09-25 01:51:09.79687
471	San Salvador	13	2020-09-25 01:51:09.799541	2020-09-25 01:51:09.799541
472	Francisco I. Madero	13	2020-09-25 01:51:09.802455	2020-09-25 01:51:09.802455
473	El Arenal	13	2020-09-25 01:51:09.806411	2020-09-25 01:51:09.806411
474	Mixquiahuala de Juárez	13	2020-09-25 01:51:09.809914	2020-09-25 01:51:09.809914
475	Progreso de Obregón	13	2020-09-25 01:51:09.813108	2020-09-25 01:51:09.813108
476	Chilcuautla	13	2020-09-25 01:51:09.816388	2020-09-25 01:51:09.816388
477	Tezontepec de Aldama	13	2020-09-25 01:51:09.819606	2020-09-25 01:51:09.819606
478	Tlahuelilpan	13	2020-09-25 01:51:09.823001	2020-09-25 01:51:09.823001
479	Tula de Allende	13	2020-09-25 01:51:09.825867	2020-09-25 01:51:09.825867
480	Tepeji del Río de Ocampo	13	2020-09-25 01:51:09.828604	2020-09-25 01:51:09.828604
481	Chapantongo	13	2020-09-25 01:51:09.831305	2020-09-25 01:51:09.831305
482	Tepetitlán	13	2020-09-25 01:51:09.833945	2020-09-25 01:51:09.833945
483	Tetepango	13	2020-09-25 01:51:09.838476	2020-09-25 01:51:09.838476
484	Tlaxcoapan	13	2020-09-25 01:51:09.842631	2020-09-25 01:51:09.842631
485	Atitalaquia	13	2020-09-25 01:51:09.852687	2020-09-25 01:51:09.852687
486	Atotonilco de Tula	13	2020-09-25 01:51:09.855638	2020-09-25 01:51:09.855638
487	Huejutla de Reyes	13	2020-09-25 01:51:09.858537	2020-09-25 01:51:09.858537
488	San Felipe Orizatlán	13	2020-09-25 01:51:09.861293	2020-09-25 01:51:09.861293
489	Jaltocán	13	2020-09-25 01:51:09.863809	2020-09-25 01:51:09.863809
490	Huautla	13	2020-09-25 01:51:09.866403	2020-09-25 01:51:09.866403
491	Atlapexco	13	2020-09-25 01:51:09.869248	2020-09-25 01:51:09.869248
492	Huazalingo	13	2020-09-25 01:51:09.872002	2020-09-25 01:51:09.872002
493	Yahualica	13	2020-09-25 01:51:09.875308	2020-09-25 01:51:09.875308
494	Xochiatipan	13	2020-09-25 01:51:09.878145	2020-09-25 01:51:09.878145
495	Molango de Escamilla	13	2020-09-25 01:51:09.881041	2020-09-25 01:51:09.881041
496	Tepehuacán de Guerrero	13	2020-09-25 01:51:09.883638	2020-09-25 01:51:09.883638
497	Lolotla	13	2020-09-25 01:51:09.886699	2020-09-25 01:51:09.886699
498	Tlanchinol	13	2020-09-25 01:51:09.889974	2020-09-25 01:51:09.889974
499	Tlahuiltepa	13	2020-09-25 01:51:09.89346	2020-09-25 01:51:09.89346
500	Juárez Hidalgo	13	2020-09-25 01:51:09.896257	2020-09-25 01:51:09.896257
501	Zacualtipán de Ángeles	13	2020-09-25 01:51:09.898908	2020-09-25 01:51:09.898908
502	Calnali	13	2020-09-25 01:51:09.901864	2020-09-25 01:51:09.901864
503	Xochicoatlán	13	2020-09-25 01:51:09.905589	2020-09-25 01:51:09.905589
504	Tianguistengo	13	2020-09-25 01:51:09.90855	2020-09-25 01:51:09.90855
505	Atotonilco el Grande	13	2020-09-25 01:51:09.911235	2020-09-25 01:51:09.911235
506	Eloxochitlán	13	2020-09-25 01:51:09.913835	2020-09-25 01:51:09.913835
507	Metztitlán	13	2020-09-25 01:51:09.91634	2020-09-25 01:51:09.91634
508	San Agustín Metzquititlán	13	2020-09-25 01:51:09.918817	2020-09-25 01:51:09.918817
509	Metepec	13	2020-09-25 01:51:09.923614	2020-09-25 01:51:09.923614
510	Huehuetla	13	2020-09-25 01:51:09.927048	2020-09-25 01:51:09.927048
511	San Bartolo Tutotepec	13	2020-09-25 01:51:09.929703	2020-09-25 01:51:09.929703
512	Agua Blanca de Iturbide	13	2020-09-25 01:51:09.932377	2020-09-25 01:51:09.932377
513	Tenango de Doria	13	2020-09-25 01:51:09.935104	2020-09-25 01:51:09.935104
514	Huasca de Ocampo	13	2020-09-25 01:51:09.938143	2020-09-25 01:51:09.938143
515	Acatlán	13	2020-09-25 01:51:09.940827	2020-09-25 01:51:09.940827
516	Omitlán de Juárez	13	2020-09-25 01:51:09.943847	2020-09-25 01:51:09.943847
517	Epazoyucan	13	2020-09-25 01:51:09.946886	2020-09-25 01:51:09.946886
518	Tulancingo de Bravo	13	2020-09-25 01:51:09.94951	2020-09-25 01:51:09.94951
519	Acaxochitlán	13	2020-09-25 01:51:09.953469	2020-09-25 01:51:09.953469
520	Cuautepec de Hinojosa	13	2020-09-25 01:51:09.959392	2020-09-25 01:51:09.959392
521	Santiago Tulantepec de Lugo Guerrero	13	2020-09-25 01:51:09.962778	2020-09-25 01:51:09.962778
522	Singuilucan	13	2020-09-25 01:51:09.96573	2020-09-25 01:51:09.96573
523	Tizayuca	13	2020-09-25 01:51:09.968319	2020-09-25 01:51:09.968319
524	Zempoala	13	2020-09-25 01:51:09.972866	2020-09-25 01:51:09.972866
525	Tolcayuca	13	2020-09-25 01:51:09.977808	2020-09-25 01:51:09.977808
526	Villa de Tezontepec	13	2020-09-25 01:51:09.981023	2020-09-25 01:51:09.981023
527	Apan	13	2020-09-25 01:51:09.983581	2020-09-25 01:51:09.983581
528	Tlanalapa	13	2020-09-25 01:51:09.986596	2020-09-25 01:51:09.986596
529	Almoloya	13	2020-09-25 01:51:09.989453	2020-09-25 01:51:09.989453
530	Emiliano Zapata	13	2020-09-25 01:51:09.992214	2020-09-25 01:51:09.992214
531	Tepeapulco	13	2020-09-25 01:51:09.994887	2020-09-25 01:51:09.994887
532	Guadalajara	14	2020-09-25 01:51:09.997475	2020-09-25 01:51:09.997475
533	Zapopan	14	2020-09-25 01:51:10.000011	2020-09-25 01:51:10.000011
534	San Cristóbal de la Barranca	14	2020-09-25 01:51:10.004769	2020-09-25 01:51:10.004769
535	Ixtlahuacán del Río	14	2020-09-25 01:51:10.008952	2020-09-25 01:51:10.008952
536	Tala	14	2020-09-25 01:51:10.012016	2020-09-25 01:51:10.012016
537	El Arenal	14	2020-09-25 01:51:10.014772	2020-09-25 01:51:10.014772
538	Amatitán	14	2020-09-25 01:51:10.017383	2020-09-25 01:51:10.017383
539	Tonalá	14	2020-09-25 01:51:10.020321	2020-09-25 01:51:10.020321
540	Zapotlanejo	14	2020-09-25 01:51:10.023768	2020-09-25 01:51:10.023768
541	Acatic	14	2020-09-25 01:51:10.026759	2020-09-25 01:51:10.026759
542	Cuquío	14	2020-09-25 01:51:10.029667	2020-09-25 01:51:10.029667
543	San Pedro Tlaquepaque	14	2020-09-25 01:51:10.032447	2020-09-25 01:51:10.032447
544	Tlajomulco de Zúñiga	14	2020-09-25 01:51:10.035223	2020-09-25 01:51:10.035223
545	El Salto	14	2020-09-25 01:51:10.038005	2020-09-25 01:51:10.038005
546	Acatlán de Juárez	14	2020-09-25 01:51:10.04079	2020-09-25 01:51:10.04079
547	Villa Corona	14	2020-09-25 01:51:10.043637	2020-09-25 01:51:10.043637
548	Zacoalco de Torres	14	2020-09-25 01:51:10.046293	2020-09-25 01:51:10.046293
549	Atemajac de Brizuela	14	2020-09-25 01:51:10.048977	2020-09-25 01:51:10.048977
550	Jocotepec	14	2020-09-25 01:51:10.052761	2020-09-25 01:51:10.052761
551	Ixtlahuacán de los Membrillos	14	2020-09-25 01:51:10.056158	2020-09-25 01:51:10.056158
552	Juanacatlán	14	2020-09-25 01:51:10.060082	2020-09-25 01:51:10.060082
553	Chapala	14	2020-09-25 01:51:10.063166	2020-09-25 01:51:10.063166
554	Poncitlán	14	2020-09-25 01:51:10.065824	2020-09-25 01:51:10.065824
555	Zapotlán del Rey	14	2020-09-25 01:51:10.068718	2020-09-25 01:51:10.068718
556	Huejuquilla el Alto	14	2020-09-25 01:51:10.071515	2020-09-25 01:51:10.071515
557	Mezquitic	14	2020-09-25 01:51:10.076247	2020-09-25 01:51:10.076247
558	Villa Guerrero	14	2020-09-25 01:51:10.079616	2020-09-25 01:51:10.079616
559	Bolaños	14	2020-09-25 01:51:10.082614	2020-09-25 01:51:10.082614
560	Totatiche	14	2020-09-25 01:51:10.085999	2020-09-25 01:51:10.085999
561	Colotlán	14	2020-09-25 01:51:10.09098	2020-09-25 01:51:10.09098
562	Santa María de los Ángeles	14	2020-09-25 01:51:10.094037	2020-09-25 01:51:10.094037
563	Huejúcar	14	2020-09-25 01:51:10.096644	2020-09-25 01:51:10.096644
564	Chimaltitán	14	2020-09-25 01:51:10.09917	2020-09-25 01:51:10.09917
565	San Martín de Bolaños	14	2020-09-25 01:51:10.101985	2020-09-25 01:51:10.101985
566	Tequila	14	2020-09-25 01:51:10.104953	2020-09-25 01:51:10.104953
567	Hostotipaquillo	14	2020-09-25 01:51:10.107768	2020-09-25 01:51:10.107768
568	Magdalena	14	2020-09-25 01:51:10.110451	2020-09-25 01:51:10.110451
569	Etzatlán	14	2020-09-25 01:51:10.114548	2020-09-25 01:51:10.114548
570	San Marcos	14	2020-09-25 01:51:10.117527	2020-09-25 01:51:10.117527
571	San Juanito de Escobedo	14	2020-09-25 01:51:10.120865	2020-09-25 01:51:10.120865
572	Ameca	14	2020-09-25 01:51:10.123799	2020-09-25 01:51:10.123799
573	Ahualulco de Mercado	14	2020-09-25 01:51:10.12655	2020-09-25 01:51:10.12655
574	Teuchitlán	14	2020-09-25 01:51:10.129342	2020-09-25 01:51:10.129342
575	San Martín Hidalgo	14	2020-09-25 01:51:10.13192	2020-09-25 01:51:10.13192
576	Guachinango	14	2020-09-25 01:51:10.135352	2020-09-25 01:51:10.135352
577	Mixtlán	14	2020-09-25 01:51:10.139259	2020-09-25 01:51:10.139259
578	Mascota	14	2020-09-25 01:51:10.142948	2020-09-25 01:51:10.142948
579	San Sebastián del Oeste	14	2020-09-25 01:51:10.145812	2020-09-25 01:51:10.145812
580	San Juan de los Lagos	14	2020-09-25 01:51:10.148479	2020-09-25 01:51:10.148479
581	Jalostotitlán	14	2020-09-25 01:51:10.151287	2020-09-25 01:51:10.151287
582	San Miguel el Alto	14	2020-09-25 01:51:10.154735	2020-09-25 01:51:10.154735
583	San Julián	14	2020-09-25 01:51:10.157814	2020-09-25 01:51:10.157814
584	Arandas	14	2020-09-25 01:51:10.160645	2020-09-25 01:51:10.160645
585	San Ignacio Cerro Gordo	14	2020-09-25 01:51:10.163384	2020-09-25 01:51:10.163384
586	Teocaltiche	14	2020-09-25 01:51:10.165991	2020-09-25 01:51:10.165991
587	Villa Hidalgo	14	2020-09-25 01:51:10.169654	2020-09-25 01:51:10.169654
588	Encarnación de Díaz	14	2020-09-25 01:51:10.173302	2020-09-25 01:51:10.173302
589	Yahualica de González Gallo	14	2020-09-25 01:51:10.177101	2020-09-25 01:51:10.177101
590	Mexticacán	14	2020-09-25 01:51:10.180265	2020-09-25 01:51:10.180265
591	Cañadas de Obregón	14	2020-09-25 01:51:10.183132	2020-09-25 01:51:10.183132
592	Valle de Guadalupe	14	2020-09-25 01:51:10.185973	2020-09-25 01:51:10.185973
593	Lagos de Moreno	14	2020-09-25 01:51:10.188662	2020-09-25 01:51:10.188662
594	Ojuelos de Jalisco	14	2020-09-25 01:51:10.191305	2020-09-25 01:51:10.191305
595	Unión de San Antonio	14	2020-09-25 01:51:10.193983	2020-09-25 01:51:10.193983
596	San Diego de Alejandría	14	2020-09-25 01:51:10.196598	2020-09-25 01:51:10.196598
597	Tepatitlán de Morelos	14	2020-09-25 01:51:10.199234	2020-09-25 01:51:10.199234
598	Tototlán	14	2020-09-25 01:51:10.202454	2020-09-25 01:51:10.202454
599	Atotonilco el Alto	14	2020-09-25 01:51:10.205751	2020-09-25 01:51:10.205751
600	Ocotlán	14	2020-09-25 01:51:10.208505	2020-09-25 01:51:10.208505
601	Jamay	14	2020-09-25 01:51:10.211063	2020-09-25 01:51:10.211063
602	La Barca	14	2020-09-25 01:51:10.213571	2020-09-25 01:51:10.213571
603	Ayotlán	14	2020-09-25 01:51:10.216155	2020-09-25 01:51:10.216155
604	Jesús María	14	2020-09-25 01:51:10.219316	2020-09-25 01:51:10.219316
605	Degollado	14	2020-09-25 01:51:10.223235	2020-09-25 01:51:10.223235
606	Unión de Tula	14	2020-09-25 01:51:10.226712	2020-09-25 01:51:10.226712
607	Ayutla	14	2020-09-25 01:51:10.229785	2020-09-25 01:51:10.229785
608	Atenguillo	14	2020-09-25 01:51:10.232655	2020-09-25 01:51:10.232655
609	Cuautla	14	2020-09-25 01:51:10.23543	2020-09-25 01:51:10.23543
610	Atengo	14	2020-09-25 01:51:10.238935	2020-09-25 01:51:10.238935
611	Talpa de Allende	14	2020-09-25 01:51:10.241859	2020-09-25 01:51:10.241859
612	Puerto Vallarta	14	2020-09-25 01:51:10.2447	2020-09-25 01:51:10.2447
613	Cabo Corrientes	14	2020-09-25 01:51:10.247398	2020-09-25 01:51:10.247398
614	Tomatlán	14	2020-09-25 01:51:10.250162	2020-09-25 01:51:10.250162
615	Cocula	14	2020-09-25 01:51:10.25448	2020-09-25 01:51:10.25448
616	Tecolotlán	14	2020-09-25 01:51:10.258391	2020-09-25 01:51:10.258391
617	Tenamaxtlán	14	2020-09-25 01:51:10.261364	2020-09-25 01:51:10.261364
618	Juchitlán	14	2020-09-25 01:51:10.264604	2020-09-25 01:51:10.264604
619	Chiquilistlán	14	2020-09-25 01:51:10.267537	2020-09-25 01:51:10.267537
620	Ejutla	14	2020-09-25 01:51:10.270519	2020-09-25 01:51:10.270519
621	El Limón	14	2020-09-25 01:51:10.273424	2020-09-25 01:51:10.273424
622	El Grullo	14	2020-09-25 01:51:10.276217	2020-09-25 01:51:10.276217
623	Tonaya	14	2020-09-25 01:51:10.278753	2020-09-25 01:51:10.278753
624	Tuxcacuesco	14	2020-09-25 01:51:10.281558	2020-09-25 01:51:10.281558
625	Villa Purificación	14	2020-09-25 01:51:10.284325	2020-09-25 01:51:10.284325
626	La Huerta	14	2020-09-25 01:51:10.287541	2020-09-25 01:51:10.287541
627	Autlán de Navarro	14	2020-09-25 01:51:10.290296	2020-09-25 01:51:10.290296
628	Casimiro Castillo	14	2020-09-25 01:51:10.293514	2020-09-25 01:51:10.293514
629	Cuautitlán de García Barragán	14	2020-09-25 01:51:10.296369	2020-09-25 01:51:10.296369
630	Cihuatlán	14	2020-09-25 01:51:10.298982	2020-09-25 01:51:10.298982
631	Zapotlán el Grande	14	2020-09-25 01:51:10.302027	2020-09-25 01:51:10.302027
632	Gómez Farías	14	2020-09-25 01:51:10.30718	2020-09-25 01:51:10.30718
633	Concepción de Buenos Aires	14	2020-09-25 01:51:10.310863	2020-09-25 01:51:10.310863
634	Atoyac	14	2020-09-25 01:51:10.31365	2020-09-25 01:51:10.31365
635	Techaluta de Montenegro	14	2020-09-25 01:51:10.316475	2020-09-25 01:51:10.316475
636	Teocuitatlán de Corona	14	2020-09-25 01:51:10.319723	2020-09-25 01:51:10.319723
637	Sayula	14	2020-09-25 01:51:10.322609	2020-09-25 01:51:10.322609
638	Tapalpa	14	2020-09-25 01:51:10.325778	2020-09-25 01:51:10.325778
639	Amacueca	14	2020-09-25 01:51:10.328883	2020-09-25 01:51:10.328883
640	Tizapán el Alto	14	2020-09-25 01:51:10.331672	2020-09-25 01:51:10.331672
641	Tuxcueca	14	2020-09-25 01:51:10.334346	2020-09-25 01:51:10.334346
642	La Manzanilla de la Paz	14	2020-09-25 01:51:10.338306	2020-09-25 01:51:10.338306
643	Mazamitla	14	2020-09-25 01:51:10.342323	2020-09-25 01:51:10.342323
644	Valle de Juárez	14	2020-09-25 01:51:10.345071	2020-09-25 01:51:10.345071
645	Quitupan	14	2020-09-25 01:51:10.347843	2020-09-25 01:51:10.347843
646	Zapotiltic	14	2020-09-25 01:51:10.351264	2020-09-25 01:51:10.351264
647	Tamazula de Gordiano	14	2020-09-25 01:51:10.35456	2020-09-25 01:51:10.35456
648	San Gabriel	14	2020-09-25 01:51:10.357729	2020-09-25 01:51:10.357729
649	Tolimán	14	2020-09-25 01:51:10.360775	2020-09-25 01:51:10.360775
650	Zapotitlán de Vadillo	14	2020-09-25 01:51:10.363564	2020-09-25 01:51:10.363564
651	Tuxpan	14	2020-09-25 01:51:10.366242	2020-09-25 01:51:10.366242
652	Tonila	14	2020-09-25 01:51:10.36902	2020-09-25 01:51:10.36902
653	Pihuamo	14	2020-09-25 01:51:10.372424	2020-09-25 01:51:10.372424
654	Tecalitlán	14	2020-09-25 01:51:10.375365	2020-09-25 01:51:10.375365
655	Jilotlán de los Dolores	14	2020-09-25 01:51:10.382347	2020-09-25 01:51:10.382347
656	Santa María del Oro	14	2020-09-25 01:51:10.385979	2020-09-25 01:51:10.385979
657	CDMX	15	2020-09-25 01:51:10.389109	2020-09-25 01:51:10.389109
658	Toluca	15	2020-09-25 01:51:10.392479	2020-09-25 01:51:10.392479
659	Acambay de Ruíz Castañeda	15	2020-09-25 01:51:10.395191	2020-09-25 01:51:10.395191
660	Aculco	15	2020-09-25 01:51:10.39796	2020-09-25 01:51:10.39796
661	Temascalcingo	15	2020-09-25 01:51:10.400848	2020-09-25 01:51:10.400848
662	Atlacomulco	15	2020-09-25 01:51:10.403662	2020-09-25 01:51:10.403662
663	Timilpan	15	2020-09-25 01:51:10.406359	2020-09-25 01:51:10.406359
664	Morelos	15	2020-09-25 01:51:10.40901	2020-09-25 01:51:10.40901
665	El Oro	15	2020-09-25 01:51:10.411757	2020-09-25 01:51:10.411757
666	San Felipe del Progreso	15	2020-09-25 01:51:10.414694	2020-09-25 01:51:10.414694
667	San José del Rincón	15	2020-09-25 01:51:10.417609	2020-09-25 01:51:10.417609
668	Jocotitlán	15	2020-09-25 01:51:10.422699	2020-09-25 01:51:10.422699
669	Ixtlahuaca	15	2020-09-25 01:51:10.426382	2020-09-25 01:51:10.426382
670	Jiquipilco	15	2020-09-25 01:51:10.429296	2020-09-25 01:51:10.429296
671	Temoaya	15	2020-09-25 01:51:10.432208	2020-09-25 01:51:10.432208
672	Almoloya de Juárez	15	2020-09-25 01:51:10.435102	2020-09-25 01:51:10.435102
673	Villa Victoria	15	2020-09-25 01:51:10.438237	2020-09-25 01:51:10.438237
674	Villa de Allende	15	2020-09-25 01:51:10.441053	2020-09-25 01:51:10.441053
675	Donato Guerra	15	2020-09-25 01:51:10.443958	2020-09-25 01:51:10.443958
676	Ixtapan del Oro	15	2020-09-25 01:51:10.446578	2020-09-25 01:51:10.446578
677	Santo Tomás	15	2020-09-25 01:51:10.44914	2020-09-25 01:51:10.44914
678	Otzoloapan	15	2020-09-25 01:51:10.451951	2020-09-25 01:51:10.451951
679	Zacazonapan	15	2020-09-25 01:51:10.45539	2020-09-25 01:51:10.45539
680	Valle de Bravo	15	2020-09-25 01:51:10.458242	2020-09-25 01:51:10.458242
681	Amanalco	15	2020-09-25 01:51:10.460894	2020-09-25 01:51:10.460894
682	Temascaltepec	15	2020-09-25 01:51:10.463509	2020-09-25 01:51:10.463509
683	Zinacantepec	15	2020-09-25 01:51:10.466054	2020-09-25 01:51:10.466054
684	Tejupilco	15	2020-09-25 01:51:10.469535	2020-09-25 01:51:10.469535
685	Luvianos	15	2020-09-25 01:51:10.47268	2020-09-25 01:51:10.47268
686	San Simón de Guerrero	15	2020-09-25 01:51:10.47654	2020-09-25 01:51:10.47654
687	Amatepec	15	2020-09-25 01:51:10.479339	2020-09-25 01:51:10.479339
688	Tlatlaya	15	2020-09-25 01:51:10.482084	2020-09-25 01:51:10.482084
689	Sultepec	15	2020-09-25 01:51:10.485084	2020-09-25 01:51:10.485084
690	Texcaltitlán	15	2020-09-25 01:51:10.490652	2020-09-25 01:51:10.490652
691	Coatepec Harinas	15	2020-09-25 01:51:10.49352	2020-09-25 01:51:10.49352
692	Villa Guerrero	15	2020-09-25 01:51:10.496355	2020-09-25 01:51:10.496355
693	Zacualpan	15	2020-09-25 01:51:10.499126	2020-09-25 01:51:10.499126
694	Almoloya de Alquisiras	15	2020-09-25 01:51:10.503926	2020-09-25 01:51:10.503926
695	Ixtapan de la Sal	15	2020-09-25 01:51:10.508059	2020-09-25 01:51:10.508059
696	Tonatico	15	2020-09-25 01:51:10.511734	2020-09-25 01:51:10.511734
697	Zumpahuacán	15	2020-09-25 01:51:10.514586	2020-09-25 01:51:10.514586
698	Lerma	15	2020-09-25 01:51:10.517433	2020-09-25 01:51:10.517433
699	Xonacatlán	15	2020-09-25 01:51:10.52039	2020-09-25 01:51:10.52039
700	Otzolotepec	15	2020-09-25 01:51:10.523402	2020-09-25 01:51:10.523402
701	San Mateo Atenco	15	2020-09-25 01:51:10.526099	2020-09-25 01:51:10.526099
702	Metepec	15	2020-09-25 01:51:10.528839	2020-09-25 01:51:10.528839
703	Mexicaltzingo	15	2020-09-25 01:51:10.531598	2020-09-25 01:51:10.531598
704	Calimaya	15	2020-09-25 01:51:10.534429	2020-09-25 01:51:10.534429
705	Chapultepec	15	2020-09-25 01:51:10.537516	2020-09-25 01:51:10.537516
706	San Antonio la Isla	15	2020-09-25 01:51:10.540445	2020-09-25 01:51:10.540445
707	Tenango del Valle	15	2020-09-25 01:51:10.543205	2020-09-25 01:51:10.543205
708	Rayón	15	2020-09-25 01:51:10.546044	2020-09-25 01:51:10.546044
709	Joquicingo	15	2020-09-25 01:51:10.548652	2020-09-25 01:51:10.548652
710	Tenancingo	15	2020-09-25 01:51:10.551978	2020-09-25 01:51:10.551978
711	Malinalco	15	2020-09-25 01:51:10.555038	2020-09-25 01:51:10.555038
712	Ocuilan	15	2020-09-25 01:51:10.559135	2020-09-25 01:51:10.559135
713	Atizapán	15	2020-09-25 01:51:10.562528	2020-09-25 01:51:10.562528
714	Almoloya del Río	15	2020-09-25 01:51:10.565465	2020-09-25 01:51:10.565465
715	Texcalyacac	15	2020-09-25 01:51:10.568382	2020-09-25 01:51:10.568382
716	Tianguistenco	15	2020-09-25 01:51:10.571887	2020-09-25 01:51:10.571887
717	Xalatlaco	15	2020-09-25 01:51:10.574816	2020-09-25 01:51:10.574816
718	Capulhuac	15	2020-09-25 01:51:10.577464	2020-09-25 01:51:10.577464
719	Ocoyoacac	15	2020-09-25 01:51:10.580098	2020-09-25 01:51:10.580098
720	Huixquilucan	15	2020-09-25 01:51:10.582802	2020-09-25 01:51:10.582802
721	Atizapán de Zaragoza	15	2020-09-25 01:51:10.587101	2020-09-25 01:51:10.587101
722	Naucalpan de Juárez	15	2020-09-25 01:51:10.590692	2020-09-25 01:51:10.590692
723	Tlalnepantla de Baz	15	2020-09-25 01:51:10.593967	2020-09-25 01:51:10.593967
724	Polotitlán	15	2020-09-25 01:51:10.596702	2020-09-25 01:51:10.596702
725	Jilotepec	15	2020-09-25 01:51:10.599326	2020-09-25 01:51:10.599326
726	Soyaniquilpan de Juárez	15	2020-09-25 01:51:10.602156	2020-09-25 01:51:10.602156
727	Villa del Carbón	15	2020-09-25 01:51:10.60516	2020-09-25 01:51:10.60516
728	Chapa de Mota	15	2020-09-25 01:51:10.607923	2020-09-25 01:51:10.607923
729	Nicolás Romero	15	2020-09-25 01:51:10.610506	2020-09-25 01:51:10.610506
730	Isidro Fabela	15	2020-09-25 01:51:10.612957	2020-09-25 01:51:10.612957
731	Jilotzingo	15	2020-09-25 01:51:10.615538	2020-09-25 01:51:10.615538
732	Tepotzotlán	15	2020-09-25 01:51:10.618266	2020-09-25 01:51:10.618266
733	Coyotepec	15	2020-09-25 01:51:10.621661	2020-09-25 01:51:10.621661
734	Huehuetoca	15	2020-09-25 01:51:10.625176	2020-09-25 01:51:10.625176
735	Cuautitlán Izcalli	15	2020-09-25 01:51:10.628569	2020-09-25 01:51:10.628569
736	Teoloyucan	15	2020-09-25 01:51:10.631471	2020-09-25 01:51:10.631471
737	Cuautitlán	15	2020-09-25 01:51:10.634733	2020-09-25 01:51:10.634733
738	Melchor Ocampo	15	2020-09-25 01:51:10.637853	2020-09-25 01:51:10.637853
739	Tultitlán	15	2020-09-25 01:51:10.640853	2020-09-25 01:51:10.640853
740	Tultepec	15	2020-09-25 01:51:10.644121	2020-09-25 01:51:10.644121
741	Ecatepec de Morelos	15	2020-09-25 01:51:10.646995	2020-09-25 01:51:10.646995
742	Zumpango	15	2020-09-25 01:51:10.649868	2020-09-25 01:51:10.649868
743	Tequixquiac	15	2020-09-25 01:51:10.653154	2020-09-25 01:51:10.653154
744	Apaxco	15	2020-09-25 01:51:10.656034	2020-09-25 01:51:10.656034
745	Hueypoxtla	15	2020-09-25 01:51:10.659311	2020-09-25 01:51:10.659311
746	Coacalco de Berriozábal	15	2020-09-25 01:51:10.66215	2020-09-25 01:51:10.66215
747	Tecámac	15	2020-09-25 01:51:10.664766	2020-09-25 01:51:10.664766
748	Jaltenco	15	2020-09-25 01:51:10.668412	2020-09-25 01:51:10.668412
749	Tonanitla	15	2020-09-25 01:51:10.671968	2020-09-25 01:51:10.671968
750	Nextlalpan	15	2020-09-25 01:51:10.675426	2020-09-25 01:51:10.675426
751	Teotihuacán	15	2020-09-25 01:51:10.678389	2020-09-25 01:51:10.678389
752	San Martín de las Pirámides	15	2020-09-25 01:51:10.681171	2020-09-25 01:51:10.681171
753	Acolman	15	2020-09-25 01:51:10.68409	2020-09-25 01:51:10.68409
754	Otumba	15	2020-09-25 01:51:10.686939	2020-09-25 01:51:10.686939
755	Axapusco	15	2020-09-25 01:51:10.689701	2020-09-25 01:51:10.689701
756	Nopaltepec	15	2020-09-25 01:51:10.692327	2020-09-25 01:51:10.692327
757	Temascalapa	15	2020-09-25 01:51:10.695013	2020-09-25 01:51:10.695013
758	Tezoyuca	15	2020-09-25 01:51:10.697624	2020-09-25 01:51:10.697624
759	Chiautla	15	2020-09-25 01:51:10.700168	2020-09-25 01:51:10.700168
760	Papalotla	15	2020-09-25 01:51:10.703047	2020-09-25 01:51:10.703047
761	Tepetlaoxtoc	15	2020-09-25 01:51:10.705702	2020-09-25 01:51:10.705702
762	Texcoco	15	2020-09-25 01:51:10.708343	2020-09-25 01:51:10.708343
763	Chiconcuac	15	2020-09-25 01:51:10.711234	2020-09-25 01:51:10.711234
764	Atenco	15	2020-09-25 01:51:10.71434	2020-09-25 01:51:10.71434
765	Chimalhuacán	15	2020-09-25 01:51:10.71758	2020-09-25 01:51:10.71758
766	Chicoloapan	15	2020-09-25 01:51:10.721389	2020-09-25 01:51:10.721389
767	La Paz	15	2020-09-25 01:51:10.724842	2020-09-25 01:51:10.724842
768	Ixtapaluca	15	2020-09-25 01:51:10.72779	2020-09-25 01:51:10.72779
769	Chalco	15	2020-09-25 01:51:10.730793	2020-09-25 01:51:10.730793
770	Valle de Chalco Solidaridad	15	2020-09-25 01:51:10.733712	2020-09-25 01:51:10.733712
771	Temamatla	15	2020-09-25 01:51:10.736648	2020-09-25 01:51:10.736648
772	Cocotitlán	15	2020-09-25 01:51:10.739218	2020-09-25 01:51:10.739218
773	Tlalmanalco	15	2020-09-25 01:51:10.742086	2020-09-25 01:51:10.742086
774	Ayapango	15	2020-09-25 01:51:10.744766	2020-09-25 01:51:10.744766
775	Tenango del Aire	15	2020-09-25 01:51:10.74763	2020-09-25 01:51:10.74763
776	Ozumba	15	2020-09-25 01:51:10.751115	2020-09-25 01:51:10.751115
777	Juchitepec	15	2020-09-25 01:51:10.75611	2020-09-25 01:51:10.75611
778	Tepetlixpa	15	2020-09-25 01:51:10.759033	2020-09-25 01:51:10.759033
779	Amecameca	15	2020-09-25 01:51:10.76158	2020-09-25 01:51:10.76158
780	Atlautla	15	2020-09-25 01:51:10.764139	2020-09-25 01:51:10.764139
781	Ecatzingo	15	2020-09-25 01:51:10.766908	2020-09-25 01:51:10.766908
782	Nezahualcóyotl	15	2020-09-25 01:51:10.769916	2020-09-25 01:51:10.769916
783	Morelia	16	2020-09-25 01:51:10.772732	2020-09-25 01:51:10.772732
784	Huaniqueo	16	2020-09-25 01:51:10.77608	2020-09-25 01:51:10.77608
785	Coeneo	16	2020-09-25 01:51:10.77888	2020-09-25 01:51:10.77888
786	Quiroga	16	2020-09-25 01:51:10.781541	2020-09-25 01:51:10.781541
787	Tzintzuntzan	16	2020-09-25 01:51:10.784229	2020-09-25 01:51:10.784229
788	Lagunillas	16	2020-09-25 01:51:10.786995	2020-09-25 01:51:10.786995
789	Acuitzio	16	2020-09-25 01:51:10.789706	2020-09-25 01:51:10.789706
790	Madero	16	2020-09-25 01:51:10.792394	2020-09-25 01:51:10.792394
791	Puruándiro	16	2020-09-25 01:51:10.795092	2020-09-25 01:51:10.795092
792	José Sixto Verduzco	16	2020-09-25 01:51:10.79769	2020-09-25 01:51:10.79769
793	Angamacutiro	16	2020-09-25 01:51:10.801154	2020-09-25 01:51:10.801154
794	Panindícuaro	16	2020-09-25 01:51:10.804354	2020-09-25 01:51:10.804354
795	Zacapu	16	2020-09-25 01:51:10.80798	2020-09-25 01:51:10.80798
796	Tlazazalca	16	2020-09-25 01:51:10.811203	2020-09-25 01:51:10.811203
797	Purépero	16	2020-09-25 01:51:10.814191	2020-09-25 01:51:10.814191
798	Jiménez	16	2020-09-25 01:51:10.817555	2020-09-25 01:51:10.817555
799	Morelos	16	2020-09-25 01:51:10.820844	2020-09-25 01:51:10.820844
800	Huandacareo	16	2020-09-25 01:51:10.823671	2020-09-25 01:51:10.823671
801	Cuitzeo	16	2020-09-25 01:51:10.826445	2020-09-25 01:51:10.826445
802	Chucándiro	16	2020-09-25 01:51:10.829032	2020-09-25 01:51:10.829032
803	Copándaro	16	2020-09-25 01:51:10.832081	2020-09-25 01:51:10.832081
804	Tarímbaro	16	2020-09-25 01:51:10.837083	2020-09-25 01:51:10.837083
805	Santa Ana Maya	16	2020-09-25 01:51:10.841079	2020-09-25 01:51:10.841079
806	Álvaro Obregón	16	2020-09-25 01:51:10.844226	2020-09-25 01:51:10.844226
807	Zinapécuaro	16	2020-09-25 01:51:10.847082	2020-09-25 01:51:10.847082
808	Indaparapeo	16	2020-09-25 01:51:10.850067	2020-09-25 01:51:10.850067
809	Queréndaro	16	2020-09-25 01:51:10.852961	2020-09-25 01:51:10.852961
810	Sahuayo	16	2020-09-25 01:51:10.855822	2020-09-25 01:51:10.855822
811	Briseñas	16	2020-09-25 01:51:10.858525	2020-09-25 01:51:10.858525
812	Cojumatlán de Régules	16	2020-09-25 01:51:10.861563	2020-09-25 01:51:10.861563
813	Venustiano Carranza	16	2020-09-25 01:51:10.869873	2020-09-25 01:51:10.869873
814	Pajacuarán	16	2020-09-25 01:51:10.873023	2020-09-25 01:51:10.873023
815	Vista Hermosa	16	2020-09-25 01:51:10.875889	2020-09-25 01:51:10.875889
816	Tanhuato	16	2020-09-25 01:51:10.878524	2020-09-25 01:51:10.878524
817	Yurécuaro	16	2020-09-25 01:51:10.881243	2020-09-25 01:51:10.881243
818	Ixtlán	16	2020-09-25 01:51:10.885025	2020-09-25 01:51:10.885025
819	La Piedad	16	2020-09-25 01:51:10.888146	2020-09-25 01:51:10.888146
820	Numarán	16	2020-09-25 01:51:10.891554	2020-09-25 01:51:10.891554
821	Churintzio	16	2020-09-25 01:51:10.894919	2020-09-25 01:51:10.894919
822	Zináparo	16	2020-09-25 01:51:10.897793	2020-09-25 01:51:10.897793
823	Penjamillo	16	2020-09-25 01:51:10.900586	2020-09-25 01:51:10.900586
824	Marcos Castellanos	16	2020-09-25 01:51:10.904246	2020-09-25 01:51:10.904246
825	Jiquilpan	16	2020-09-25 01:51:10.907392	2020-09-25 01:51:10.907392
826	Villamar	16	2020-09-25 01:51:10.910177	2020-09-25 01:51:10.910177
827	Chavinda	16	2020-09-25 01:51:10.912904	2020-09-25 01:51:10.912904
828	Zamora	16	2020-09-25 01:51:10.91546	2020-09-25 01:51:10.91546
829	Ecuandureo	16	2020-09-25 01:51:10.919446	2020-09-25 01:51:10.919446
830	Tangancícuaro	16	2020-09-25 01:51:10.922732	2020-09-25 01:51:10.922732
831	Chilchota	16	2020-09-25 01:51:10.92618	2020-09-25 01:51:10.92618
832	Jacona	16	2020-09-25 01:51:10.929177	2020-09-25 01:51:10.929177
833	Tangamandapio	16	2020-09-25 01:51:10.931873	2020-09-25 01:51:10.931873
834	Cotija	16	2020-09-25 01:51:10.934857	2020-09-25 01:51:10.934857
835	Tocumbo	16	2020-09-25 01:51:10.937595	2020-09-25 01:51:10.937595
836	Tingüindín	16	2020-09-25 01:51:10.940263	2020-09-25 01:51:10.940263
837	Uruapan	16	2020-09-25 01:51:10.942992	2020-09-25 01:51:10.942992
838	Charapan	16	2020-09-25 01:51:10.945878	2020-09-25 01:51:10.945878
839	Paracho	16	2020-09-25 01:51:10.948753	2020-09-25 01:51:10.948753
840	Cherán	16	2020-09-25 01:51:10.951733	2020-09-25 01:51:10.951733
841	Nahuatzen	16	2020-09-25 01:51:10.954428	2020-09-25 01:51:10.954428
842	Tingambato	16	2020-09-25 01:51:10.957555	2020-09-25 01:51:10.957555
843	Los Reyes	16	2020-09-25 01:51:10.960489	2020-09-25 01:51:10.960489
844	Peribán	16	2020-09-25 01:51:10.963195	2020-09-25 01:51:10.963195
845	Tancítaro	16	2020-09-25 01:51:10.965876	2020-09-25 01:51:10.965876
846	Nuevo Parangaricutiro	16	2020-09-25 01:51:10.969421	2020-09-25 01:51:10.969421
847	Buenavista	16	2020-09-25 01:51:10.972616	2020-09-25 01:51:10.972616
848	Tepalcatepec	16	2020-09-25 01:51:10.97646	2020-09-25 01:51:10.97646
849	Aguililla	16	2020-09-25 01:51:10.979179	2020-09-25 01:51:10.979179
850	Apatzingán	16	2020-09-25 01:51:10.982206	2020-09-25 01:51:10.982206
851	Parácuaro	16	2020-09-25 01:51:10.987582	2020-09-25 01:51:10.987582
852	Coahuayana	16	2020-09-25 01:51:10.990957	2020-09-25 01:51:10.990957
853	Chinicuila	16	2020-09-25 01:51:10.993733	2020-09-25 01:51:10.993733
854	Coalcomán de Vázquez Pallares	16	2020-09-25 01:51:10.996494	2020-09-25 01:51:10.996494
855	Aquila	16	2020-09-25 01:51:10.999096	2020-09-25 01:51:10.999096
856	Tumbiscatío	16	2020-09-25 01:51:11.003374	2020-09-25 01:51:11.003374
857	Arteaga	16	2020-09-25 01:51:11.006901	2020-09-25 01:51:11.006901
858	Lázaro Cárdenas	16	2020-09-25 01:51:11.010273	2020-09-25 01:51:11.010273
859	Epitacio Huerta	16	2020-09-25 01:51:11.013023	2020-09-25 01:51:11.013023
860	Contepec	16	2020-09-25 01:51:11.015859	2020-09-25 01:51:11.015859
861	Tlalpujahua	16	2020-09-25 01:51:11.018557	2020-09-25 01:51:11.018557
862	Hidalgo	16	2020-09-25 01:51:11.02143	2020-09-25 01:51:11.02143
863	Maravatío	16	2020-09-25 01:51:11.024191	2020-09-25 01:51:11.024191
864	Irimbo	16	2020-09-25 01:51:11.026819	2020-09-25 01:51:11.026819
865	Senguio	16	2020-09-25 01:51:11.029433	2020-09-25 01:51:11.029433
866	Charo	16	2020-09-25 01:51:11.032126	2020-09-25 01:51:11.032126
867	Tzitzio	16	2020-09-25 01:51:11.034878	2020-09-25 01:51:11.034878
868	Tiquicheo de Nicolás Romero	16	2020-09-25 01:51:11.037578	2020-09-25 01:51:11.037578
869	Aporo	16	2020-09-25 01:51:11.040178	2020-09-25 01:51:11.040178
870	Angangueo	16	2020-09-25 01:51:11.043162	2020-09-25 01:51:11.043162
871	Tuxpan	16	2020-09-25 01:51:11.045696	2020-09-25 01:51:11.045696
872	Ocampo	16	2020-09-25 01:51:11.048252	2020-09-25 01:51:11.048252
873	Jungapeo	16	2020-09-25 01:51:11.052557	2020-09-25 01:51:11.052557
874	Zitácuaro	16	2020-09-25 01:51:11.055852	2020-09-25 01:51:11.055852
875	Tuzantla	16	2020-09-25 01:51:11.060114	2020-09-25 01:51:11.060114
876	Juárez	16	2020-09-25 01:51:11.062992	2020-09-25 01:51:11.062992
877	Susupuato	16	2020-09-25 01:51:11.065793	2020-09-25 01:51:11.065793
878	Pátzcuaro	16	2020-09-25 01:51:11.068564	2020-09-25 01:51:11.068564
879	Erongarícuaro	16	2020-09-25 01:51:11.071587	2020-09-25 01:51:11.071587
880	Huiramba	16	2020-09-25 01:51:11.075182	2020-09-25 01:51:11.075182
881	Tacámbaro	16	2020-09-25 01:51:11.078286	2020-09-25 01:51:11.078286
882	Turicato	16	2020-09-25 01:51:11.081021	2020-09-25 01:51:11.081021
883	Ziracuaretiro	16	2020-09-25 01:51:11.084885	2020-09-25 01:51:11.084885
884	Taretan	16	2020-09-25 01:51:11.088141	2020-09-25 01:51:11.088141
885	Gabriel Zamora	16	2020-09-25 01:51:11.091686	2020-09-25 01:51:11.091686
886	Nuevo Urecho	16	2020-09-25 01:51:11.094786	2020-09-25 01:51:11.094786
887	Múgica	16	2020-09-25 01:51:11.097779	2020-09-25 01:51:11.097779
888	Salvador Escalante	16	2020-09-25 01:51:11.100733	2020-09-25 01:51:11.100733
889	Ario	16	2020-09-25 01:51:11.104043	2020-09-25 01:51:11.104043
890	La Huacana	16	2020-09-25 01:51:11.106898	2020-09-25 01:51:11.106898
891	Churumuco	16	2020-09-25 01:51:11.110299	2020-09-25 01:51:11.110299
892	Nocupétaro	16	2020-09-25 01:51:11.113071	2020-09-25 01:51:11.113071
893	Carácuaro	16	2020-09-25 01:51:11.11578	2020-09-25 01:51:11.11578
894	Huetamo	16	2020-09-25 01:51:11.118548	2020-09-25 01:51:11.118548
895	San Lucas	16	2020-09-25 01:51:11.121193	2020-09-25 01:51:11.121193
896	Cuernavaca	17	2020-09-25 01:51:11.123901	2020-09-25 01:51:11.123901
897	Huitzilac	17	2020-09-25 01:51:11.126468	2020-09-25 01:51:11.126468
898	Tepoztlán	17	2020-09-25 01:51:11.129076	2020-09-25 01:51:11.129076
899	Tlalnepantla	17	2020-09-25 01:51:11.131715	2020-09-25 01:51:11.131715
900	Tlayacapan	17	2020-09-25 01:51:11.135177	2020-09-25 01:51:11.135177
901	Jiutepec	17	2020-09-25 01:51:11.139064	2020-09-25 01:51:11.139064
902	Temixco	17	2020-09-25 01:51:11.142784	2020-09-25 01:51:11.142784
903	Miacatlán	17	2020-09-25 01:51:11.145939	2020-09-25 01:51:11.145939
904	Coatlán del Río	17	2020-09-25 01:51:11.14877	2020-09-25 01:51:11.14877
905	Tetecala	17	2020-09-25 01:51:11.151696	2020-09-25 01:51:11.151696
906	Mazatepec	17	2020-09-25 01:51:11.154372	2020-09-25 01:51:11.154372
907	Amacuzac	17	2020-09-25 01:51:11.157018	2020-09-25 01:51:11.157018
908	Puente de Ixtla	17	2020-09-25 01:51:11.15974	2020-09-25 01:51:11.15974
909	Ayala	17	2020-09-25 01:51:11.16263	2020-09-25 01:51:11.16263
910	Yautepec	17	2020-09-25 01:51:11.165608	2020-09-25 01:51:11.165608
911	Cuautla	17	2020-09-25 01:51:11.170584	2020-09-25 01:51:11.170584
912	Emiliano Zapata	17	2020-09-25 01:51:11.173982	2020-09-25 01:51:11.173982
913	Tlaltizapán de Zapata	17	2020-09-25 01:51:11.177121	2020-09-25 01:51:11.177121
914	Zacatepec	17	2020-09-25 01:51:11.179883	2020-09-25 01:51:11.179883
915	Xochitepec	17	2020-09-25 01:51:11.182912	2020-09-25 01:51:11.182912
916	Tetela del Volcán	17	2020-09-25 01:51:11.185629	2020-09-25 01:51:11.185629
917	Yecapixtla	17	2020-09-25 01:51:11.18812	2020-09-25 01:51:11.18812
918	Totolapan	17	2020-09-25 01:51:11.190676	2020-09-25 01:51:11.190676
919	Atlatlahucan	17	2020-09-25 01:51:11.193485	2020-09-25 01:51:11.193485
920	Ocuituco	17	2020-09-25 01:51:11.196151	2020-09-25 01:51:11.196151
921	Temoac	17	2020-09-25 01:51:11.198798	2020-09-25 01:51:11.198798
922	Zacualpan	17	2020-09-25 01:51:11.202648	2020-09-25 01:51:11.202648
923	Jojutla	17	2020-09-25 01:51:11.205633	2020-09-25 01:51:11.205633
924	Tepalcingo	17	2020-09-25 01:51:11.208532	2020-09-25 01:51:11.208532
925	Jonacatepec	17	2020-09-25 01:51:11.211286	2020-09-25 01:51:11.211286
926	Axochiapan	17	2020-09-25 01:51:11.213853	2020-09-25 01:51:11.213853
927	Jantetelco	17	2020-09-25 01:51:11.217471	2020-09-25 01:51:11.217471
928	Tlaquiltenango	17	2020-09-25 01:51:11.220432	2020-09-25 01:51:11.220432
929	Tepic	18	2020-09-25 01:51:11.223924	2020-09-25 01:51:11.223924
930	Tuxpan	18	2020-09-25 01:51:11.227361	2020-09-25 01:51:11.227361
931	Santiago Ixcuintla	18	2020-09-25 01:51:11.230291	2020-09-25 01:51:11.230291
932	Acaponeta	18	2020-09-25 01:51:11.233226	2020-09-25 01:51:11.233226
933	Tecuala	18	2020-09-25 01:51:11.235961	2020-09-25 01:51:11.235961
934	Huajicori	18	2020-09-25 01:51:11.238573	2020-09-25 01:51:11.238573
935	Del Nayar	18	2020-09-25 01:51:11.241205	2020-09-25 01:51:11.241205
936	La Yesca	18	2020-09-25 01:51:11.24387	2020-09-25 01:51:11.24387
937	Ruíz	18	2020-09-25 01:51:11.24679	2020-09-25 01:51:11.24679
938	Rosamorada	18	2020-09-25 01:51:11.249819	2020-09-25 01:51:11.249819
939	Compostela	18	2020-09-25 01:51:11.253638	2020-09-25 01:51:11.253638
940	Bahía de Banderas	18	2020-09-25 01:51:11.257349	2020-09-25 01:51:11.257349
941	San Blas	18	2020-09-25 01:51:11.260403	2020-09-25 01:51:11.260403
942	Xalisco	18	2020-09-25 01:51:11.263074	2020-09-25 01:51:11.263074
943	San Pedro Lagunillas	18	2020-09-25 01:51:11.266646	2020-09-25 01:51:11.266646
944	Santa María del Oro	18	2020-09-25 01:51:11.269918	2020-09-25 01:51:11.269918
945	Jala	18	2020-09-25 01:51:11.272917	2020-09-25 01:51:11.272917
946	Ahuacatlán	18	2020-09-25 01:51:11.276232	2020-09-25 01:51:11.276232
947	Ixtlán del Río	18	2020-09-25 01:51:11.279069	2020-09-25 01:51:11.279069
948	Amatlán de Cañas	18	2020-09-25 01:51:11.282123	2020-09-25 01:51:11.282123
949	Monterrey	19	2020-09-25 01:51:11.285568	2020-09-25 01:51:11.285568
950	Anáhuac	19	2020-09-25 01:51:11.288553	2020-09-25 01:51:11.288553
951	Lampazos de Naranjo	19	2020-09-25 01:51:11.291447	2020-09-25 01:51:11.291447
952	Mina	19	2020-09-25 01:51:11.294313	2020-09-25 01:51:11.294313
953	Bustamante	19	2020-09-25 01:51:11.29701	2020-09-25 01:51:11.29701
954	Sabinas Hidalgo	19	2020-09-25 01:51:11.300736	2020-09-25 01:51:11.300736
955	Villaldama	19	2020-09-25 01:51:11.303863	2020-09-25 01:51:11.303863
956	Vallecillo	19	2020-09-25 01:51:11.307315	2020-09-25 01:51:11.307315
957	Parás	19	2020-09-25 01:51:11.311138	2020-09-25 01:51:11.311138
958	Salinas Victoria	19	2020-09-25 01:51:11.314774	2020-09-25 01:51:11.314774
959	Ciénega de Flores	19	2020-09-25 01:51:11.322829	2020-09-25 01:51:11.322829
960	Hidalgo	19	2020-09-25 01:51:11.325993	2020-09-25 01:51:11.325993
961	Abasolo	19	2020-09-25 01:51:11.328775	2020-09-25 01:51:11.328775
962	Higueras	19	2020-09-25 01:51:11.331734	2020-09-25 01:51:11.331734
963	General Zuazua	19	2020-09-25 01:51:11.33498	2020-09-25 01:51:11.33498
964	Agualeguas	19	2020-09-25 01:51:11.338063	2020-09-25 01:51:11.338063
965	General Treviño	19	2020-09-25 01:51:11.340831	2020-09-25 01:51:11.340831
966	Cerralvo	19	2020-09-25 01:51:11.343571	2020-09-25 01:51:11.343571
967	Melchor Ocampo	19	2020-09-25 01:51:11.346331	2020-09-25 01:51:11.346331
968	García	19	2020-09-25 01:51:11.34961	2020-09-25 01:51:11.34961
969	General Escobedo	19	2020-09-25 01:51:11.352878	2020-09-25 01:51:11.352878
970	Santa Catarina	19	2020-09-25 01:51:11.355698	2020-09-25 01:51:11.355698
971	San Pedro Garza García	19	2020-09-25 01:51:11.359227	2020-09-25 01:51:11.359227
972	San Nicolás de los Garza	19	2020-09-25 01:51:11.362089	2020-09-25 01:51:11.362089
973	El Carmen	19	2020-09-25 01:51:11.364847	2020-09-25 01:51:11.364847
974	Apodaca	19	2020-09-25 01:51:11.367754	2020-09-25 01:51:11.367754
975	Pesquería	19	2020-09-25 01:51:11.370891	2020-09-25 01:51:11.370891
976	Marín	19	2020-09-25 01:51:11.375133	2020-09-25 01:51:11.375133
977	Doctor González	19	2020-09-25 01:51:11.378214	2020-09-25 01:51:11.378214
978	Los Ramones	19	2020-09-25 01:51:11.381004	2020-09-25 01:51:11.381004
979	Los Herreras	19	2020-09-25 01:51:11.384498	2020-09-25 01:51:11.384498
980	Los Aldamas	19	2020-09-25 01:51:11.387492	2020-09-25 01:51:11.387492
981	Doctor Coss	19	2020-09-25 01:51:11.390492	2020-09-25 01:51:11.390492
982	General Bravo	19	2020-09-25 01:51:11.394141	2020-09-25 01:51:11.394141
983	China	19	2020-09-25 01:51:11.396991	2020-09-25 01:51:11.396991
984	Guadalupe	19	2020-09-25 01:51:11.399733	2020-09-25 01:51:11.399733
985	Juárez	19	2020-09-25 01:51:11.402838	2020-09-25 01:51:11.402838
986	Santiago	19	2020-09-25 01:51:11.405687	2020-09-25 01:51:11.405687
987	Allende	19	2020-09-25 01:51:11.408789	2020-09-25 01:51:11.408789
988	General Terán	19	2020-09-25 01:51:11.411646	2020-09-25 01:51:11.411646
989	Cadereyta Jiménez	19	2020-09-25 01:51:11.414354	2020-09-25 01:51:11.414354
990	Montemorelos	19	2020-09-25 01:51:11.417762	2020-09-25 01:51:11.417762
991	Rayones	19	2020-09-25 01:51:11.421115	2020-09-25 01:51:11.421115
992	Linares	19	2020-09-25 01:51:11.424006	2020-09-25 01:51:11.424006
993	Iturbide	19	2020-09-25 01:51:11.42671	2020-09-25 01:51:11.42671
994	Galeana	19	2020-09-25 01:51:11.429306	2020-09-25 01:51:11.429306
995	Hualahuises	19	2020-09-25 01:51:11.432145	2020-09-25 01:51:11.432145
996	Doctor Arroyo	19	2020-09-25 01:51:11.435601	2020-09-25 01:51:11.435601
997	Aramberri	19	2020-09-25 01:51:11.438699	2020-09-25 01:51:11.438699
998	General Zaragoza	19	2020-09-25 01:51:11.441911	2020-09-25 01:51:11.441911
999	Mier y Noriega	19	2020-09-25 01:51:11.444761	2020-09-25 01:51:11.444761
1000	Oaxaca de Juárez	20	2020-09-25 01:51:11.447355	2020-09-25 01:51:11.447355
1001	Villa de Etla	20	2020-09-25 01:51:11.450362	2020-09-25 01:51:11.450362
1002	San Juan Bautista Atatlahuca	20	2020-09-25 01:51:11.453147	2020-09-25 01:51:11.453147
1003	San Jerónimo Sosola	20	2020-09-25 01:51:11.456024	2020-09-25 01:51:11.456024
1004	San Juan Bautista Jayacatlán	20	2020-09-25 01:51:11.458978	2020-09-25 01:51:11.458978
1005	San Francisco Telixtlahuaca	20	2020-09-25 01:51:11.461858	2020-09-25 01:51:11.461858
1006	Santiago Tenango	20	2020-09-25 01:51:11.464672	2020-09-25 01:51:11.464672
1007	San Pablo Huitzo	20	2020-09-25 01:51:11.46923	2020-09-25 01:51:11.46923
1008	San Juan del Estado	20	2020-09-25 01:51:11.472463	2020-09-25 01:51:11.472463
1009	Magdalena Apasco	20	2020-09-25 01:51:11.476374	2020-09-25 01:51:11.476374
1010	Santiago Suchilquitongo	20	2020-09-25 01:51:11.479478	2020-09-25 01:51:11.479478
1011	San Juan Bautista Guelache	20	2020-09-25 01:51:11.48326	2020-09-25 01:51:11.48326
1012	Reyes Etla	20	2020-09-25 01:51:11.487801	2020-09-25 01:51:11.487801
1013	Nazareno Etla	20	2020-09-25 01:51:11.490729	2020-09-25 01:51:11.490729
1014	San Andrés Zautla	20	2020-09-25 01:51:11.493666	2020-09-25 01:51:11.493666
1015	San Agustín Etla	20	2020-09-25 01:51:11.4965	2020-09-25 01:51:11.4965
1016	Soledad Etla	20	2020-09-25 01:51:11.499889	2020-09-25 01:51:11.499889
1017	Santo Tomás Mazaltepec	20	2020-09-25 01:51:11.503883	2020-09-25 01:51:11.503883
1018	Guadalupe Etla	20	2020-09-25 01:51:11.506974	2020-09-25 01:51:11.506974
1019	San Pablo Etla	20	2020-09-25 01:51:11.509728	2020-09-25 01:51:11.509728
1020	San Felipe Tejalápam	20	2020-09-25 01:51:11.512422	2020-09-25 01:51:11.512422
1021	San Lorenzo Cacaotepec	20	2020-09-25 01:51:11.516037	2020-09-25 01:51:11.516037
1022	Santa María Peñoles	20	2020-09-25 01:51:11.519179	2020-09-25 01:51:11.519179
1023	Santiago Tlazoyaltepec	20	2020-09-25 01:51:11.522434	2020-09-25 01:51:11.522434
1024	Tlalixtac de Cabrera	20	2020-09-25 01:51:11.526421	2020-09-25 01:51:11.526421
1025	San Jacinto Amilpas	20	2020-09-25 01:51:11.529293	2020-09-25 01:51:11.529293
1026	San Andrés Huayápam	20	2020-09-25 01:51:11.532201	2020-09-25 01:51:11.532201
1027	San Agustín Yatareni	20	2020-09-25 01:51:11.535025	2020-09-25 01:51:11.535025
1028	Santo Domingo Tomaltepec	20	2020-09-25 01:51:11.537696	2020-09-25 01:51:11.537696
1029	Santa María del Tule	20	2020-09-25 01:51:11.540734	2020-09-25 01:51:11.540734
1030	San Juan Bautista Tuxtepec	20	2020-09-25 01:51:11.543741	2020-09-25 01:51:11.543741
1031	Loma Bonita	20	2020-09-25 01:51:11.546446	2020-09-25 01:51:11.546446
1032	San José Independencia	20	2020-09-25 01:51:11.549936	2020-09-25 01:51:11.549936
1033	Cosolapa	20	2020-09-25 01:51:11.55306	2020-09-25 01:51:11.55306
1034	Acatlán de Pérez Figueroa	20	2020-09-25 01:51:11.556187	2020-09-25 01:51:11.556187
1035	San Miguel Soyaltepec	20	2020-09-25 01:51:11.559956	2020-09-25 01:51:11.559956
1036	Ayotzintepec	20	2020-09-25 01:51:11.562761	2020-09-25 01:51:11.562761
1037	San Pedro Ixcatlán	20	2020-09-25 01:51:11.565776	2020-09-25 01:51:11.565776
1038	San José Chiltepec	20	2020-09-25 01:51:11.568519	2020-09-25 01:51:11.568519
1039	San Felipe Jalapa de Díaz	20	2020-09-25 01:51:11.571175	2020-09-25 01:51:11.571175
1040	Santa María Jacatepec	20	2020-09-25 01:51:11.574212	2020-09-25 01:51:11.574212
1041	San Lucas Ojitlán	20	2020-09-25 01:51:11.576935	2020-09-25 01:51:11.576935
1042	San Juan Bautista Valle Nacional	20	2020-09-25 01:51:11.579599	2020-09-25 01:51:11.579599
1043	San Felipe Usila	20	2020-09-25 01:51:11.583378	2020-09-25 01:51:11.583378
1044	Huautla de Jiménez	20	2020-09-25 01:51:11.587145	2020-09-25 01:51:11.587145
1045	Santa María Chilchotla	20	2020-09-25 01:51:11.590179	2020-09-25 01:51:11.590179
1046	Santa Ana Ateixtlahuaca	20	2020-09-25 01:51:11.593071	2020-09-25 01:51:11.593071
1047	San Lorenzo Cuaunecuiltitla	20	2020-09-25 01:51:11.595722	2020-09-25 01:51:11.595722
1048	San Francisco Huehuetlán	20	2020-09-25 01:51:11.59912	2020-09-25 01:51:11.59912
1049	San Pedro Ocopetatillo	20	2020-09-25 01:51:11.602305	2020-09-25 01:51:11.602305
1050	Santa Cruz Acatepec	20	2020-09-25 01:51:11.60497	2020-09-25 01:51:11.60497
1051	Eloxochitlán de Flores Magón	20	2020-09-25 01:51:11.608507	2020-09-25 01:51:11.608507
1052	Santiago Texcalcingo	20	2020-09-25 01:51:11.61168	2020-09-25 01:51:11.61168
1053	Teotitlán de Flores Magón	20	2020-09-25 01:51:11.614681	2020-09-25 01:51:11.614681
1054	Santa María Teopoxco	20	2020-09-25 01:51:11.618236	2020-09-25 01:51:11.618236
1055	San Martín Toxpalan	20	2020-09-25 01:51:11.621083	2020-09-25 01:51:11.621083
1056	San Jerónimo Tecóatl	20	2020-09-25 01:51:11.623845	2020-09-25 01:51:11.623845
1057	Santa María la Asunción	20	2020-09-25 01:51:11.626591	2020-09-25 01:51:11.626591
1058	Huautepec	20	2020-09-25 01:51:11.629465	2020-09-25 01:51:11.629465
1059	San Juan Coatzóspam	20	2020-09-25 01:51:11.632949	2020-09-25 01:51:11.632949
1060	San Lucas Zoquiápam	20	2020-09-25 01:51:11.636001	2020-09-25 01:51:11.636001
1061	San Antonio Nanahuatípam	20	2020-09-25 01:51:11.638837	2020-09-25 01:51:11.638837
1062	San José Tenango	20	2020-09-25 01:51:11.642204	2020-09-25 01:51:11.642204
1063	San Mateo Yoloxochitlán	20	2020-09-25 01:51:11.645349	2020-09-25 01:51:11.645349
1064	San Bartolomé Ayautla	20	2020-09-25 01:51:11.648333	2020-09-25 01:51:11.648333
1065	Mazatlán Villa de Flores	20	2020-09-25 01:51:11.652527	2020-09-25 01:51:11.652527
1066	San Juan de los Cués	20	2020-09-25 01:51:11.655519	2020-09-25 01:51:11.655519
1067	Santa María Tecomavaca	20	2020-09-25 01:51:11.658329	2020-09-25 01:51:11.658329
1068	Santa María Ixcatlán	20	2020-09-25 01:51:11.660936	2020-09-25 01:51:11.660936
1069	San Juan Bautista Cuicatlán	20	2020-09-25 01:51:11.66354	2020-09-25 01:51:11.66354
1070	Cuyamecalco Villa de Zaragoza	20	2020-09-25 01:51:11.666695	2020-09-25 01:51:11.666695
1071	Santa Ana Cuauhtémoc	20	2020-09-25 01:51:11.669939	2020-09-25 01:51:11.669939
1072	Chiquihuitlán de Benito Juárez	20	2020-09-25 01:51:11.673055	2020-09-25 01:51:11.673055
1073	San Pedro Teutila	20	2020-09-25 01:51:11.675886	2020-09-25 01:51:11.675886
1074	San Miguel Santa Flor	20	2020-09-25 01:51:11.678715	2020-09-25 01:51:11.678715
1075	Santa María Tlalixtac	20	2020-09-25 01:51:11.681936	2020-09-25 01:51:11.681936
1076	San Andrés Teotilálpam	20	2020-09-25 01:51:11.685109	2020-09-25 01:51:11.685109
1077	San Francisco Chapulapa	20	2020-09-25 01:51:11.687875	2020-09-25 01:51:11.687875
1078	Concepción Pápalo	20	2020-09-25 01:51:11.690969	2020-09-25 01:51:11.690969
1079	Santos Reyes Pápalo	20	2020-09-25 01:51:11.694487	2020-09-25 01:51:11.694487
1080	San Juan Bautista Tlacoatzintepec	20	2020-09-25 01:51:11.697443	2020-09-25 01:51:11.697443
1081	Santa María Pápalo	20	2020-09-25 01:51:11.700305	2020-09-25 01:51:11.700305
1082	San Juan Tepeuxila	20	2020-09-25 01:51:11.703197	2020-09-25 01:51:11.703197
1083	San Pedro Sochiápam	20	2020-09-25 01:51:11.706108	2020-09-25 01:51:11.706108
1084	Valerio Trujano	20	2020-09-25 01:51:11.709623	2020-09-25 01:51:11.709623
1085	San Pedro Jocotipac	20	2020-09-25 01:51:11.712492	2020-09-25 01:51:11.712492
1086	Santa María Texcatitlán	20	2020-09-25 01:51:11.716168	2020-09-25 01:51:11.716168
1087	San Pedro Jaltepetongo	20	2020-09-25 01:51:11.719256	2020-09-25 01:51:11.719256
1088	Santiago Nacaltepec	20	2020-09-25 01:51:11.722131	2020-09-25 01:51:11.722131
1089	Natividad	20	2020-09-25 01:51:11.725446	2020-09-25 01:51:11.725446
1090	San Juan Quiotepec	20	2020-09-25 01:51:11.728659	2020-09-25 01:51:11.728659
1091	San Pedro Yólox	20	2020-09-25 01:51:11.731858	2020-09-25 01:51:11.731858
1092	Santiago Comaltepec	20	2020-09-25 01:51:11.735046	2020-09-25 01:51:11.735046
1093	Abejones	20	2020-09-25 01:51:11.737903	2020-09-25 01:51:11.737903
1094	San Pablo Macuiltianguis	20	2020-09-25 01:51:11.74109	2020-09-25 01:51:11.74109
1095	Ixtlán de Juárez	20	2020-09-25 01:51:11.748462	2020-09-25 01:51:11.748462
1096	San Juan Atepec	20	2020-09-25 01:51:11.751803	2020-09-25 01:51:11.751803
1097	San Pedro Yaneri	20	2020-09-25 01:51:11.75486	2020-09-25 01:51:11.75486
1098	San Miguel Aloápam	20	2020-09-25 01:51:11.757877	2020-09-25 01:51:11.757877
1099	Teococuilco de Marcos Pérez	20	2020-09-25 01:51:11.760576	2020-09-25 01:51:11.760576
1100	Santa Ana Yareni	20	2020-09-25 01:51:11.76344	2020-09-25 01:51:11.76344
1101	San Juan Evangelista Analco	20	2020-09-25 01:51:11.766988	2020-09-25 01:51:11.766988
1102	Santa María Jaltianguis	20	2020-09-25 01:51:11.769935	2020-09-25 01:51:11.769935
1103	San Miguel del Río	20	2020-09-25 01:51:11.772726	2020-09-25 01:51:11.772726
1104	San Juan Chicomezúchil	20	2020-09-25 01:51:11.776351	2020-09-25 01:51:11.776351
1105	Capulálpam de Méndez	20	2020-09-25 01:51:11.779459	2020-09-25 01:51:11.779459
1106	Nuevo Zoquiápam	20	2020-09-25 01:51:11.7825	2020-09-25 01:51:11.7825
1107	Santiago Xiacuí	20	2020-09-25 01:51:11.78532	2020-09-25 01:51:11.78532
1108	Guelatao de Juárez	20	2020-09-25 01:51:11.788001	2020-09-25 01:51:11.788001
1109	Santa Catarina Ixtepeji	20	2020-09-25 01:51:11.790792	2020-09-25 01:51:11.790792
1110	San Miguel Yotao	20	2020-09-25 01:51:11.793764	2020-09-25 01:51:11.793764
1111	Santa Catarina Lachatao	20	2020-09-25 01:51:11.796516	2020-09-25 01:51:11.796516
1112	San Miguel Amatlán	20	2020-09-25 01:51:11.800943	2020-09-25 01:51:11.800943
1113	Santa María Yavesía	20	2020-09-25 01:51:11.804169	2020-09-25 01:51:11.804169
1114	Santiago Laxopa	20	2020-09-25 01:51:11.807372	2020-09-25 01:51:11.807372
1115	San Ildefonso Villa Alta	20	2020-09-25 01:51:11.810512	2020-09-25 01:51:11.810512
1116	Santiago Camotlán	20	2020-09-25 01:51:11.813193	2020-09-25 01:51:11.813193
1117	San Juan Yaeé	20	2020-09-25 01:51:11.816212	2020-09-25 01:51:11.816212
1118	Santiago Lalopa	20	2020-09-25 01:51:11.819015	2020-09-25 01:51:11.819015
1119	San Juan Yatzona	20	2020-09-25 01:51:11.822252	2020-09-25 01:51:11.822252
1120	Villa Talea de Castro	20	2020-09-25 01:51:11.82577	2020-09-25 01:51:11.82577
1121	Tanetze de Zaragoza	20	2020-09-25 01:51:11.828562	2020-09-25 01:51:11.828562
1122	San Juan Juquila Vijanos	20	2020-09-25 01:51:11.831522	2020-09-25 01:51:11.831522
1123	San Cristóbal Lachirioag	20	2020-09-25 01:51:11.834632	2020-09-25 01:51:11.834632
1124	Santa María Temaxcalapa	20	2020-09-25 01:51:11.837624	2020-09-25 01:51:11.837624
1125	Santo Domingo Roayaga	20	2020-09-25 01:51:11.8406	2020-09-25 01:51:11.8406
1126	Santa María Yalina	20	2020-09-25 01:51:11.843657	2020-09-25 01:51:11.843657
1127	San Andrés Solaga	20	2020-09-25 01:51:11.846415	2020-09-25 01:51:11.846415
1128	San Juan Tabaá	20	2020-09-25 01:51:11.85058	2020-09-25 01:51:11.85058
1129	San Melchor Betaza	20	2020-09-25 01:51:11.853768	2020-09-25 01:51:11.853768
1130	San Andrés Yaá	20	2020-09-25 01:51:11.856821	2020-09-25 01:51:11.856821
1131	San Bartolomé Zoogocho	20	2020-09-25 01:51:11.860446	2020-09-25 01:51:11.860446
1132	San Baltazar Yatzachi el Bajo	20	2020-09-25 01:51:11.863379	2020-09-25 01:51:11.863379
1133	Santiago Zoochila	20	2020-09-25 01:51:11.866669	2020-09-25 01:51:11.866669
1134	Villa Hidalgo	20	2020-09-25 01:51:11.869523	2020-09-25 01:51:11.869523
1135	San Francisco Cajonos	20	2020-09-25 01:51:11.87239	2020-09-25 01:51:11.87239
1136	San Mateo Cajonos	20	2020-09-25 01:51:11.875059	2020-09-25 01:51:11.875059
1137	San Pedro Cajonos	20	2020-09-25 01:51:11.877672	2020-09-25 01:51:11.877672
1138	Santo Domingo Xagacía	20	2020-09-25 01:51:11.880527	2020-09-25 01:51:11.880527
1139	San Pablo Yaganiza	20	2020-09-25 01:51:11.884489	2020-09-25 01:51:11.884489
1140	Santiago Choápam	20	2020-09-25 01:51:11.887422	2020-09-25 01:51:11.887422
1141	Santiago Jocotepec	20	2020-09-25 01:51:11.890709	2020-09-25 01:51:11.890709
1142	San Juan Lalana	20	2020-09-25 01:51:11.893951	2020-09-25 01:51:11.893951
1143	Santiago Yaveo	20	2020-09-25 01:51:11.896726	2020-09-25 01:51:11.896726
1144	San Juan Petlapa	20	2020-09-25 01:51:11.899272	2020-09-25 01:51:11.899272
1145	San Juan Comaltepec	20	2020-09-25 01:51:11.901905	2020-09-25 01:51:11.901905
1146	Heroica Ciudad de Huajuapan de León	20	2020-09-25 01:51:11.904686	2020-09-25 01:51:11.904686
1147	Santiago Chazumba	20	2020-09-25 01:51:11.907547	2020-09-25 01:51:11.907547
1148	Cosoltepec	20	2020-09-25 01:51:11.910245	2020-09-25 01:51:11.910245
1149	San Pedro y San Pablo Tequixtepec	20	2020-09-25 01:51:11.912927	2020-09-25 01:51:11.912927
1150	San Juan Bautista Suchitepec	20	2020-09-25 01:51:11.916668	2020-09-25 01:51:11.916668
1151	Santa Catarina Zapoquila	20	2020-09-25 01:51:11.919911	2020-09-25 01:51:11.919911
1152	Santiago Miltepec	20	2020-09-25 01:51:11.92284	2020-09-25 01:51:11.92284
1153	San Jerónimo Silacayoapilla	20	2020-09-25 01:51:11.925775	2020-09-25 01:51:11.925775
1154	Zapotitlán Palmas	20	2020-09-25 01:51:11.92886	2020-09-25 01:51:11.92886
1155	San Andrés Dinicuiti	20	2020-09-25 01:51:11.932448	2020-09-25 01:51:11.932448
1156	Santiago Cacaloxtepec	20	2020-09-25 01:51:11.935456	2020-09-25 01:51:11.935456
1157	Asunción Cuyotepeji	20	2020-09-25 01:51:11.938332	2020-09-25 01:51:11.938332
1158	Santa María Camotlán	20	2020-09-25 01:51:11.941612	2020-09-25 01:51:11.941612
1159	Santiago Huajolotitlán	20	2020-09-25 01:51:11.944692	2020-09-25 01:51:11.944692
1160	Santiago Tamazola	20	2020-09-25 01:51:11.947606	2020-09-25 01:51:11.947606
1161	San Juan Cieneguilla	20	2020-09-25 01:51:11.951342	2020-09-25 01:51:11.951342
1162	Zapotitlán Lagunas	20	2020-09-25 01:51:11.954589	2020-09-25 01:51:11.954589
1163	San Juan Ihualtepec	20	2020-09-25 01:51:11.95745	2020-09-25 01:51:11.95745
1164	San Nicolás Hidalgo	20	2020-09-25 01:51:11.960141	2020-09-25 01:51:11.960141
1590	Naupan	21	2020-09-25 01:51:13.385616	2020-09-25 01:51:13.385616
1165	Guadalupe de Ramírez	20	2020-09-25 01:51:11.962715	2020-09-25 01:51:11.962715
1166	San Andrés Tepetlapa	20	2020-09-25 01:51:11.966396	2020-09-25 01:51:11.966396
1167	San Miguel Ahuehuetitlán	20	2020-09-25 01:51:11.969676	2020-09-25 01:51:11.969676
1168	San Mateo Nejápam	20	2020-09-25 01:51:11.973285	2020-09-25 01:51:11.973285
1169	San Juan Bautista Tlachichilco	20	2020-09-25 01:51:11.979188	2020-09-25 01:51:11.979188
1170	Tezoatlán de Segura y Luna	20	2020-09-25 01:51:11.982903	2020-09-25 01:51:11.982903
1171	Fresnillo de Trujano	20	2020-09-25 01:51:11.986064	2020-09-25 01:51:11.986064
1172	Santiago Ayuquililla	20	2020-09-25 01:51:11.988919	2020-09-25 01:51:11.988919
1173	San José Ayuquila	20	2020-09-25 01:51:11.991971	2020-09-25 01:51:11.991971
1174	San Martín Zacatepec	20	2020-09-25 01:51:11.994838	2020-09-25 01:51:11.994838
1175	San Miguel Amatitlán	20	2020-09-25 01:51:11.997746	2020-09-25 01:51:11.997746
1176	Mariscala de Juárez	20	2020-09-25 01:51:12.000935	2020-09-25 01:51:12.000935
1177	Santa Cruz Tacache de Mina	20	2020-09-25 01:51:12.004605	2020-09-25 01:51:12.004605
1178	San Simón Zahuatlán	20	2020-09-25 01:51:12.008061	2020-09-25 01:51:12.008061
1179	San Marcos Arteaga	20	2020-09-25 01:51:12.010988	2020-09-25 01:51:12.010988
1180	San Jorge Nuchita	20	2020-09-25 01:51:12.013826	2020-09-25 01:51:12.013826
1181	Santos Reyes Yucuná	20	2020-09-25 01:51:12.017738	2020-09-25 01:51:12.017738
1182	Santo Domingo Tonalá	20	2020-09-25 01:51:12.021011	2020-09-25 01:51:12.021011
1183	Santo Domingo Yodohino	20	2020-09-25 01:51:12.024364	2020-09-25 01:51:12.024364
1184	San Juan Bautista Coixtlahuaca	20	2020-09-25 01:51:12.027216	2020-09-25 01:51:12.027216
1185	Tepelmeme Villa de Morelos	20	2020-09-25 01:51:12.030029	2020-09-25 01:51:12.030029
1186	Concepción Buenavista	20	2020-09-25 01:51:12.033215	2020-09-25 01:51:12.033215
1187	Santiago Ihuitlán Plumas	20	2020-09-25 01:51:12.036264	2020-09-25 01:51:12.036264
1188	Tlacotepec Plumas	20	2020-09-25 01:51:12.039191	2020-09-25 01:51:12.039191
1189	San Francisco Teopan	20	2020-09-25 01:51:12.042643	2020-09-25 01:51:12.042643
1190	Santa Magdalena Jicotlán	20	2020-09-25 01:51:12.045304	2020-09-25 01:51:12.045304
1191	San Mateo Tlapiltepec	20	2020-09-25 01:51:12.048664	2020-09-25 01:51:12.048664
1192	San Miguel Tequixtepec	20	2020-09-25 01:51:12.051664	2020-09-25 01:51:12.051664
1193	San Miguel Tulancingo	20	2020-09-25 01:51:12.05445	2020-09-25 01:51:12.05445
1194	Santiago Tepetlapa	20	2020-09-25 01:51:12.058718	2020-09-25 01:51:12.058718
1195	San Cristóbal Suchixtlahuaca	20	2020-09-25 01:51:12.062003	2020-09-25 01:51:12.062003
1196	Santa María Nativitas	20	2020-09-25 01:51:12.06563	2020-09-25 01:51:12.06563
1197	Silacayoápam	20	2020-09-25 01:51:12.068709	2020-09-25 01:51:12.068709
1198	Santiago Yucuyachi	20	2020-09-25 01:51:12.071639	2020-09-25 01:51:12.071639
1199	San Lorenzo Victoria	20	2020-09-25 01:51:12.074494	2020-09-25 01:51:12.074494
1200	San Agustín Atenango	20	2020-09-25 01:51:12.077482	2020-09-25 01:51:12.077482
1201	Calihualá	20	2020-09-25 01:51:12.080474	2020-09-25 01:51:12.080474
1202	Santa Cruz de Bravo	20	2020-09-25 01:51:12.083808	2020-09-25 01:51:12.083808
1203	Ixpantepec Nieves	20	2020-09-25 01:51:12.086809	2020-09-25 01:51:12.086809
1204	San Francisco Tlapancingo	20	2020-09-25 01:51:12.089519	2020-09-25 01:51:12.089519
1205	Santiago del Río	20	2020-09-25 01:51:12.092139	2020-09-25 01:51:12.092139
1206	San Pedro y San Pablo Teposcolula	20	2020-09-25 01:51:12.0948	2020-09-25 01:51:12.0948
1207	La Trinidad Vista Hermosa	20	2020-09-25 01:51:12.098582	2020-09-25 01:51:12.098582
1208	Villa de Tamazulápam del Progreso	20	2020-09-25 01:51:12.101728	2020-09-25 01:51:12.101728
1209	San Pedro Nopala	20	2020-09-25 01:51:12.104428	2020-09-25 01:51:12.104428
1210	Teotongo	20	2020-09-25 01:51:12.107414	2020-09-25 01:51:12.107414
1211	San Antonio Acutla	20	2020-09-25 01:51:12.110696	2020-09-25 01:51:12.110696
1212	Villa Tejúpam de la Unión	20	2020-09-25 01:51:12.11363	2020-09-25 01:51:12.11363
1213	Santo Domingo Tonaltepec	20	2020-09-25 01:51:12.116386	2020-09-25 01:51:12.116386
1214	Villa de Chilapa de Díaz	20	2020-09-25 01:51:12.119381	2020-09-25 01:51:12.119381
1215	San Antonino Monte Verde	20	2020-09-25 01:51:12.12231	2020-09-25 01:51:12.12231
1216	San Andrés Lagunas	20	2020-09-25 01:51:12.125912	2020-09-25 01:51:12.125912
1217	San Pedro Yucunama	20	2020-09-25 01:51:12.12888	2020-09-25 01:51:12.12888
1218	San Juan Teposcolula	20	2020-09-25 01:51:12.132462	2020-09-25 01:51:12.132462
1219	San Bartolo Soyaltepec	20	2020-09-25 01:51:12.135536	2020-09-25 01:51:12.135536
1220	Santiago Yolomécatl	20	2020-09-25 01:51:12.144399	2020-09-25 01:51:12.144399
1221	San Sebastián Nicananduta	20	2020-09-25 01:51:12.147791	2020-09-25 01:51:12.147791
1222	Santo Domingo Tlatayápam	20	2020-09-25 01:51:12.151058	2020-09-25 01:51:12.151058
1223	Santa María Nduayaco	20	2020-09-25 01:51:12.154276	2020-09-25 01:51:12.154276
1224	San Vicente Nuñú	20	2020-09-25 01:51:12.157833	2020-09-25 01:51:12.157833
1225	San Pedro Topiltepec	20	2020-09-25 01:51:12.160798	2020-09-25 01:51:12.160798
1226	Santiago Nejapilla	20	2020-09-25 01:51:12.164164	2020-09-25 01:51:12.164164
1227	Asunción Nochixtlán	20	2020-09-25 01:51:12.16765	2020-09-25 01:51:12.16765
1228	San Miguel Huautla	20	2020-09-25 01:51:12.170859	2020-09-25 01:51:12.170859
1229	San Miguel Chicahua	20	2020-09-25 01:51:12.173848	2020-09-25 01:51:12.173848
1230	Santa María Apazco	20	2020-09-25 01:51:12.176689	2020-09-25 01:51:12.176689
1231	Santiago Apoala	20	2020-09-25 01:51:12.179454	2020-09-25 01:51:12.179454
1232	Santa María Chachoápam	20	2020-09-25 01:51:12.183776	2020-09-25 01:51:12.183776
1233	San Pedro Coxcaltepec Cántaros	20	2020-09-25 01:51:12.186819	2020-09-25 01:51:12.186819
1234	Santiago Huauclilla	20	2020-09-25 01:51:12.189791	2020-09-25 01:51:12.189791
1235	Santo Domingo Yanhuitlán	20	2020-09-25 01:51:12.193494	2020-09-25 01:51:12.193494
1236	San Andrés Sinaxtla	20	2020-09-25 01:51:12.196771	2020-09-25 01:51:12.196771
1237	San Juan Yucuita	20	2020-09-25 01:51:12.199801	2020-09-25 01:51:12.199801
1238	San Juan Sayultepec	20	2020-09-25 01:51:12.20271	2020-09-25 01:51:12.20271
1239	Santiago Tillo	20	2020-09-25 01:51:12.205735	2020-09-25 01:51:12.205735
1240	San Francisco Chindúa	20	2020-09-25 01:51:12.208617	2020-09-25 01:51:12.208617
1241	San Mateo Etlatongo	20	2020-09-25 01:51:12.211668	2020-09-25 01:51:12.211668
1242	Santa Inés de Zaragoza	20	2020-09-25 01:51:12.216015	2020-09-25 01:51:12.216015
1243	Santiago Juxtlahuaca	20	2020-09-25 01:51:12.219082	2020-09-25 01:51:12.219082
1244	San Miguel Tlacotepec	20	2020-09-25 01:51:12.222105	2020-09-25 01:51:12.222105
1245	San Sebastián Tecomaxtlahuaca	20	2020-09-25 01:51:12.225774	2020-09-25 01:51:12.225774
1246	Santos Reyes Tepejillo	20	2020-09-25 01:51:12.229051	2020-09-25 01:51:12.229051
1247	San Juan Mixtepec -Dto. 08 -	20	2020-09-25 01:51:12.232289	2020-09-25 01:51:12.232289
1248	San Martín Peras	20	2020-09-25 01:51:12.23508	2020-09-25 01:51:12.23508
1249	Coicoyán de las Flores	20	2020-09-25 01:51:12.237949	2020-09-25 01:51:12.237949
1250	Heroica Ciudad de Tlaxiaco	20	2020-09-25 01:51:12.240905	2020-09-25 01:51:12.240905
1251	San Juan Ñumí	20	2020-09-25 01:51:12.243997	2020-09-25 01:51:12.243997
1252	San Pedro Mártir Yucuxaco	20	2020-09-25 01:51:12.247354	2020-09-25 01:51:12.247354
1253	San Martín Huamelúlpam	20	2020-09-25 01:51:12.251641	2020-09-25 01:51:12.251641
1254	Santa Cruz Tayata	20	2020-09-25 01:51:12.255131	2020-09-25 01:51:12.255131
1255	Santiago Nundiche	20	2020-09-25 01:51:12.258271	2020-09-25 01:51:12.258271
1256	Santa María del Rosario	20	2020-09-25 01:51:12.261166	2020-09-25 01:51:12.261166
1257	San Juan Achiutla	20	2020-09-25 01:51:12.264922	2020-09-25 01:51:12.264922
1258	Santa Catarina Tayata	20	2020-09-25 01:51:12.267995	2020-09-25 01:51:12.267995
1259	San Cristóbal Amoltepec	20	2020-09-25 01:51:12.27136	2020-09-25 01:51:12.27136
1260	San Miguel Achiutla	20	2020-09-25 01:51:12.275084	2020-09-25 01:51:12.275084
1261	San Martín Itunyoso	20	2020-09-25 01:51:12.278485	2020-09-25 01:51:12.278485
1262	Magdalena Peñasco	20	2020-09-25 01:51:12.281989	2020-09-25 01:51:12.281989
1263	San Bartolomé Yucuañe	20	2020-09-25 01:51:12.284951	2020-09-25 01:51:12.284951
1264	Santa Cruz Nundaco	20	2020-09-25 01:51:12.287745	2020-09-25 01:51:12.287745
1265	San Agustín Tlacotepec	20	2020-09-25 01:51:12.290791	2020-09-25 01:51:12.290791
1266	Santo Tomás Ocotepec	20	2020-09-25 01:51:12.293727	2020-09-25 01:51:12.293727
1267	San Antonio Sinicahua	20	2020-09-25 01:51:12.297213	2020-09-25 01:51:12.297213
1268	San Mateo Peñasco	20	2020-09-25 01:51:12.300956	2020-09-25 01:51:12.300956
1269	Santa María Tataltepec	20	2020-09-25 01:51:12.304167	2020-09-25 01:51:12.304167
1270	San Pedro Molinos	20	2020-09-25 01:51:12.307953	2020-09-25 01:51:12.307953
1271	Santa María Yosoyúa	20	2020-09-25 01:51:12.311776	2020-09-25 01:51:12.311776
1272	San Juan Teita	20	2020-09-25 01:51:12.315155	2020-09-25 01:51:12.315155
1273	Magdalena Jaltepec	20	2020-09-25 01:51:12.318368	2020-09-25 01:51:12.318368
1274	Magdalena Yodocono de Porfirio Díaz	20	2020-09-25 01:51:12.321547	2020-09-25 01:51:12.321547
1275	San Miguel Tecomatlán	20	2020-09-25 01:51:12.324742	2020-09-25 01:51:12.324742
1276	Magdalena Zahuatlán	20	2020-09-25 01:51:12.328714	2020-09-25 01:51:12.328714
1277	San Francisco Nuxaño	20	2020-09-25 01:51:12.333963	2020-09-25 01:51:12.333963
1278	San Pedro Tidaá	20	2020-09-25 01:51:12.338639	2020-09-25 01:51:12.338639
1279	San Francisco Jaltepetongo	20	2020-09-25 01:51:12.342692	2020-09-25 01:51:12.342692
1280	Santiago Tilantongo	20	2020-09-25 01:51:12.347296	2020-09-25 01:51:12.347296
1281	San Juan Diuxi	20	2020-09-25 01:51:12.35131	2020-09-25 01:51:12.35131
1282	San Andrés Nuxiño	20	2020-09-25 01:51:12.355448	2020-09-25 01:51:12.355448
1283	San Juan Tamazola	20	2020-09-25 01:51:12.360011	2020-09-25 01:51:12.360011
1284	Santo Domingo Nuxaá	20	2020-09-25 01:51:12.364348	2020-09-25 01:51:12.364348
1285	Yutanduchi de Guerrero	20	2020-09-25 01:51:12.36913	2020-09-25 01:51:12.36913
1286	San Pedro Teozacoalco	20	2020-09-25 01:51:12.373538	2020-09-25 01:51:12.373538
1287	San Miguel Piedras	20	2020-09-25 01:51:12.378308	2020-09-25 01:51:12.378308
1288	San Mateo Sindihui	20	2020-09-25 01:51:12.383131	2020-09-25 01:51:12.383131
1289	Heroica Ciudad de Juchitán de Zaragoza	20	2020-09-25 01:51:12.387336	2020-09-25 01:51:12.387336
1290	Ciudad Ixtepec	20	2020-09-25 01:51:12.39209	2020-09-25 01:51:12.39209
1291	El Espinal	20	2020-09-25 01:51:12.397835	2020-09-25 01:51:12.397835
1292	Santo Domingo Ingenio	20	2020-09-25 01:51:12.402362	2020-09-25 01:51:12.402362
1293	Santa María Xadani	20	2020-09-25 01:51:12.406347	2020-09-25 01:51:12.406347
1294	Santiago Niltepec	20	2020-09-25 01:51:12.410286	2020-09-25 01:51:12.410286
1295	San Dionisio del Mar	20	2020-09-25 01:51:12.414533	2020-09-25 01:51:12.414533
1296	Asunción Ixtaltepec	20	2020-09-25 01:51:12.419237	2020-09-25 01:51:12.419237
1297	San Francisco del Mar	20	2020-09-25 01:51:12.423123	2020-09-25 01:51:12.423123
1298	Unión Hidalgo	20	2020-09-25 01:51:12.4267	2020-09-25 01:51:12.4267
1299	San Miguel Chimalapa	20	2020-09-25 01:51:12.430677	2020-09-25 01:51:12.430677
1300	Santo Domingo Zanatepec	20	2020-09-25 01:51:12.434725	2020-09-25 01:51:12.434725
1301	Reforma de Pineda	20	2020-09-25 01:51:12.439325	2020-09-25 01:51:12.439325
1302	San Francisco Ixhuatán	20	2020-09-25 01:51:12.443758	2020-09-25 01:51:12.443758
1303	San Pedro Tapanatepec	20	2020-09-25 01:51:12.447284	2020-09-25 01:51:12.447284
1304	Chahuites	20	2020-09-25 01:51:12.451341	2020-09-25 01:51:12.451341
1305	Santiago Zacatepec	20	2020-09-25 01:51:12.455529	2020-09-25 01:51:12.455529
1306	Santo Domingo Tepuxtepec	20	2020-09-25 01:51:12.460267	2020-09-25 01:51:12.460267
1307	San Juan Cotzocón	20	2020-09-25 01:51:12.463745	2020-09-25 01:51:12.463745
1308	San Juan Mazatlán	20	2020-09-25 01:51:12.467055	2020-09-25 01:51:12.467055
1309	Totontepec Villa de Morelos	20	2020-09-25 01:51:12.471764	2020-09-25 01:51:12.471764
1310	Mixistlán de la Reforma	20	2020-09-25 01:51:12.476718	2020-09-25 01:51:12.476718
1311	Santa María Tlahuitoltepec	20	2020-09-25 01:51:12.483736	2020-09-25 01:51:12.483736
1312	Santa María Alotepec	20	2020-09-25 01:51:12.488835	2020-09-25 01:51:12.488835
1313	Santiago Atitlán	20	2020-09-25 01:51:12.492769	2020-09-25 01:51:12.492769
1314	Tamazulápam del Espíritu Santo	20	2020-09-25 01:51:12.496843	2020-09-25 01:51:12.496843
1315	San Pedro y San Pablo Ayutla	20	2020-09-25 01:51:12.501121	2020-09-25 01:51:12.501121
1316	Santa María Tepantlali	20	2020-09-25 01:51:12.505352	2020-09-25 01:51:12.505352
1317	San Miguel Quetzaltepec	20	2020-09-25 01:51:12.509313	2020-09-25 01:51:12.509313
1318	Asunción Cacalotepec	20	2020-09-25 01:51:12.51497	2020-09-25 01:51:12.51497
1319	San Pedro Ocotepec	20	2020-09-25 01:51:12.519218	2020-09-25 01:51:12.519218
1320	San Lucas Camotlán	20	2020-09-25 01:51:12.523214	2020-09-25 01:51:12.523214
1321	Santiago Ixcuintepec	20	2020-09-25 01:51:12.527828	2020-09-25 01:51:12.527828
1322	Matías Romero Avendaño	20	2020-09-25 01:51:12.531706	2020-09-25 01:51:12.531706
1323	San Juan Guichicovi	20	2020-09-25 01:51:12.535386	2020-09-25 01:51:12.535386
1324	Santo Domingo Petapa	20	2020-09-25 01:51:12.538943	2020-09-25 01:51:12.538943
1325	Santa María Chimalapa	20	2020-09-25 01:51:12.542937	2020-09-25 01:51:12.542937
1326	Santa María Petapa	20	2020-09-25 01:51:12.548118	2020-09-25 01:51:12.548118
1327	El Barrio de la Soledad	20	2020-09-25 01:51:12.552282	2020-09-25 01:51:12.552282
1328	Tlacolula de Matamoros	20	2020-09-25 01:51:12.556405	2020-09-25 01:51:12.556405
1329	San Sebastián Abasolo	20	2020-09-25 01:51:12.561906	2020-09-25 01:51:12.561906
1330	Villa Díaz Ordaz	20	2020-09-25 01:51:12.566918	2020-09-25 01:51:12.566918
1331	Santa María Guelacé	20	2020-09-25 01:51:12.570923	2020-09-25 01:51:12.570923
1332	Teotitlán del Valle	20	2020-09-25 01:51:12.575103	2020-09-25 01:51:12.575103
1333	San Francisco Lachigoló	20	2020-09-25 01:51:12.579257	2020-09-25 01:51:12.579257
1334	San Sebastián Teitipac	20	2020-09-25 01:51:12.583734	2020-09-25 01:51:12.583734
1335	Santa Ana del Valle	20	2020-09-25 01:51:12.587654	2020-09-25 01:51:12.587654
1336	San Pablo Villa de Mitla	20	2020-09-25 01:51:12.605218	2020-09-25 01:51:12.605218
1337	Santiago Matatlán	20	2020-09-25 01:51:12.609742	2020-09-25 01:51:12.609742
1338	Santo Domingo Albarradas	20	2020-09-25 01:51:12.612898	2020-09-25 01:51:12.612898
1339	Rojas de Cuauhtémoc	20	2020-09-25 01:51:12.615715	2020-09-25 01:51:12.615715
1340	San Juan Teitipac	20	2020-09-25 01:51:12.618298	2020-09-25 01:51:12.618298
1341	Santa Cruz Papalutla	20	2020-09-25 01:51:12.621042	2020-09-25 01:51:12.621042
1342	Magdalena Teitipac	20	2020-09-25 01:51:12.623847	2020-09-25 01:51:12.623847
1343	San Jerónimo Tlacochahuaya	20	2020-09-25 01:51:12.626502	2020-09-25 01:51:12.626502
1344	San Juan Guelavía	20	2020-09-25 01:51:12.63001	2020-09-25 01:51:12.63001
1345	San Lucas Quiaviní	20	2020-09-25 01:51:12.633465	2020-09-25 01:51:12.633465
1346	San Juan del Río	20	2020-09-25 01:51:12.636197	2020-09-25 01:51:12.636197
1347	San Bartolomé Quialana	20	2020-09-25 01:51:12.638838	2020-09-25 01:51:12.638838
1348	San Lorenzo Albarradas	20	2020-09-25 01:51:12.641822	2020-09-25 01:51:12.641822
1349	San Pedro Totolápam	20	2020-09-25 01:51:12.645014	2020-09-25 01:51:12.645014
1350	San Pedro Quiatoni	20	2020-09-25 01:51:12.647736	2020-09-25 01:51:12.647736
1351	Santa María Zoquitlán	20	2020-09-25 01:51:12.650595	2020-09-25 01:51:12.650595
1352	San Dionisio Ocotepec	20	2020-09-25 01:51:12.653574	2020-09-25 01:51:12.653574
1353	San Carlos Yautepec	20	2020-09-25 01:51:12.65626	2020-09-25 01:51:12.65626
1354	San Juan Juquila Mixes	20	2020-09-25 01:51:12.659026	2020-09-25 01:51:12.659026
1355	Nejapa de Madero	20	2020-09-25 01:51:12.661827	2020-09-25 01:51:12.661827
1356	Santa Ana Tavela	20	2020-09-25 01:51:12.665422	2020-09-25 01:51:12.665422
1357	San Juan Lajarcia	20	2020-09-25 01:51:12.66864	2020-09-25 01:51:12.66864
1358	San Bartolo Yautepec	20	2020-09-25 01:51:12.671476	2020-09-25 01:51:12.671476
1359	Santa María Ecatepec	20	2020-09-25 01:51:12.674343	2020-09-25 01:51:12.674343
1360	Asunción Tlacolulita	20	2020-09-25 01:51:12.67716	2020-09-25 01:51:12.67716
1361	San Pedro Mártir Quiechapa	20	2020-09-25 01:51:12.680591	2020-09-25 01:51:12.680591
1362	Santa María Quiegolani	20	2020-09-25 01:51:12.683456	2020-09-25 01:51:12.683456
1363	Santa Catarina Quioquitani	20	2020-09-25 01:51:12.686118	2020-09-25 01:51:12.686118
1364	Santa Catalina Quierí	20	2020-09-25 01:51:12.688704	2020-09-25 01:51:12.688704
1365	Salina Cruz	20	2020-09-25 01:51:12.692068	2020-09-25 01:51:12.692068
1366	Santiago Lachiguiri	20	2020-09-25 01:51:12.695482	2020-09-25 01:51:12.695482
1367	Santa María Jalapa del Marqués	20	2020-09-25 01:51:12.699234	2020-09-25 01:51:12.699234
1368	Santa María Totolapilla	20	2020-09-25 01:51:12.702038	2020-09-25 01:51:12.702038
1369	Santiago Laollaga	20	2020-09-25 01:51:12.705034	2020-09-25 01:51:12.705034
1370	Guevea de Humboldt	20	2020-09-25 01:51:12.708068	2020-09-25 01:51:12.708068
1371	Santo Domingo Chihuitán	20	2020-09-25 01:51:12.710864	2020-09-25 01:51:12.710864
1372	Santa María Guienagati	20	2020-09-25 01:51:12.71433	2020-09-25 01:51:12.71433
1373	Magdalena Tequisistlán	20	2020-09-25 01:51:12.717441	2020-09-25 01:51:12.717441
1374	Magdalena Tlacotepec	20	2020-09-25 01:51:12.720334	2020-09-25 01:51:12.720334
1375	San Pedro Comitancillo	20	2020-09-25 01:51:12.723436	2020-09-25 01:51:12.723436
1376	Santa María Mixtequilla	20	2020-09-25 01:51:12.726626	2020-09-25 01:51:12.726626
1377	Santo Domingo Tehuantepec	20	2020-09-25 01:51:12.729501	2020-09-25 01:51:12.729501
1378	San Pedro Huamelula	20	2020-09-25 01:51:12.732368	2020-09-25 01:51:12.732368
1379	San Pedro Huilotepec	20	2020-09-25 01:51:12.735042	2020-09-25 01:51:12.735042
1380	San Mateo del Mar	20	2020-09-25 01:51:12.737893	2020-09-25 01:51:12.737893
1381	San Blas Atempa	20	2020-09-25 01:51:12.740593	2020-09-25 01:51:12.740593
1382	Santiago Astata	20	2020-09-25 01:51:12.743167	2020-09-25 01:51:12.743167
1383	San Miguel Tenango	20	2020-09-25 01:51:12.746324	2020-09-25 01:51:12.746324
1384	Miahuatlán de Porfirio Díaz	20	2020-09-25 01:51:12.749633	2020-09-25 01:51:12.749633
1385	San Nicolás	20	2020-09-25 01:51:12.752795	2020-09-25 01:51:12.752795
1386	San Simón Almolongas	20	2020-09-25 01:51:12.755709	2020-09-25 01:51:12.755709
1387	San Luis Amatlán	20	2020-09-25 01:51:12.759566	2020-09-25 01:51:12.759566
1388	San José Lachiguiri	20	2020-09-25 01:51:12.762772	2020-09-25 01:51:12.762772
1389	Sitio de Xitlapehua	20	2020-09-25 01:51:12.765988	2020-09-25 01:51:12.765988
1390	San Francisco Logueche	20	2020-09-25 01:51:12.768596	2020-09-25 01:51:12.768596
1391	Santa Ana	20	2020-09-25 01:51:12.771291	2020-09-25 01:51:12.771291
1392	Santa Cruz Xitla	20	2020-09-25 01:51:12.774204	2020-09-25 01:51:12.774204
1393	Monjas	20	2020-09-25 01:51:12.777263	2020-09-25 01:51:12.777263
1394	San Ildefonso Amatlán	20	2020-09-25 01:51:12.780396	2020-09-25 01:51:12.780396
1395	Santa Catarina Cuixtla	20	2020-09-25 01:51:12.78344	2020-09-25 01:51:12.78344
1396	San José del Peñasco	20	2020-09-25 01:51:12.786224	2020-09-25 01:51:12.786224
1397	San Cristóbal Amatlán	20	2020-09-25 01:51:12.788904	2020-09-25 01:51:12.788904
1398	San Juan Mixtepec -Dto. 26 -	20	2020-09-25 01:51:12.792087	2020-09-25 01:51:12.792087
1399	San Pedro Mixtepec -Dto. 26 -	20	2020-09-25 01:51:12.795017	2020-09-25 01:51:12.795017
1400	Santa Lucía Miahuatlán	20	2020-09-25 01:51:12.798505	2020-09-25 01:51:12.798505
1401	San Jerónimo Coatlán	20	2020-09-25 01:51:12.801543	2020-09-25 01:51:12.801543
1402	San Sebastián Coatlán	20	2020-09-25 01:51:12.804433	2020-09-25 01:51:12.804433
1403	San Pablo Coatlán	20	2020-09-25 01:51:12.807816	2020-09-25 01:51:12.807816
1404	San Mateo Río Hondo	20	2020-09-25 01:51:12.811485	2020-09-25 01:51:12.811485
1405	Santo Tomás Tamazulapan	20	2020-09-25 01:51:12.815409	2020-09-25 01:51:12.815409
1406	San Andrés Paxtlán	20	2020-09-25 01:51:12.818316	2020-09-25 01:51:12.818316
1407	Santa María Ozolotepec	20	2020-09-25 01:51:12.820893	2020-09-25 01:51:12.820893
1408	San Miguel Coatlán	20	2020-09-25 01:51:12.824039	2020-09-25 01:51:12.824039
1409	San Sebastián Río Hondo	20	2020-09-25 01:51:12.826854	2020-09-25 01:51:12.826854
1410	San Miguel Suchixtepec	20	2020-09-25 01:51:12.82979	2020-09-25 01:51:12.82979
1411	Santo Domingo Ozolotepec	20	2020-09-25 01:51:12.83296	2020-09-25 01:51:12.83296
1412	San Francisco Ozolotepec	20	2020-09-25 01:51:12.835926	2020-09-25 01:51:12.835926
1413	Santiago Xanica	20	2020-09-25 01:51:12.838542	2020-09-25 01:51:12.838542
1414	San Marcial Ozolotepec	20	2020-09-25 01:51:12.841218	2020-09-25 01:51:12.841218
1415	San Juan Ozolotepec	20	2020-09-25 01:51:12.843968	2020-09-25 01:51:12.843968
1416	San Pedro Pochutla	20	2020-09-25 01:51:12.847926	2020-09-25 01:51:12.847926
1417	Santo Domingo de Morelos	20	2020-09-25 01:51:12.850965	2020-09-25 01:51:12.850965
1418	Santa Catarina Loxicha	20	2020-09-25 01:51:12.853522	2020-09-25 01:51:12.853522
1419	San Agustín Loxicha	20	2020-09-25 01:51:12.856365	2020-09-25 01:51:12.856365
1420	San Baltazar Loxicha	20	2020-09-25 01:51:12.859712	2020-09-25 01:51:12.859712
1421	Santa María Colotepec	20	2020-09-25 01:51:12.862302	2020-09-25 01:51:12.862302
1422	San Bartolomé Loxicha	20	2020-09-25 01:51:12.865232	2020-09-25 01:51:12.865232
1423	Santa María Tonameca	20	2020-09-25 01:51:12.867969	2020-09-25 01:51:12.867969
1424	Candelaria Loxicha	20	2020-09-25 01:51:12.870828	2020-09-25 01:51:12.870828
1425	Pluma Hidalgo	20	2020-09-25 01:51:12.874037	2020-09-25 01:51:12.874037
1426	San Pedro el Alto	20	2020-09-25 01:51:12.876955	2020-09-25 01:51:12.876955
1427	San Mateo Piñas	20	2020-09-25 01:51:12.880574	2020-09-25 01:51:12.880574
1428	Santa María Huatulco	20	2020-09-25 01:51:12.883652	2020-09-25 01:51:12.883652
1429	San Miguel del Puerto	20	2020-09-25 01:51:12.886364	2020-09-25 01:51:12.886364
1430	Putla Villa de Guerrero	20	2020-09-25 01:51:12.889337	2020-09-25 01:51:12.889337
1431	Constancia del Rosario	20	2020-09-25 01:51:12.892684	2020-09-25 01:51:12.892684
1432	Mesones Hidalgo	20	2020-09-25 01:51:12.895553	2020-09-25 01:51:12.895553
1433	Santa María Zacatepec	20	2020-09-25 01:51:12.898432	2020-09-25 01:51:12.898432
1434	San Pedro Amuzgos	20	2020-09-25 01:51:12.90115	2020-09-25 01:51:12.90115
1435	La Reforma	20	2020-09-25 01:51:12.904264	2020-09-25 01:51:12.904264
1436	Santa María Ipalapa	20	2020-09-25 01:51:12.907475	2020-09-25 01:51:12.907475
1437	Chalcatongo de Hidalgo	20	2020-09-25 01:51:12.910768	2020-09-25 01:51:12.910768
1438	Santa María Yucuhiti	20	2020-09-25 01:51:12.913955	2020-09-25 01:51:12.913955
1439	San Esteban Atatlahuca	20	2020-09-25 01:51:12.917083	2020-09-25 01:51:12.917083
1440	Santa Catarina Ticuá	20	2020-09-25 01:51:12.919849	2020-09-25 01:51:12.919849
1441	Santiago Nuyoó	20	2020-09-25 01:51:12.922548	2020-09-25 01:51:12.922548
1442	Santa Catarina Yosonotú	20	2020-09-25 01:51:12.924965	2020-09-25 01:51:12.924965
1443	San Miguel el Grande	20	2020-09-25 01:51:12.927637	2020-09-25 01:51:12.927637
1444	Santo Domingo Ixcatlán	20	2020-09-25 01:51:12.931728	2020-09-25 01:51:12.931728
1445	San Pablo Tijaltepec	20	2020-09-25 01:51:12.934876	2020-09-25 01:51:12.934876
1446	Santa Cruz Tacahua	20	2020-09-25 01:51:12.937646	2020-09-25 01:51:12.937646
1447	Santa Lucía Monteverde	20	2020-09-25 01:51:12.940769	2020-09-25 01:51:12.940769
1448	San Andrés Cabecera Nueva	20	2020-09-25 01:51:12.9439	2020-09-25 01:51:12.9439
1449	Santa María Yolotepec	20	2020-09-25 01:51:12.946766	2020-09-25 01:51:12.946766
1450	Santiago Yosondúa	20	2020-09-25 01:51:12.949367	2020-09-25 01:51:12.949367
1451	Santa Cruz Itundujia	20	2020-09-25 01:51:12.952301	2020-09-25 01:51:12.952301
1452	Zimatlán de Álvarez	20	2020-09-25 01:51:12.955045	2020-09-25 01:51:12.955045
1453	San Bernardo Mixtepec	20	2020-09-25 01:51:12.957747	2020-09-25 01:51:12.957747
1454	Santa Cruz Mixtepec	20	2020-09-25 01:51:12.960317	2020-09-25 01:51:12.960317
1455	San Miguel Mixtepec	20	2020-09-25 01:51:12.964909	2020-09-25 01:51:12.964909
1456	Santa María Atzompa	20	2020-09-25 01:51:12.96794	2020-09-25 01:51:12.96794
1457	San Andrés Ixtlahuaca	20	2020-09-25 01:51:12.970778	2020-09-25 01:51:12.970778
1458	Santa Cruz Amilpas	20	2020-09-25 01:51:12.974685	2020-09-25 01:51:12.974685
1459	Santa Cruz Xoxocotlán	20	2020-09-25 01:51:12.980414	2020-09-25 01:51:12.980414
1460	Santa Lucía del Camino	20	2020-09-25 01:51:12.98329	2020-09-25 01:51:12.98329
1461	San Pedro Ixtlahuaca	20	2020-09-25 01:51:12.985957	2020-09-25 01:51:12.985957
1462	San Antonio de la Cal	20	2020-09-25 01:51:12.988711	2020-09-25 01:51:12.988711
1463	San Agustín de las Juntas	20	2020-09-25 01:51:12.99124	2020-09-25 01:51:12.99124
1464	San Pablo Huixtepec	20	2020-09-25 01:51:12.994422	2020-09-25 01:51:12.994422
1465	Ánimas Trujano	20	2020-09-25 01:51:12.998484	2020-09-25 01:51:12.998484
1466	San Jacinto Tlacotepec	20	2020-09-25 01:51:13.001697	2020-09-25 01:51:13.001697
1467	San Raymundo Jalpan	20	2020-09-25 01:51:13.004699	2020-09-25 01:51:13.004699
1468	Trinidad Zaachila	20	2020-09-25 01:51:13.007465	2020-09-25 01:51:13.007465
1469	Santa María Coyotepec	20	2020-09-25 01:51:13.010155	2020-09-25 01:51:13.010155
1470	San Bartolo Coyotepec	20	2020-09-25 01:51:13.013738	2020-09-25 01:51:13.013738
1471	Santa Inés Yatzeche	20	2020-09-25 01:51:13.016721	2020-09-25 01:51:13.016721
1472	Ciénega de Zimatlán	20	2020-09-25 01:51:13.019579	2020-09-25 01:51:13.019579
1473	San Antonio Huitepec	20	2020-09-25 01:51:13.022481	2020-09-25 01:51:13.022481
1474	Villa de Zaachila	20	2020-09-25 01:51:13.026215	2020-09-25 01:51:13.026215
1475	San Sebastián Tutla	20	2020-09-25 01:51:13.029452	2020-09-25 01:51:13.029452
1476	San Miguel Peras	20	2020-09-25 01:51:13.032247	2020-09-25 01:51:13.032247
1477	San Pablo Cuatro Venados	20	2020-09-25 01:51:13.034952	2020-09-25 01:51:13.034952
1478	Santa Inés del Monte	20	2020-09-25 01:51:13.03801	2020-09-25 01:51:13.03801
1479	Santa Gertrudis	20	2020-09-25 01:51:13.040747	2020-09-25 01:51:13.040747
1480	San Antonino el Alto	20	2020-09-25 01:51:13.043377	2020-09-25 01:51:13.043377
1481	Magdalena Mixtepec	20	2020-09-25 01:51:13.046681	2020-09-25 01:51:13.046681
1482	Santa Catarina Quiané	20	2020-09-25 01:51:13.049689	2020-09-25 01:51:13.049689
1483	Ayoquezco de Aldama	20	2020-09-25 01:51:13.052632	2020-09-25 01:51:13.052632
1484	Santa Ana Tlapacoyan	20	2020-09-25 01:51:13.055259	2020-09-25 01:51:13.055259
1485	Santa Cruz Zenzontepec	20	2020-09-25 01:51:13.06137	2020-09-25 01:51:13.06137
1486	San Francisco Cahuacuá	20	2020-09-25 01:51:13.064607	2020-09-25 01:51:13.064607
1487	San Mateo Yucutindoo	20	2020-09-25 01:51:13.067151	2020-09-25 01:51:13.067151
1488	Santiago Textitlán	20	2020-09-25 01:51:13.069711	2020-09-25 01:51:13.069711
1489	Santiago Amoltepec	20	2020-09-25 01:51:13.072206	2020-09-25 01:51:13.072206
1490	Santa María Zaniza	20	2020-09-25 01:51:13.074792	2020-09-25 01:51:13.074792
1491	Santo Domingo Teojomulco	20	2020-09-25 01:51:13.077594	2020-09-25 01:51:13.077594
1492	Cuilápam de Guerrero	20	2020-09-25 01:51:13.081086	2020-09-25 01:51:13.081086
1493	Villa Sola de Vega	20	2020-09-25 01:51:13.084305	2020-09-25 01:51:13.084305
1494	Santa María Lachixío	20	2020-09-25 01:51:13.086953	2020-09-25 01:51:13.086953
1495	San Vicente Lachixío	20	2020-09-25 01:51:13.089702	2020-09-25 01:51:13.089702
1496	San Lorenzo Texmelúcan	20	2020-09-25 01:51:13.092954	2020-09-25 01:51:13.092954
1497	Santa María Sola	20	2020-09-25 01:51:13.096154	2020-09-25 01:51:13.096154
1498	San Francisco Sola	20	2020-09-25 01:51:13.099064	2020-09-25 01:51:13.099064
1499	San Ildefonso Sola	20	2020-09-25 01:51:13.101933	2020-09-25 01:51:13.101933
1500	Santiago Minas	20	2020-09-25 01:51:13.104858	2020-09-25 01:51:13.104858
1501	Heroica Ciudad de Ejutla de Crespo	20	2020-09-25 01:51:13.108179	2020-09-25 01:51:13.108179
1502	San Martín Tilcajete	20	2020-09-25 01:51:13.111093	2020-09-25 01:51:13.111093
1503	Santo Tomás Jalieza	20	2020-09-25 01:51:13.114417	2020-09-25 01:51:13.114417
1504	San Juan Chilateca	20	2020-09-25 01:51:13.117175	2020-09-25 01:51:13.117175
1505	Ocotlán de Morelos	20	2020-09-25 01:51:13.119811	2020-09-25 01:51:13.119811
1506	Santa Ana Zegache	20	2020-09-25 01:51:13.122902	2020-09-25 01:51:13.122902
1507	Santiago Apóstol	20	2020-09-25 01:51:13.126474	2020-09-25 01:51:13.126474
1508	San Antonino Castillo Velasco	20	2020-09-25 01:51:13.12998	2020-09-25 01:51:13.12998
1509	Asunción Ocotlán	20	2020-09-25 01:51:13.133059	2020-09-25 01:51:13.133059
1510	San Pedro Mártir	20	2020-09-25 01:51:13.135721	2020-09-25 01:51:13.135721
1511	San Dionisio Ocotlán	20	2020-09-25 01:51:13.138386	2020-09-25 01:51:13.138386
1512	Magdalena Ocotlán	20	2020-09-25 01:51:13.142502	2020-09-25 01:51:13.142502
1513	San Miguel Tilquiápam	20	2020-09-25 01:51:13.146492	2020-09-25 01:51:13.146492
1514	Santa Catarina Minas	20	2020-09-25 01:51:13.149412	2020-09-25 01:51:13.149412
1515	San Baltazar Chichicápam	20	2020-09-25 01:51:13.152173	2020-09-25 01:51:13.152173
1516	San Pedro Apóstol	20	2020-09-25 01:51:13.154639	2020-09-25 01:51:13.154639
1517	Santa Lucía Ocotlán	20	2020-09-25 01:51:13.158077	2020-09-25 01:51:13.158077
1518	San Jerónimo Taviche	20	2020-09-25 01:51:13.162	2020-09-25 01:51:13.162
1519	San Andrés Zabache	20	2020-09-25 01:51:13.165349	2020-09-25 01:51:13.165349
1520	San José del Progreso	20	2020-09-25 01:51:13.168438	2020-09-25 01:51:13.168438
1521	Yaxe	20	2020-09-25 01:51:13.17123	2020-09-25 01:51:13.17123
1522	San Pedro Taviche	20	2020-09-25 01:51:13.173961	2020-09-25 01:51:13.173961
1523	San Martín de los Cansecos	20	2020-09-25 01:51:13.176482	2020-09-25 01:51:13.176482
1524	San Martín Lachilá	20	2020-09-25 01:51:13.17985	2020-09-25 01:51:13.17985
1525	La Pe	20	2020-09-25 01:51:13.18325	2020-09-25 01:51:13.18325
1526	La Compañía	20	2020-09-25 01:51:13.186624	2020-09-25 01:51:13.186624
1527	Coatecas Altas	20	2020-09-25 01:51:13.189769	2020-09-25 01:51:13.189769
1528	San Juan Lachigalla	20	2020-09-25 01:51:13.193422	2020-09-25 01:51:13.193422
1529	San Agustín Amatengo	20	2020-09-25 01:51:13.196647	2020-09-25 01:51:13.196647
1530	Taniche	20	2020-09-25 01:51:13.199331	2020-09-25 01:51:13.199331
1531	San Miguel Ejutla	20	2020-09-25 01:51:13.202134	2020-09-25 01:51:13.202134
1532	Yogana	20	2020-09-25 01:51:13.205007	2020-09-25 01:51:13.205007
1533	San Vicente Coatlán	20	2020-09-25 01:51:13.208222	2020-09-25 01:51:13.208222
1534	Santiago Pinotepa Nacional	20	2020-09-25 01:51:13.211876	2020-09-25 01:51:13.211876
1535	San Juan Cacahuatepec	20	2020-09-25 01:51:13.214762	2020-09-25 01:51:13.214762
1536	San Juan Bautista Lo de Soto	20	2020-09-25 01:51:13.217932	2020-09-25 01:51:13.217932
1537	Mártires de Tacubaya	20	2020-09-25 01:51:13.221553	2020-09-25 01:51:13.221553
1538	San Sebastián Ixcapa	20	2020-09-25 01:51:13.224819	2020-09-25 01:51:13.224819
1539	San Antonio Tepetlapa	20	2020-09-25 01:51:13.227861	2020-09-25 01:51:13.227861
1540	Santa María Cortijo	20	2020-09-25 01:51:13.230901	2020-09-25 01:51:13.230901
1541	Santiago Llano Grande	20	2020-09-25 01:51:13.233863	2020-09-25 01:51:13.233863
1542	San Miguel Tlacamama	20	2020-09-25 01:51:13.236406	2020-09-25 01:51:13.236406
1543	Santiago Tapextla	20	2020-09-25 01:51:13.238977	2020-09-25 01:51:13.238977
1544	San José Estancia Grande	20	2020-09-25 01:51:13.241948	2020-09-25 01:51:13.241948
1545	Santo Domingo Armenta	20	2020-09-25 01:51:13.24484	2020-09-25 01:51:13.24484
1546	Santiago Jamiltepec	20	2020-09-25 01:51:13.248061	2020-09-25 01:51:13.248061
1547	San Pedro Atoyac	20	2020-09-25 01:51:13.251025	2020-09-25 01:51:13.251025
1548	San Juan Colorado	20	2020-09-25 01:51:13.253817	2020-09-25 01:51:13.253817
1549	Santiago Ixtayutla	20	2020-09-25 01:51:13.256696	2020-09-25 01:51:13.256696
1550	San Pedro Jicayán	20	2020-09-25 01:51:13.260444	2020-09-25 01:51:13.260444
1551	Pinotepa de Don Luis	20	2020-09-25 01:51:13.264198	2020-09-25 01:51:13.264198
1552	San Lorenzo	20	2020-09-25 01:51:13.267081	2020-09-25 01:51:13.267081
1553	San Agustín Chayuco	20	2020-09-25 01:51:13.269833	2020-09-25 01:51:13.269833
1554	San Andrés Huaxpaltepec	20	2020-09-25 01:51:13.272591	2020-09-25 01:51:13.272591
1555	Santa Catarina Mechoacán	20	2020-09-25 01:51:13.276189	2020-09-25 01:51:13.276189
1556	Santiago Tetepec	20	2020-09-25 01:51:13.279425	2020-09-25 01:51:13.279425
1557	Santa María Huazolotitlán	20	2020-09-25 01:51:13.282256	2020-09-25 01:51:13.282256
1558	Villa de Tututepec de Melchor Ocampo	20	2020-09-25 01:51:13.284972	2020-09-25 01:51:13.284972
1559	Tataltepec de Valdés	20	2020-09-25 01:51:13.287642	2020-09-25 01:51:13.287642
1560	San Juan Quiahije	20	2020-09-25 01:51:13.290616	2020-09-25 01:51:13.290616
1561	San Miguel Panixtlahuaca	20	2020-09-25 01:51:13.293908	2020-09-25 01:51:13.293908
1562	Santa Catarina Juquila	20	2020-09-25 01:51:13.298403	2020-09-25 01:51:13.298403
1563	San Pedro Juchatengo	20	2020-09-25 01:51:13.301288	2020-09-25 01:51:13.301288
1564	Santiago Yaitepec	20	2020-09-25 01:51:13.304049	2020-09-25 01:51:13.304049
1565	San Juan Lachao	20	2020-09-25 01:51:13.307582	2020-09-25 01:51:13.307582
1566	Santa María Temaxcaltepec	20	2020-09-25 01:51:13.311223	2020-09-25 01:51:13.311223
1567	Santos Reyes Nopala	20	2020-09-25 01:51:13.314581	2020-09-25 01:51:13.314581
1568	San Gabriel Mixtepec	20	2020-09-25 01:51:13.317371	2020-09-25 01:51:13.317371
1569	San Pedro Mixtepec -Dto. 22 -	20	2020-09-25 01:51:13.319942	2020-09-25 01:51:13.319942
1570	Ahuazotepec	21	2020-09-25 01:51:13.322782	2020-09-25 01:51:13.322782
1571	Puebla	21	2020-09-25 01:51:13.32642	2020-09-25 01:51:13.32642
1572	Tlaltenango	21	2020-09-25 01:51:13.329825	2020-09-25 01:51:13.329825
1573	San Miguel Xoxtla	21	2020-09-25 01:51:13.332966	2020-09-25 01:51:13.332966
1574	Juan C. Bonilla	21	2020-09-25 01:51:13.336029	2020-09-25 01:51:13.336029
1575	Coronango	21	2020-09-25 01:51:13.338765	2020-09-25 01:51:13.338765
1576	Cuautlancingo	21	2020-09-25 01:51:13.341616	2020-09-25 01:51:13.341616
1577	San Pedro Cholula	21	2020-09-25 01:51:13.344569	2020-09-25 01:51:13.344569
1578	San Andrés Cholula	21	2020-09-25 01:51:13.348123	2020-09-25 01:51:13.348123
1579	Ocoyucan	21	2020-09-25 01:51:13.350934	2020-09-25 01:51:13.350934
1580	Amozoc	21	2020-09-25 01:51:13.35397	2020-09-25 01:51:13.35397
1581	Francisco Z. Mena	21	2020-09-25 01:51:13.357272	2020-09-25 01:51:13.357272
1582	Pantepec	21	2020-09-25 01:51:13.361051	2020-09-25 01:51:13.361051
1583	Venustiano Carranza	21	2020-09-25 01:51:13.363956	2020-09-25 01:51:13.363956
1584	Jalpan	21	2020-09-25 01:51:13.366846	2020-09-25 01:51:13.366846
1585	Tlaxco	21	2020-09-25 01:51:13.369527	2020-09-25 01:51:13.369527
1586	Tlacuilotepec	21	2020-09-25 01:51:13.372571	2020-09-25 01:51:13.372571
1587	Xicotepec	21	2020-09-25 01:51:13.375235	2020-09-25 01:51:13.375235
1588	Pahuatlán	21	2020-09-25 01:51:13.378833	2020-09-25 01:51:13.378833
1589	Honey	21	2020-09-25 01:51:13.382768	2020-09-25 01:51:13.382768
1591	Huauchinango	21	2020-09-25 01:51:13.388291	2020-09-25 01:51:13.388291
1592	Juan Galindo	21	2020-09-25 01:51:13.391248	2020-09-25 01:51:13.391248
1593	Tlaola	21	2020-09-25 01:51:13.394814	2020-09-25 01:51:13.394814
1594	Zihuateutla	21	2020-09-25 01:51:13.397903	2020-09-25 01:51:13.397903
1595	Jopala	21	2020-09-25 01:51:13.400699	2020-09-25 01:51:13.400699
1596	Tlapacoya	21	2020-09-25 01:51:13.403302	2020-09-25 01:51:13.403302
1597	Chignahuapan	21	2020-09-25 01:51:13.406046	2020-09-25 01:51:13.406046
1598	Zacatlán	21	2020-09-25 01:51:13.408919	2020-09-25 01:51:13.408919
1599	Chiconcuautla	21	2020-09-25 01:51:13.412451	2020-09-25 01:51:13.412451
1600	Ahuacatlán	21	2020-09-25 01:51:13.415756	2020-09-25 01:51:13.415756
1601	Tepetzintla	21	2020-09-25 01:51:13.41857	2020-09-25 01:51:13.41857
1602	San Felipe Tepatlán	21	2020-09-25 01:51:13.421462	2020-09-25 01:51:13.421462
1603	Amixtlán	21	2020-09-25 01:51:13.424598	2020-09-25 01:51:13.424598
1604	Tepango de Rodríguez	21	2020-09-25 01:51:13.427971	2020-09-25 01:51:13.427971
1605	Zongozotla	21	2020-09-25 01:51:13.431247	2020-09-25 01:51:13.431247
1606	Hermenegildo Galeana	21	2020-09-25 01:51:13.434574	2020-09-25 01:51:13.434574
1607	Olintla	21	2020-09-25 01:51:13.437256	2020-09-25 01:51:13.437256
1608	Coatepec	21	2020-09-25 01:51:13.440437	2020-09-25 01:51:13.440437
1609	Camocuautla	21	2020-09-25 01:51:13.444762	2020-09-25 01:51:13.444762
1610	Hueytlalpan	21	2020-09-25 01:51:13.447807	2020-09-25 01:51:13.447807
1611	Zapotitlán de Méndez	21	2020-09-25 01:51:13.450621	2020-09-25 01:51:13.450621
1612	Huitzilan de Serdán	21	2020-09-25 01:51:13.453244	2020-09-25 01:51:13.453244
1613	Xochitlán de Vicente Suárez	21	2020-09-25 01:51:13.456298	2020-09-25 01:51:13.456298
1614	Huehuetla	21	2020-09-25 01:51:13.459058	2020-09-25 01:51:13.459058
1615	Ixtepec	21	2020-09-25 01:51:13.462406	2020-09-25 01:51:13.462406
1616	Atlequizayan	21	2020-09-25 01:51:13.465505	2020-09-25 01:51:13.465505
1617	Tenampulco	21	2020-09-25 01:51:13.468362	2020-09-25 01:51:13.468362
1618	Tuzamapan de Galeana	21	2020-09-25 01:51:13.471093	2020-09-25 01:51:13.471093
1619	Caxhuacan	21	2020-09-25 01:51:13.474596	2020-09-25 01:51:13.474596
1620	Jonotla	21	2020-09-25 01:51:13.478058	2020-09-25 01:51:13.478058
1621	Zoquiapan	21	2020-09-25 01:51:13.483509	2020-09-25 01:51:13.483509
1622	Nauzontla	21	2020-09-25 01:51:13.486598	2020-09-25 01:51:13.486598
1623	Cuetzalan del Progreso	21	2020-09-25 01:51:13.489212	2020-09-25 01:51:13.489212
1624	Ayotoxco de Guerrero	21	2020-09-25 01:51:13.491801	2020-09-25 01:51:13.491801
1625	Hueytamalco	21	2020-09-25 01:51:13.494929	2020-09-25 01:51:13.494929
1626	Acateno	21	2020-09-25 01:51:13.498287	2020-09-25 01:51:13.498287
1627	Cuautempan	21	2020-09-25 01:51:13.501042	2020-09-25 01:51:13.501042
1628	Aquixtla	21	2020-09-25 01:51:13.504066	2020-09-25 01:51:13.504066
1629	Tetela de Ocampo	21	2020-09-25 01:51:13.507442	2020-09-25 01:51:13.507442
1630	Xochiapulco	21	2020-09-25 01:51:13.510834	2020-09-25 01:51:13.510834
1631	Zacapoaxtla	21	2020-09-25 01:51:13.513961	2020-09-25 01:51:13.513961
1632	Zaragoza	21	2020-09-25 01:51:13.517826	2020-09-25 01:51:13.517826
1633	Ixtacamaxtitlán	21	2020-09-25 01:51:13.52086	2020-09-25 01:51:13.52086
1634	Zautla	21	2020-09-25 01:51:13.523997	2020-09-25 01:51:13.523997
1635	Ocotepec	21	2020-09-25 01:51:13.527641	2020-09-25 01:51:13.527641
1636	Libres	21	2020-09-25 01:51:13.530729	2020-09-25 01:51:13.530729
1637	Teziutlán	21	2020-09-25 01:51:13.533675	2020-09-25 01:51:13.533675
1638	Tlatlauquitepec	21	2020-09-25 01:51:13.536656	2020-09-25 01:51:13.536656
1639	Yaonáhuac	21	2020-09-25 01:51:13.539911	2020-09-25 01:51:13.539911
1640	Hueyapan	21	2020-09-25 01:51:13.544131	2020-09-25 01:51:13.544131
1641	Teteles de Avila Castillo	21	2020-09-25 01:51:13.547299	2020-09-25 01:51:13.547299
1642	Atempan	21	2020-09-25 01:51:13.550548	2020-09-25 01:51:13.550548
1643	Chignautla	21	2020-09-25 01:51:13.553315	2020-09-25 01:51:13.553315
1644	Xiutetelco	21	2020-09-25 01:51:13.556467	2020-09-25 01:51:13.556467
1645	Cuyoaco	21	2020-09-25 01:51:13.560792	2020-09-25 01:51:13.560792
1646	Tepeyahualco	21	2020-09-25 01:51:13.564338	2020-09-25 01:51:13.564338
1647	San Martín Texmelucan	21	2020-09-25 01:51:13.567384	2020-09-25 01:51:13.567384
1648	Tlahuapan	21	2020-09-25 01:51:13.570612	2020-09-25 01:51:13.570612
1649	San Matías Tlalancaleca	21	2020-09-25 01:51:13.573981	2020-09-25 01:51:13.573981
1650	San Salvador el Verde	21	2020-09-25 01:51:13.577159	2020-09-25 01:51:13.577159
1651	San Felipe Teotlalcingo	21	2020-09-25 01:51:13.580435	2020-09-25 01:51:13.580435
1652	Chiautzingo	21	2020-09-25 01:51:13.583886	2020-09-25 01:51:13.583886
1653	Huejotzingo	21	2020-09-25 01:51:13.586862	2020-09-25 01:51:13.586862
1654	Domingo Arenas	21	2020-09-25 01:51:13.596676	2020-09-25 01:51:13.596676
1655	Calpan	21	2020-09-25 01:51:13.600092	2020-09-25 01:51:13.600092
1656	San Nicolás de los Ranchos	21	2020-09-25 01:51:13.603223	2020-09-25 01:51:13.603223
1657	Atlixco	21	2020-09-25 01:51:13.606146	2020-09-25 01:51:13.606146
1658	Nealtican	21	2020-09-25 01:51:13.60941	2020-09-25 01:51:13.60941
1659	San Jerónimo Tecuanipan	21	2020-09-25 01:51:13.613016	2020-09-25 01:51:13.613016
1660	San Gregorio Atzompa	21	2020-09-25 01:51:13.616041	2020-09-25 01:51:13.616041
1661	Tochimilco	21	2020-09-25 01:51:13.618625	2020-09-25 01:51:13.618625
1662	Tianguismanalco	21	2020-09-25 01:51:13.621188	2020-09-25 01:51:13.621188
1663	Santa Isabel Cholula	21	2020-09-25 01:51:13.624808	2020-09-25 01:51:13.624808
1664	Huaquechula	21	2020-09-25 01:51:13.627826	2020-09-25 01:51:13.627826
1665	San Diego la Mesa Tochimiltzingo	21	2020-09-25 01:51:13.630749	2020-09-25 01:51:13.630749
1666	Tepeojuma	21	2020-09-25 01:51:13.633503	2020-09-25 01:51:13.633503
1667	Izúcar de Matamoros	21	2020-09-25 01:51:13.636231	2020-09-25 01:51:13.636231
1668	Atzitzihuacán	21	2020-09-25 01:51:13.638749	2020-09-25 01:51:13.638749
1669	Acteopan	21	2020-09-25 01:51:13.641383	2020-09-25 01:51:13.641383
1670	Cohuecan	21	2020-09-25 01:51:13.644922	2020-09-25 01:51:13.644922
1671	Tepemaxalco	21	2020-09-25 01:51:13.647946	2020-09-25 01:51:13.647946
1672	Tlapanalá	21	2020-09-25 01:51:13.650562	2020-09-25 01:51:13.650562
1673	Tepexco	21	2020-09-25 01:51:13.653583	2020-09-25 01:51:13.653583
1674	Tilapa	21	2020-09-25 01:51:13.656374	2020-09-25 01:51:13.656374
1675	Chietla	21	2020-09-25 01:51:13.660725	2020-09-25 01:51:13.660725
1676	Atzala	21	2020-09-25 01:51:13.664235	2020-09-25 01:51:13.664235
1677	Teopantlán	21	2020-09-25 01:51:13.667154	2020-09-25 01:51:13.667154
1678	San Martín Totoltepec	21	2020-09-25 01:51:13.669708	2020-09-25 01:51:13.669708
1679	Xochiltepec	21	2020-09-25 01:51:13.672464	2020-09-25 01:51:13.672464
1680	Epatlán	21	2020-09-25 01:51:13.675154	2020-09-25 01:51:13.675154
1681	Ahuatlán	21	2020-09-25 01:51:13.678642	2020-09-25 01:51:13.678642
1682	Coatzingo	21	2020-09-25 01:51:13.681892	2020-09-25 01:51:13.681892
1683	Santa Catarina Tlaltempan	21	2020-09-25 01:51:13.684834	2020-09-25 01:51:13.684834
1684	Chigmecatitlán	21	2020-09-25 01:51:13.68815	2020-09-25 01:51:13.68815
1685	Zacapala	21	2020-09-25 01:51:13.691464	2020-09-25 01:51:13.691464
1686	Tepexi de Rodríguez	21	2020-09-25 01:51:13.694691	2020-09-25 01:51:13.694691
1687	Teotlalco	21	2020-09-25 01:51:13.697736	2020-09-25 01:51:13.697736
1688	Jolalpan	21	2020-09-25 01:51:13.700491	2020-09-25 01:51:13.700491
1689	Huehuetlán el Chico	21	2020-09-25 01:51:13.702989	2020-09-25 01:51:13.702989
1690	Chiautla	21	2020-09-25 01:51:13.705536	2020-09-25 01:51:13.705536
1691	Cohetzala	21	2020-09-25 01:51:13.708141	2020-09-25 01:51:13.708141
1692	Xicotlán	21	2020-09-25 01:51:13.710997	2020-09-25 01:51:13.710997
1693	Chila de la Sal	21	2020-09-25 01:51:13.714038	2020-09-25 01:51:13.714038
1694	Ixcamilpa de Guerrero	21	2020-09-25 01:51:13.716631	2020-09-25 01:51:13.716631
1695	Albino Zertuche	21	2020-09-25 01:51:13.71943	2020-09-25 01:51:13.71943
1696	Tulcingo	21	2020-09-25 01:51:13.722135	2020-09-25 01:51:13.722135
1697	Tehuitzingo	21	2020-09-25 01:51:13.725155	2020-09-25 01:51:13.725155
1698	Cuayuca de Andrade	21	2020-09-25 01:51:13.729218	2020-09-25 01:51:13.729218
1699	Santa Inés Ahuatempan	21	2020-09-25 01:51:13.73228	2020-09-25 01:51:13.73228
1700	Axutla	21	2020-09-25 01:51:13.735089	2020-09-25 01:51:13.735089
1701	Chinantla	21	2020-09-25 01:51:13.737715	2020-09-25 01:51:13.737715
1702	Ahuehuetitla	21	2020-09-25 01:51:13.741016	2020-09-25 01:51:13.741016
1703	San Pablo Anicano	21	2020-09-25 01:51:13.745914	2020-09-25 01:51:13.745914
1704	Tecomatlán	21	2020-09-25 01:51:13.748949	2020-09-25 01:51:13.748949
1705	Piaxtla	21	2020-09-25 01:51:13.751703	2020-09-25 01:51:13.751703
1706	Guadalupe	21	2020-09-25 01:51:13.75439	2020-09-25 01:51:13.75439
1707	Ixcaquixtla	21	2020-09-25 01:51:13.757012	2020-09-25 01:51:13.757012
1708	Coyotepec	21	2020-09-25 01:51:13.759778	2020-09-25 01:51:13.759778
1709	Xayacatlán de Bravo	21	2020-09-25 01:51:13.764182	2020-09-25 01:51:13.764182
1710	Totoltepec de Guerrero	21	2020-09-25 01:51:13.767274	2020-09-25 01:51:13.767274
1711	Acatlán	21	2020-09-25 01:51:13.770055	2020-09-25 01:51:13.770055
1712	San Jerónimo Xayacatlán	21	2020-09-25 01:51:13.772946	2020-09-25 01:51:13.772946
1713	San Pedro Yeloixtlahuaca	21	2020-09-25 01:51:13.776771	2020-09-25 01:51:13.776771
1714	Petlalcingo	21	2020-09-25 01:51:13.779967	2020-09-25 01:51:13.779967
1715	San Miguel Ixitlán	21	2020-09-25 01:51:13.782703	2020-09-25 01:51:13.782703
1716	Chila	21	2020-09-25 01:51:13.785413	2020-09-25 01:51:13.785413
1717	Rafael Lara Grajales	21	2020-09-25 01:51:13.788098	2020-09-25 01:51:13.788098
1718	San José Chiapa	21	2020-09-25 01:51:13.790702	2020-09-25 01:51:13.790702
1719	Oriental	21	2020-09-25 01:51:13.793654	2020-09-25 01:51:13.793654
1720	San Nicolás Buenos Aires	21	2020-09-25 01:51:13.796354	2020-09-25 01:51:13.796354
1721	Guadalupe Victoria	21	2020-09-25 01:51:13.79883	2020-09-25 01:51:13.79883
1722	Tlachichuca	21	2020-09-25 01:51:13.801734	2020-09-25 01:51:13.801734
1723	Lafragua	21	2020-09-25 01:51:13.805882	2020-09-25 01:51:13.805882
1724	Chilchotla	21	2020-09-25 01:51:13.808835	2020-09-25 01:51:13.808835
1725	Quimixtlán	21	2020-09-25 01:51:13.812548	2020-09-25 01:51:13.812548
1726	Chichiquila	21	2020-09-25 01:51:13.815612	2020-09-25 01:51:13.815612
1727	Tepatlaxco de Hidalgo	21	2020-09-25 01:51:13.818353	2020-09-25 01:51:13.818353
1728	Acajete	21	2020-09-25 01:51:13.820992	2020-09-25 01:51:13.820992
1729	Nopalucan	21	2020-09-25 01:51:13.823933	2020-09-25 01:51:13.823933
1730	Mazapiltepec de Juárez	21	2020-09-25 01:51:13.827799	2020-09-25 01:51:13.827799
1731	Soltepec	21	2020-09-25 01:51:13.830601	2020-09-25 01:51:13.830601
1732	Acatzingo	21	2020-09-25 01:51:13.833526	2020-09-25 01:51:13.833526
1733	San Salvador el Seco	21	2020-09-25 01:51:13.836279	2020-09-25 01:51:13.836279
1734	General Felipe Ángeles	21	2020-09-25 01:51:13.838805	2020-09-25 01:51:13.838805
1735	Aljojuca	21	2020-09-25 01:51:13.84214	2020-09-25 01:51:13.84214
1736	San Juan Atenco	21	2020-09-25 01:51:13.846232	2020-09-25 01:51:13.846232
1737	Tepeaca	21	2020-09-25 01:51:13.849717	2020-09-25 01:51:13.849717
1738	Cuautinchán	21	2020-09-25 01:51:13.852627	2020-09-25 01:51:13.852627
1739	Tecali de Herrera	21	2020-09-25 01:51:13.855383	2020-09-25 01:51:13.855383
1740	Mixtla	21	2020-09-25 01:51:13.858546	2020-09-25 01:51:13.858546
1741	Santo Tomás Hueyotlipan	21	2020-09-25 01:51:13.862244	2020-09-25 01:51:13.862244
1742	Tzicatlacoyan	21	2020-09-25 01:51:13.865366	2020-09-25 01:51:13.865366
1743	Huehuetlán el Grande	21	2020-09-25 01:51:13.868312	2020-09-25 01:51:13.868312
1744	La Magdalena Tlatlauquitepec	21	2020-09-25 01:51:13.87131	2020-09-25 01:51:13.87131
1745	San Juan Atzompa	21	2020-09-25 01:51:13.874271	2020-09-25 01:51:13.874271
1746	Huatlatlauca	21	2020-09-25 01:51:13.877072	2020-09-25 01:51:13.877072
1747	Los Reyes de Juárez	21	2020-09-25 01:51:13.879742	2020-09-25 01:51:13.879742
1748	Cuapiaxtla de Madero	21	2020-09-25 01:51:13.882369	2020-09-25 01:51:13.882369
1749	San Salvador Huixcolotla	21	2020-09-25 01:51:13.884973	2020-09-25 01:51:13.884973
1750	Quecholac	21	2020-09-25 01:51:13.887625	2020-09-25 01:51:13.887625
1751	Tecamachalco	21	2020-09-25 01:51:13.890537	2020-09-25 01:51:13.890537
1752	Palmar de Bravo	21	2020-09-25 01:51:13.89455	2020-09-25 01:51:13.89455
1753	Chalchicomula de Sesma	21	2020-09-25 01:51:13.89784	2020-09-25 01:51:13.89784
1754	Atzitzintla	21	2020-09-25 01:51:13.900555	2020-09-25 01:51:13.900555
1755	Esperanza	21	2020-09-25 01:51:13.903273	2020-09-25 01:51:13.903273
1756	Cañada Morelos	21	2020-09-25 01:51:13.906195	2020-09-25 01:51:13.906195
1757	Tlanepantla	21	2020-09-25 01:51:13.90949	2020-09-25 01:51:13.90949
1758	Tochtepec	21	2020-09-25 01:51:13.912282	2020-09-25 01:51:13.912282
1759	Atoyatempan	21	2020-09-25 01:51:13.915064	2020-09-25 01:51:13.915064
1760	Tepeyahualco de Cuauhtémoc	21	2020-09-25 01:51:13.917829	2020-09-25 01:51:13.917829
1761	Huitziltepec	21	2020-09-25 01:51:13.920413	2020-09-25 01:51:13.920413
1762	Molcaxac	21	2020-09-25 01:51:13.923222	2020-09-25 01:51:13.923222
1763	Xochitlán Todos Santos	21	2020-09-25 01:51:13.927035	2020-09-25 01:51:13.927035
1764	Yehualtepec	21	2020-09-25 01:51:13.930541	2020-09-25 01:51:13.930541
1765	Tlacotepec de Benito Juárez	21	2020-09-25 01:51:13.933631	2020-09-25 01:51:13.933631
1766	Juan N. Méndez	21	2020-09-25 01:51:13.936441	2020-09-25 01:51:13.936441
1767	Tehuacán	21	2020-09-25 01:51:13.939093	2020-09-25 01:51:13.939093
1768	Tepanco de López	21	2020-09-25 01:51:13.942428	2020-09-25 01:51:13.942428
1769	Chapulco	21	2020-09-25 01:51:13.945931	2020-09-25 01:51:13.945931
1770	Santiago Miahuatlán	21	2020-09-25 01:51:13.948776	2020-09-25 01:51:13.948776
1771	Nicolás Bravo	21	2020-09-25 01:51:13.952415	2020-09-25 01:51:13.952415
1772	Atexcal	21	2020-09-25 01:51:13.956619	2020-09-25 01:51:13.956619
1773	San Antonio Cañada	21	2020-09-25 01:51:13.960219	2020-09-25 01:51:13.960219
1774	Zapotitlán	21	2020-09-25 01:51:13.963278	2020-09-25 01:51:13.963278
1775	San Gabriel Chilac	21	2020-09-25 01:51:13.966428	2020-09-25 01:51:13.966428
1776	Caltepec	21	2020-09-25 01:51:13.96948	2020-09-25 01:51:13.96948
1777	Vicente Guerrero	21	2020-09-25 01:51:13.972906	2020-09-25 01:51:13.972906
1778	Ajalpan	21	2020-09-25 01:51:13.976679	2020-09-25 01:51:13.976679
1779	Eloxochitlán	21	2020-09-25 01:51:13.98254	2020-09-25 01:51:13.98254
1780	Zoquitlán	21	2020-09-25 01:51:13.985316	2020-09-25 01:51:13.985316
1781	San Sebastián Tlacotepec	21	2020-09-25 01:51:13.988628	2020-09-25 01:51:13.988628
1782	Altepexi	21	2020-09-25 01:51:13.99291	2020-09-25 01:51:13.99291
1783	Zinacatepec	21	2020-09-25 01:51:13.995858	2020-09-25 01:51:13.995858
1784	San José Miahuatlán	21	2020-09-25 01:51:13.998714	2020-09-25 01:51:13.998714
1785	Coxcatlán	21	2020-09-25 01:51:14.0018	2020-09-25 01:51:14.0018
1786	Coyomeapan	21	2020-09-25 01:51:14.004591	2020-09-25 01:51:14.004591
1787	Querétaro	22	2020-09-25 01:51:14.007269	2020-09-25 01:51:14.007269
1788	El Marqués	22	2020-09-25 01:51:14.011391	2020-09-25 01:51:14.011391
1789	Colón	22	2020-09-25 01:51:14.014653	2020-09-25 01:51:14.014653
1790	Pinal de Amoles	22	2020-09-25 01:51:14.018162	2020-09-25 01:51:14.018162
1791	Jalpan de Serra	22	2020-09-25 01:51:14.021283	2020-09-25 01:51:14.021283
1792	Landa de Matamoros	22	2020-09-25 01:51:14.025203	2020-09-25 01:51:14.025203
1793	Arroyo Seco	22	2020-09-25 01:51:14.028116	2020-09-25 01:51:14.028116
1794	Peñamiller	22	2020-09-25 01:51:14.030741	2020-09-25 01:51:14.030741
1795	Cadereyta de Montes	22	2020-09-25 01:51:14.033747	2020-09-25 01:51:14.033747
1796	San Joaquín	22	2020-09-25 01:51:14.036665	2020-09-25 01:51:14.036665
1797	Tolimán	22	2020-09-25 01:51:14.039756	2020-09-25 01:51:14.039756
1798	Ezequiel Montes	22	2020-09-25 01:51:14.043133	2020-09-25 01:51:14.043133
1799	Pedro Escobedo	22	2020-09-25 01:51:14.046792	2020-09-25 01:51:14.046792
1800	Tequisquiapan	22	2020-09-25 01:51:14.049827	2020-09-25 01:51:14.049827
1801	San Juan del Río	22	2020-09-25 01:51:14.052632	2020-09-25 01:51:14.052632
1802	Amealco de Bonfil	22	2020-09-25 01:51:14.055235	2020-09-25 01:51:14.055235
1803	Corregidora	22	2020-09-25 01:51:14.059825	2020-09-25 01:51:14.059825
1804	Huimilpan	22	2020-09-25 01:51:14.063437	2020-09-25 01:51:14.063437
1805	Othón P. Blanco	23	2020-09-25 01:51:14.066205	2020-09-25 01:51:14.066205
1806	Felipe Carrillo Puerto	23	2020-09-25 01:51:14.068752	2020-09-25 01:51:14.068752
1807	Lázaro Cárdenas	23	2020-09-25 01:51:14.071503	2020-09-25 01:51:14.071503
1808	Isla Mujeres	23	2020-09-25 01:51:14.075073	2020-09-25 01:51:14.075073
1809	Benito Juárez	23	2020-09-25 01:51:14.0784	2020-09-25 01:51:14.0784
1810	Cozumel	23	2020-09-25 01:51:14.081133	2020-09-25 01:51:14.081133
1811	Solidaridad	23	2020-09-25 01:51:14.083813	2020-09-25 01:51:14.083813
1812	Tulum	23	2020-09-25 01:51:14.086826	2020-09-25 01:51:14.086826
1813	José María Morelos	23	2020-09-25 01:51:14.089887	2020-09-25 01:51:14.089887
1814	Bacalar	23	2020-09-25 01:51:14.093806	2020-09-25 01:51:14.093806
1815	San Luis Potosí	24	2020-09-25 01:51:14.097235	2020-09-25 01:51:14.097235
1816	Soledad de Graciano Sánchez	24	2020-09-25 01:51:14.100018	2020-09-25 01:51:14.100018
1817	Cerro de San Pedro	24	2020-09-25 01:51:14.103173	2020-09-25 01:51:14.103173
1818	Ahualulco	24	2020-09-25 01:51:14.10609	2020-09-25 01:51:14.10609
1819	Mexquitic de Carmona	24	2020-09-25 01:51:14.11	2020-09-25 01:51:14.11
1820	Villa de Arriaga	24	2020-09-25 01:51:14.112591	2020-09-25 01:51:14.112591
1821	Vanegas	24	2020-09-25 01:51:14.115587	2020-09-25 01:51:14.115587
1822	Cedral	24	2020-09-25 01:51:14.118762	2020-09-25 01:51:14.118762
1823	Catorce	24	2020-09-25 01:51:14.121486	2020-09-25 01:51:14.121486
1824	Charcas	24	2020-09-25 01:51:14.124362	2020-09-25 01:51:14.124362
1825	Salinas	24	2020-09-25 01:51:14.128077	2020-09-25 01:51:14.128077
1826	Santo Domingo	24	2020-09-25 01:51:14.131292	2020-09-25 01:51:14.131292
1827	Villa de Ramos	24	2020-09-25 01:51:14.134033	2020-09-25 01:51:14.134033
1828	Matehuala	24	2020-09-25 01:51:14.13678	2020-09-25 01:51:14.13678
1829	Villa de la Paz	24	2020-09-25 01:51:14.13963	2020-09-25 01:51:14.13963
1830	Villa de Guadalupe	24	2020-09-25 01:51:14.143447	2020-09-25 01:51:14.143447
1831	Guadalcázar	24	2020-09-25 01:51:14.147051	2020-09-25 01:51:14.147051
1832	Moctezuma	24	2020-09-25 01:51:14.149802	2020-09-25 01:51:14.149802
1833	Venado	24	2020-09-25 01:51:14.152802	2020-09-25 01:51:14.152802
1834	Villa de Arista	24	2020-09-25 01:51:14.155959	2020-09-25 01:51:14.155959
1835	Villa Hidalgo	24	2020-09-25 01:51:14.159163	2020-09-25 01:51:14.159163
1836	Armadillo de los Infante	24	2020-09-25 01:51:14.162408	2020-09-25 01:51:14.162408
1837	Ciudad Valles	24	2020-09-25 01:51:14.165063	2020-09-25 01:51:14.165063
1838	Ebano	24	2020-09-25 01:51:14.167703	2020-09-25 01:51:14.167703
1839	Tamuín	24	2020-09-25 01:51:14.170332	2020-09-25 01:51:14.170332
1840	El Naranjo	24	2020-09-25 01:51:14.172845	2020-09-25 01:51:14.172845
1841	Ciudad del Maíz	24	2020-09-25 01:51:14.177069	2020-09-25 01:51:14.177069
1842	Alaquines	24	2020-09-25 01:51:14.180394	2020-09-25 01:51:14.180394
1843	Cárdenas	24	2020-09-25 01:51:14.183087	2020-09-25 01:51:14.183087
1844	Cerritos	24	2020-09-25 01:51:14.185551	2020-09-25 01:51:14.185551
1845	Villa Juárez	24	2020-09-25 01:51:14.188355	2020-09-25 01:51:14.188355
1846	San Nicolás Tolentino	24	2020-09-25 01:51:14.191784	2020-09-25 01:51:14.191784
1847	Villa de Reyes	24	2020-09-25 01:51:14.19526	2020-09-25 01:51:14.19526
1848	Zaragoza	24	2020-09-25 01:51:14.198251	2020-09-25 01:51:14.198251
1849	Santa María del Río	24	2020-09-25 01:51:14.202064	2020-09-25 01:51:14.202064
1850	Tierra Nueva	24	2020-09-25 01:51:14.205523	2020-09-25 01:51:14.205523
1851	Rioverde	24	2020-09-25 01:51:14.208587	2020-09-25 01:51:14.208587
1852	Ciudad Fernández	24	2020-09-25 01:51:14.211578	2020-09-25 01:51:14.211578
1853	San Ciro de Acosta	24	2020-09-25 01:51:14.21476	2020-09-25 01:51:14.21476
1854	Tamasopo	24	2020-09-25 01:51:14.21758	2020-09-25 01:51:14.21758
1855	Rayón	24	2020-09-25 01:51:14.220585	2020-09-25 01:51:14.220585
1856	Aquismón	24	2020-09-25 01:51:14.22338	2020-09-25 01:51:14.22338
1857	Lagunillas	24	2020-09-25 01:51:14.226725	2020-09-25 01:51:14.226725
1858	Santa Catarina	24	2020-09-25 01:51:14.230226	2020-09-25 01:51:14.230226
1859	Tancanhuitz	24	2020-09-25 01:51:14.23333	2020-09-25 01:51:14.23333
1860	Tanlajás	24	2020-09-25 01:51:14.23637	2020-09-25 01:51:14.23637
1861	San Vicente Tancuayalab	24	2020-09-25 01:51:14.239377	2020-09-25 01:51:14.239377
1862	San Antonio	24	2020-09-25 01:51:14.242921	2020-09-25 01:51:14.242921
1863	Tanquián de Escobedo	24	2020-09-25 01:51:14.245809	2020-09-25 01:51:14.245809
1864	Tampamolón Corona	24	2020-09-25 01:51:14.248444	2020-09-25 01:51:14.248444
1865	Coxcatlán	24	2020-09-25 01:51:14.251149	2020-09-25 01:51:14.251149
1866	Huehuetlán	24	2020-09-25 01:51:14.25444	2020-09-25 01:51:14.25444
1867	Xilitla	24	2020-09-25 01:51:14.257607	2020-09-25 01:51:14.257607
1868	Axtla de Terrazas	24	2020-09-25 01:51:14.261554	2020-09-25 01:51:14.261554
1869	Tampacán	24	2020-09-25 01:51:14.264899	2020-09-25 01:51:14.264899
1870	San Martín Chalchicuautla	24	2020-09-25 01:51:14.267675	2020-09-25 01:51:14.267675
1871	Tamazunchale	24	2020-09-25 01:51:14.270352	2020-09-25 01:51:14.270352
1872	Matlapa	24	2020-09-25 01:51:14.274344	2020-09-25 01:51:14.274344
1873	Culiacán	25	2020-09-25 01:51:14.278692	2020-09-25 01:51:14.278692
1874	Navolato	25	2020-09-25 01:51:14.282013	2020-09-25 01:51:14.282013
1875	Badiraguato	25	2020-09-25 01:51:14.284959	2020-09-25 01:51:14.284959
1876	Cosalá	25	2020-09-25 01:51:14.287507	2020-09-25 01:51:14.287507
1877	Mocorito	25	2020-09-25 01:51:14.290427	2020-09-25 01:51:14.290427
1878	Guasave	25	2020-09-25 01:51:14.293453	2020-09-25 01:51:14.293453
1879	Ahome	25	2020-09-25 01:51:14.296689	2020-09-25 01:51:14.296689
1880	Salvador Alvarado	25	2020-09-25 01:51:14.29954	2020-09-25 01:51:14.29954
1881	Angostura	25	2020-09-25 01:51:14.302209	2020-09-25 01:51:14.302209
1882	Choix	25	2020-09-25 01:51:14.304896	2020-09-25 01:51:14.304896
1883	El Fuerte	25	2020-09-25 01:51:14.308272	2020-09-25 01:51:14.308272
1884	Sinaloa	25	2020-09-25 01:51:14.312208	2020-09-25 01:51:14.312208
1885	Mazatlán	25	2020-09-25 01:51:14.315096	2020-09-25 01:51:14.315096
1886	Escuinapa	25	2020-09-25 01:51:14.317968	2020-09-25 01:51:14.317968
1887	Concordia	25	2020-09-25 01:51:14.320722	2020-09-25 01:51:14.320722
1888	Elota	25	2020-09-25 01:51:14.323876	2020-09-25 01:51:14.323876
1889	Rosario	25	2020-09-25 01:51:14.32783	2020-09-25 01:51:14.32783
1890	San Ignacio	25	2020-09-25 01:51:14.330391	2020-09-25 01:51:14.330391
1891	Hermosillo	26	2020-09-25 01:51:14.333083	2020-09-25 01:51:14.333083
1892	San Miguel de Horcasitas	26	2020-09-25 01:51:14.336034	2020-09-25 01:51:14.336034
1893	Carbó	26	2020-09-25 01:51:14.338975	2020-09-25 01:51:14.338975
1894	San Luis Río Colorado	26	2020-09-25 01:51:14.343871	2020-09-25 01:51:14.343871
1895	Puerto Peñasco	26	2020-09-25 01:51:14.347278	2020-09-25 01:51:14.347278
1896	General Plutarco Elías Calles	26	2020-09-25 01:51:14.351235	2020-09-25 01:51:14.351235
1897	Caborca	26	2020-09-25 01:51:14.354077	2020-09-25 01:51:14.354077
1898	Altar	26	2020-09-25 01:51:14.357012	2020-09-25 01:51:14.357012
1899	Tubutama	26	2020-09-25 01:51:14.360516	2020-09-25 01:51:14.360516
1900	Atil	26	2020-09-25 01:51:14.363247	2020-09-25 01:51:14.363247
1901	Oquitoa	26	2020-09-25 01:51:14.365809	2020-09-25 01:51:14.365809
1902	Sáric	26	2020-09-25 01:51:14.368479	2020-09-25 01:51:14.368479
1903	Benjamín Hill	26	2020-09-25 01:51:14.3715	2020-09-25 01:51:14.3715
1904	Trincheras	26	2020-09-25 01:51:14.375557	2020-09-25 01:51:14.375557
1905	Pitiquito	26	2020-09-25 01:51:14.379026	2020-09-25 01:51:14.379026
1906	Nogales	26	2020-09-25 01:51:14.382132	2020-09-25 01:51:14.382132
1907	Imuris	26	2020-09-25 01:51:14.384852	2020-09-25 01:51:14.384852
1908	Santa Cruz	26	2020-09-25 01:51:14.387468	2020-09-25 01:51:14.387468
1909	Magdalena	26	2020-09-25 01:51:14.390248	2020-09-25 01:51:14.390248
1910	Naco	26	2020-09-25 01:51:14.393731	2020-09-25 01:51:14.393731
1911	Agua Prieta	26	2020-09-25 01:51:14.396644	2020-09-25 01:51:14.396644
1912	Fronteras	26	2020-09-25 01:51:14.399356	2020-09-25 01:51:14.399356
1913	Nacozari de García	26	2020-09-25 01:51:14.402482	2020-09-25 01:51:14.402482
1914	Bavispe	26	2020-09-25 01:51:14.405378	2020-09-25 01:51:14.405378
1915	Bacerac	26	2020-09-25 01:51:14.40874	2020-09-25 01:51:14.40874
1916	Huachinera	26	2020-09-25 01:51:14.411696	2020-09-25 01:51:14.411696
1917	Nácori Chico	26	2020-09-25 01:51:14.414438	2020-09-25 01:51:14.414438
1918	Granados	26	2020-09-25 01:51:14.417089	2020-09-25 01:51:14.417089
1919	Bacadéhuachi	26	2020-09-25 01:51:14.419594	2020-09-25 01:51:14.419594
1920	Cumpas	26	2020-09-25 01:51:14.422256	2020-09-25 01:51:14.422256
1921	Huásabas	26	2020-09-25 01:51:14.426076	2020-09-25 01:51:14.426076
1922	Moctezuma	26	2020-09-25 01:51:14.429714	2020-09-25 01:51:14.429714
1923	Villa Hidalgo	26	2020-09-25 01:51:14.432876	2020-09-25 01:51:14.432876
1924	Santa Ana	26	2020-09-25 01:51:14.435667	2020-09-25 01:51:14.435667
1925	Cananea	26	2020-09-25 01:51:14.43839	2020-09-25 01:51:14.43839
1926	Arizpe	26	2020-09-25 01:51:14.441701	2020-09-25 01:51:14.441701
1927	Cucurpe	26	2020-09-25 01:51:14.444967	2020-09-25 01:51:14.444967
1928	Bacoachi	26	2020-09-25 01:51:14.448005	2020-09-25 01:51:14.448005
1929	San Pedro de la Cueva	26	2020-09-25 01:51:14.450848	2020-09-25 01:51:14.450848
1930	Divisaderos	26	2020-09-25 01:51:14.45358	2020-09-25 01:51:14.45358
1931	Tepache	26	2020-09-25 01:51:14.456196	2020-09-25 01:51:14.456196
1932	Villa Pesqueira	26	2020-09-25 01:51:14.459306	2020-09-25 01:51:14.459306
1933	Opodepe	26	2020-09-25 01:51:14.462158	2020-09-25 01:51:14.462158
1934	Huépac	26	2020-09-25 01:51:14.465196	2020-09-25 01:51:14.465196
1935	Banámichi	26	2020-09-25 01:51:14.468547	2020-09-25 01:51:14.468547
1936	Ures	26	2020-09-25 01:51:14.47275	2020-09-25 01:51:14.47275
1937	Aconchi	26	2020-09-25 01:51:14.479447	2020-09-25 01:51:14.479447
1938	Baviácora	26	2020-09-25 01:51:14.482595	2020-09-25 01:51:14.482595
1939	San Felipe de Jesús	26	2020-09-25 01:51:14.485358	2020-09-25 01:51:14.485358
1940	Rayón	26	2020-09-25 01:51:14.48835	2020-09-25 01:51:14.48835
1941	Cajeme	26	2020-09-25 01:51:14.493264	2020-09-25 01:51:14.493264
1942	Navojoa	26	2020-09-25 01:51:14.49616	2020-09-25 01:51:14.49616
1943	Huatabampo	26	2020-09-25 01:51:14.499077	2020-09-25 01:51:14.499077
1944	Bácum	26	2020-09-25 01:51:14.501715	2020-09-25 01:51:14.501715
1945	Etchojoa	26	2020-09-25 01:51:14.504933	2020-09-25 01:51:14.504933
1946	Benito Juárez	26	2020-09-25 01:51:14.507809	2020-09-25 01:51:14.507809
1947	Empalme	26	2020-09-25 01:51:14.520198	2020-09-25 01:51:14.520198
1948	Guaymas	26	2020-09-25 01:51:14.524579	2020-09-25 01:51:14.524579
1949	San Ignacio Río Muerto	26	2020-09-25 01:51:14.527857	2020-09-25 01:51:14.527857
1950	La Colorada	26	2020-09-25 01:51:14.530695	2020-09-25 01:51:14.530695
1951	Mazatán	26	2020-09-25 01:51:14.533426	2020-09-25 01:51:14.533426
1952	Suaqui Grande	26	2020-09-25 01:51:14.535736	2020-09-25 01:51:14.535736
1953	Sahuaripa	26	2020-09-25 01:51:14.538325	2020-09-25 01:51:14.538325
1954	San Javier	26	2020-09-25 01:51:14.540972	2020-09-25 01:51:14.540972
1955	Soyopa	26	2020-09-25 01:51:14.543667	2020-09-25 01:51:14.543667
1956	Bacanora	26	2020-09-25 01:51:14.546235	2020-09-25 01:51:14.546235
1957	Arivechi	26	2020-09-25 01:51:14.549012	2020-09-25 01:51:14.549012
1958	Rosario	26	2020-09-25 01:51:14.552053	2020-09-25 01:51:14.552053
1959	Quiriego	26	2020-09-25 01:51:14.554709	2020-09-25 01:51:14.554709
1960	Onavas	26	2020-09-25 01:51:14.558724	2020-09-25 01:51:14.558724
1961	Alamos	26	2020-09-25 01:51:14.561842	2020-09-25 01:51:14.561842
1962	Yécora	26	2020-09-25 01:51:14.564587	2020-09-25 01:51:14.564587
1963	Centro	27	2020-09-25 01:51:14.56759	2020-09-25 01:51:14.56759
1964	Jalpa de Méndez	27	2020-09-25 01:51:14.5709	2020-09-25 01:51:14.5709
1965	Nacajuca	27	2020-09-25 01:51:14.574491	2020-09-25 01:51:14.574491
1966	Comalcalco	27	2020-09-25 01:51:14.577893	2020-09-25 01:51:14.577893
1967	Huimanguillo	27	2020-09-25 01:51:14.580657	2020-09-25 01:51:14.580657
1968	Cárdenas	27	2020-09-25 01:51:14.583838	2020-09-25 01:51:14.583838
1969	Paraíso	27	2020-09-25 01:51:14.586707	2020-09-25 01:51:14.586707
1970	Cunduacán	27	2020-09-25 01:51:14.589625	2020-09-25 01:51:14.589625
1971	Macuspana	27	2020-09-25 01:51:14.594787	2020-09-25 01:51:14.594787
1972	Centla	27	2020-09-25 01:51:14.59796	2020-09-25 01:51:14.59796
1973	Jonuta	27	2020-09-25 01:51:14.600736	2020-09-25 01:51:14.600736
1974	Teapa	27	2020-09-25 01:51:14.604023	2020-09-25 01:51:14.604023
1975	Jalapa	27	2020-09-25 01:51:14.607521	2020-09-25 01:51:14.607521
1976	Tacotalpa	27	2020-09-25 01:51:14.610719	2020-09-25 01:51:14.610719
1977	Tenosique	27	2020-09-25 01:51:14.613705	2020-09-25 01:51:14.613705
1978	Balancán	27	2020-09-25 01:51:14.61653	2020-09-25 01:51:14.61653
1979	Emiliano Zapata	27	2020-09-25 01:51:14.619792	2020-09-25 01:51:14.619792
1980	Villahermosa	27	2020-09-25 01:51:14.622627	2020-09-25 01:51:14.622627
1981	Victoria	28	2020-09-25 01:51:14.626444	2020-09-25 01:51:14.626444
1982	Llera	28	2020-09-25 01:51:14.629533	2020-09-25 01:51:14.629533
1983	Güémez	28	2020-09-25 01:51:14.632399	2020-09-25 01:51:14.632399
1984	Casas	28	2020-09-25 01:51:14.635056	2020-09-25 01:51:14.635056
1985	Matamoros	28	2020-09-25 01:51:14.638329	2020-09-25 01:51:14.638329
1986	Valle Hermoso	28	2020-09-25 01:51:14.642346	2020-09-25 01:51:14.642346
1987	San Fernando	28	2020-09-25 01:51:14.645361	2020-09-25 01:51:14.645361
1988	Cruillas	28	2020-09-25 01:51:14.648447	2020-09-25 01:51:14.648447
1989	San Nicolás	28	2020-09-25 01:51:14.651372	2020-09-25 01:51:14.651372
1990	Soto la Marina	28	2020-09-25 01:51:14.654087	2020-09-25 01:51:14.654087
1991	Jiménez	28	2020-09-25 01:51:14.657118	2020-09-25 01:51:14.657118
1992	San Carlos	28	2020-09-25 01:51:14.660513	2020-09-25 01:51:14.660513
1993	Abasolo	28	2020-09-25 01:51:14.663069	2020-09-25 01:51:14.663069
1994	Padilla	28	2020-09-25 01:51:14.665658	2020-09-25 01:51:14.665658
1995	Hidalgo	28	2020-09-25 01:51:14.66878	2020-09-25 01:51:14.66878
1996	Mainero	28	2020-09-25 01:51:14.67197	2020-09-25 01:51:14.67197
1997	Villagrán	28	2020-09-25 01:51:14.675598	2020-09-25 01:51:14.675598
1998	Tula	28	2020-09-25 01:51:14.679203	2020-09-25 01:51:14.679203
1999	Jaumave	28	2020-09-25 01:51:14.682204	2020-09-25 01:51:14.682204
2000	Miquihuana	28	2020-09-25 01:51:14.68523	2020-09-25 01:51:14.68523
2001	Bustamante	28	2020-09-25 01:51:14.688054	2020-09-25 01:51:14.688054
2002	Palmillas	28	2020-09-25 01:51:14.691102	2020-09-25 01:51:14.691102
2003	Ocampo	28	2020-09-25 01:51:14.694396	2020-09-25 01:51:14.694396
2004	Nuevo Laredo	28	2020-09-25 01:51:14.696946	2020-09-25 01:51:14.696946
2005	Miguel Alemán	28	2020-09-25 01:51:14.699622	2020-09-25 01:51:14.699622
2006	Guerrero	28	2020-09-25 01:51:14.70304	2020-09-25 01:51:14.70304
2007	Mier	28	2020-09-25 01:51:14.706334	2020-09-25 01:51:14.706334
2008	Gustavo Díaz Ordaz	28	2020-09-25 01:51:14.709769	2020-09-25 01:51:14.709769
2009	Camargo	28	2020-09-25 01:51:14.712432	2020-09-25 01:51:14.712432
2010	Reynosa	28	2020-09-25 01:51:14.714912	2020-09-25 01:51:14.714912
2011	Río Bravo	28	2020-09-25 01:51:14.717911	2020-09-25 01:51:14.717911
2012	Méndez	28	2020-09-25 01:51:14.721023	2020-09-25 01:51:14.721023
2013	Burgos	28	2020-09-25 01:51:14.724825	2020-09-25 01:51:14.724825
2014	Tampico	28	2020-09-25 01:51:14.728105	2020-09-25 01:51:14.728105
2015	Ciudad Madero	28	2020-09-25 01:51:14.730886	2020-09-25 01:51:14.730886
2016	Altamira	28	2020-09-25 01:51:14.733825	2020-09-25 01:51:14.733825
2017	Aldama	28	2020-09-25 01:51:14.736365	2020-09-25 01:51:14.736365
2018	González	28	2020-09-25 01:51:14.738932	2020-09-25 01:51:14.738932
2019	Xicoténcatl	28	2020-09-25 01:51:14.742543	2020-09-25 01:51:14.742543
2020	Gómez Farías	28	2020-09-25 01:51:14.745411	2020-09-25 01:51:14.745411
2021	El Mante	28	2020-09-25 01:51:14.748448	2020-09-25 01:51:14.748448
2022	Antiguo Morelos	28	2020-09-25 01:51:14.751208	2020-09-25 01:51:14.751208
2023	Nuevo Morelos	28	2020-09-25 01:51:14.754504	2020-09-25 01:51:14.754504
2024	Tlaxcala	29	2020-09-25 01:51:14.75849	2020-09-25 01:51:14.75849
2025	Ixtacuixtla de Mariano Matamoros	29	2020-09-25 01:51:14.762163	2020-09-25 01:51:14.762163
2026	Santa Ana Nopalucan	29	2020-09-25 01:51:14.765174	2020-09-25 01:51:14.765174
2027	Panotla	29	2020-09-25 01:51:14.768329	2020-09-25 01:51:14.768329
2028	Totolac	29	2020-09-25 01:51:14.771044	2020-09-25 01:51:14.771044
2029	Tepeyanco	29	2020-09-25 01:51:14.774281	2020-09-25 01:51:14.774281
2030	Santa Isabel Xiloxoxtla	29	2020-09-25 01:51:14.777967	2020-09-25 01:51:14.777967
2031	San Juan Huactzinco	29	2020-09-25 01:51:14.780819	2020-09-25 01:51:14.780819
2032	Calpulalpan	29	2020-09-25 01:51:14.783723	2020-09-25 01:51:14.783723
2033	Sanctórum de Lázaro Cárdenas	29	2020-09-25 01:51:14.786736	2020-09-25 01:51:14.786736
2034	Benito Juárez	29	2020-09-25 01:51:14.789797	2020-09-25 01:51:14.789797
2035	Hueyotlipan	29	2020-09-25 01:51:14.793128	2020-09-25 01:51:14.793128
2036	Tlaxco	29	2020-09-25 01:51:14.795882	2020-09-25 01:51:14.795882
2037	Nanacamilpa de Mariano Arista	29	2020-09-25 01:51:14.798361	2020-09-25 01:51:14.798361
2038	Españita	29	2020-09-25 01:51:14.800922	2020-09-25 01:51:14.800922
2039	Apizaco	29	2020-09-25 01:51:14.804154	2020-09-25 01:51:14.804154
2040	Atlangatepec	29	2020-09-25 01:51:14.808695	2020-09-25 01:51:14.808695
2041	Muñoz de Domingo Arenas	29	2020-09-25 01:51:14.81215	2020-09-25 01:51:14.81215
2042	Tetla de la Solidaridad	29	2020-09-25 01:51:14.814962	2020-09-25 01:51:14.814962
2043	Xaltocan	29	2020-09-25 01:51:14.817944	2020-09-25 01:51:14.817944
2044	San Lucas Tecopilco	29	2020-09-25 01:51:14.820987	2020-09-25 01:51:14.820987
2045	Yauhquemehcan	29	2020-09-25 01:51:14.824906	2020-09-25 01:51:14.824906
2046	Xaloztoc	29	2020-09-25 01:51:14.82786	2020-09-25 01:51:14.82786
2047	Tocatlán	29	2020-09-25 01:51:14.830733	2020-09-25 01:51:14.830733
2048	Tzompantepec	29	2020-09-25 01:51:14.833877	2020-09-25 01:51:14.833877
2049	San José Teacalco	29	2020-09-25 01:51:14.836725	2020-09-25 01:51:14.836725
2050	Huamantla	29	2020-09-25 01:51:14.839772	2020-09-25 01:51:14.839772
2051	Terrenate	29	2020-09-25 01:51:14.843515	2020-09-25 01:51:14.843515
2052	Lázaro Cárdenas	29	2020-09-25 01:51:14.846442	2020-09-25 01:51:14.846442
2053	Emiliano Zapata	29	2020-09-25 01:51:14.849062	2020-09-25 01:51:14.849062
2054	Atltzayanca	29	2020-09-25 01:51:14.852211	2020-09-25 01:51:14.852211
2055	Cuapiaxtla	29	2020-09-25 01:51:14.855285	2020-09-25 01:51:14.855285
2056	El Carmen Tequexquitla	29	2020-09-25 01:51:14.859496	2020-09-25 01:51:14.859496
2057	Ixtenco	29	2020-09-25 01:51:14.862196	2020-09-25 01:51:14.862196
2058	Ziltlaltépec de Trinidad Sánchez Santos	29	2020-09-25 01:51:14.864665	2020-09-25 01:51:14.864665
2059	Apetatitlán de Antonio Carvajal	29	2020-09-25 01:51:14.867762	2020-09-25 01:51:14.867762
2060	Amaxac de Guerrero	29	2020-09-25 01:51:14.870449	2020-09-25 01:51:14.870449
2061	Santa Cruz Tlaxcala	29	2020-09-25 01:51:14.873466	2020-09-25 01:51:14.873466
2062	Cuaxomulco	29	2020-09-25 01:51:14.876373	2020-09-25 01:51:14.876373
2063	Contla de Juan Cuamatzi	29	2020-09-25 01:51:14.879257	2020-09-25 01:51:14.879257
2064	Tepetitla de Lardizábal	29	2020-09-25 01:51:14.882079	2020-09-25 01:51:14.882079
2065	Natívitas	29	2020-09-25 01:51:14.884842	2020-09-25 01:51:14.884842
2066	Santa Apolonia Teacalco	29	2020-09-25 01:51:14.887516	2020-09-25 01:51:14.887516
2067	Tetlatlahuca	29	2020-09-25 01:51:14.890602	2020-09-25 01:51:14.890602
2068	San Damián Texóloc	29	2020-09-25 01:51:14.894334	2020-09-25 01:51:14.894334
2069	San Jerónimo Zacualpan	29	2020-09-25 01:51:14.897016	2020-09-25 01:51:14.897016
2070	Zacatelco	29	2020-09-25 01:51:14.89969	2020-09-25 01:51:14.89969
2071	San Lorenzo Axocomanitla	29	2020-09-25 01:51:14.902316	2020-09-25 01:51:14.902316
2072	Santa Catarina Ayometla	29	2020-09-25 01:51:14.904849	2020-09-25 01:51:14.904849
2073	Xicohtzinco	29	2020-09-25 01:51:14.908362	2020-09-25 01:51:14.908362
2074	Papalotla de Xicohténcatl	29	2020-09-25 01:51:14.912108	2020-09-25 01:51:14.912108
2075	Chiautempan	29	2020-09-25 01:51:14.915263	2020-09-25 01:51:14.915263
2076	La Magdalena Tlaltelulco	29	2020-09-25 01:51:14.918147	2020-09-25 01:51:14.918147
2077	San Francisco Tetlanohcan	29	2020-09-25 01:51:14.920691	2020-09-25 01:51:14.920691
2078	Teolocholco	29	2020-09-25 01:51:14.924739	2020-09-25 01:51:14.924739
2079	Acuamanala de Miguel Hidalgo	29	2020-09-25 01:51:14.930292	2020-09-25 01:51:14.930292
2080	Santa Cruz Quilehtla	29	2020-09-25 01:51:14.938892	2020-09-25 01:51:14.938892
2081	Mazatecochco de José María Morelos	29	2020-09-25 01:51:14.948132	2020-09-25 01:51:14.948132
2082	Tenancingo	29	2020-09-25 01:51:14.957719	2020-09-25 01:51:14.957719
2083	San Pablo del Monte	29	2020-09-25 01:51:14.966009	2020-09-25 01:51:14.966009
2084	Xalapa	30	2020-09-25 01:51:14.968569	2020-09-25 01:51:14.968569
2085	Tlalnelhuayocan	30	2020-09-25 01:51:14.971299	2020-09-25 01:51:14.971299
2086	Xico	30	2020-09-25 01:51:14.977439	2020-09-25 01:51:14.977439
2087	Ixhuacán de los Reyes	30	2020-09-25 01:51:14.980687	2020-09-25 01:51:14.980687
2088	Ayahualulco	30	2020-09-25 01:51:14.983184	2020-09-25 01:51:14.983184
2089	Perote	30	2020-09-25 01:51:14.985626	2020-09-25 01:51:14.985626
2090	Banderilla	30	2020-09-25 01:51:14.988168	2020-09-25 01:51:14.988168
2091	Rafael Lucio	30	2020-09-25 01:51:14.991181	2020-09-25 01:51:14.991181
2092	Acajete	30	2020-09-25 01:51:14.994172	2020-09-25 01:51:14.994172
2093	Las Vigas de Ramírez	30	2020-09-25 01:51:14.996781	2020-09-25 01:51:14.996781
2094	Villa Aldama	30	2020-09-25 01:51:14.99946	2020-09-25 01:51:14.99946
2095	Tlacolulan	30	2020-09-25 01:51:15.002308	2020-09-25 01:51:15.002308
2096	Tonayán	30	2020-09-25 01:51:15.005367	2020-09-25 01:51:15.005367
2097	Coacoatzintla	30	2020-09-25 01:51:15.010071	2020-09-25 01:51:15.010071
2098	Jilotepec	30	2020-09-25 01:51:15.013092	2020-09-25 01:51:15.013092
2099	Naolinco	30	2020-09-25 01:51:15.015545	2020-09-25 01:51:15.015545
2100	Miahuatlán	30	2020-09-25 01:51:15.01799	2020-09-25 01:51:15.01799
2101	Acatlán	30	2020-09-25 01:51:15.020674	2020-09-25 01:51:15.020674
2102	Tepetlán	30	2020-09-25 01:51:15.023689	2020-09-25 01:51:15.023689
2103	Juchique de Ferrer	30	2020-09-25 01:51:15.026573	2020-09-25 01:51:15.026573
2104	Alto Lucero de Gutiérrez Barrios	30	2020-09-25 01:51:15.029357	2020-09-25 01:51:15.029357
2105	Actopan	30	2020-09-25 01:51:15.032073	2020-09-25 01:51:15.032073
2106	Coatepec	30	2020-09-25 01:51:15.034717	2020-09-25 01:51:15.034717
2107	Teocelo	30	2020-09-25 01:51:15.03723	2020-09-25 01:51:15.03723
2108	Cosautlán de Carvajal	30	2020-09-25 01:51:15.039954	2020-09-25 01:51:15.039954
2109	Emiliano Zapata	30	2020-09-25 01:51:15.043187	2020-09-25 01:51:15.043187
2110	Apazapan	30	2020-09-25 01:51:15.045838	2020-09-25 01:51:15.045838
2111	Puente Nacional	30	2020-09-25 01:51:15.048563	2020-09-25 01:51:15.048563
2112	Ursulo Galván	30	2020-09-25 01:51:15.051152	2020-09-25 01:51:15.051152
2113	Paso de Ovejas	30	2020-09-25 01:51:15.053737	2020-09-25 01:51:15.053737
2114	La Antigua	30	2020-09-25 01:51:15.057557	2020-09-25 01:51:15.057557
2115	Veracruz	30	2020-09-25 01:51:15.060902	2020-09-25 01:51:15.060902
2116	Pánuco	30	2020-09-25 01:51:15.064078	2020-09-25 01:51:15.064078
2117	Pueblo Viejo	30	2020-09-25 01:51:15.066862	2020-09-25 01:51:15.066862
2118	Tampico Alto	30	2020-09-25 01:51:15.069561	2020-09-25 01:51:15.069561
2119	Tempoal	30	2020-09-25 01:51:15.072223	2020-09-25 01:51:15.072223
2120	Ozuluama de Mascareñas	30	2020-09-25 01:51:15.076104	2020-09-25 01:51:15.076104
2121	Tantoyuca	30	2020-09-25 01:51:15.079322	2020-09-25 01:51:15.079322
2122	Platón Sánchez	30	2020-09-25 01:51:15.082121	2020-09-25 01:51:15.082121
2123	Chiconamel	30	2020-09-25 01:51:15.085006	2020-09-25 01:51:15.085006
2124	Chalma	30	2020-09-25 01:51:15.087697	2020-09-25 01:51:15.087697
2125	Chontla	30	2020-09-25 01:51:15.091311	2020-09-25 01:51:15.091311
2126	Citlaltépetl	30	2020-09-25 01:51:15.094928	2020-09-25 01:51:15.094928
2127	Ixcatepec	30	2020-09-25 01:51:15.097873	2020-09-25 01:51:15.097873
2128	Naranjos Amatlán	30	2020-09-25 01:51:15.100589	2020-09-25 01:51:15.100589
2129	El Higo	30	2020-09-25 01:51:15.103313	2020-09-25 01:51:15.103313
2130	Chinampa de Gorostiza	30	2020-09-25 01:51:15.10656	2020-09-25 01:51:15.10656
2131	Tantima	30	2020-09-25 01:51:15.110197	2020-09-25 01:51:15.110197
2132	Tamalín	30	2020-09-25 01:51:15.112942	2020-09-25 01:51:15.112942
2133	Cerro Azul	30	2020-09-25 01:51:15.115783	2020-09-25 01:51:15.115783
2134	Tepetzintla	30	2020-09-25 01:51:15.118376	2020-09-25 01:51:15.118376
2135	Tancoco	30	2020-09-25 01:51:15.121122	2020-09-25 01:51:15.121122
2136	Tamiahua	30	2020-09-25 01:51:15.124141	2020-09-25 01:51:15.124141
2137	Huayacocotla	30	2020-09-25 01:51:15.127886	2020-09-25 01:51:15.127886
2138	Ilamatlán	30	2020-09-25 01:51:15.13074	2020-09-25 01:51:15.13074
2139	Zontecomatlán de López y Fuentes	30	2020-09-25 01:51:15.133459	2020-09-25 01:51:15.133459
2140	Texcatepec	30	2020-09-25 01:51:15.136187	2020-09-25 01:51:15.136187
2141	Zacualpan	30	2020-09-25 01:51:15.139493	2020-09-25 01:51:15.139493
2142	Benito Juárez	30	2020-09-25 01:51:15.142764	2020-09-25 01:51:15.142764
2143	Tlachichilco	30	2020-09-25 01:51:15.14561	2020-09-25 01:51:15.14561
2144	Ixhuatlán de Madero	30	2020-09-25 01:51:15.149378	2020-09-25 01:51:15.149378
2145	Chicontepec	30	2020-09-25 01:51:15.152569	2020-09-25 01:51:15.152569
2146	Álamo Temapache	30	2020-09-25 01:51:15.155537	2020-09-25 01:51:15.155537
2147	Tuxpan	30	2020-09-25 01:51:15.159505	2020-09-25 01:51:15.159505
2148	Tihuatlán	30	2020-09-25 01:51:15.162589	2020-09-25 01:51:15.162589
2149	Castillo de Teayo	30	2020-09-25 01:51:15.165337	2020-09-25 01:51:15.165337
2150	Cazones de Herrera	30	2020-09-25 01:51:15.168195	2020-09-25 01:51:15.168195
2151	Zozocolco de Hidalgo	30	2020-09-25 01:51:15.171028	2020-09-25 01:51:15.171028
2152	Chumatlán	30	2020-09-25 01:51:15.175106	2020-09-25 01:51:15.175106
2153	Coxquihui	30	2020-09-25 01:51:15.178457	2020-09-25 01:51:15.178457
2154	Mecatlán	30	2020-09-25 01:51:15.181467	2020-09-25 01:51:15.181467
2155	Filomeno Mata	30	2020-09-25 01:51:15.184212	2020-09-25 01:51:15.184212
2156	Coahuitlán	30	2020-09-25 01:51:15.186864	2020-09-25 01:51:15.186864
2157	Coyutla	30	2020-09-25 01:51:15.189639	2020-09-25 01:51:15.189639
2158	Coatzintla	30	2020-09-25 01:51:15.193205	2020-09-25 01:51:15.193205
2159	Espinal	30	2020-09-25 01:51:15.196084	2020-09-25 01:51:15.196084
2160	Poza Rica de Hidalgo	30	2020-09-25 01:51:15.198767	2020-09-25 01:51:15.198767
2161	Papantla	30	2020-09-25 01:51:15.201514	2020-09-25 01:51:15.201514
2162	Gutiérrez Zamora	30	2020-09-25 01:51:15.204418	2020-09-25 01:51:15.204418
2163	Tecolutla	30	2020-09-25 01:51:15.207245	2020-09-25 01:51:15.207245
2164	Martínez de la Torre	30	2020-09-25 01:51:15.209961	2020-09-25 01:51:15.209961
2165	San Rafael	30	2020-09-25 01:51:15.212969	2020-09-25 01:51:15.212969
2166	Tlapacoyan	30	2020-09-25 01:51:15.215765	2020-09-25 01:51:15.215765
2167	Jalacingo	30	2020-09-25 01:51:15.218408	2020-09-25 01:51:15.218408
2168	Atzalan	30	2020-09-25 01:51:15.221041	2020-09-25 01:51:15.221041
2169	Altotonga	30	2020-09-25 01:51:15.224978	2020-09-25 01:51:15.224978
2170	Las Minas	30	2020-09-25 01:51:15.228126	2020-09-25 01:51:15.228126
2171	Tatatila	30	2020-09-25 01:51:15.230955	2020-09-25 01:51:15.230955
2172	Tenochtitlán	30	2020-09-25 01:51:15.233956	2020-09-25 01:51:15.233956
2173	Nautla	30	2020-09-25 01:51:15.236822	2020-09-25 01:51:15.236822
2174	Misantla	30	2020-09-25 01:51:15.239825	2020-09-25 01:51:15.239825
2175	Landero y Coss	30	2020-09-25 01:51:15.243411	2020-09-25 01:51:15.243411
2176	Chiconquiaco	30	2020-09-25 01:51:15.24634	2020-09-25 01:51:15.24634
2177	Yecuatla	30	2020-09-25 01:51:15.249189	2020-09-25 01:51:15.249189
2178	Colipa	30	2020-09-25 01:51:15.252107	2020-09-25 01:51:15.252107
2179	Vega de Alatorre	30	2020-09-25 01:51:15.254926	2020-09-25 01:51:15.254926
2180	Jalcomulco	30	2020-09-25 01:51:15.260181	2020-09-25 01:51:15.260181
2181	Tlaltetela	30	2020-09-25 01:51:15.263439	2020-09-25 01:51:15.263439
2182	Tenampa	30	2020-09-25 01:51:15.266231	2020-09-25 01:51:15.266231
2183	Totutla	30	2020-09-25 01:51:15.269151	2020-09-25 01:51:15.269151
2184	Sochiapa	30	2020-09-25 01:51:15.272083	2020-09-25 01:51:15.272083
2185	Tlacotepec de Mejía	30	2020-09-25 01:51:15.27629	2020-09-25 01:51:15.27629
2186	Huatusco	30	2020-09-25 01:51:15.279264	2020-09-25 01:51:15.279264
2187	Calcahualco	30	2020-09-25 01:51:15.281839	2020-09-25 01:51:15.281839
2188	Alpatláhuac	30	2020-09-25 01:51:15.28432	2020-09-25 01:51:15.28432
2189	Coscomatepec	30	2020-09-25 01:51:15.286902	2020-09-25 01:51:15.286902
2190	La Perla	30	2020-09-25 01:51:15.289626	2020-09-25 01:51:15.289626
2191	Chocamán	30	2020-09-25 01:51:15.292486	2020-09-25 01:51:15.292486
2192	Tomatlán	30	2020-09-25 01:51:15.29508	2020-09-25 01:51:15.29508
2193	Ixhuatlán del Café	30	2020-09-25 01:51:15.297834	2020-09-25 01:51:15.297834
2194	Tepatlaxco	30	2020-09-25 01:51:15.300495	2020-09-25 01:51:15.300495
2195	Comapa	30	2020-09-25 01:51:15.303609	2020-09-25 01:51:15.303609
2196	Zentla	30	2020-09-25 01:51:15.307433	2020-09-25 01:51:15.307433
2197	Camarón de Tejeda	30	2020-09-25 01:51:15.310797	2020-09-25 01:51:15.310797
2198	Soledad de Doblado	30	2020-09-25 01:51:15.313625	2020-09-25 01:51:15.313625
2199	Manlio Fabio Altamirano	30	2020-09-25 01:51:15.316417	2020-09-25 01:51:15.316417
2200	Jamapa	30	2020-09-25 01:51:15.319361	2020-09-25 01:51:15.319361
2201	Medellín	30	2020-09-25 01:51:15.322475	2020-09-25 01:51:15.322475
2202	Boca del Río	30	2020-09-25 01:51:15.325797	2020-09-25 01:51:15.325797
2203	Orizaba	30	2020-09-25 01:51:15.328753	2020-09-25 01:51:15.328753
2204	Rafael Delgado	30	2020-09-25 01:51:15.331742	2020-09-25 01:51:15.331742
2205	Mariano Escobedo	30	2020-09-25 01:51:15.334605	2020-09-25 01:51:15.334605
2206	Ixhuatlancillo	30	2020-09-25 01:51:15.337453	2020-09-25 01:51:15.337453
2207	Atzacan	30	2020-09-25 01:51:15.342648	2020-09-25 01:51:15.342648
2208	Ixtaczoquitlán	30	2020-09-25 01:51:15.346518	2020-09-25 01:51:15.346518
2209	Fortín	30	2020-09-25 01:51:15.349368	2020-09-25 01:51:15.349368
2210	Córdoba	30	2020-09-25 01:51:15.352164	2020-09-25 01:51:15.352164
2211	Maltrata	30	2020-09-25 01:51:15.355265	2020-09-25 01:51:15.355265
2212	Nogales	30	2020-09-25 01:51:15.358498	2020-09-25 01:51:15.358498
2213	Río Blanco	30	2020-09-25 01:51:15.361593	2020-09-25 01:51:15.361593
2214	Camerino Z. Mendoza	30	2020-09-25 01:51:15.364518	2020-09-25 01:51:15.364518
2215	Aquila	30	2020-09-25 01:51:15.367285	2020-09-25 01:51:15.367285
2216	Acultzingo	30	2020-09-25 01:51:15.370001	2020-09-25 01:51:15.370001
2217	Soledad Atzompa	30	2020-09-25 01:51:15.37374	2020-09-25 01:51:15.37374
2218	Huiloapan de Cuauhtémoc	30	2020-09-25 01:51:15.377281	2020-09-25 01:51:15.377281
2219	Tlaquilpa	30	2020-09-25 01:51:15.386094	2020-09-25 01:51:15.386094
2220	Astacinga	30	2020-09-25 01:51:15.389625	2020-09-25 01:51:15.389625
2221	Xoxocotla	30	2020-09-25 01:51:15.393098	2020-09-25 01:51:15.393098
2222	Atlahuilco	30	2020-09-25 01:51:15.396057	2020-09-25 01:51:15.396057
2223	Tequila	30	2020-09-25 01:51:15.39876	2020-09-25 01:51:15.39876
2224	San Andrés Tenejapan	30	2020-09-25 01:51:15.401438	2020-09-25 01:51:15.401438
2225	Tlilapan	30	2020-09-25 01:51:15.404086	2020-09-25 01:51:15.404086
2226	Magdalena	30	2020-09-25 01:51:15.407862	2020-09-25 01:51:15.407862
2227	Naranjal	30	2020-09-25 01:51:15.411155	2020-09-25 01:51:15.411155
2228	Coetzala	30	2020-09-25 01:51:15.414006	2020-09-25 01:51:15.414006
2229	Omealca	30	2020-09-25 01:51:15.416635	2020-09-25 01:51:15.416635
2230	Cuitláhuac	30	2020-09-25 01:51:15.419068	2020-09-25 01:51:15.419068
2231	Cuichapa	30	2020-09-25 01:51:15.422702	2020-09-25 01:51:15.422702
2232	Yanga	30	2020-09-25 01:51:15.427455	2020-09-25 01:51:15.427455
2233	Amatlán de los Reyes	30	2020-09-25 01:51:15.430512	2020-09-25 01:51:15.430512
2234	Atoyac	30	2020-09-25 01:51:15.433208	2020-09-25 01:51:15.433208
2235	Paso del Macho	30	2020-09-25 01:51:15.435745	2020-09-25 01:51:15.435745
2236	Carrillo Puerto	30	2020-09-25 01:51:15.438415	2020-09-25 01:51:15.438415
2237	Cotaxtla	30	2020-09-25 01:51:15.441197	2020-09-25 01:51:15.441197
2238	Zongolica	30	2020-09-25 01:51:15.443867	2020-09-25 01:51:15.443867
2239	Tehuipango	30	2020-09-25 01:51:15.446741	2020-09-25 01:51:15.446741
2240	Mixtla de Altamirano	30	2020-09-25 01:51:15.449438	2020-09-25 01:51:15.449438
2241	Los Reyes	30	2020-09-25 01:51:15.452269	2020-09-25 01:51:15.452269
2242	Texhuacán	30	2020-09-25 01:51:15.45521	2020-09-25 01:51:15.45521
2243	Tezonapa	30	2020-09-25 01:51:15.458861	2020-09-25 01:51:15.458861
2244	Tierra Blanca	30	2020-09-25 01:51:15.461866	2020-09-25 01:51:15.461866
2245	Tlalixcoyan	30	2020-09-25 01:51:15.464483	2020-09-25 01:51:15.464483
2246	Ignacio de la Llave	30	2020-09-25 01:51:15.467022	2020-09-25 01:51:15.467022
2247	Alvarado	30	2020-09-25 01:51:15.469735	2020-09-25 01:51:15.469735
2248	Lerdo de Tejada	30	2020-09-25 01:51:15.473553	2020-09-25 01:51:15.473553
2249	Tres Valles	30	2020-09-25 01:51:15.476806	2020-09-25 01:51:15.476806
2250	Carlos A. Carrillo	30	2020-09-25 01:51:15.479656	2020-09-25 01:51:15.479656
2251	Cosamaloapan de Carpio	30	2020-09-25 01:51:15.482488	2020-09-25 01:51:15.482488
2252	Ixmatlahuacan	30	2020-09-25 01:51:15.48524	2020-09-25 01:51:15.48524
2253	Acula	30	2020-09-25 01:51:15.487914	2020-09-25 01:51:15.487914
2254	Amatitlán	30	2020-09-25 01:51:15.491485	2020-09-25 01:51:15.491485
2255	Tlacotalpan	30	2020-09-25 01:51:15.497563	2020-09-25 01:51:15.497563
2256	Saltabarranca	30	2020-09-25 01:51:15.500436	2020-09-25 01:51:15.500436
2257	Otatitlán	30	2020-09-25 01:51:15.503125	2020-09-25 01:51:15.503125
2258	Tlacojalpan	30	2020-09-25 01:51:15.506811	2020-09-25 01:51:15.506811
2259	Tuxtilla	30	2020-09-25 01:51:15.510403	2020-09-25 01:51:15.510403
2260	Chacaltianguis	30	2020-09-25 01:51:15.51396	2020-09-25 01:51:15.51396
2261	José Azueta	30	2020-09-25 01:51:15.516779	2020-09-25 01:51:15.516779
2262	Playa Vicente	30	2020-09-25 01:51:15.519412	2020-09-25 01:51:15.519412
2263	Santiago Sochiapan	30	2020-09-25 01:51:15.5222	2020-09-25 01:51:15.5222
2264	Isla	30	2020-09-25 01:51:15.525988	2020-09-25 01:51:15.525988
2265	Juan Rodríguez Clara	30	2020-09-25 01:51:15.52904	2020-09-25 01:51:15.52904
2266	San Andrés Tuxtla	30	2020-09-25 01:51:15.531651	2020-09-25 01:51:15.531651
2267	Santiago Tuxtla	30	2020-09-25 01:51:15.534485	2020-09-25 01:51:15.534485
2268	Angel R. Cabada	30	2020-09-25 01:51:15.537149	2020-09-25 01:51:15.537149
2269	Hueyapan de Ocampo	30	2020-09-25 01:51:15.540094	2020-09-25 01:51:15.540094
2270	Catemaco	30	2020-09-25 01:51:15.542904	2020-09-25 01:51:15.542904
2271	Soteapan	30	2020-09-25 01:51:15.54595	2020-09-25 01:51:15.54595
2272	Mecayapan	30	2020-09-25 01:51:15.548618	2020-09-25 01:51:15.548618
2273	Tatahuicapan de Juárez	30	2020-09-25 01:51:15.551311	2020-09-25 01:51:15.551311
2274	Pajapan	30	2020-09-25 01:51:15.554294	2020-09-25 01:51:15.554294
2275	Chinameca	30	2020-09-25 01:51:15.559436	2020-09-25 01:51:15.559436
2276	Acayucan	30	2020-09-25 01:51:15.562591	2020-09-25 01:51:15.562591
2277	San Juan Evangelista	30	2020-09-25 01:51:15.565451	2020-09-25 01:51:15.565451
2278	Sayula de Alemán	30	2020-09-25 01:51:15.568139	2020-09-25 01:51:15.568139
2279	Oluta	30	2020-09-25 01:51:15.571178	2020-09-25 01:51:15.571178
2280	Soconusco	30	2020-09-25 01:51:15.57448	2020-09-25 01:51:15.57448
2281	Texistepec	30	2020-09-25 01:51:15.577431	2020-09-25 01:51:15.577431
2282	Jáltipan	30	2020-09-25 01:51:15.5803	2020-09-25 01:51:15.5803
2283	Zaragoza	30	2020-09-25 01:51:15.582949	2020-09-25 01:51:15.582949
2284	Oteapan	30	2020-09-25 01:51:15.585398	2020-09-25 01:51:15.585398
2285	Cosoleacaque	30	2020-09-25 01:51:15.588145	2020-09-25 01:51:15.588145
2286	Nanchital de Lázaro Cárdenas del Río	30	2020-09-25 01:51:15.592641	2020-09-25 01:51:15.592641
2287	Ixhuatlán del Sureste	30	2020-09-25 01:51:15.595881	2020-09-25 01:51:15.595881
2288	Moloacán	30	2020-09-25 01:51:15.599003	2020-09-25 01:51:15.599003
2289	Coatzacoalcos	30	2020-09-25 01:51:15.602004	2020-09-25 01:51:15.602004
2290	Agua Dulce	30	2020-09-25 01:51:15.604942	2020-09-25 01:51:15.604942
2291	Minatitlán	30	2020-09-25 01:51:15.608515	2020-09-25 01:51:15.608515
2292	Hidalgotitlán	30	2020-09-25 01:51:15.611412	2020-09-25 01:51:15.611412
2293	Jesús Carranza	30	2020-09-25 01:51:15.614156	2020-09-25 01:51:15.614156
2294	Las Choapas	30	2020-09-25 01:51:15.616875	2020-09-25 01:51:15.616875
2295	Uxpanapa	30	2020-09-25 01:51:15.61978	2020-09-25 01:51:15.61978
2296	Mérida	31	2020-09-25 01:51:15.622532	2020-09-25 01:51:15.622532
2297	Progreso	31	2020-09-25 01:51:15.625121	2020-09-25 01:51:15.625121
2298	Chicxulub Pueblo	31	2020-09-25 01:51:15.627828	2020-09-25 01:51:15.627828
2299	Ixil	31	2020-09-25 01:51:15.630483	2020-09-25 01:51:15.630483
2300	Conkal	31	2020-09-25 01:51:15.633227	2020-09-25 01:51:15.633227
2301	Yaxkukul	31	2020-09-25 01:51:15.635762	2020-09-25 01:51:15.635762
2302	Hunucmá	31	2020-09-25 01:51:15.638448	2020-09-25 01:51:15.638448
2303	Ucú	31	2020-09-25 01:51:15.642403	2020-09-25 01:51:15.642403
2304	Kinchil	31	2020-09-25 01:51:15.64534	2020-09-25 01:51:15.64534
2305	Tetiz	31	2020-09-25 01:51:15.648099	2020-09-25 01:51:15.648099
2306	Celestún	31	2020-09-25 01:51:15.650813	2020-09-25 01:51:15.650813
2307	Kanasín	31	2020-09-25 01:51:15.653476	2020-09-25 01:51:15.653476
2308	Timucuy	31	2020-09-25 01:51:15.656479	2020-09-25 01:51:15.656479
2309	Acanceh	31	2020-09-25 01:51:15.659743	2020-09-25 01:51:15.659743
2310	Tixpéhual	31	2020-09-25 01:51:15.662823	2020-09-25 01:51:15.662823
2311	Umán	31	2020-09-25 01:51:15.66557	2020-09-25 01:51:15.66557
2312	Telchac Pueblo	31	2020-09-25 01:51:15.668327	2020-09-25 01:51:15.668327
2313	Dzemul	31	2020-09-25 01:51:15.671359	2020-09-25 01:51:15.671359
2314	Telchac Puerto	31	2020-09-25 01:51:15.676374	2020-09-25 01:51:15.676374
2315	Cansahcab	31	2020-09-25 01:51:15.679463	2020-09-25 01:51:15.679463
2316	Sinanché	31	2020-09-25 01:51:15.682746	2020-09-25 01:51:15.682746
2317	Yobaín	31	2020-09-25 01:51:15.685537	2020-09-25 01:51:15.685537
2318	Motul	31	2020-09-25 01:51:15.68839	2020-09-25 01:51:15.68839
2319	Baca	31	2020-09-25 01:51:15.691773	2020-09-25 01:51:15.691773
2320	Mocochá	31	2020-09-25 01:51:15.694876	2020-09-25 01:51:15.694876
2321	Muxupip	31	2020-09-25 01:51:15.697588	2020-09-25 01:51:15.697588
2322	Cacalchén	31	2020-09-25 01:51:15.700387	2020-09-25 01:51:15.700387
2323	Bokobá	31	2020-09-25 01:51:15.703188	2020-09-25 01:51:15.703188
2324	Tixkokob	31	2020-09-25 01:51:15.706565	2020-09-25 01:51:15.706565
2325	Hoctún	31	2020-09-25 01:51:15.709563	2020-09-25 01:51:15.709563
2326	Tahmek	31	2020-09-25 01:51:15.712286	2020-09-25 01:51:15.712286
2327	Dzidzantún	31	2020-09-25 01:51:15.714862	2020-09-25 01:51:15.714862
2328	Temax	31	2020-09-25 01:51:15.717568	2020-09-25 01:51:15.717568
2329	Tekantó	31	2020-09-25 01:51:15.720016	2020-09-25 01:51:15.720016
2330	Teya	31	2020-09-25 01:51:15.723654	2020-09-25 01:51:15.723654
2331	Suma	31	2020-09-25 01:51:15.726728	2020-09-25 01:51:15.726728
2332	Tepakán	31	2020-09-25 01:51:15.729468	2020-09-25 01:51:15.729468
2333	Tekal de Venegas	31	2020-09-25 01:51:15.732052	2020-09-25 01:51:15.732052
2334	Izamal	31	2020-09-25 01:51:15.734835	2020-09-25 01:51:15.734835
2335	Hocabá	31	2020-09-25 01:51:15.737434	2020-09-25 01:51:15.737434
2336	Xocchel	31	2020-09-25 01:51:15.740872	2020-09-25 01:51:15.740872
2337	Seyé	31	2020-09-25 01:51:15.743755	2020-09-25 01:51:15.743755
2338	Cuzamá	31	2020-09-25 01:51:15.746833	2020-09-25 01:51:15.746833
2339	Homún	31	2020-09-25 01:51:15.74953	2020-09-25 01:51:15.74953
2340	Sanahcat	31	2020-09-25 01:51:15.752571	2020-09-25 01:51:15.752571
2341	Huhí	31	2020-09-25 01:51:15.756628	2020-09-25 01:51:15.756628
2342	Dzilam González	31	2020-09-25 01:51:15.760192	2020-09-25 01:51:15.760192
2343	Dzilam de Bravo	31	2020-09-25 01:51:15.764343	2020-09-25 01:51:15.764343
2344	Panabá	31	2020-09-25 01:51:15.767311	2020-09-25 01:51:15.767311
2345	San Felipe	31	2020-09-25 01:51:15.770165	2020-09-25 01:51:15.770165
2346	Buctzotz	31	2020-09-25 01:51:15.773058	2020-09-25 01:51:15.773058
2347	Sucilá	31	2020-09-25 01:51:15.776439	2020-09-25 01:51:15.776439
2348	Cenotillo	31	2020-09-25 01:51:15.779166	2020-09-25 01:51:15.779166
2349	Dzoncauich	31	2020-09-25 01:51:15.782454	2020-09-25 01:51:15.782454
2350	Tunkás	31	2020-09-25 01:51:15.785498	2020-09-25 01:51:15.785498
2351	Quintana Roo	31	2020-09-25 01:51:15.788577	2020-09-25 01:51:15.788577
2352	Dzitás	31	2020-09-25 01:51:15.792054	2020-09-25 01:51:15.792054
2353	Kantunil	31	2020-09-25 01:51:15.794782	2020-09-25 01:51:15.794782
2354	Sudzal	31	2020-09-25 01:51:15.797482	2020-09-25 01:51:15.797482
2355	Tekit	31	2020-09-25 01:51:15.800091	2020-09-25 01:51:15.800091
2356	Sotuta	31	2020-09-25 01:51:15.802769	2020-09-25 01:51:15.802769
2357	Tizimín	31	2020-09-25 01:51:15.806342	2020-09-25 01:51:15.806342
2358	Río Lagartos	31	2020-09-25 01:51:15.809747	2020-09-25 01:51:15.809747
2359	Espita	31	2020-09-25 01:51:15.812697	2020-09-25 01:51:15.812697
2360	Temozón	31	2020-09-25 01:51:15.815625	2020-09-25 01:51:15.815625
2361	Calotmul	31	2020-09-25 01:51:15.818436	2020-09-25 01:51:15.818436
2362	Tinum	31	2020-09-25 01:51:15.821052	2020-09-25 01:51:15.821052
2363	Chankom	31	2020-09-25 01:51:15.824796	2020-09-25 01:51:15.824796
2364	Chichimilá	31	2020-09-25 01:51:15.827939	2020-09-25 01:51:15.827939
2365	Tixcacalcupul	31	2020-09-25 01:51:15.830797	2020-09-25 01:51:15.830797
2366	Kaua	31	2020-09-25 01:51:15.833469	2020-09-25 01:51:15.833469
2367	Cuncunul	31	2020-09-25 01:51:15.836129	2020-09-25 01:51:15.836129
2368	Tekom	31	2020-09-25 01:51:15.840328	2020-09-25 01:51:15.840328
2369	Chemax	31	2020-09-25 01:51:15.843649	2020-09-25 01:51:15.843649
2370	Valladolid	31	2020-09-25 01:51:15.846388	2020-09-25 01:51:15.846388
2371	Uayma	31	2020-09-25 01:51:15.848989	2020-09-25 01:51:15.848989
2372	Maxcanú	31	2020-09-25 01:51:15.851671	2020-09-25 01:51:15.851671
2373	Samahil	31	2020-09-25 01:51:15.854803	2020-09-25 01:51:15.854803
2374	Opichén	31	2020-09-25 01:51:15.858391	2020-09-25 01:51:15.858391
2375	Chocholá	31	2020-09-25 01:51:15.86111	2020-09-25 01:51:15.86111
2376	Kopomá	31	2020-09-25 01:51:15.863646	2020-09-25 01:51:15.863646
2377	Tecoh	31	2020-09-25 01:51:15.866281	2020-09-25 01:51:15.866281
2378	Abalá	31	2020-09-25 01:51:15.868847	2020-09-25 01:51:15.868847
2379	Halachó	31	2020-09-25 01:51:15.872244	2020-09-25 01:51:15.872244
2380	Muna	31	2020-09-25 01:51:15.87571	2020-09-25 01:51:15.87571
2381	Sacalum	31	2020-09-25 01:51:15.878415	2020-09-25 01:51:15.878415
2382	Maní	31	2020-09-25 01:51:15.881039	2020-09-25 01:51:15.881039
2383	Dzán	31	2020-09-25 01:51:15.8837	2020-09-25 01:51:15.8837
2384	Chapab	31	2020-09-25 01:51:15.886283	2020-09-25 01:51:15.886283
2385	Ticul	31	2020-09-25 01:51:15.889759	2020-09-25 01:51:15.889759
2386	Oxkutzcab	31	2020-09-25 01:51:15.893262	2020-09-25 01:51:15.893262
2387	Santa Elena	31	2020-09-25 01:51:15.896285	2020-09-25 01:51:15.896285
2388	Mama	31	2020-09-25 01:51:15.899066	2020-09-25 01:51:15.899066
2389	Chumayel	31	2020-09-25 01:51:15.901872	2020-09-25 01:51:15.901872
2390	Mayapán	31	2020-09-25 01:51:15.90499	2020-09-25 01:51:15.90499
2391	Teabo	31	2020-09-25 01:51:15.908287	2020-09-25 01:51:15.908287
2392	Cantamayec	31	2020-09-25 01:51:15.911048	2020-09-25 01:51:15.911048
2393	Yaxcabá	31	2020-09-25 01:51:15.913736	2020-09-25 01:51:15.913736
2394	Peto	31	2020-09-25 01:51:15.916462	2020-09-25 01:51:15.916462
2395	Chikindzonot	31	2020-09-25 01:51:15.919233	2020-09-25 01:51:15.919233
2396	Tahdziú	31	2020-09-25 01:51:15.92302	2020-09-25 01:51:15.92302
2397	Tixmehuac	31	2020-09-25 01:51:15.927466	2020-09-25 01:51:15.927466
2398	Chacsinkín	31	2020-09-25 01:51:15.930452	2020-09-25 01:51:15.930452
2399	Tzucacab	31	2020-09-25 01:51:15.933236	2020-09-25 01:51:15.933236
2400	Tekax	31	2020-09-25 01:51:15.936007	2020-09-25 01:51:15.936007
2401	Akil	31	2020-09-25 01:51:15.939161	2020-09-25 01:51:15.939161
2402	Zacatecas	32	2020-09-25 01:51:15.942171	2020-09-25 01:51:15.942171
2403	Morelos	32	2020-09-25 01:51:15.945649	2020-09-25 01:51:15.945649
2404	Vetagrande	32	2020-09-25 01:51:15.948629	2020-09-25 01:51:15.948629
2405	Concepción del Oro	32	2020-09-25 01:51:15.951433	2020-09-25 01:51:15.951433
2406	Melchor Ocampo	32	2020-09-25 01:51:15.954189	2020-09-25 01:51:15.954189
2407	Mazapil	32	2020-09-25 01:51:15.957326	2020-09-25 01:51:15.957326
2408	El Salvador	32	2020-09-25 01:51:15.960268	2020-09-25 01:51:15.960268
2409	Juan Aldama	32	2020-09-25 01:51:15.963133	2020-09-25 01:51:15.963133
2410	Miguel Auza	32	2020-09-25 01:51:15.965869	2020-09-25 01:51:15.965869
2411	General Francisco R. Murguía	32	2020-09-25 01:51:15.968524	2020-09-25 01:51:15.968524
2412	Río Grande	32	2020-09-25 01:51:15.971421	2020-09-25 01:51:15.971421
2413	Villa de Cos	32	2020-09-25 01:51:15.976231	2020-09-25 01:51:15.976231
2414	Cañitas de Felipe Pescador	32	2020-09-25 01:51:15.979291	2020-09-25 01:51:15.979291
2415	Calera	32	2020-09-25 01:51:15.982199	2020-09-25 01:51:15.982199
2416	Pánuco	32	2020-09-25 01:51:15.984885	2020-09-25 01:51:15.984885
2417	General Enrique Estrada	32	2020-09-25 01:51:15.987497	2020-09-25 01:51:15.987497
2418	Guadalupe	32	2020-09-25 01:51:15.991119	2020-09-25 01:51:15.991119
2419	Trancoso	32	2020-09-25 01:51:15.996531	2020-09-25 01:51:15.996531
2420	Genaro Codina	32	2020-09-25 01:51:15.999163	2020-09-25 01:51:15.999163
2421	Cuauhtémoc	32	2020-09-25 01:51:16.002051	2020-09-25 01:51:16.002051
2422	Ojocaliente	32	2020-09-25 01:51:16.018337	2020-09-25 01:51:16.018337
2423	General Pánfilo Natera	32	2020-09-25 01:51:16.022896	2020-09-25 01:51:16.022896
2424	Luis Moya	32	2020-09-25 01:51:16.035461	2020-09-25 01:51:16.035461
2425	Loreto	32	2020-09-25 01:51:16.039154	2020-09-25 01:51:16.039154
2426	Villa González Ortega	32	2020-09-25 01:51:16.042722	2020-09-25 01:51:16.042722
2427	Noria de Ángeles	32	2020-09-25 01:51:16.046301	2020-09-25 01:51:16.046301
2428	Villa García	32	2020-09-25 01:51:16.049672	2020-09-25 01:51:16.049672
2429	Pinos	32	2020-09-25 01:51:16.053094	2020-09-25 01:51:16.053094
2430	Villa Hidalgo	32	2020-09-25 01:51:16.057963	2020-09-25 01:51:16.057963
2431	Fresnillo	32	2020-09-25 01:51:16.061609	2020-09-25 01:51:16.061609
2432	Sombrerete	32	2020-09-25 01:51:16.065191	2020-09-25 01:51:16.065191
2433	Sain Alto	32	2020-09-25 01:51:16.068568	2020-09-25 01:51:16.068568
2434	Valparaíso	32	2020-09-25 01:51:16.071645	2020-09-25 01:51:16.071645
2435	Chalchihuites	32	2020-09-25 01:51:16.075658	2020-09-25 01:51:16.075658
2436	Jiménez del Teul	32	2020-09-25 01:51:16.079429	2020-09-25 01:51:16.079429
2437	Jerez	32	2020-09-25 01:51:16.083324	2020-09-25 01:51:16.083324
2438	Monte Escobedo	32	2020-09-25 01:51:16.086829	2020-09-25 01:51:16.086829
2439	Susticacán	32	2020-09-25 01:51:16.093308	2020-09-25 01:51:16.093308
2440	Villanueva	32	2020-09-25 01:51:16.096885	2020-09-25 01:51:16.096885
2441	Tepetongo	32	2020-09-25 01:51:16.100088	2020-09-25 01:51:16.100088
2442	El Plateado de Joaquín Amaro	32	2020-09-25 01:51:16.103323	2020-09-25 01:51:16.103323
2443	Jalpa	32	2020-09-25 01:51:16.106656	2020-09-25 01:51:16.106656
2444	Tabasco	32	2020-09-25 01:51:16.110353	2020-09-25 01:51:16.110353
2445	Huanusco	32	2020-09-25 01:51:16.114327	2020-09-25 01:51:16.114327
2446	Tlaltenango de Sánchez Román	32	2020-09-25 01:51:16.117949	2020-09-25 01:51:16.117949
2447	Momax	32	2020-09-25 01:51:16.121457	2020-09-25 01:51:16.121457
2448	Atolinga	32	2020-09-25 01:51:16.125216	2020-09-25 01:51:16.125216
2449	Tepechitlán	32	2020-09-25 01:51:16.128875	2020-09-25 01:51:16.128875
2450	Benito Juárez	32	2020-09-25 01:51:16.132945	2020-09-25 01:51:16.132945
2451	Teúl de González Ortega	32	2020-09-25 01:51:16.151656	2020-09-25 01:51:16.151656
2452	Santa María de la Paz	32	2020-09-25 01:51:16.167043	2020-09-25 01:51:16.167043
2453	Trinidad García de la Cadena	32	2020-09-25 01:51:16.171256	2020-09-25 01:51:16.171256
2454	Mezquital del Oro	32	2020-09-25 01:51:16.176214	2020-09-25 01:51:16.176214
2455	Nochistlán de Mejía	32	2020-09-25 01:51:16.179663	2020-09-25 01:51:16.179663
2456	Apulco	32	2020-09-25 01:51:16.18248	2020-09-25 01:51:16.18248
2457	Apozol	32	2020-09-25 01:51:16.185144	2020-09-25 01:51:16.185144
2458	Juchipila	32	2020-09-25 01:51:16.188006	2020-09-25 01:51:16.188006
2459	Moyahua de Estrada	32	2020-09-25 01:51:16.191409	2020-09-25 01:51:16.191409
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.clients (id, name, last_name, maiden_name, address, postal_code, email, phone_number, cellphone, contact, created_at, updated_at, rfc, suburb, state_id, city_id, company) FROM stdin;
1	Emma	Rodriguez	Gonzalez	Sierra cristal	31123	emma@gmail.com	6141109517	6141109517	Emmanuel	2020-09-30 04:18:23.678863	2020-09-30 04:18:23.678863	\N	\N	\N	\N	\N
2	Rodrigo	Ramos	Najera	Santo niño	31220	rodrigo@gmail.com	6148900000	614367889	Rodri	2020-10-16 18:20:41.7906	2020-10-16 18:20:41.7906	rona7890000	\N	\N	\N	\N
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.colors (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Negro	kjhg7890	t	2020-11-26 02:44:15.440289	2020-11-26 02:44:15.440289
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.companies (id, name, description, logo, manager, address, phone, email, user_id, created_at, updated_at) FROM stdin;
1	AgroTrailers Planet	AgroTrailers Planet	\N	\N	Cambiar Direccion	Cambiar Telefono	\N	1	2020-09-25 01:51:16.54264	2020-09-25 01:51:16.54264
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.countries (id, name, created_at, updated_at) FROM stdin;
1	México	2020-09-25 01:51:06.519693	2020-09-25 01:51:06.519693
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.departments (id, name, description, branch_id, manager_id, created_at, updated_at, code, sequence, last_code) FROM stdin;
2	Departamento Chihuahua	\N	2	2	2020-10-07 01:55:38.183773	2021-03-09 00:46:37.900008	31123	5	\N
1	Cuauhtemoc	Cuauhtemoc	1	2	2020-09-29 00:19:04.555338	2021-03-09 22:11:51.842617	d1	9	\N
\.


--
-- Data for Name: divition_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.divition_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Nueva division	0986asdf	t	2020-11-26 02:37:31.004429	2020-11-26 02:37:31.004429
\.


--
-- Data for Name: fender_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.fender_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Nuevo Fender	sdfh777	t	2020-11-26 02:39:21.719159	2020-11-26 02:39:21.719159
\.


--
-- Data for Name: fiscal_vouchers; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.fiscal_vouchers (id, name, status, created_at, updated_at) FROM stdin;
1	Adquisición de mercancias	t	2020-10-15 19:20:45.381218	2020-10-15 19:20:45.381218
2	Aportaciones voluntarias al SAR	t	2020-10-15 19:20:45.385327	2020-10-15 19:20:45.385327
3	Comunicaciones satelitales	t	2020-10-15 19:20:45.387121	2020-10-15 19:20:45.387121
4	Comunicaciones telefónicas	t	2020-10-15 19:20:45.38871	2020-10-15 19:20:45.38871
5	Construcciones	t	2020-10-15 19:20:45.390275	2020-10-15 19:20:45.390275
6	Dados, troqueles, moldes, matrices y herramental	t	2020-10-15 19:20:45.391819	2020-10-15 19:20:45.391819
7	Depósitos en cuentas para el ahorro, primas que te..	t	2020-10-15 19:20:45.393506	2020-10-15 19:20:45.393506
8	Devoluciones, descuentos o bonificaciones	t	2020-10-15 19:20:45.395276	2020-10-15 19:20:45.395276
9	Donativos	t	2020-10-15 19:20:45.397018	2020-10-15 19:20:45.397018
10	Equipo de computo y accesorios	t	2020-10-15 19:20:45.398716	2020-10-15 19:20:45.398716
11	Equipo de transporte	t	2020-10-15 19:20:45.400635	2020-10-15 19:20:45.400635
12	Gastos de transportación escolar obligatoria	t	2020-10-15 19:20:45.403138	2020-10-15 19:20:45.403138
13	Gastos en general	t	2020-10-15 19:20:45.405104	2020-10-15 19:20:45.405104
14	Gastos funerales	t	2020-10-15 19:20:45.406795	2020-10-15 19:20:45.406795
15	Gastos médicos por incapacidad o discapacidad	t	2020-10-15 19:20:45.408501	2020-10-15 19:20:45.408501
16	Honorarios médicos, dentales y gastos hospitalarios	t	2020-10-15 19:20:45.410331	2020-10-15 19:20:45.410331
17	Intereses reales efectivamente pagados por crédito	t	2020-10-15 19:20:45.412088	2020-10-15 19:20:45.412088
18	Mobiliario y equipo de oficina por inversiones	t	2020-10-15 19:20:45.413776	2020-10-15 19:20:45.413776
19	Otra maquinaria y equipo	t	2020-10-15 19:20:45.415385	2020-10-15 19:20:45.415385
20	Pagos por servicios educativos (colegiaturas)	t	2020-10-15 19:20:45.417283	2020-10-15 19:20:45.417283
21	Por definir	t	2020-10-15 19:20:45.419126	2020-10-15 19:20:45.419126
22	Primas por seguros de gastos médicos	t	2020-10-15 19:20:45.421495	2020-10-15 19:20:45.421495
\.


--
-- Data for Name: floor_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.floor_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	plano	123	t	2020-11-03 01:48:29.794898	2020-11-03 01:48:29.794898
\.


--
-- Data for Name: hydraulic_jacks; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.hydraulic_jacks (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Nuevo Gato hidraulico	987fsdfdfa	t	2020-11-26 02:40:05.644328	2020-11-26 02:40:05.644328
\.


--
-- Data for Name: item_files; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.item_files (id, item_id, file, file_type, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.items (id, name, description, model, serial_number, purchased_date, in_service_date, time_unit_service, time_quantity_service, price, time_unit_depreciation, time_quantity_depreciation, sub_category_id, provider_id, department_id, user_id, brand_id, status_item_id, created_at, updated_at, code, image, maintenance_date, maintenance_done, branch_id, category_id, to_assing, sale_price, remission, accessory, acquisition_date, trailer_id, client_id, payment_type, fiscal_voucher_id, advance_payment, status_shipping_id, color, trailer_length_id, trailer_height_id, ramp_type_id, redila_type_id, trailer_type_id, floor_type_id, capacity_id, duck_tail, gooseneck, trailer_width_id, color_id, hydraulic_jack_id, pull_type_id, brake_type_id, reinforcement_type_id, fender_type_id, turn_type_id, divition_type_id, suspension_type_id, roof_type_id, categories_description, seller_percentage, planet_percentage, branch_percentage) FROM stdin;
30	\N	\N		oiuytgb	2021-03-10	\N	\N	\N	50000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-10 17:30:34.255278	2021-03-10 17:30:55.592423	\N	\N	\N	\N	1	\N	\N	7000.0	\N	onj	2021-03-24	\N	\N	4	\N	60.0	3	\N	1	\N	1	1	1	1	1	\N	\N	1	1	\N	1	1	\N	1	\N	1	1	\N		\N	\N	\N
31	\N	\N		0999	2021-03-10	\N	\N	\N	20000.0	\N	\N	\N	\N	2	2	\N	6	2021-03-10 17:34:19.734247	2021-03-10 17:34:47.201742	\N	\N	\N	\N	2	\N	\N	20000.0	\N	ninguno	2021-03-24	\N	\N	4	\N	100.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
32	\N	\N		poiuyg	2021-03-10	\N	\N	\N	69.0	\N	\N	\N	\N	1	2	\N	6	2021-03-10 17:44:57.682025	2021-03-10 17:45:21.063378	\N	\N	\N	\N	1	\N	\N	7654.0	\N	on	2021-03-16	\N	\N	4	\N	9876.0	3	\N	1	\N	1	1	1	1	1	\N	\N	1	1	\N	1	1	\N	1	\N	1	1	\N		\N	\N	\N
33	\N	\N		0987y	2021-03-10	\N	\N	\N	10000.0	\N	\N	\N	\N	1	2	\N	1	2021-03-10 17:52:13.844844	2021-03-10 17:52:34.846048	\N	\N	\N	\N	1	\N	\N	1000.0	\N	pokj	\N	\N	\N	2	\N	\N	3	\N	1	\N	1	1	1	1	1	\N	\N	1	1	\N	1	1	\N	1	\N	1	1	\N		\N	\N	\N
35	\N	\N		098u	2021-03-10	\N	\N	\N	100000.0	\N	\N	\N	\N	1	2	\N	1	2021-03-10 18:01:37.049752	2021-03-10 18:02:01.05985	\N	\N	\N	\N	1	\N	\N	10000.0	\N	asdf	2021-03-23	\N	\N	3	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
36	\N	\N		o9uyg	2021-03-10	\N	\N	\N	67877.0	\N	\N	\N	\N	2	1	\N	6	2021-03-10 21:04:51.79045	2021-03-10 21:05:15.006042	\N	\N	\N	\N	2	\N	\N	2000.0	\N	jhgf	2021-03-17	\N	\N	4	\N	1000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
37	\N	\N		98ygbn	2021-03-10	\N	\N	\N	10000.0	\N	\N	\N	\N	1	1	\N	6	2021-03-10 21:08:33.93461	2021-03-10 21:08:53.708102	\N	\N	\N	\N	1	\N	\N	10000.0	\N	None	2021-03-02	\N	\N	4	\N	4000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
38	\N	obs		ouygbn	2021-03-10	\N	\N	\N	1000.0	\N	\N	\N	\N	2	1	\N	3	2021-03-10 21:09:19.793141	2021-03-10 21:09:34.419442	\N	\N	\N	\N	2	\N	\N	10000.0	\N	obas	2021-03-17	\N	1	3	7	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
39	\N	\N		numserie	2021-03-10	\N	\N	\N	10000.0	\N	\N	\N	\N	2	1	\N	1	2021-03-10 21:10:00.840385	2021-03-10 21:10:20.509762	\N	\N	\N	\N	2	\N	\N	1000.0	\N	accs	2021-03-09	\N	\N	2	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
40	\N	\N	1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgnullmodel234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	8	7	2021-03-11 04:01:46.68559	2021-03-11 04:01:46.68559	\N	\N	\N	\N	\N	\N	\N	\N	\N	ninguno	\N	\N	1	\N	\N	20000.0	\N	\N	1	\N	1	1	1	1	1	\N	\N	1	1	1	1	1	\N	1	1	1	1	1	\N	\N	\N	\N
34	\N	\N		087	2021-03-10	\N	\N	\N	7888.0	\N	\N	\N	\N	2	2	\N	4	2021-03-10 17:54:50.848743	2021-03-16 02:26:15.925751	\N	\N	\N	\N	2	\N	\N	1000.0	\N	nnn	2021-03-16	\N	\N	3	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
43	\N	\N	1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	1	\N	5	2021-03-23 17:47:13.0771	2021-03-23 17:47:13.0771	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ningun accesorio	\N	\N	1	\N	\N	25000.0	1	\N	1	\N	1	1	3	1	1	\N	\N	1	1	1	1	1	\N	1	1	1	1	1	\N	\N	\N	\N
11	\N	Falta factura	\N	3333444	2020-10-08	\N	\N	\N	200000.0	\N	\N	\N	\N	2	4	\N	4	2020-10-10 22:52:18.368549	2020-10-15 21:00:29.490796	chih123rw	\N	\N	t	2	\N	\N	10000.0	fffremison	\N	\N	2	1	2	6	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	\N	faltaa factura	\N	12355	\N	\N	\N	\N	10000.0	\N	\N	\N	\N	2	4	\N	4	2020-10-14 16:42:02.40675	2020-10-15 21:29:11.21518	1234Folio	\N	\N	\N	2	\N	\N	10000.0	Remision123	Grande	2020-10-15	1	1	2	7	10000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	\N	obs	\N	3455665	2020-10-15	\N	\N	\N	1000000.0	\N	\N	\N	\N	2	1	\N	1	2020-10-08 20:02:39.787802	2020-10-27 01:18:22.507824	1234Folio	\N	\N	t	2	\N	\N	200000.0	remisison 2020	Varios	\N	2	1	2	6	30000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	\N	\N	\N	34455	\N	\N	\N	\N	1000000.0	\N	\N	\N	\N	1	2	\N	4	2020-10-15 21:55:37.817949	2020-10-15 21:56:36.012199	87655	\N	\N	\N	1	\N	\N	39999.0	899990	\N	2020-10-08	2	\N	3	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	\N	\N	\N	3333	\N	\N	\N	\N	12300.0	\N	\N	\N	\N	2	1	\N	4	2020-10-14 18:33:38.108711	2020-10-19 21:50:02.944754	1234Folio	\N	\N	\N	2	\N	\N	10000.0	123Folio	\N	2020-10-08	2	\N	2	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	\N	\N		oiuytfvb	2021-03-10	\N	\N	\N	1000000.0	\N	\N	\N	\N	2	2	\N	6	2021-03-10 04:28:39.730083	2021-03-10 04:29:28.708622	\N	\N	\N	\N	2	\N	\N	10000.0	\N	Ninguno	2021-03-09	\N	\N	4	\N	50000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
2	\N	\N	B	98765	2021-03-09	\N	\N	\N	10000.0	\N	\N	\N	\N	1	1	\N	4	2020-09-30 04:30:20.451655	2021-03-09 03:51:46.582721	Folio nuevo	\N	\N	t	1	\N	\N	10000.0	remision probando estatus	todos	\N	2	1	2	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	B	\N	\N	\N
18	\N	\N	123456	123987	\N	\N	\N	\N	100000.0	\N	\N	\N	\N	2	1	\N	4	2020-11-03 01:51:33.329245	2021-01-04 21:34:59.596418	1234Folio	\N	\N	\N	2	\N	\N	1000.0	Remision123	accesorio	2020-11-25	\N	1	2	\N	120000.0	3	negro	1	\N	1	1	1	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Categoria de decripcion bla bla asdkljfhaskfgafgdkhsafgkasdhfgaskhdfgaskfgkasfgasydufgsafsa	\N	\N	\N
17	\N	observacon	\N	123567	\N	\N	\N	\N	133333.0	\N	\N	\N	\N	2	4	\N	3	2020-10-16 18:03:54.417698	2021-01-19 22:31:42.162359	nuevoarticulofolio	\N	\N	\N	1	\N	\N	4000.0	123	\N	2020-10-15	2	1	2	5	\N	3	negro	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Descripcion	11.0	78.0	11.0
19	\N	\N		oiuytr	2021-03-09	\N	\N	\N	10000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-09 22:10:28.54145	2021-03-09 22:11:51.386181	\N	\N	\N	\N	1	\N	\N	20000.0	\N	Ninguno	2021-03-10	\N	\N	4	\N	1000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
3	\N	observaconasd	blabla	87654	2020-10-15	\N	\N	\N	100000000.0	\N	\N	\N	\N	1	2	\N	1	2020-09-30 04:43:06.585425	2021-01-20 22:00:08.13494	123cuau	\N	\N	t	1	\N	\N	1000.0	remcuau	Muchos	\N	1	1	2	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	A	\N	\N	\N
8	\N	\N	\N	1235888	2020-10-15	\N	\N	\N	100000.0	\N	\N	\N	\N	1	\N	\N	1	2020-10-05 23:49:59.521772	2021-03-08 20:16:49.72218	1234Folio4	\N	\N	t	1	\N	\N	20000000.0	Remision3	\N	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10.0	90.0
10	\N	\N	A	3444	2020-10-02	\N	\N	\N	1000.0	\N	\N	\N	\N	2	3	\N	1	2020-10-10 22:45:12.083577	2021-03-08 20:17:08.810396	2349	\N	\N	t	2	\N	\N	20000000.0	emisimnn	Accesorio	\N	1	1	\N	\N	2000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	\N	\N	\N	3455	2020-10-29	\N	\N	\N	1000000.0	\N	\N	\N	\N	2	\N	\N	1	2020-10-10 23:37:44.611987	2021-03-08 20:17:17.511884	009999	\N	\N	t	2	\N	\N	20000000.0	remisisi88	\N	\N	2	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	4	\N	3	2020-10-13 00:26:22.256892	2021-03-08 20:17:41.005112	\N	\N	\N	\N	\N	\N	\N	20000000.0	\N	ACcesorios	\N	1	1	\N	\N	30000.0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	\N	\N	A	87777	2021-03-09	\N	\N	\N	200000.0	\N	\N	\N	\N	2	1	\N	1	2020-10-02 01:24:03.880744	2021-03-09 00:38:33.408251	chih123	\N	\N	t	2	\N	\N	10000.0	remchih	Todos	\N	1	1	4	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	A	\N	\N	\N
20	\N	\N		kuytf	2021-03-09	\N	\N	\N	100000.0	\N	\N	\N	\N	2	2	\N	6	2021-03-09 22:17:31.799323	2021-03-09 22:18:06.077778	\N	\N	\N	\N	2	\N	\N	1000.0	\N	ninguno	2021-03-16	\N	\N	4	\N	20000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
5	\N	\N	modelo4	7655	2021-03-09	\N	\N	\N	20000.0	\N	\N	\N	\N	2	1	\N	6	2020-10-02 01:23:09.176746	2021-03-09 01:24:44.933224	\N	\N	\N	t	2	\N	\N	10000.0	\N	Todos	2021-01-19	1	1	4	\N	90.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
1	\N	Sin comprobante	modelo1	12345	2021-03-09	\N	\N	\N	300000.0	\N	\N	\N	\N	1	1	\N	4	2020-09-30 04:29:03.845201	2021-03-09 03:33:32.785653	\N	\N	\N	t	1	\N	\N	1000.0	\N	Probando editar	2021-01-19	2	1	3	6	100.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
21	\N	\N		098765	2021-03-09	\N	\N	\N	10000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-09 22:23:06.686526	2021-03-09 22:23:53.206226	\N	\N	\N	\N	1	\N	\N	0.0	\N	ninguno	2021-03-17	\N	\N	4	\N	1000.0	3	\N	1	\N	1	1	1	1	1	\N	\N	1	1	\N	1	1	\N	1	\N	1	1	\N		\N	\N	\N
22	\N	\N		poiuyt	2021-03-09	\N	\N	\N	10000000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-09 22:25:34.791684	2021-03-09 22:27:38.498406	\N	\N	\N	\N	1	\N	\N	67000.0	\N	ninguno	2021-03-10	\N	\N	4	\N	87777.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
23	\N	\N		po87ytr	2021-03-09	\N	\N	\N	600000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-09 22:28:54.513647	2021-03-09 22:29:26.228501	\N	\N	\N	\N	1	\N	\N	500000.0	\N	ninguno	2021-03-17	\N	\N	4	\N	700000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
24	\N	\N		p'0uygv	2021-03-09	\N	\N	\N	10000000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-09 22:32:18.801591	2021-03-09 22:33:01.057552	\N	\N	\N	\N	1	\N	\N	2000.0	\N	ninguno	2021-03-10	\N	\N	4	\N	1000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
26	\N	\N		poiuytfdc	2021-03-10	\N	\N	\N	200000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-10 17:04:35.030387	2021-03-10 17:05:15.905654	\N	\N	\N	\N	1	\N	\N	10000000.0	\N	Ninnungo	2021-03-09	\N	\N	4	\N	200000.0	3	\N	1	\N	1	1	1	1	1	\N	\N	1	1	\N	1	1	\N	1	\N	1	1	\N		\N	\N	\N
27	\N	\N		09876rdvbn	2021-03-10	\N	\N	\N	400000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-10 17:09:46.580055	2021-03-10 17:10:13.38506	\N	\N	\N	\N	1	\N	\N	10000000.0	\N	none	\N	\N	\N	4	\N	28888.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
28	\N	\N		u87ytgh	2021-03-10	\N	\N	\N	100000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-10 17:15:07.263196	2021-03-10 17:15:48.943355	\N	\N	\N	\N	1	\N	\N	1000.0	\N	None	\N	\N	\N	4	\N	200.0	3	\N	1	\N	1	1	1	1	1	\N	\N	1	1	\N	1	1	\N	1	\N	1	1	\N		\N	\N	\N
29	\N	\N		wefsa	2021-03-10	\N	\N	\N	10000.0	\N	\N	\N	\N	1	2	\N	6	2021-03-10 17:21:35.040863	2021-03-10 17:22:10.711111	\N	\N	\N	\N	1	\N	\N	10000.0	\N	none	2021-03-11	\N	\N	4	\N	100.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
45	\N	\N	123456modelo1238865sdfh777	9876	\N	\N	\N	\N	35000.0	\N	\N	\N	\N	1	\N	\N	2	2021-03-24 00:02:59.169387	2021-03-24 00:02:59.169387	\N	\N	\N	\N	1	\N	\N	\N	\N	Accesorio nuevo	2021-03-17	\N	\N	\N	\N	\N	3	\N	\N	\N	1	\N	2	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER: Nuevo Fender. 	\N	\N	\N
41	\N	\N	123456modelo1238865sdfh777	1235	\N	\N	\N	\N	10000.0	\N	\N	\N	\N	1	\N	\N	2	2021-03-22 21:48:11.829867	2021-03-24 00:24:56.035266	\N	\N	\N	\N	1	\N	\N	\N	\N	Accesorio	2021-03-17	\N	\N	\N	\N	\N	3	\N	\N	\N	1	\N	2	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	TRAILER: Doble cabina. RAMPA: RAmpa. CAPACIDAD: 100. FENDER: Nuevo Fender. 	\N	\N	\N
42	\N	\N	1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234	9998888	2021-03-24	\N	\N	\N	10000.0	\N	\N	\N	\N	2	1	\N	6	2021-03-23 01:17:40.177377	2021-03-24 01:50:39.814379	\N	\N	\N	\N	2	\N	\N	10000.0	\N	Ninungo	2021-03-10	\N	\N	4	\N	2000.0	3	\N	1	\N	1	1	3	1	1	\N	\N	1	1	1	1	1	\N	1	1	1	1	1	TRAILER: Trailer grane. ANCHO: 5. LARGO: 6. PISO: plano. RAMPA: RAmpa. CAPACIDAD: 100. REDILA: Redila. TECHO: Techo nuevo. VOLTEO: Volteo. FRENO: Freno nuevo. COLOR: Negro. DIVISION: Nueva division. FENDER: Nuevo Fender. GATO HIDRAULICO: Nuevo Gato hidraulico. JALON: Jalon Nuevo. SUSPENSION: Nueva suspension. 	\N	\N	\N
44	\N	\N	123456modelo1238865sdfh777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	7	\N	5	2021-03-23 18:05:36.807308	2021-03-24 02:50:46.645272	\N	\N	\N	\N	\N	\N	\N	\N	\N	Accesorios	\N	\N	2	\N	\N	35000.0	1	\N	\N	\N	1	\N	2	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N
46	\N	\N	1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234	10097654888	\N	\N	\N	\N	60000.0	\N	\N	\N	\N	1	\N	\N	2	2021-03-24 21:08:15.504895	2021-03-24 21:09:02.708421	\N	\N	\N	\N	1	\N	\N	\N	\N	60 mil	2021-03-18	\N	\N	\N	\N	\N	3	\N	1	\N	1	1	3	1	1	\N	\N	1	1	1	1	1	\N	1	1	1	1	1	TRAILER: Trailer grane. ANCHO: 5. LARGO: 6. PISO: plano. RAMPA: RAmpa. CAPACIDAD: 100. REDILA: Redila. TECHO: Techo nuevo. VOLTEO: Volteo. FRENO: Freno nuevo. COLOR: Negro. DIVISION: Nueva division. FENDER: Nuevo Fender. GATO HIDRAULICO: Nuevo Gato hidraulico. JALON: Jalon Nuevo. SUSPENSION: Nueva suspension. 	\N	\N	\N
47	\N	\N	123456modelo1238865sdfh777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	3	\N	5	2021-03-24 21:10:08.174611	2021-03-24 21:11:37.761139	\N	\N	\N	\N	\N	\N	\N	\N	\N	todos	\N	\N	1	\N	\N	50000.0	1	\N	\N	\N	1	\N	2	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: items_maintenances; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.items_maintenances (id, item_id, file, maintenance_id, description, price, provider, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: maintenances; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.maintenances (id, name, description, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: offices; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.offices (id, name, description, department_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permission_roles; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.permission_roles (id, role_id, permission_id, created_at, updated_at) FROM stdin;
1374	3	117	2021-03-17 01:28:01.365077	2021-03-17 01:28:01.365077
1375	3	36	2021-03-17 01:28:01.374248	2021-03-17 01:28:01.374248
1376	3	78	2021-03-17 01:28:01.38681	2021-03-17 01:28:01.38681
1377	3	43	2021-03-17 01:28:01.398514	2021-03-17 01:28:01.398514
1378	3	76	2021-03-17 01:28:01.405798	2021-03-17 01:28:01.405798
1379	3	123	2021-03-17 01:28:01.414342	2021-03-17 01:28:01.414342
1380	3	113	2021-03-17 01:28:01.422583	2021-03-17 01:28:01.422583
1381	3	77	2021-03-17 01:28:01.429212	2021-03-17 01:28:01.429212
1382	3	89	2021-03-17 01:28:01.437326	2021-03-17 01:28:01.437326
1383	3	90	2021-03-17 01:28:01.449769	2021-03-17 01:28:01.449769
1384	3	91	2021-03-17 01:28:01.458718	2021-03-17 01:28:01.458718
1385	3	94	2021-03-17 01:28:01.466053	2021-03-17 01:28:01.466053
1386	3	95	2021-03-17 01:28:01.47281	2021-03-17 01:28:01.47281
1387	3	96	2021-03-17 01:28:01.483286	2021-03-17 01:28:01.483286
1388	3	118	2021-03-17 01:28:01.495121	2021-03-17 01:28:01.495121
1389	3	68	2021-03-17 01:28:01.506874	2021-03-17 01:28:01.506874
1390	3	82	2021-03-17 01:28:01.514742	2021-03-17 01:28:01.514742
1391	3	119	2021-03-17 01:28:01.520403	2021-03-17 01:28:01.520403
1392	3	120	2021-03-17 01:28:01.527626	2021-03-17 01:28:01.527626
1393	3	93	2021-03-17 01:28:01.567195	2021-03-17 01:28:01.567195
1394	3	111	2021-03-17 01:28:01.580162	2021-03-17 01:28:01.580162
1395	3	121	2021-03-17 01:28:01.58786	2021-03-17 01:28:01.58786
1396	3	73	2021-03-17 01:28:01.613091	2021-03-17 01:28:01.613091
1397	3	80	2021-03-17 01:28:01.620809	2021-03-17 01:28:01.620809
1398	3	92	2021-03-17 01:28:01.63618	2021-03-17 01:28:01.63618
1399	3	86	2021-03-17 01:28:01.645837	2021-03-17 01:28:01.645837
1400	3	98	2021-03-17 01:28:01.655084	2021-03-17 01:28:01.655084
1401	3	84	2021-03-17 01:28:01.665098	2021-03-17 01:28:01.665098
1402	3	85	2021-03-17 01:28:01.672693	2021-03-17 01:28:01.672693
1403	3	61	2021-03-17 01:28:01.679644	2021-03-17 01:28:01.679644
1404	3	75	2021-03-17 01:28:01.686787	2021-03-17 01:28:01.686787
1405	3	64	2021-03-17 01:28:01.698698	2021-03-17 01:28:01.698698
1406	3	65	2021-03-17 01:28:01.709362	2021-03-17 01:28:01.709362
1407	3	66	2021-03-17 01:28:01.716806	2021-03-17 01:28:01.716806
1408	3	97	2021-03-17 01:28:01.7224	2021-03-17 01:28:01.7224
1409	3	67	2021-03-17 01:28:01.731641	2021-03-17 01:28:01.731641
1410	3	69	2021-03-17 01:28:01.738286	2021-03-17 01:28:01.738286
1411	3	70	2021-03-17 01:28:01.755921	2021-03-17 01:28:01.755921
1412	3	74	2021-03-17 01:28:01.769705	2021-03-17 01:28:01.769705
1413	3	99	2021-03-17 01:28:01.783794	2021-03-17 01:28:01.783794
1414	3	122	2021-03-17 01:28:01.844269	2021-03-17 01:28:01.844269
1415	3	105	2021-03-17 01:28:01.860881	2021-03-17 01:28:01.860881
1416	3	102	2021-03-17 01:28:01.875064	2021-03-17 01:28:01.875064
1417	3	107	2021-03-17 01:28:01.88282	2021-03-17 01:28:01.88282
1418	3	103	2021-03-17 01:28:01.948825	2021-03-17 01:28:01.948825
1419	3	101	2021-03-17 01:28:02.00823	2021-03-17 01:28:02.00823
1420	3	104	2021-03-17 01:28:02.044176	2021-03-17 01:28:02.044176
1421	3	100	2021-03-17 01:28:02.103205	2021-03-17 01:28:02.103205
1422	3	112	2021-03-17 01:28:02.111861	2021-03-17 01:28:02.111861
1423	3	114	2021-03-17 01:28:02.118655	2021-03-17 01:28:02.118655
1424	3	79	2021-03-17 01:28:02.127573	2021-03-17 01:28:02.127573
1425	3	115	2021-03-17 01:28:02.136829	2021-03-17 01:28:02.136829
1426	3	83	2021-03-17 01:28:02.160132	2021-03-17 01:28:02.160132
1427	3	124	2021-03-17 01:28:02.166253	2021-03-17 01:28:02.166253
1428	3	110	2021-03-17 01:28:02.173811	2021-03-17 01:28:02.173811
1429	3	108	2021-03-17 01:28:02.184032	2021-03-17 01:28:02.184032
1430	3	109	2021-03-17 01:28:02.191894	2021-03-17 01:28:02.191894
1431	3	88	2021-03-17 01:28:02.220412	2021-03-17 01:28:02.220412
1432	3	87	2021-03-17 01:28:02.231958	2021-03-17 01:28:02.231958
1433	3	116	2021-03-17 01:28:02.247242	2021-03-17 01:28:02.247242
1434	3	60	2021-03-17 01:28:02.259358	2021-03-17 01:28:02.259358
1435	3	62	2021-03-17 01:28:02.345326	2021-03-17 01:28:02.345326
1503	4	117	2021-03-17 01:45:51.947151	2021-03-17 01:45:51.947151
1436	3	63	2021-03-17 01:28:02.353904	2021-03-17 01:28:02.353904
1437	3	26	2021-03-17 01:28:02.372699	2021-03-17 01:28:02.372699
1438	3	24	2021-03-17 01:28:02.387228	2021-03-17 01:28:02.387228
1439	3	71	2021-03-17 01:28:02.400625	2021-03-17 01:28:02.400625
1440	3	23	2021-03-17 01:28:02.411803	2021-03-17 01:28:02.411803
1441	3	20	2021-03-17 01:28:02.420656	2021-03-17 01:28:02.420656
1442	3	19	2021-03-17 01:28:02.433559	2021-03-17 01:28:02.433559
1443	3	18	2021-03-17 01:28:02.479414	2021-03-17 01:28:02.479414
1444	3	17	2021-03-17 01:28:02.622803	2021-03-17 01:28:02.622803
1504	4	36	2021-03-17 01:45:51.954869	2021-03-17 01:45:51.954869
1505	4	78	2021-03-17 01:45:51.966489	2021-03-17 01:45:51.966489
1506	4	43	2021-03-17 01:45:51.975413	2021-03-17 01:45:51.975413
1507	4	76	2021-03-17 01:45:51.982293	2021-03-17 01:45:51.982293
1508	4	123	2021-03-17 01:45:51.989083	2021-03-17 01:45:51.989083
1509	4	113	2021-03-17 01:45:51.999983	2021-03-17 01:45:51.999983
1510	4	77	2021-03-17 01:45:52.014008	2021-03-17 01:45:52.014008
1511	4	89	2021-03-17 01:45:52.025004	2021-03-17 01:45:52.025004
1512	4	90	2021-03-17 01:45:52.032631	2021-03-17 01:45:52.032631
1513	4	91	2021-03-17 01:45:52.039428	2021-03-17 01:45:52.039428
1514	4	94	2021-03-17 01:45:52.04563	2021-03-17 01:45:52.04563
1515	4	95	2021-03-17 01:45:52.055403	2021-03-17 01:45:52.055403
1516	4	96	2021-03-17 01:45:52.066235	2021-03-17 01:45:52.066235
1517	4	118	2021-03-17 01:45:52.074052	2021-03-17 01:45:52.074052
1518	4	82	2021-03-17 01:45:52.080656	2021-03-17 01:45:52.080656
1519	4	119	2021-03-17 01:45:52.0932	2021-03-17 01:45:52.0932
1520	4	120	2021-03-17 01:45:52.108154	2021-03-17 01:45:52.108154
1521	4	93	2021-03-17 01:45:52.119846	2021-03-17 01:45:52.119846
1522	4	111	2021-03-17 01:45:52.126498	2021-03-17 01:45:52.126498
1523	4	121	2021-03-17 01:45:52.132693	2021-03-17 01:45:52.132693
1524	4	73	2021-03-17 01:45:52.138048	2021-03-17 01:45:52.138048
1525	4	80	2021-03-17 01:45:52.143591	2021-03-17 01:45:52.143591
1526	4	92	2021-03-17 01:45:52.159234	2021-03-17 01:45:52.159234
1527	4	86	2021-03-17 01:45:52.166684	2021-03-17 01:45:52.166684
1528	4	98	2021-03-17 01:45:52.172829	2021-03-17 01:45:52.172829
1529	4	84	2021-03-17 01:45:52.181035	2021-03-17 01:45:52.181035
1445	3	59	2021-03-17 01:28:02.63654	2021-03-17 01:28:02.63654
1446	3	72	2021-03-17 01:28:02.658096	2021-03-17 01:28:02.658096
1530	4	85	2021-03-17 01:45:52.186421	2021-03-17 01:45:52.186421
1531	4	61	2021-03-17 01:45:52.192763	2021-03-17 01:45:52.192763
1532	4	75	2021-03-17 01:45:52.199611	2021-03-17 01:45:52.199611
1533	4	64	2021-03-17 01:45:52.210824	2021-03-17 01:45:52.210824
1534	4	66	2021-03-17 01:45:52.219221	2021-03-17 01:45:52.219221
1535	4	97	2021-03-17 01:45:52.22581	2021-03-17 01:45:52.22581
1536	4	67	2021-03-17 01:45:52.231458	2021-03-17 01:45:52.231458
1537	4	69	2021-03-17 01:45:52.238282	2021-03-17 01:45:52.238282
1538	4	74	2021-03-17 01:45:52.244952	2021-03-17 01:45:52.244952
1539	4	99	2021-03-17 01:45:52.252423	2021-03-17 01:45:52.252423
1540	4	122	2021-03-17 01:45:52.273337	2021-03-17 01:45:52.273337
1541	4	105	2021-03-17 01:45:52.281	2021-03-17 01:45:52.281
1542	4	102	2021-03-17 01:45:52.289106	2021-03-17 01:45:52.289106
1543	4	107	2021-03-17 01:45:52.295412	2021-03-17 01:45:52.295412
1544	4	103	2021-03-17 01:45:52.321723	2021-03-17 01:45:52.321723
1545	4	101	2021-03-17 01:45:52.327996	2021-03-17 01:45:52.327996
1546	4	104	2021-03-17 01:45:52.334101	2021-03-17 01:45:52.334101
1547	4	100	2021-03-17 01:45:52.34194	2021-03-17 01:45:52.34194
1548	4	112	2021-03-17 01:45:52.347685	2021-03-17 01:45:52.347685
1549	4	114	2021-03-17 01:45:52.355804	2021-03-17 01:45:52.355804
1550	4	79	2021-03-17 01:45:52.368237	2021-03-17 01:45:52.368237
1551	4	115	2021-03-17 01:45:52.375136	2021-03-17 01:45:52.375136
1552	4	83	2021-03-17 01:45:52.380378	2021-03-17 01:45:52.380378
1553	4	124	2021-03-17 01:45:52.387386	2021-03-17 01:45:52.387386
1554	4	110	2021-03-17 01:45:52.394463	2021-03-17 01:45:52.394463
1555	4	108	2021-03-17 01:45:52.400425	2021-03-17 01:45:52.400425
1556	4	109	2021-03-17 01:45:52.41604	2021-03-17 01:45:52.41604
1557	4	88	2021-03-17 01:45:52.429022	2021-03-17 01:45:52.429022
1558	4	87	2021-03-17 01:45:52.437266	2021-03-17 01:45:52.437266
1559	4	116	2021-03-17 01:45:52.444883	2021-03-17 01:45:52.444883
241	2	107	2021-03-16 04:34:36.131353	2021-03-16 04:34:36.131353
242	2	103	2021-03-16 04:34:36.139986	2021-03-16 04:34:36.139986
243	2	102	2021-03-16 04:34:36.152249	2021-03-16 04:34:36.152249
244	2	101	2021-03-16 04:34:36.162536	2021-03-16 04:34:36.162536
245	2	100	2021-03-16 04:34:36.168874	2021-03-16 04:34:36.168874
246	2	105	2021-03-16 04:34:36.174237	2021-03-16 04:34:36.174237
247	2	104	2021-03-16 04:34:36.180808	2021-03-16 04:34:36.180808
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.permissions (id, name, description, action, controller, created_at, updated_at) FROM stdin;
1	Mostrar Detalles De Un Permiso	Permite mostrar los detalles de un permiso.	show	Permissions	2020-09-25 01:51:16.617613	2020-09-25 01:51:16.617613
2	Actualizar Permiso	Permite actualizar un permiso. 	update	Permissions	2020-09-25 01:51:16.626096	2020-09-25 01:51:16.626096
3	Editar Permiso	Permite visualizar la vista editar permiso.	edit	Permissions	2020-09-25 01:51:16.634022	2020-09-25 01:51:16.634022
4	Generar Semillas	Permite generar las semillas de los permisos y sus relaciones.	generate_seeds	Permissions	2020-09-25 01:51:16.646049	2020-09-25 01:51:16.646049
5	Obtener Controladores Y Acciones	Permite obtener los controladores y acciones para generar los permisos.	get_controller_actions	Permissions	2020-09-25 01:51:16.652228	2020-09-25 01:51:16.652228
6	Mostrar Listado De Permisos	Permite mostrar un listado de los permisos.	index	Permissions	2020-09-25 01:51:16.660924	2020-09-25 01:51:16.660924
7	Nuevo Permiso	Permite visualizar la vista nuevo permiso.	new	Permissions	2020-09-25 01:51:16.669224	2020-09-25 01:51:16.669224
8	Crear Rol	Permite crear roles.	create	Roles	2020-09-25 01:51:16.679167	2020-09-25 01:51:16.679167
9	Asignar Permisos A Roles	Permite asignar permisos a un rol existente. 	assign_permissions	Roles	2020-09-25 01:51:16.686034	2020-09-25 01:51:16.686034
10	Destruir Rol	Permite destruir un rol.	destroy	Roles	2020-09-25 01:51:16.697269	2020-09-25 01:51:16.697269
11	Editar Rol	Permite visualizar la vista editar rol.	edit	Roles	2020-09-25 01:51:16.705999	2020-09-25 01:51:16.705999
12	Mostrar Listado De Roles	Permite mostrar un listado de los roles.	index	Roles	2020-09-25 01:51:16.712373	2020-09-25 01:51:16.712373
13	Nuevo Rol	Permite visualizar la vista nuevo rol.	new	Roles	2020-09-25 01:51:16.717877	2020-09-25 01:51:16.717877
14	Mostrar Permisos Asignados A Un Rol	Permite mostrar los permisos asignados de un rol.	role_permissions	Roles	2020-09-25 01:51:16.725841	2020-09-25 01:51:16.725841
15	Mostrar Detalles De Un Rol	Permite mostrar los detalles de un rol.	show	Roles	2020-09-25 01:51:16.745792	2020-09-25 01:51:16.745792
16	Actualizar Rol	Permite actualizar un rol.	update	Roles	2020-09-25 01:51:16.749595	2020-09-25 01:51:16.749595
17	Crear Usuario	Permite crear un usuario. 	create_user	Users::Registrations	2020-09-25 01:51:16.75429	2020-09-25 01:51:16.75429
18	Editar Un Usuario	Permite visualizar la vista editar de un usuario.	edit_user	Users::Registrations	2020-09-25 01:51:16.75893	2020-09-25 01:51:16.75893
19	Mostrar Listado De Usuarios	Permite mostrar un listado de los usuarios.	index	Users::Registrations	2020-09-25 01:51:16.762513	2020-09-25 01:51:16.762513
20	Nuevo Usuario	Permite visualizar la vista nuevo usuario.	new_user	Users::Registrations	2020-09-25 01:51:16.765907	2020-09-25 01:51:16.765907
21	Cambiar Contraseña De Un Usuario	Permite visualizar la vista cambiar contraseña de un usuario.	change_password	Users::Registrations	2020-09-25 01:51:16.771119	2020-09-25 01:51:16.771119
22	Guardar Contraseña De Un Usuario	Permite guardar la contraseña de un usuario. 	save_password	Users::Registrations	2020-09-25 01:51:16.781887	2020-09-25 01:51:16.781887
23	Actualizar Usuario	Permite actualizar un usuario.	update_user	Users::Registrations	2020-09-25 01:51:16.791452	2020-09-25 01:51:16.791452
24	Mostrar Detalles De Un Usuario	Permite mostrar los detalles de un usuario.	show	Users::Registrations	2020-09-25 01:51:16.801078	2020-09-25 01:51:16.801078
25	Destruir Permiso	Permite destruir un permiso.	destroy	Permissions	2020-09-25 01:51:16.807831	2020-09-25 01:51:16.807831
26	Eliminar Usuario	Permite destruir un usuario.	destroy	Users::Registrations	2020-09-25 01:51:16.81229	2020-09-25 01:51:16.81229
27	Cambiar Contraseña Propia	Permite cambiar contraseña en la edición de perfil.	update_password	Users::Registrations	2020-09-25 01:51:16.81606	2020-09-25 01:51:16.81606
28	Cambiar Datos De Perfil	Permite cambiar datos en la edición de perfil.	update_profile	Users::Registrations	2020-09-25 01:51:16.819955	2020-09-25 01:51:16.819955
29	Cambiar Imágen De Perfil	Permite cambiar imágen de perfil.	get_user_image	Users::Registrations	2020-09-25 01:51:16.823497	2020-09-25 01:51:16.823497
30	Mostrar Lista De Compañías	Permite mostrar lista de Compañías	index	Companies	2020-09-25 01:51:16.82705	2020-09-25 01:51:16.82705
31	Mostrar Vista Para Crear Una Empresa	Permite mostrar vista para crear una empresa	new	Companies	2020-09-25 01:51:16.830611	2020-09-25 01:51:16.830611
32	Crear Empresas	Permite crear empresas	create	Companies	2020-09-25 01:51:16.834858	2020-09-25 01:51:16.834858
33	Mostrar Vista Para Actualizar Una Empresa	Permite mostrar vista para actualizar una empresa	edit	Companies	2020-09-25 01:51:16.840178	2020-09-25 01:51:16.840178
34	Actualizar Una Empresa	Permite actualizar una empresa	update	Companies	2020-09-25 01:51:16.844352	2020-09-25 01:51:16.844352
35	Eliminar Empresa	Permite eliminar empresa	destroy	Companies	2020-09-25 01:51:16.847902	2020-09-25 01:51:16.847902
36	Mostrar Lista De Sucursales	Permite mostrar lista de Sucursales	index	Branches	2020-09-25 01:51:16.851444	2020-09-25 01:51:16.851444
37	Mostrar Vista Para Crear Sucursales	Permite mostrar vista para crear sucursales	new	Branches	2020-09-25 01:51:16.856284	2020-09-25 01:51:16.856284
38	Crear Sucursales	Permite crear sucursales	create	Branches	2020-09-25 01:51:16.860662	2020-09-25 01:51:16.860662
39	Mostrar Vista Para Actualizar Sucursales	Permite mostrar vista para actualizar sucursales	edit	Branches	2020-09-25 01:51:16.86452	2020-09-25 01:51:16.86452
40	Actualizar Sucursales	Permite actualizar sucursales	update	Branches	2020-09-25 01:51:16.868207	2020-09-25 01:51:16.868207
41	Eliminar Sucursales	Permite eliminar sucursales	destroy	Branches	2020-09-25 01:51:16.872913	2020-09-25 01:51:16.872913
42	Mostrar Detalles De Una Compañía	Permite mostrar detalles de una compañía	show	Companies	2020-09-25 01:51:16.877028	2020-09-25 01:51:16.877028
43	Mostrar Detalles De Una Sucursal	Permite mostrar detalles de una sucursal	show	Branches	2020-09-25 01:51:16.880777	2020-09-25 01:51:16.880777
44	Mostrar Lista De Departamentos	Permite mostrar lista de Departamentos	index	Departments	2020-09-25 01:51:16.884332	2020-09-25 01:51:16.884332
45	Mostrar Detalles De Un Departamento	Permite mostrar detalles de un departamento	show	Departments	2020-09-25 01:51:16.889139	2020-09-25 01:51:16.889139
46	Mostrar Vista Para Crear Un Departamento	Permite mostrar vista para crear un departamento	new	Departments	2020-09-25 01:51:16.893899	2020-09-25 01:51:16.893899
47	Crear Departamentos	Permite crear departamentos	create	Departments	2020-09-25 01:51:16.89808	2020-09-25 01:51:16.89808
48	Mostrar Vista Para Actualizar Un Departamento	Permite mostrar vista para actualizar un departamento	edit	Departments	2020-09-25 01:51:16.901963	2020-09-25 01:51:16.901963
49	Actualizar Departamentos	Permite actualizar departamentos	update	Departments	2020-09-25 01:51:16.906367	2020-09-25 01:51:16.906367
50	Eliminar Departamentos	Permite eliminar departamentos	destroy	Departments	2020-09-25 01:51:16.910052	2020-09-25 01:51:16.910052
51	Mostrar Lista De Empleados	Permite mostrar lista de empleados	employees_index	Users::Registrations	2020-09-25 01:51:16.913616	2020-09-25 01:51:16.913616
52	Mostrar Lista De Artículos De Trabajo	Permite mostrar lista de Artículos de Trabajo	index	WorkArticles	2020-09-25 01:51:16.917258	2020-09-25 01:51:16.917258
53	Mostrar Vista Para Crear Un Artículo De Trabajo	Permite mostrar vista para crear un artículo de trabajo	new	WorkArticles	2020-09-25 01:51:16.922409	2020-09-25 01:51:16.922409
54	Crear Artículo De Trabajo	Permite crear Artículo de Trabajo	create	WorkArticles	2020-09-25 01:51:16.926522	2020-09-25 01:51:16.926522
55	Mostrar Vista Para Actualizar Un Artículo De Trabajo	Permite mostrar vista para actualizar un artículo de trabajo	edit	WorkArticles	2020-09-25 01:51:16.93026	2020-09-25 01:51:16.93026
56	Actualizar Artículos De Trabajo	Permite actualizar Artículos de Trabajo	update	WorkArticles	2020-09-25 01:51:16.933825	2020-09-25 01:51:16.933825
57	Mostrar Detalles De Un Artículo De Trabajo	Permite mostrar detalles de un Artículo de Trabajo	show	WorkArticles	2020-09-25 01:51:16.938598	2020-09-25 01:51:16.938598
58	Eliminar Artículos De Trabajo	Permite eliminar Artículos de Trabajo	destroy	WorkArticles	2020-09-25 01:51:16.943433	2020-09-25 01:51:16.943433
59	Asignar Artículo De Trabajo A Empleado	Permite asignar artículo de trabajo a empleado	add_work_article	Users::Registrations	2020-09-25 01:51:16.947246	2020-09-25 01:51:16.947246
60	Desasignar Artículo De Trabajo A Empleado	Permite desasignar artículo de trabajo a empleado	remove_work_article	Users::Registrations	2020-09-25 01:51:16.951533	2020-09-25 01:51:16.951533
61	Actualizar Artículos	Permite actualizar artículos	update	Items	2020-09-25 01:51:16.957199	2020-09-25 01:51:16.957199
62	Mostrar Lista De Artículos De Trabajo Asignados A Un Empleado	Permite mostrar lista de Artículos de Trabajo asignados a un empleado	assign_work_articles	Users::Registrations	2020-09-25 01:51:16.961272	2020-09-25 01:51:16.961272
63	Obtener Artículos De Trabajo De Un Empleado	Permite obtener Artículos de Trabajo de un empleado	search_work_articles	Users::Registrations	2020-09-25 01:51:16.96517	2020-09-25 01:51:16.96517
64	Mostrar Lista De Artículos	Permite mostrar lista de Artículos	index	Items	2020-09-25 01:51:16.969739	2020-09-25 01:51:16.969739
65	Mostrar Vista Para Crear Un Artículo	Permite mostrar vista para crear un artículo	new	Items	2020-09-25 01:51:16.975021	2020-09-25 01:51:16.975021
66	Crear Artículos	Permite crear artículos	create	Items	2020-09-25 01:51:16.978906	2020-09-25 01:51:16.978906
67	Mostrar Vista Para Actualizar Artículos	Permite mostrar vista para actualizar artículos	edit	Items	2020-09-25 01:51:16.983165	2020-09-25 01:51:16.983165
68	Mostrar Artículos De Empleado	Permite mostrar artículos de empleado	employee_items	Departments	2020-09-25 01:51:16.988243	2020-09-25 01:51:16.988243
69	Mostrar Detalles De Un Artículo	Permite mostrar detalles de un artículo	show	Items	2020-09-25 01:51:16.993522	2020-09-25 01:51:16.993522
70	Eliminar Artículos	Permite eliminar artículos	destroy	Items	2020-09-25 01:51:16.997097	2020-09-25 01:51:16.997097
71	Asignar Artículo A Empleado	Permite asignar artículo a empleado	assign_item	Users::Registrations	2020-09-25 01:51:17.000799	2020-09-25 01:51:17.000799
72	Desasignar Artículo A Empleado	Permite desasignar artículo a empleado	unassign_item	Users::Registrations	2020-09-25 01:51:17.005666	2020-09-25 01:51:17.005666
73	Realizar Búsquedas Para Reporteador	Permite realizar búsquedas para reporteador	reporter	Items	2020-09-25 01:51:17.009876	2020-09-25 01:51:17.009876
74	Ver Los Mantenimientos Próximos	Permite ver los mantenimientos próximos	next_maintenances	Items	2020-09-25 01:51:17.013579	2020-09-25 01:51:17.013579
75	Exportador De Excel	Permite exportar los items a un excel	items_excel	Items	2020-09-25 01:51:17.017221	2020-09-25 01:51:17.017221
76	Obtener Departamentos Para Select En Reporteador	Permite obtener departamentos para select en reporteador	departments	Branches	2020-09-25 01:51:17.021907	2020-09-25 01:51:17.021907
77	Obtener Subcategorias Para Select En Reporteador	Permite obtener subcategorias para select en reporteador	sub_categories	Categories	2020-09-25 01:51:17.026568	2020-09-25 01:51:17.026568
78	Obtener Departamentos Para Select En Form De Item	Permite obtener departamentos para select en form de item	departments_for_select	Branches	2020-09-25 01:51:17.030442	2020-09-25 01:51:17.030442
79	Permite Generar El Reporte Del Checklist Del Empleado	Permite Generar el reporte del Checklist del empleado	report_check_items_user	Reports	2020-09-25 01:51:17.034302	2020-09-25 01:51:17.034302
80	Actualizar Fecha De Mantenimiento De Un Artículo	Permite actualizar fecha de mantenimiento de un artículo	change_maintenance_done	Items	2020-09-25 01:51:17.038292	2020-09-25 01:51:17.038292
81	Obtener El Ultimo Codigo De Un Departamento Para Cuando No Se Tiene Sucursal	Permite obtener el ultimo codigo del departamento	next_code	Branches	2020-09-25 01:51:17.042202	2020-09-25 01:51:17.042202
82	Obtener Departmante Por Id De Sucursal	Permite Obtener departmante por id de sucursal	get_departments_by_branch	Departments	2020-09-25 01:51:17.046064	2020-09-25 01:51:17.046064
83	Obtener Sub Categorias Por Id De Categoria	Permite obtener SubCategorias por id de categoria	get_subcategory_by_category	SubCategories	2020-09-25 01:51:17.049925	2020-09-25 01:51:17.049925
84	Vista Para Crear Pedidos	Permite entrar a la vista para crear los pedidos	new_order	Items	2020-09-28 02:36:35.180902	2020-09-28 02:36:35.180902
85	Vista Para Ver Pedidos	Permite entrar a la vista para ver los pedidos	orders	Items	2020-10-12 19:51:41.497485	2020-10-12 19:51:41.497485
86	Vista Para Ver Las Ventas	Permite entrar a la vista para ver las ventas	sales	Items	2020-10-12 21:10:28.128255	2020-10-12 21:10:28.128255
87	Vista Para Ver Las Trailers	Permite entrar a la vista para ver los trailers	index	Trailers	2020-10-12 22:56:38.714647	2020-10-12 22:56:38.714647
88	Permite Entrar A La Vista Para Ver La Informacion De Un Trailer.	Permite entrar a la vista para ver la informacion de un trailer en especifico	show	Trailers	2020-10-13 00:03:03.783053	2020-10-13 00:03:03.783053
89	Vista Para Ver Los Clientes	Permite entrar a la vista para ver los clientes	index	Clients	2020-10-13 00:47:21.770362	2020-10-13 00:47:21.770362
90	Vista Para Crear Los Clientes	Permite entrar a la vista para crear los clientes	new	Clients	2020-10-13 04:36:43.948122	2020-10-13 04:36:43.948122
91	Mostrar Detalles De Un Cliente	Permite mostrar los detalles de un cliente.	show	Clients	2020-10-13 04:38:20.391702	2020-10-13 04:38:20.391702
92	Vista Para Ver Pedidos Enviados	Permite entrar a la vista para ver los pedidos enviados	orders_shipped	Items	2020-10-14 16:00:33.499613	2020-10-14 16:00:33.499613
93	Mostrar Listado De Comprobantes Fiscales	Permite mostrar un listado de los comprobantes fiscales.	index	FiscalVouchers	2020-10-15 19:28:06.073611	2020-10-15 19:28:06.073611
94	Crear Cliente	Permite crear los cliente.	create	Clients	2020-10-16 18:19:22.701462	2020-10-16 18:19:22.701462
95	Actualizar Cliente	Permite actualizar los cliente.	update	Clients	2020-10-16 18:22:42.285352	2020-10-16 18:22:42.285352
96	Editar Cliente	Permite visualizar la vista editar cliente.	edit	Clients	2020-10-16 18:25:18.345847	2020-10-16 18:25:18.345847
97	Mandar Correo De Trailer Vendido	Permite mandar correo de trailer vendido	send_email	Items	2020-11-20 23:36:48.307126	2020-11-20 23:38:17.345452
98	Vista Para Ver Cotizaciones	Permite entrar a la vista para ver las cotizaciones	quotations	Items	2021-03-11 03:27:18.764451	2021-03-11 03:27:18.764451
99	Vista Para Crear Cotizacion	Permite entrar a la vista para crear las cotizaciones	new_quotation	Items	2021-03-11 03:30:42.45315	2021-03-11 03:30:42.45315
100	Vista Para Ver Cotizaciones	Permite entrar a la vista para ver las cotizaciones	index	Quotations	2021-03-16 04:14:46.324398	2021-03-16 04:14:46.324398
101	Vista Para Crear Cotizacion	Permite entrar a la vista para crear las cotizaciones	new	Quotations	2021-03-16 04:15:20.131544	2021-03-16 04:15:20.131544
102	Vista Para Editar Una Cotizacion	Permite entrar a la vista para editar las cotizaciones	edit	Quotations	2021-03-16 04:15:53.986371	2021-03-16 04:15:53.986371
103	Permite Crear Una Cotizacion	Permite crear las cotizaciones	create	Quotations	2021-03-16 04:16:56.444209	2021-03-16 04:16:56.444209
104	Permite Actualizar Una Cotizacion	Permite actualizar las cotizaciones	update	Quotations	2021-03-16 04:17:23.396651	2021-03-16 04:17:23.396651
105	Permite Eliminar Una Cotizacion	Permite eliminar las cotizaciones	delete	Quotations	2021-03-16 04:18:14.068509	2021-03-16 04:18:14.068509
107	Permite Ver El Pdf De Una Cotizacion	Permite ver pdf de una cotizacion	report_quotation	Quotations	2021-03-16 04:33:58.953581	2021-03-16 04:33:58.953581
108	Vista Para Ver Los Trailers	Permite entrar a la vista para ver los trailers types	index	TrailerTypes	2021-03-16 20:32:56.538772	2021-03-16 20:35:09.234407
109	Vista Para Ver Los La Categoria De Ancho De Los Trailers	Permite entrar a la vista para ver la categoria de ancho de los trailers	index	TrailerWidths	2021-03-16 20:44:38.842296	2021-03-16 20:44:38.842296
110	Vista Para Ver Los La Categoria Del Largo De Los Trailers	Permite entrar a la vista para ver la categoria del largo de los trailers	index	TrailerLengths	2021-03-16 20:48:40.91096	2021-03-16 20:48:40.91096
111	Vista Para Ver Los La Categoria De Los Pisos	Permite entrar a la vista para ver la categoria de los pisos	index	FloorTypes	2021-03-16 20:53:30.125548	2021-03-16 20:53:30.125548
112	Vista Para Ver Los La Categoria De Las Rampas	Permite entrar a la vista para ver la categoria de las rampas	index	RampTypes	2021-03-17 00:55:46.541875	2021-03-17 00:55:46.541875
113	Vista Para Ver Los La Categoria De Las Capacidades	Permite entrar a la vista para ver la categoria de las capacidades	index	Capacities	2021-03-17 00:59:17.790023	2021-03-17 00:59:17.790023
114	Vista Para Ver Los La Categoria De Las Redilas	Permite entrar a la vista para ver la categoria de las redilas	index	RedilaTypes	2021-03-17 01:07:12.852782	2021-03-17 01:07:12.852782
115	Vista Para Ver Los La Categoria De Los Techos	Permite entrar a la vista para ver la categoria de los techos	index	RoofTypes	2021-03-17 01:09:49.753636	2021-03-17 01:09:49.753636
116	Vista Para Ver Los La Categoria De Los Volteos	Permite entrar a la vista para ver la categoria de los volteos	index	TurnTypes	2021-03-17 01:11:09.431709	2021-03-17 01:11:09.431709
117	Vista Para Ver Los La Categoria De Los Frenos	Permite entrar a la vista para ver la categoria de los frenos	index	BrakeTypes	2021-03-17 01:13:27.565231	2021-03-17 01:13:27.565231
118	Vista Para Ver Los La Categoria De Los Colores	Permite entrar a la vista para ver la categoria de los colores	index	Colors	2021-03-17 01:15:12.449971	2021-03-17 01:15:12.449971
119	Vista Para Ver Las Categorias De Las Divisiones	Permite entrar a la vista para ver la categoria de las divisiones	index	DivitionTypes	2021-03-17 01:17:41.446017	2021-03-17 01:17:41.446017
120	Vista Para Ver Las Categorias De Los Fenders	Permite entrar a la vista para ver la categoria de los fenders	index	FenderTypes	2021-03-17 01:19:46.159503	2021-03-17 01:19:46.159503
121	Vista Para Ver Las Categorias De Los Gatos Hidraylicos	Permite entrar a la vista para ver la categoria de los gatos hidraulicos	index	HydraulicJacks	2021-03-17 01:21:53.553354	2021-03-17 01:21:53.553354
122	Vista Para Ver Las Categorias De Los Jalones	Permite entrar a la vista para ver la categoria de los jalones	index	PullTypes	2021-03-17 01:23:35.368357	2021-03-17 01:23:35.368357
123	Vista Para Ver Las Categorias De Las Marcas	Permite entrar a la vista para ver la categoria de las marcas	index	Brands	2021-03-17 01:25:00.072391	2021-03-17 01:25:00.072391
124	Vista Para Ver Las Categorias De Las Suspensiones	Permite entrar a la vista para ver la categoria de las suspensiones	index	SuspensionTypes	2021-03-17 01:27:28.01724	2021-03-17 01:27:28.01724
\.


--
-- Data for Name: plutus_accounts; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.plutus_accounts (id, name, type, contra, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: plutus_amounts; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.plutus_amounts (id, type, account_id, entry_id, amount) FROM stdin;
\.


--
-- Data for Name: plutus_entries; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.plutus_entries (id, description, date, commercial_document_id, commercial_document_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.providers (id, name, description, contact, phone, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pull_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.pull_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Jalon Nuevo	876tg	t	2020-11-26 02:40:31.627307	2020-11-26 02:40:31.627307
\.


--
-- Data for Name: quotations; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.quotations (id, user_id, price, model, client_id, branch_id, department_id, trailer_type_id, brake_type_id, trailer_width_id, color_id, trailer_length_id, divition_type_id, floor_type_id, fender_type_id, ramp_type_id, hydraulic_jack_id, capacity_id, pull_type_id, redila_type_id, brand_id, roof_type_id, suspension_type_id, turn_type_id, accessory, categories_description, catalog, created_at, updated_at) FROM stdin;
3	5	250002.0	123456	2	\N	1	3	1	1	1	1	1	1	1	1	1	1	1	1	\N	1	1	1	Accesorio nuevo	TRAILER: Trailer grane. ANCHO: 5. LARGO: 6. PISO: plano. RAMPA: RAmpa. CAPACIDAD: 100. REDILA: Redila. TECHO: Techo nuevo. VOLTEO: Volteo. FRENO: Freno nuevo. COLOR: Negro. DIVISION: Nueva division. FENDER: Nuevo Fender. GATO HIDRAULICO: Nuevo Gato hidraulico. JALON: Jalon Nuevo. SUSPENSION: Nueva suspension. 	\N	2021-03-23 20:27:58.70272	2021-03-23 21:13:59.549079
1	5	1000000.0	1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234	2	\N	1	3	1	1	1	1	1	1	1	1	1	1	1	1	7	1	1	1	Ninguno	TRAILER: Trailer grane. ANCHO: 5. LARGO: 6. PISO: plano. RAMPA: RAmpa. CAPACIDAD: 100. REDILA: Redila. TECHO: Techo nuevo. VOLTEO: Volteo. FRENO: Freno nuevo. COLOR: Negro. DIVISION: Nueva division. FENDER: Nuevo Fender. GATO HIDRAULICO: Nuevo Gato hidraulico. JALON: Jalon Nuevo. SUSPENSION: Nueva suspension. 	1	2021-03-15 00:13:17.741777	2021-03-24 02:24:23.171341
6	6	\N	1234561238761231238865765098yghvvolte10987yhjkkjhg78900986asdfsdfh777987fsdfdfa876tgmodel234	1	\N	2	3	1	1	1	1	1	1	1	1	1	1	1	1	\N	1	1	1	Tres	TRAILER: Trailer grane. ANCHO: 5. LARGO: 6. PISO: plano. RAMPA: RAmpa. CAPACIDAD: 100. REDILA: Redila. TECHO: Techo nuevo. VOLTEO: Volteo. FRENO: Freno nuevo. COLOR: Negro. DIVISION: Nueva division. FENDER: Nuevo Fender. GATO HIDRAULICO: Nuevo Gato hidraulico. JALON: Jalon Nuevo. SUSPENSION: Nueva suspension. 	\N	2021-03-24 21:13:41.733168	2021-03-24 21:14:14.559659
\.


--
-- Data for Name: ramp_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.ramp_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	RAmpa	12388	t	2020-11-03 01:48:58.512627	2020-11-03 01:48:58.512627
\.


--
-- Data for Name: redila_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.redila_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Redila	765	t	2020-11-03 01:48:42.486194	2020-11-03 01:48:42.486194
\.


--
-- Data for Name: reinforcement_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.reinforcement_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Nuevo refuerzo	0987asdfdf	t	2020-11-26 02:42:51.286286	2020-11-26 02:42:51.286286
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.roles (id, name, key, description, scope, created_at, updated_at) FROM stdin;
1	God	god	Super administrador del sistema. Tiene acceso a todo y superpoderes.	0	2020-09-25 01:51:16.223398	2020-09-25 01:51:16.223398
2	Administrador General	admin	Administrador general del corporativo.	0	2020-09-25 01:51:16.227364	2020-09-25 01:51:16.227364
3	Gerente	admin_sucursal	Administrador de Sucursal.	0	2020-09-25 01:51:16.241809	2020-09-25 01:51:16.241809
4	Vendedor	empleado_sin_acceso	Empleado sin acceso al sistema.	0	2020-09-25 01:51:16.246577	2020-09-25 01:51:16.246577
\.


--
-- Data for Name: roof_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.roof_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Techo nuevo	098yghv	t	2020-11-26 02:37:01.645456	2020-11-26 02:37:01.645456
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.schema_migrations (version) FROM stdin;
20160121193037
20160122204749
20160125183436
20160125183518
20160125184030
20160125194817
20160303005342
20160303232151
20161203192432
20161205230750
20161206030302
20161206030334
20161206030416
20161206031023
20161206031513
20161206031708
20161206031915
20161206032056
20161206032147
20161206032418
20161206032703
20161206033109
20161206040319
20161206054638
20161208203158
20161208203206
20161208203928
20161221200900
20161222193150
20161223190539
20161223195228
20170107200414
20170119000527
20170125161038
20170126230224
20170128175140
20180418015745
20180418023607
20180418223535
20180425204348
20180425205842
20180426204719
20180430175340
20180518034724
20180518155920
20180528203035
20180824234646
20200827044056
20200909052918
20200909053235
20200909072307
20200909164751
20200909231442
20200925015804
20200925033506
20200925040610
20200928032545
20201007012504
20201007012753
20201014204953
20201014205104
20201015203057
20201026174845
20201026175016
20201026175409
20201026175438
20201026175705
20201026175835
20201026180949
20201026224252
20201026224343
20201026230623
20201109060032
20201109060301
20201109060418
20201109060504
20201109060638
20201109060729
20201109060831
20201109061047
20201109061102
20201109061911
20201109062403
20201109204657
20201112061844
20201113002031
20201114202609
20201124211342
20201127222706
20201208181949
20201229200558
20210112234058
20210212031131
20210311044737
20210309031136
20210316013108
20210316153643
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.states (id, name, country_id, created_at, updated_at) FROM stdin;
1	Aguascalientes	1	2020-09-25 01:51:06.560105	2020-09-25 01:51:06.560105
2	Baja California	1	2020-09-25 01:51:06.574927	2020-09-25 01:51:06.574927
3	Baja California Sur	1	2020-09-25 01:51:06.58597	2020-09-25 01:51:06.58597
4	Campeche	1	2020-09-25 01:51:06.589352	2020-09-25 01:51:06.589352
5	Coahuila	1	2020-09-25 01:51:06.593439	2020-09-25 01:51:06.593439
6	Colima	1	2020-09-25 01:51:06.598321	2020-09-25 01:51:06.598321
7	Chiapas	1	2020-09-25 01:51:06.601355	2020-09-25 01:51:06.601355
8	Chihuahua	1	2020-09-25 01:51:06.604944	2020-09-25 01:51:06.604944
9	Distrito Federal	1	2020-09-25 01:51:06.610455	2020-09-25 01:51:06.610455
10	Durango	1	2020-09-25 01:51:06.614077	2020-09-25 01:51:06.614077
11	Guanajuato	1	2020-09-25 01:51:06.617169	2020-09-25 01:51:06.617169
12	Guerrero	1	2020-09-25 01:51:06.620159	2020-09-25 01:51:06.620159
13	Hidalgo	1	2020-09-25 01:51:06.623669	2020-09-25 01:51:06.623669
14	Jalisco	1	2020-09-25 01:51:06.626699	2020-09-25 01:51:06.626699
15	México	1	2020-09-25 01:51:06.631176	2020-09-25 01:51:06.631176
16	Michoacán	1	2020-09-25 01:51:06.634544	2020-09-25 01:51:06.634544
17	Morelos	1	2020-09-25 01:51:06.637531	2020-09-25 01:51:06.637531
18	Nayarit	1	2020-09-25 01:51:06.641189	2020-09-25 01:51:06.641189
19	Nuevo León	1	2020-09-25 01:51:06.644755	2020-09-25 01:51:06.644755
20	Oaxaca	1	2020-09-25 01:51:06.647769	2020-09-25 01:51:06.647769
21	Puebla	1	2020-09-25 01:51:06.650684	2020-09-25 01:51:06.650684
22	Querétaro	1	2020-09-25 01:51:06.653472	2020-09-25 01:51:06.653472
23	Quintana Roo	1	2020-09-25 01:51:06.656528	2020-09-25 01:51:06.656528
24	San Luis Potosí	1	2020-09-25 01:51:06.659565	2020-09-25 01:51:06.659565
25	Sinaloa	1	2020-09-25 01:51:06.663858	2020-09-25 01:51:06.663858
26	Sonora	1	2020-09-25 01:51:06.667254	2020-09-25 01:51:06.667254
27	Tabasco	1	2020-09-25 01:51:06.670201	2020-09-25 01:51:06.670201
28	Tamaulipas	1	2020-09-25 01:51:06.673617	2020-09-25 01:51:06.673617
29	Tlaxcala	1	2020-09-25 01:51:06.677112	2020-09-25 01:51:06.677112
30	Veracruz	1	2020-09-25 01:51:06.681225	2020-09-25 01:51:06.681225
31	Yucatán	1	2020-09-25 01:51:06.684451	2020-09-25 01:51:06.684451
32	Zacatecas	1	2020-09-25 01:51:06.687505	2020-09-25 01:51:06.687505
\.


--
-- Data for Name: status_items; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.status_items (id, name, description, status, created_at, updated_at, key) FROM stdin;
1	Vendido	Vendido	\N	2020-09-25 01:51:17.319094	2020-09-25 01:51:17.319094	vendido
2	No Vendido	No Vendido	\N	2020-09-25 01:51:17.326765	2020-09-25 01:51:17.326765	no_vendido
4	Vendido y Facturado	Vendido y Facturado	\N	2020-09-25 01:51:17.330701	2020-09-25 01:51:17.330701	facturado
5	Pendiente	Artículo Pendiente	t	2020-09-29 01:14:32.778222	2020-10-02 01:17:51.513514	pendiente
3	Vendido y Pendiente de Factura	Vendido y Pendiente de Factura	\N	2020-09-25 01:51:17.328861	2020-10-02 01:18:00.415756	pendiente_factura
6	Vendido a Credito	Vendido a Credito	t	2021-03-09 00:48:12.110625	2021-03-09 00:57:57.404557	vendido_credito
7	Cotizado	Cotizado	t	2021-03-11 02:43:13.741623	2021-03-11 02:43:13.741623	cotizado
\.


--
-- Data for Name: status_shippings; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.status_shippings (id, name, description, status, key, created_at, updated_at) FROM stdin;
1	Pedido	Articulo Pedido	\N	pedido	2020-10-07 01:34:42.235518	2020-10-07 01:34:42.235518
2	Enviado	Articulo Enviado	\N	enviado	2020-10-07 01:35:31.013635	2020-10-07 01:35:31.013635
3	Recibido	Articulo Recibido	\N	recibido	2020-10-07 01:35:37.734169	2020-10-07 01:35:37.734169
\.


--
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.sub_categories (id, name, description, status, category_id, created_at, updated_at) FROM stdin;
1	Sub Categoria	\N	t	1	2020-09-25 02:31:57.732707	2020-09-25 02:31:57.732707
2	SubCategoria 2	\N	t	1	2020-09-25 02:32:07.102648	2020-09-25 02:32:07.102648
\.


--
-- Data for Name: suspension_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.suspension_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Nueva suspension	model234	t	2020-11-26 02:43:30.239163	2020-11-26 02:43:30.239163
\.


--
-- Data for Name: trailer_categories; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.trailer_categories (id, trailer_id, trailer_length_id, trailer_height_id, ramp_type_id, redila_type_id, trailer_type_id, floor_type_id, capacity_id, trailer_width_id, color_id, hydraulic_jack_id, pull_type_id, brake_type_id, reinforcement_type_id, fender_type_id, turn_type_id, divition_type_id, suspension_type_id, roof_type_id, brand_id, created_at, updated_at, key) FROM stdin;
1	\N	\N	\N	\N	\N	2	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-22 21:47:11.546506	2021-03-22 21:47:11.546506	capacity_id
2	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	2021-03-22 21:47:11.557814	2021-03-22 21:47:11.557814	fender_type_id
3	\N	\N	\N	1	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-22 21:47:11.560193	2021-03-22 21:47:11.560193	ramp_type_id
4	\N	\N	\N	\N	\N	3	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.359057	2021-03-23 03:50:59.359057	trailer_width_id
5	\N	\N	\N	\N	\N	3	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.375871	2021-03-23 03:50:59.375871	capacity_id
6	\N	\N	\N	\N	\N	3	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.379561	2021-03-23 03:50:59.379561	color_id
7	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.382324	2021-03-23 03:50:59.382324	hydraulic_jack_id
8	\N	1	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.386571	2021-03-23 03:50:59.386571	trailer_length_id
9	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.391442	2021-03-23 03:50:59.391442	reinforcement_type_id
10	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	2021-03-23 03:50:59.39578	2021-03-23 03:50:59.39578	divition_type_id
11	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	2021-03-23 03:50:59.40015	2021-03-23 03:50:59.40015	fender_type_id
12	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.404617	2021-03-23 03:50:59.404617	brake_type_id
13	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.408144	2021-03-23 03:50:59.408144	pull_type_id
14	\N	\N	\N	\N	\N	3	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.411144	2021-03-23 03:50:59.411144	floor_type_id
15	\N	\N	\N	1	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.413578	2021-03-23 03:50:59.413578	ramp_type_id
16	\N	\N	\N	\N	1	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-23 03:50:59.415918	2021-03-23 03:50:59.415918	redila_type_id
17	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	2021-03-23 03:50:59.419963	2021-03-23 03:50:59.419963	suspension_type_id
18	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	2021-03-23 03:50:59.424928	2021-03-23 03:50:59.424928	roof_type_id
19	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	2021-03-23 03:50:59.428945	2021-03-23 03:50:59.428945	turn_type_id
\.


--
-- Data for Name: trailer_heights; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.trailer_heights (id, name, model_part, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: trailer_lengths; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.trailer_lengths (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	6	876	t	2020-11-03 01:47:37.46259	2020-11-03 01:47:37.46259
\.


--
-- Data for Name: trailer_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.trailer_types (id, name, image, status, created_at, updated_at, model_part) FROM stdin;
1	Una cabina	\N	t	2020-11-03 01:46:27.685607	2020-11-03 01:46:27.708805	123456
2	Doble cabina	\N	t	2021-03-22 21:47:11.525267	2021-03-22 21:47:11.567882	123456modelo
3	Trailer grane	\N	t	2021-03-23 03:50:59.341213	2021-03-23 03:50:59.341213	123456
\.


--
-- Data for Name: trailer_widths; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.trailer_widths (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	5	123	t	2020-11-03 01:47:25.045663	2020-11-03 01:47:25.045663
\.


--
-- Data for Name: trailers; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.trailers (id, name, model, photo, created_at, updated_at, category_id, sub_category_id, image, status, trailer_type_id, trailer_length_id, trailer_height_id, trailer_width_id, ramp_type_id, redila_type_id, floor_type_id, capacity_id, color_id, hydraulic_jack_id, pull_type_id, brake_type_id, reinforcement_type_id, fender_type_id, turn_type_id, divition_type_id, suspension_type_id, roof_type_id, brand_id) FROM stdin;
1	Nuevo Trailer	Modelo tr	\N	2020-09-25 03:17:17.10826	2020-09-25 03:17:17.150683	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	Imagen trailer	Modelo image	\N	2020-09-25 03:30:30.810483	2020-09-25 03:30:30.816484	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	Trialer Email	model2349871234561238761231238865765098yghv0987yhjkkjhg78900986asdfsdfh777876tg0987asdfdfmodel234	\N	2020-11-26 02:48:33.161499	2020-11-26 02:48:33.187278	\N	\N	\N	\N	1	1	\N	1	1	1	1	1	1	\N	1	1	1	1	\N	1	1	\N	\N
\.


--
-- Data for Name: turn_types; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.turn_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Volteo	volte1	t	2021-03-11 03:56:21.694351	2021-03-11 03:56:21.694351
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, role_id, first_name, last_name, maiden_name, username, avatar, department_id, employee_number, received_file, current_company, token) FROM stdin;
6	a271578@uach.mx	$2a$10$RCcs.bA.1MrER/BfdJmB7.2RrIgtEYDYGovMrmt2XpAy51KKYj4Qa	\N	\N	\N	3	2021-01-14 20:03:05.038858	2021-01-13 21:25:05.724537	::1	::1	2021-01-13 21:05:43.834415	2021-01-14 20:03:05.042987	\N	\N	\N	\N	3	Wero	Rodriguez	Gonzalez	\N	Captura_de_pantalla_2021-01-08_a_la_s__10.28.39.png	2	54321	\N	1	\N
3	ovalencia@uach.mx	$2a$10$2t0s40fY/uPTdiU02Jn/Re5oI.uz2ITh4zOJGCFAVXHvmOVlyl/Uq	\N	\N	\N	9	2020-11-20 22:53:57.019014	2020-10-15 21:54:42.537745	::1	::1	2020-09-25 01:51:16.523096	2020-11-20 22:53:57.023473	\N	2020-09-25 01:51:16.455023	\N	\N	4	Orlando	Valencia	User Orlando	orlando	\N	2	567	\N	\N	\N
2	alexrdgz03@gmail.com	$2a$10$MbnRiMSQvErwwqQBUuCHaeR9p0.6DrSi7VWvClvmNNdiif/xE31IO	\N	\N	\N	23	2021-03-16 20:21:01.58699	2021-03-16 04:19:11.751631	::1	::1	2020-09-25 01:51:16.44905	2021-03-16 20:21:01.590382	\N	2020-09-25 01:51:16.377756	\N	\N	3	Alejandro	Rodriguez	User Alex	alex	\N	1	123	\N	\N	\N
7	emmanuel.rdgz98@gmail.com	$2a$10$XdNyHGMQMhs/GBcEfYjsKuZ.DswOn79g5fjEnz2b3c8SIRmniWydi	\N	\N	\N	0	\N	\N	\N	\N	2021-02-10 00:34:46.970932	2021-02-10 00:34:46.970932	\N	\N	\N	\N	3	Emmanuel	Rodriguez	Gonzalez	\N	116310912_363807407941880_4183698741367764999_n.jpg	2	23177	\N	1	\N
5	alexrdgz03@hotmal.com	$2a$10$cxvk8tffV0.5FS5xfkha3eeLgafZpDp8Q219TTfjlUo99YdqQmjuC	\N	\N	\N	2	2021-03-17 01:40:23.635666	2021-03-16 04:27:54.071179	::1	::1	2020-10-19 21:41:39.329184	2021-03-17 01:40:23.638243	\N	\N	\N	\N	4	Alejandro	Rodriguez	Gonzalez	\N	\N	1	23177	\N	\N	\N
1	god@example.com	$2a$10$GBd7sA7.M9MF8XLH8SoNCuAt0VcvbR21zXV/ZH.R9q8GoNQVG0D12	\N	\N	\N	43	2021-03-30 22:59:23.434946	2021-03-24 21:07:26.995899	::1	::1	2020-09-25 01:51:16.371726	2021-03-30 22:59:23.437745	\N	2020-09-25 01:51:16.261674	\N	\N	1	God	System	User	divinity	\N	1	12345	\N	1	\N
4	javitorres@uach.mx	$2a$10$070eF.p54.dT34iqhDhsX.E89IsTUixildB2nyeI5o50TQLpqcsye	\N	\N	\N	18	2021-03-11 03:24:38.127724	2021-01-09 03:44:45.928682	::1	::1	2020-10-12 23:03:01.164602	2021-03-11 03:24:38.131419	\N	2020-10-12 23:03:00.968513	\N	\N	4	Javier	Torres	User Javi	javi	116310912_363807407941880_4183698741367764999_n.jpg	2	1245	\N	1	\N
\.


--
-- Data for Name: users_work_articles; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.users_work_articles (id, user_id, work_article_id, reception_status, delivery_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: work_articles; Type: TABLE DATA; Schema: public; Owner: alejandrorodriguez
--

COPY public.work_articles (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 52, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 52, true);


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.audits_id_seq', 221, true);


--
-- Name: brake_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.brake_types_id_seq', 1, true);


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.branches_id_seq', 3, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.brands_id_seq', 47, true);


--
-- Name: capacities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.capacities_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.cities_id_seq', 2459, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.clients_id_seq', 2, true);


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.colors_id_seq', 1, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.departments_id_seq', 2, true);


--
-- Name: divition_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.divition_types_id_seq', 1, true);


--
-- Name: fender_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.fender_types_id_seq', 1, true);


--
-- Name: fiscal_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.fiscal_vouchers_id_seq', 22, true);


--
-- Name: floor_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.floor_types_id_seq', 1, true);


--
-- Name: hydraulic_jacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.hydraulic_jacks_id_seq', 1, true);


--
-- Name: item_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.item_files_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.items_id_seq', 47, true);


--
-- Name: items_maintenances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.items_maintenances_id_seq', 1, false);


--
-- Name: maintenances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.maintenances_id_seq', 1, false);


--
-- Name: offices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.offices_id_seq', 1, false);


--
-- Name: permission_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.permission_roles_id_seq', 1559, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.permissions_id_seq', 124, true);


--
-- Name: plutus_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.plutus_accounts_id_seq', 1, false);


--
-- Name: plutus_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.plutus_amounts_id_seq', 1, false);


--
-- Name: plutus_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.plutus_entries_id_seq', 1, false);


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.providers_id_seq', 1, false);


--
-- Name: pull_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.pull_types_id_seq', 1, true);


--
-- Name: quotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.quotations_id_seq', 6, true);


--
-- Name: ramp_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.ramp_types_id_seq', 1, true);


--
-- Name: redila_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.redila_types_id_seq', 1, true);


--
-- Name: reinforcement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.reinforcement_types_id_seq', 1, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: roof_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.roof_types_id_seq', 1, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.states_id_seq', 32, true);


--
-- Name: status_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.status_items_id_seq', 7, true);


--
-- Name: status_shippings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.status_shippings_id_seq', 3, true);


--
-- Name: sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.sub_categories_id_seq', 2, true);


--
-- Name: suspension_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.suspension_types_id_seq', 1, true);


--
-- Name: trailer_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.trailer_categories_id_seq', 19, true);


--
-- Name: trailer_heights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.trailer_heights_id_seq', 1, false);


--
-- Name: trailer_lengths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.trailer_lengths_id_seq', 1, true);


--
-- Name: trailer_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.trailer_types_id_seq', 3, true);


--
-- Name: trailer_widths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.trailer_widths_id_seq', 1, true);


--
-- Name: trailers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.trailers_id_seq', 3, true);


--
-- Name: turn_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.turn_types_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: users_work_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.users_work_articles_id_seq', 1, false);


--
-- Name: work_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alejandrorodriguez
--

SELECT pg_catalog.setval('public.work_articles_id_seq', 1, false);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: brake_types brake_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.brake_types
    ADD CONSTRAINT brake_types_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: capacities capacities_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.capacities
    ADD CONSTRAINT capacities_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: divition_types divition_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.divition_types
    ADD CONSTRAINT divition_types_pkey PRIMARY KEY (id);


--
-- Name: fender_types fender_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.fender_types
    ADD CONSTRAINT fender_types_pkey PRIMARY KEY (id);


--
-- Name: fiscal_vouchers fiscal_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.fiscal_vouchers
    ADD CONSTRAINT fiscal_vouchers_pkey PRIMARY KEY (id);


--
-- Name: floor_types floor_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.floor_types
    ADD CONSTRAINT floor_types_pkey PRIMARY KEY (id);


--
-- Name: hydraulic_jacks hydraulic_jacks_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.hydraulic_jacks
    ADD CONSTRAINT hydraulic_jacks_pkey PRIMARY KEY (id);


--
-- Name: item_files item_files_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.item_files
    ADD CONSTRAINT item_files_pkey PRIMARY KEY (id);


--
-- Name: items_maintenances items_maintenances_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items_maintenances
    ADD CONSTRAINT items_maintenances_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: maintenances maintenances_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.maintenances
    ADD CONSTRAINT maintenances_pkey PRIMARY KEY (id);


--
-- Name: offices offices_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (id);


--
-- Name: permission_roles permission_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.permission_roles
    ADD CONSTRAINT permission_roles_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: plutus_accounts plutus_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.plutus_accounts
    ADD CONSTRAINT plutus_accounts_pkey PRIMARY KEY (id);


--
-- Name: plutus_amounts plutus_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.plutus_amounts
    ADD CONSTRAINT plutus_amounts_pkey PRIMARY KEY (id);


--
-- Name: plutus_entries plutus_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.plutus_entries
    ADD CONSTRAINT plutus_entries_pkey PRIMARY KEY (id);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: pull_types pull_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.pull_types
    ADD CONSTRAINT pull_types_pkey PRIMARY KEY (id);


--
-- Name: quotations quotations_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT quotations_pkey PRIMARY KEY (id);


--
-- Name: ramp_types ramp_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.ramp_types
    ADD CONSTRAINT ramp_types_pkey PRIMARY KEY (id);


--
-- Name: redila_types redila_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.redila_types
    ADD CONSTRAINT redila_types_pkey PRIMARY KEY (id);


--
-- Name: reinforcement_types reinforcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.reinforcement_types
    ADD CONSTRAINT reinforcement_types_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roof_types roof_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.roof_types
    ADD CONSTRAINT roof_types_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: status_items status_items_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.status_items
    ADD CONSTRAINT status_items_pkey PRIMARY KEY (id);


--
-- Name: status_shippings status_shippings_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.status_shippings
    ADD CONSTRAINT status_shippings_pkey PRIMARY KEY (id);


--
-- Name: sub_categories sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.sub_categories
    ADD CONSTRAINT sub_categories_pkey PRIMARY KEY (id);


--
-- Name: suspension_types suspension_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.suspension_types
    ADD CONSTRAINT suspension_types_pkey PRIMARY KEY (id);


--
-- Name: trailer_categories trailer_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT trailer_categories_pkey PRIMARY KEY (id);


--
-- Name: trailer_heights trailer_heights_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_heights
    ADD CONSTRAINT trailer_heights_pkey PRIMARY KEY (id);


--
-- Name: trailer_lengths trailer_lengths_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_lengths
    ADD CONSTRAINT trailer_lengths_pkey PRIMARY KEY (id);


--
-- Name: trailer_types trailer_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_types
    ADD CONSTRAINT trailer_types_pkey PRIMARY KEY (id);


--
-- Name: trailer_widths trailer_widths_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_widths
    ADD CONSTRAINT trailer_widths_pkey PRIMARY KEY (id);


--
-- Name: trailers trailers_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT trailers_pkey PRIMARY KEY (id);


--
-- Name: turn_types turn_types_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.turn_types
    ADD CONSTRAINT turn_types_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_work_articles users_work_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users_work_articles
    ADD CONSTRAINT users_work_articles_pkey PRIMARY KEY (id);


--
-- Name: work_articles work_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.work_articles
    ADD CONSTRAINT work_articles_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX associated_index ON public.audits USING btree (associated_id, associated_type);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX auditable_index ON public.audits USING btree (auditable_id, auditable_type);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_audits_on_created_at ON public.audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_audits_on_request_uuid ON public.audits USING btree (request_uuid);


--
-- Name: index_branches_on_city_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_branches_on_city_id ON public.branches USING btree (city_id);


--
-- Name: index_branches_on_company_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_branches_on_company_id ON public.branches USING btree (company_id);


--
-- Name: index_branches_on_state_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_branches_on_state_id ON public.branches USING btree (state_id);


--
-- Name: index_categories_on_company_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_categories_on_company_id ON public.categories USING btree (company_id);


--
-- Name: index_cities_on_state_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_cities_on_state_id ON public.cities USING btree (state_id);


--
-- Name: index_clients_on_city_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_clients_on_city_id ON public.clients USING btree (city_id);


--
-- Name: index_clients_on_state_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_clients_on_state_id ON public.clients USING btree (state_id);


--
-- Name: index_companies_on_user_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_companies_on_user_id ON public.companies USING btree (user_id);


--
-- Name: index_departments_on_branch_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_departments_on_branch_id ON public.departments USING btree (branch_id);


--
-- Name: index_entries_on_commercial_doc; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_entries_on_commercial_doc ON public.plutus_entries USING btree (commercial_document_id, commercial_document_type);


--
-- Name: index_item_files_on_item_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_item_files_on_item_id ON public.item_files USING btree (item_id);


--
-- Name: index_items_maintenances_on_item_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_maintenances_on_item_id ON public.items_maintenances USING btree (item_id);


--
-- Name: index_items_maintenances_on_maintenance_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_maintenances_on_maintenance_id ON public.items_maintenances USING btree (maintenance_id);


--
-- Name: index_items_on_brake_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_brake_type_id ON public.items USING btree (brake_type_id);


--
-- Name: index_items_on_branch_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_branch_id ON public.items USING btree (branch_id);


--
-- Name: index_items_on_brand_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_brand_id ON public.items USING btree (brand_id);


--
-- Name: index_items_on_capacity_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_capacity_id ON public.items USING btree (capacity_id);


--
-- Name: index_items_on_category_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_category_id ON public.items USING btree (category_id);


--
-- Name: index_items_on_client_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_client_id ON public.items USING btree (client_id);


--
-- Name: index_items_on_color_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_color_id ON public.items USING btree (color_id);


--
-- Name: index_items_on_department_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_department_id ON public.items USING btree (department_id);


--
-- Name: index_items_on_divition_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_divition_type_id ON public.items USING btree (divition_type_id);


--
-- Name: index_items_on_fender_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_fender_type_id ON public.items USING btree (fender_type_id);


--
-- Name: index_items_on_fiscal_voucher_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_fiscal_voucher_id ON public.items USING btree (fiscal_voucher_id);


--
-- Name: index_items_on_floor_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_floor_type_id ON public.items USING btree (floor_type_id);


--
-- Name: index_items_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_hydraulic_jack_id ON public.items USING btree (hydraulic_jack_id);


--
-- Name: index_items_on_provider_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_provider_id ON public.items USING btree (provider_id);


--
-- Name: index_items_on_pull_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_pull_type_id ON public.items USING btree (pull_type_id);


--
-- Name: index_items_on_ramp_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_ramp_type_id ON public.items USING btree (ramp_type_id);


--
-- Name: index_items_on_redila_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_redila_type_id ON public.items USING btree (redila_type_id);


--
-- Name: index_items_on_reinforcement_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_reinforcement_type_id ON public.items USING btree (reinforcement_type_id);


--
-- Name: index_items_on_roof_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_roof_type_id ON public.items USING btree (roof_type_id);


--
-- Name: index_items_on_status_item_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_status_item_id ON public.items USING btree (status_item_id);


--
-- Name: index_items_on_status_shipping_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_status_shipping_id ON public.items USING btree (status_shipping_id);


--
-- Name: index_items_on_sub_category_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_sub_category_id ON public.items USING btree (sub_category_id);


--
-- Name: index_items_on_suspension_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_suspension_type_id ON public.items USING btree (suspension_type_id);


--
-- Name: index_items_on_trailer_height_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_trailer_height_id ON public.items USING btree (trailer_height_id);


--
-- Name: index_items_on_trailer_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_trailer_id ON public.items USING btree (trailer_id);


--
-- Name: index_items_on_trailer_length_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_trailer_length_id ON public.items USING btree (trailer_length_id);


--
-- Name: index_items_on_trailer_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_trailer_type_id ON public.items USING btree (trailer_type_id);


--
-- Name: index_items_on_trailer_width_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_trailer_width_id ON public.items USING btree (trailer_width_id);


--
-- Name: index_items_on_turn_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_turn_type_id ON public.items USING btree (turn_type_id);


--
-- Name: index_items_on_user_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_items_on_user_id ON public.items USING btree (user_id);


--
-- Name: index_offices_on_department_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_offices_on_department_id ON public.offices USING btree (department_id);


--
-- Name: index_offices_on_user_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_offices_on_user_id ON public.offices USING btree (user_id);


--
-- Name: index_permission_roles_on_permission_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_permission_roles_on_permission_id ON public.permission_roles USING btree (permission_id);


--
-- Name: index_permission_roles_on_role_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_permission_roles_on_role_id ON public.permission_roles USING btree (role_id);


--
-- Name: index_plutus_accounts_on_name_and_type; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_plutus_accounts_on_name_and_type ON public.plutus_accounts USING btree (name, type);


--
-- Name: index_plutus_amounts_on_account_id_and_entry_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_plutus_amounts_on_account_id_and_entry_id ON public.plutus_amounts USING btree (account_id, entry_id);


--
-- Name: index_plutus_amounts_on_entry_id_and_account_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_plutus_amounts_on_entry_id_and_account_id ON public.plutus_amounts USING btree (entry_id, account_id);


--
-- Name: index_plutus_amounts_on_type; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_plutus_amounts_on_type ON public.plutus_amounts USING btree (type);


--
-- Name: index_plutus_entries_on_date; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_plutus_entries_on_date ON public.plutus_entries USING btree (date);


--
-- Name: index_quotations_on_brake_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_brake_type_id ON public.quotations USING btree (brake_type_id);


--
-- Name: index_quotations_on_branch_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_branch_id ON public.quotations USING btree (branch_id);


--
-- Name: index_quotations_on_brand_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_brand_id ON public.quotations USING btree (brand_id);


--
-- Name: index_quotations_on_capacity_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_capacity_id ON public.quotations USING btree (capacity_id);


--
-- Name: index_quotations_on_client_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_client_id ON public.quotations USING btree (client_id);


--
-- Name: index_quotations_on_color_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_color_id ON public.quotations USING btree (color_id);


--
-- Name: index_quotations_on_department_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_department_id ON public.quotations USING btree (department_id);


--
-- Name: index_quotations_on_divition_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_divition_type_id ON public.quotations USING btree (divition_type_id);


--
-- Name: index_quotations_on_fender_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_fender_type_id ON public.quotations USING btree (fender_type_id);


--
-- Name: index_quotations_on_floor_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_floor_type_id ON public.quotations USING btree (floor_type_id);


--
-- Name: index_quotations_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_hydraulic_jack_id ON public.quotations USING btree (hydraulic_jack_id);


--
-- Name: index_quotations_on_pull_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_pull_type_id ON public.quotations USING btree (pull_type_id);


--
-- Name: index_quotations_on_ramp_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_ramp_type_id ON public.quotations USING btree (ramp_type_id);


--
-- Name: index_quotations_on_redila_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_redila_type_id ON public.quotations USING btree (redila_type_id);


--
-- Name: index_quotations_on_roof_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_roof_type_id ON public.quotations USING btree (roof_type_id);


--
-- Name: index_quotations_on_suspension_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_suspension_type_id ON public.quotations USING btree (suspension_type_id);


--
-- Name: index_quotations_on_trailer_length_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_trailer_length_id ON public.quotations USING btree (trailer_length_id);


--
-- Name: index_quotations_on_trailer_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_trailer_type_id ON public.quotations USING btree (trailer_type_id);


--
-- Name: index_quotations_on_trailer_width_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_trailer_width_id ON public.quotations USING btree (trailer_width_id);


--
-- Name: index_quotations_on_turn_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_turn_type_id ON public.quotations USING btree (turn_type_id);


--
-- Name: index_quotations_on_user_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_quotations_on_user_id ON public.quotations USING btree (user_id);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_states_on_country_id ON public.states USING btree (country_id);


--
-- Name: index_sub_categories_on_category_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_sub_categories_on_category_id ON public.sub_categories USING btree (category_id);


--
-- Name: index_trailer_categories_on_brake_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_brake_type_id ON public.trailer_categories USING btree (brake_type_id);


--
-- Name: index_trailer_categories_on_brand_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_brand_id ON public.trailer_categories USING btree (brand_id);


--
-- Name: index_trailer_categories_on_capacity_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_capacity_id ON public.trailer_categories USING btree (capacity_id);


--
-- Name: index_trailer_categories_on_color_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_color_id ON public.trailer_categories USING btree (color_id);


--
-- Name: index_trailer_categories_on_divition_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_divition_type_id ON public.trailer_categories USING btree (divition_type_id);


--
-- Name: index_trailer_categories_on_fender_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_fender_type_id ON public.trailer_categories USING btree (fender_type_id);


--
-- Name: index_trailer_categories_on_floor_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_floor_type_id ON public.trailer_categories USING btree (floor_type_id);


--
-- Name: index_trailer_categories_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_hydraulic_jack_id ON public.trailer_categories USING btree (hydraulic_jack_id);


--
-- Name: index_trailer_categories_on_pull_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_pull_type_id ON public.trailer_categories USING btree (pull_type_id);


--
-- Name: index_trailer_categories_on_ramp_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_ramp_type_id ON public.trailer_categories USING btree (ramp_type_id);


--
-- Name: index_trailer_categories_on_redila_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_redila_type_id ON public.trailer_categories USING btree (redila_type_id);


--
-- Name: index_trailer_categories_on_reinforcement_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_reinforcement_type_id ON public.trailer_categories USING btree (reinforcement_type_id);


--
-- Name: index_trailer_categories_on_roof_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_roof_type_id ON public.trailer_categories USING btree (roof_type_id);


--
-- Name: index_trailer_categories_on_suspension_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_suspension_type_id ON public.trailer_categories USING btree (suspension_type_id);


--
-- Name: index_trailer_categories_on_trailer_height_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_trailer_height_id ON public.trailer_categories USING btree (trailer_height_id);


--
-- Name: index_trailer_categories_on_trailer_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_trailer_id ON public.trailer_categories USING btree (trailer_id);


--
-- Name: index_trailer_categories_on_trailer_length_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_trailer_length_id ON public.trailer_categories USING btree (trailer_length_id);


--
-- Name: index_trailer_categories_on_trailer_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_trailer_type_id ON public.trailer_categories USING btree (trailer_type_id);


--
-- Name: index_trailer_categories_on_trailer_width_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_trailer_width_id ON public.trailer_categories USING btree (trailer_width_id);


--
-- Name: index_trailer_categories_on_turn_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailer_categories_on_turn_type_id ON public.trailer_categories USING btree (turn_type_id);


--
-- Name: index_trailers_on_brake_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_brake_type_id ON public.trailers USING btree (brake_type_id);


--
-- Name: index_trailers_on_brand_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_brand_id ON public.trailers USING btree (brand_id);


--
-- Name: index_trailers_on_capacity_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_capacity_id ON public.trailers USING btree (capacity_id);


--
-- Name: index_trailers_on_category_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_category_id ON public.trailers USING btree (category_id);


--
-- Name: index_trailers_on_color_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_color_id ON public.trailers USING btree (color_id);


--
-- Name: index_trailers_on_divition_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_divition_type_id ON public.trailers USING btree (divition_type_id);


--
-- Name: index_trailers_on_fender_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_fender_type_id ON public.trailers USING btree (fender_type_id);


--
-- Name: index_trailers_on_floor_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_floor_type_id ON public.trailers USING btree (floor_type_id);


--
-- Name: index_trailers_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_hydraulic_jack_id ON public.trailers USING btree (hydraulic_jack_id);


--
-- Name: index_trailers_on_pull_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_pull_type_id ON public.trailers USING btree (pull_type_id);


--
-- Name: index_trailers_on_ramp_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_ramp_type_id ON public.trailers USING btree (ramp_type_id);


--
-- Name: index_trailers_on_redila_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_redila_type_id ON public.trailers USING btree (redila_type_id);


--
-- Name: index_trailers_on_reinforcement_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_reinforcement_type_id ON public.trailers USING btree (reinforcement_type_id);


--
-- Name: index_trailers_on_roof_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_roof_type_id ON public.trailers USING btree (roof_type_id);


--
-- Name: index_trailers_on_sub_category_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_sub_category_id ON public.trailers USING btree (sub_category_id);


--
-- Name: index_trailers_on_suspension_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_suspension_type_id ON public.trailers USING btree (suspension_type_id);


--
-- Name: index_trailers_on_trailer_height_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_trailer_height_id ON public.trailers USING btree (trailer_height_id);


--
-- Name: index_trailers_on_trailer_length_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_trailer_length_id ON public.trailers USING btree (trailer_length_id);


--
-- Name: index_trailers_on_trailer_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_trailer_type_id ON public.trailers USING btree (trailer_type_id);


--
-- Name: index_trailers_on_trailer_width_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_trailer_width_id ON public.trailers USING btree (trailer_width_id);


--
-- Name: index_trailers_on_turn_type_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_trailers_on_turn_type_id ON public.trailers USING btree (turn_type_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_department_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_users_on_department_id ON public.users USING btree (department_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_users_on_role_id ON public.users USING btree (role_id);


--
-- Name: index_users_work_articles_on_user_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_users_work_articles_on_user_id ON public.users_work_articles USING btree (user_id);


--
-- Name: index_users_work_articles_on_work_article_id; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX index_users_work_articles_on_work_article_id ON public.users_work_articles USING btree (work_article_id);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: alejandrorodriguez
--

CREATE INDEX user_index ON public.audits USING btree (user_id, user_type);


--
-- Name: trailer_categories fk_rails_00fa313820; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_00fa313820 FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: trailer_categories fk_rails_028a2abaef; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_028a2abaef FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: trailer_categories fk_rails_02ecbca6ee; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_02ecbca6ee FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: trailer_categories fk_rails_030f845d67; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_030f845d67 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: trailers fk_rails_083bf5fdf9; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_083bf5fdf9 FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: trailers fk_rails_0aed5eedc3; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_0aed5eedc3 FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: trailers fk_rails_15ab1330d4; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_15ab1330d4 FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: items fk_rails_1a336e3afc; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_1a336e3afc FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: quotations fk_rails_24ffc65c4f; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_24ffc65c4f FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: items fk_rails_251c3680fb; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_251c3680fb FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: quotations fk_rails_262f362616; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_262f362616 FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: items fk_rails_2704df0fea; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_2704df0fea FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: items fk_rails_28485f6c22; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_28485f6c22 FOREIGN KEY (status_item_id) REFERENCES public.status_items(id);


--
-- Name: items fk_rails_29e5de7d1e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_29e5de7d1e FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: quotations fk_rails_2a2e26fe19; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_2a2e26fe19 FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: trailer_categories fk_rails_2b09112e1e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_2b09112e1e FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: trailers fk_rails_3034dac85c; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_3034dac85c FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: users_work_articles fk_rails_3167acd9a5; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users_work_articles
    ADD CONSTRAINT fk_rails_3167acd9a5 FOREIGN KEY (work_article_id) REFERENCES public.work_articles(id);


--
-- Name: trailer_categories fk_rails_32022af0b0; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_32022af0b0 FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: quotations fk_rails_34ba49db94; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_34ba49db94 FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: items fk_rails_3566f10a5e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_3566f10a5e FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: items fk_rails_36708b3aa6; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_36708b3aa6 FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: trailer_categories fk_rails_39e8763a2a; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_39e8763a2a FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: trailer_categories fk_rails_3a0f925a3c; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_3a0f925a3c FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: quotations fk_rails_3b97237386; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_3b97237386 FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: states fk_rails_40bd891262; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT fk_rails_40bd891262 FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: quotations fk_rails_43ab7e57f0; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_43ab7e57f0 FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: items_maintenances fk_rails_45f9fe3c9e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items_maintenances
    ADD CONSTRAINT fk_rails_45f9fe3c9e FOREIGN KEY (maintenance_id) REFERENCES public.maintenances(id);


--
-- Name: items fk_rails_49ce6bf71a; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_49ce6bf71a FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: trailers fk_rails_4b90884e0d; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_4b90884e0d FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: trailers fk_rails_4bde881491; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_4bde881491 FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: quotations fk_rails_518ff6f9ff; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_518ff6f9ff FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: quotations fk_rails_540dda8a10; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_540dda8a10 FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: items fk_rails_55332343fc; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_55332343fc FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: trailers fk_rails_56a4796802; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_56a4796802 FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: categories fk_rails_5740af41d8; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_5740af41d8 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: trailers fk_rails_599f3450b1; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_599f3450b1 FOREIGN KEY (sub_category_id) REFERENCES public.sub_categories(id);


--
-- Name: cities fk_rails_59b5e22e07; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_rails_59b5e22e07 FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: trailer_categories fk_rails_59d10b8fec; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_59d10b8fec FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: branches fk_rails_5a8fb811d4; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT fk_rails_5a8fb811d4 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: trailer_categories fk_rails_5cd4b402a7; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_5cd4b402a7 FOREIGN KEY (trailer_id) REFERENCES public.trailers(id);


--
-- Name: quotations fk_rails_5ef9c57765; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_5ef9c57765 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: quotations fk_rails_604d26f78c; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_604d26f78c FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: trailers fk_rails_60ff0b2849; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_60ff0b2849 FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: users fk_rails_642f17018b; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: quotations fk_rails_6989b697c6; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_6989b697c6 FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: clients fk_rails_6b5e4c0738; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_rails_6b5e4c0738 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: offices fk_rails_6e2be765ac; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT fk_rails_6e2be765ac FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: items fk_rails_730732b132; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_730732b132 FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: trailer_categories fk_rails_767226c2df; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_767226c2df FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: trailers fk_rails_770d9d8e1e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_770d9d8e1e FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: items fk_rails_79ba7f193e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_79ba7f193e FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: trailers fk_rails_79f91b7254; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_79f91b7254 FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: items fk_rails_7b0a288977; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_7b0a288977 FOREIGN KEY (trailer_id) REFERENCES public.trailers(id);


--
-- Name: quotations fk_rails_7c77fa1bb1; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_7c77fa1bb1 FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: trailers fk_rails_7fe5507f47; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_7fe5507f47 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: trailer_categories fk_rails_83856f4ca8; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_83856f4ca8 FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: items fk_rails_8541a27257; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_8541a27257 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: items fk_rails_85a8d98e45; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_85a8d98e45 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: items fk_rails_89fb86dc8b; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_89fb86dc8b FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: trailers fk_rails_8a23d3261a; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_8a23d3261a FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: trailers fk_rails_8a8bacaad9; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_8a8bacaad9 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: quotations fk_rails_8d67c3604e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_8d67c3604e FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: sub_categories fk_rails_8e75c2ee78; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.sub_categories
    ADD CONSTRAINT fk_rails_8e75c2ee78 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: trailers fk_rails_8f134baecc; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_8f134baecc FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: quotations fk_rails_918af027d1; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_918af027d1 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: items fk_rails_96e3cdf491; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_96e3cdf491 FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: items fk_rails_977d67151a; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_977d67151a FOREIGN KEY (provider_id) REFERENCES public.providers(id);


--
-- Name: items fk_rails_99af3508f2; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_99af3508f2 FOREIGN KEY (trailer_height_id) REFERENCES public.trailer_heights(id);


--
-- Name: branches fk_rails_9d5c1c06e3; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT fk_rails_9d5c1c06e3 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: items fk_rails_a5aed87f6f; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_a5aed87f6f FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: trailer_categories fk_rails_a7020d2899; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_a7020d2899 FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: items fk_rails_ac5f5fa72d; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_ac5f5fa72d FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: items fk_rails_ad375a4185; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_ad375a4185 FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: trailers fk_rails_ad8a4b5803; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_ad8a4b5803 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: items fk_rails_afd2de6b24; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_afd2de6b24 FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: trailer_categories fk_rails_afee5bd97a; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_afee5bd97a FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: items fk_rails_b0f0912311; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_b0f0912311 FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: trailer_categories fk_rails_b142ba5cff; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_b142ba5cff FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: trailers fk_rails_bb32afb99f; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_bb32afb99f FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: items fk_rails_bfc3e85c77; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_bfc3e85c77 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: items fk_rails_c49179e4ee; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_c49179e4ee FOREIGN KEY (fiscal_voucher_id) REFERENCES public.fiscal_vouchers(id);


--
-- Name: permission_roles fk_rails_c517d9a118; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.permission_roles
    ADD CONSTRAINT fk_rails_c517d9a118 FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: trailers fk_rails_c5daa4df74; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_c5daa4df74 FOREIGN KEY (trailer_height_id) REFERENCES public.trailer_heights(id);


--
-- Name: offices fk_rails_c780e4d374; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT fk_rails_c780e4d374 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: trailers fk_rails_c987b70ad9; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_c987b70ad9 FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: quotations fk_rails_cb40e11112; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_cb40e11112 FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: items fk_rails_cee0861031; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_cee0861031 FOREIGN KEY (status_shipping_id) REFERENCES public.status_shippings(id);


--
-- Name: items fk_rails_d17ec4f703; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_d17ec4f703 FOREIGN KEY (sub_category_id) REFERENCES public.sub_categories(id);


--
-- Name: trailer_categories fk_rails_d18ec678a2; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_d18ec678a2 FOREIGN KEY (trailer_height_id) REFERENCES public.trailer_heights(id);


--
-- Name: items fk_rails_d387046195; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_d387046195 FOREIGN KEY (reinforcement_type_id) REFERENCES public.reinforcement_types(id);


--
-- Name: items fk_rails_d4b6334db2; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_d4b6334db2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: branches fk_rails_d95f632f7d; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT fk_rails_d95f632f7d FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: trailer_categories fk_rails_d9b25efb21; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_d9b25efb21 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: quotations fk_rails_db04b903d7; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_db04b903d7 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: departments fk_rails_dd358b3f48; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_rails_dd358b3f48 FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: trailer_categories fk_rails_e0a90675d1; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_e0a90675d1 FOREIGN KEY (reinforcement_type_id) REFERENCES public.reinforcement_types(id);


--
-- Name: trailer_categories fk_rails_e1f6610438; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_e1f6610438 FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: quotations fk_rails_e4d84b692c; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_e4d84b692c FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: clients fk_rails_e51b1095c9; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_rails_e51b1095c9 FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: trailers fk_rails_e530fba61f; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_e530fba61f FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: companies fk_rails_e57cb42012; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: permission_roles fk_rails_e8b49f05fd; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.permission_roles
    ADD CONSTRAINT fk_rails_e8b49f05fd FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: quotations fk_rails_eb5da72e26; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_eb5da72e26 FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: trailer_categories fk_rails_eb75ce6ec6; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_eb75ce6ec6 FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: item_files fk_rails_f049e03d8e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.item_files
    ADD CONSTRAINT fk_rails_f049e03d8e FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: users fk_rails_f29bf9cdf2; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_f29bf9cdf2 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: quotations fk_rails_f32f4ba97e; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_f32f4ba97e FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: quotations fk_rails_f63036eec2; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_f63036eec2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_work_articles fk_rails_fbecc6c009; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.users_work_articles
    ADD CONSTRAINT fk_rails_fbecc6c009 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: items_maintenances fk_rails_fd3237a03d; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items_maintenances
    ADD CONSTRAINT fk_rails_fd3237a03d FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: quotations fk_rails_fe0f05c203; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_fe0f05c203 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: items fk_rails_ffc2aef5fc; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_ffc2aef5fc FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: trailers fk_rails_ffe2b7c3d8; Type: FK CONSTRAINT; Schema: public; Owner: alejandrorodriguez
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_ffe2b7c3d8 FOREIGN KEY (reinforcement_type_id) REFERENCES public.reinforcement_types(id);


--
-- PostgreSQL database dump complete
--

