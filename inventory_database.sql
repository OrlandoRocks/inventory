--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO mac;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO mac;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.active_storage_blobs OWNER TO mac;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO mac;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO mac;

--
-- Name: audits; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.audits OWNER TO mac;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.audits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audits_id_seq OWNER TO mac;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: brake_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.brake_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.brake_types OWNER TO mac;

--
-- Name: brake_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.brake_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brake_types_id_seq OWNER TO mac;

--
-- Name: brake_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.brake_types_id_seq OWNED BY public.brake_types.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.branches OWNER TO mac;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO mac;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.brands OWNER TO mac;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO mac;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: capacities; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.capacities (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.capacities OWNER TO mac;

--
-- Name: capacities_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.capacities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capacities_id_seq OWNER TO mac;

--
-- Name: capacities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.capacities_id_seq OWNED BY public.capacities.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.categories OWNER TO mac;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO mac;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying,
    state_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO mac;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO mac;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.clients OWNER TO mac;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO mac;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.colors (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.colors OWNER TO mac;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO mac;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.companies OWNER TO mac;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO mac;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.countries OWNER TO mac;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO mac;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.departments OWNER TO mac;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO mac;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: divition_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.divition_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.divition_types OWNER TO mac;

--
-- Name: divition_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.divition_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divition_types_id_seq OWNER TO mac;

--
-- Name: divition_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.divition_types_id_seq OWNED BY public.divition_types.id;


--
-- Name: fender_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.fender_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.fender_types OWNER TO mac;

--
-- Name: fender_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.fender_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fender_types_id_seq OWNER TO mac;

--
-- Name: fender_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.fender_types_id_seq OWNED BY public.fender_types.id;


--
-- Name: fiscal_vouchers; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.fiscal_vouchers (
    id bigint NOT NULL,
    name character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.fiscal_vouchers OWNER TO mac;

--
-- Name: fiscal_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.fiscal_vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiscal_vouchers_id_seq OWNER TO mac;

--
-- Name: fiscal_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.fiscal_vouchers_id_seq OWNED BY public.fiscal_vouchers.id;


--
-- Name: floor_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.floor_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.floor_types OWNER TO mac;

--
-- Name: floor_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.floor_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.floor_types_id_seq OWNER TO mac;

--
-- Name: floor_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.floor_types_id_seq OWNED BY public.floor_types.id;


--
-- Name: hydraulic_jacks; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.hydraulic_jacks (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.hydraulic_jacks OWNER TO mac;

--
-- Name: hydraulic_jacks_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.hydraulic_jacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hydraulic_jacks_id_seq OWNER TO mac;

--
-- Name: hydraulic_jacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.hydraulic_jacks_id_seq OWNED BY public.hydraulic_jacks.id;


--
-- Name: item_files; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.item_files OWNER TO mac;

--
-- Name: item_files_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.item_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_files_id_seq OWNER TO mac;

--
-- Name: item_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.item_files_id_seq OWNED BY public.item_files.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: mac
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
    payment_type integer,
    fiscal_voucher_id bigint,
    client_id bigint,
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


ALTER TABLE public.items OWNER TO mac;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO mac;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: items_maintenances; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.items_maintenances OWNER TO mac;

--
-- Name: items_maintenances_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.items_maintenances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_maintenances_id_seq OWNER TO mac;

--
-- Name: items_maintenances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.items_maintenances_id_seq OWNED BY public.items_maintenances.id;


--
-- Name: maintenances; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.maintenances (
    id integer NOT NULL,
    name character varying,
    description text,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.maintenances OWNER TO mac;

--
-- Name: maintenances_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.maintenances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maintenances_id_seq OWNER TO mac;

--
-- Name: maintenances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.maintenances_id_seq OWNED BY public.maintenances.id;


--
-- Name: offices; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.offices OWNER TO mac;

--
-- Name: offices_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.offices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offices_id_seq OWNER TO mac;

--
-- Name: offices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.offices_id_seq OWNED BY public.offices.id;


--
-- Name: permission_roles; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.permission_roles (
    id integer NOT NULL,
    role_id integer,
    permission_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permission_roles OWNER TO mac;

--
-- Name: permission_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.permission_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_roles_id_seq OWNER TO mac;

--
-- Name: permission_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.permission_roles_id_seq OWNED BY public.permission_roles.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.permissions OWNER TO mac;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO mac;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: plutus_accounts; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.plutus_accounts (
    id integer NOT NULL,
    name character varying,
    type character varying,
    contra boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.plutus_accounts OWNER TO mac;

--
-- Name: plutus_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.plutus_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plutus_accounts_id_seq OWNER TO mac;

--
-- Name: plutus_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.plutus_accounts_id_seq OWNED BY public.plutus_accounts.id;


--
-- Name: plutus_amounts; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.plutus_amounts (
    id integer NOT NULL,
    type character varying,
    account_id integer,
    entry_id integer,
    amount numeric(20,10)
);


ALTER TABLE public.plutus_amounts OWNER TO mac;

--
-- Name: plutus_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.plutus_amounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plutus_amounts_id_seq OWNER TO mac;

--
-- Name: plutus_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.plutus_amounts_id_seq OWNED BY public.plutus_amounts.id;


--
-- Name: plutus_entries; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.plutus_entries OWNER TO mac;

--
-- Name: plutus_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.plutus_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plutus_entries_id_seq OWNER TO mac;

--
-- Name: plutus_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.plutus_entries_id_seq OWNED BY public.plutus_entries.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.providers OWNER TO mac;

--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.providers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.providers_id_seq OWNER TO mac;

--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: pull_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.pull_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pull_types OWNER TO mac;

--
-- Name: pull_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.pull_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pull_types_id_seq OWNER TO mac;

--
-- Name: pull_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.pull_types_id_seq OWNED BY public.pull_types.id;


--
-- Name: quotations; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.quotations OWNER TO mac;

--
-- Name: quotations_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.quotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotations_id_seq OWNER TO mac;

--
-- Name: quotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.quotations_id_seq OWNED BY public.quotations.id;


--
-- Name: ramp_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.ramp_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ramp_types OWNER TO mac;

--
-- Name: ramp_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.ramp_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ramp_types_id_seq OWNER TO mac;

--
-- Name: ramp_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.ramp_types_id_seq OWNED BY public.ramp_types.id;


--
-- Name: redila_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.redila_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.redila_types OWNER TO mac;

--
-- Name: redila_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.redila_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redila_types_id_seq OWNER TO mac;

--
-- Name: redila_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.redila_types_id_seq OWNED BY public.redila_types.id;


--
-- Name: reinforcement_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.reinforcement_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.reinforcement_types OWNER TO mac;

--
-- Name: reinforcement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.reinforcement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reinforcement_types_id_seq OWNER TO mac;

--
-- Name: reinforcement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.reinforcement_types_id_seq OWNED BY public.reinforcement_types.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.roles OWNER TO mac;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO mac;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roof_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.roof_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roof_types OWNER TO mac;

--
-- Name: roof_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.roof_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roof_types_id_seq OWNER TO mac;

--
-- Name: roof_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.roof_types_id_seq OWNED BY public.roof_types.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO mac;

--
-- Name: states; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.states OWNER TO mac;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO mac;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: status_items; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.status_items OWNER TO mac;

--
-- Name: status_items_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.status_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_items_id_seq OWNER TO mac;

--
-- Name: status_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.status_items_id_seq OWNED BY public.status_items.id;


--
-- Name: status_shippings; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.status_shippings OWNER TO mac;

--
-- Name: status_shippings_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.status_shippings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_shippings_id_seq OWNER TO mac;

--
-- Name: status_shippings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.status_shippings_id_seq OWNED BY public.status_shippings.id;


--
-- Name: sub_categories; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.sub_categories OWNER TO mac;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.sub_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_categories_id_seq OWNER TO mac;

--
-- Name: sub_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.sub_categories_id_seq OWNED BY public.sub_categories.id;


--
-- Name: suspension_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.suspension_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.suspension_types OWNER TO mac;

--
-- Name: suspension_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.suspension_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suspension_types_id_seq OWNER TO mac;

--
-- Name: suspension_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.suspension_types_id_seq OWNED BY public.suspension_types.id;


--
-- Name: trailer_categories; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.trailer_categories OWNER TO mac;

--
-- Name: trailer_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.trailer_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_categories_id_seq OWNER TO mac;

--
-- Name: trailer_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.trailer_categories_id_seq OWNED BY public.trailer_categories.id;


--
-- Name: trailer_heights; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.trailer_heights (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trailer_heights OWNER TO mac;

--
-- Name: trailer_heights_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.trailer_heights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_heights_id_seq OWNER TO mac;

--
-- Name: trailer_heights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.trailer_heights_id_seq OWNED BY public.trailer_heights.id;


--
-- Name: trailer_lengths; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.trailer_lengths (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trailer_lengths OWNER TO mac;

--
-- Name: trailer_lengths_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.trailer_lengths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_lengths_id_seq OWNER TO mac;

--
-- Name: trailer_lengths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.trailer_lengths_id_seq OWNED BY public.trailer_lengths.id;


--
-- Name: trailer_types; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.trailer_types OWNER TO mac;

--
-- Name: trailer_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.trailer_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_types_id_seq OWNER TO mac;

--
-- Name: trailer_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.trailer_types_id_seq OWNED BY public.trailer_types.id;


--
-- Name: trailer_widths; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.trailer_widths (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trailer_widths OWNER TO mac;

--
-- Name: trailer_widths_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.trailer_widths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailer_widths_id_seq OWNER TO mac;

--
-- Name: trailer_widths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.trailer_widths_id_seq OWNED BY public.trailer_widths.id;


--
-- Name: trailers; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.trailers OWNER TO mac;

--
-- Name: trailers_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.trailers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trailers_id_seq OWNER TO mac;

--
-- Name: trailers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.trailers_id_seq OWNED BY public.trailers.id;


--
-- Name: turn_types; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.turn_types (
    id bigint NOT NULL,
    name character varying,
    model_part character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.turn_types OWNER TO mac;

--
-- Name: turn_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.turn_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.turn_types_id_seq OWNER TO mac;

--
-- Name: turn_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.turn_types_id_seq OWNED BY public.turn_types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.users OWNER TO mac;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mac;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_work_articles; Type: TABLE; Schema: public; Owner: mac
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


ALTER TABLE public.users_work_articles OWNER TO mac;

--
-- Name: users_work_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.users_work_articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_work_articles_id_seq OWNER TO mac;

--
-- Name: users_work_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.users_work_articles_id_seq OWNED BY public.users_work_articles.id;


--
-- Name: work_articles; Type: TABLE; Schema: public; Owner: mac
--

CREATE TABLE public.work_articles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.work_articles OWNER TO mac;

--
-- Name: work_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: mac
--

CREATE SEQUENCE public.work_articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_articles_id_seq OWNER TO mac;

--
-- Name: work_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mac
--

ALTER SEQUENCE public.work_articles_id_seq OWNED BY public.work_articles.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: brake_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.brake_types ALTER COLUMN id SET DEFAULT nextval('public.brake_types_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: capacities id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.capacities ALTER COLUMN id SET DEFAULT nextval('public.capacities_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: divition_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.divition_types ALTER COLUMN id SET DEFAULT nextval('public.divition_types_id_seq'::regclass);


--
-- Name: fender_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.fender_types ALTER COLUMN id SET DEFAULT nextval('public.fender_types_id_seq'::regclass);


--
-- Name: fiscal_vouchers id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.fiscal_vouchers ALTER COLUMN id SET DEFAULT nextval('public.fiscal_vouchers_id_seq'::regclass);


--
-- Name: floor_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.floor_types ALTER COLUMN id SET DEFAULT nextval('public.floor_types_id_seq'::regclass);


--
-- Name: hydraulic_jacks id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.hydraulic_jacks ALTER COLUMN id SET DEFAULT nextval('public.hydraulic_jacks_id_seq'::regclass);


--
-- Name: item_files id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.item_files ALTER COLUMN id SET DEFAULT nextval('public.item_files_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: items_maintenances id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items_maintenances ALTER COLUMN id SET DEFAULT nextval('public.items_maintenances_id_seq'::regclass);


--
-- Name: maintenances id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.maintenances ALTER COLUMN id SET DEFAULT nextval('public.maintenances_id_seq'::regclass);


--
-- Name: offices id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.offices ALTER COLUMN id SET DEFAULT nextval('public.offices_id_seq'::regclass);


--
-- Name: permission_roles id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.permission_roles ALTER COLUMN id SET DEFAULT nextval('public.permission_roles_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: plutus_accounts id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.plutus_accounts ALTER COLUMN id SET DEFAULT nextval('public.plutus_accounts_id_seq'::regclass);


--
-- Name: plutus_amounts id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.plutus_amounts ALTER COLUMN id SET DEFAULT nextval('public.plutus_amounts_id_seq'::regclass);


--
-- Name: plutus_entries id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.plutus_entries ALTER COLUMN id SET DEFAULT nextval('public.plutus_entries_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


--
-- Name: pull_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.pull_types ALTER COLUMN id SET DEFAULT nextval('public.pull_types_id_seq'::regclass);


--
-- Name: quotations id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations ALTER COLUMN id SET DEFAULT nextval('public.quotations_id_seq'::regclass);


--
-- Name: ramp_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.ramp_types ALTER COLUMN id SET DEFAULT nextval('public.ramp_types_id_seq'::regclass);


--
-- Name: redila_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.redila_types ALTER COLUMN id SET DEFAULT nextval('public.redila_types_id_seq'::regclass);


--
-- Name: reinforcement_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.reinforcement_types ALTER COLUMN id SET DEFAULT nextval('public.reinforcement_types_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: roof_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.roof_types ALTER COLUMN id SET DEFAULT nextval('public.roof_types_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: status_items id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.status_items ALTER COLUMN id SET DEFAULT nextval('public.status_items_id_seq'::regclass);


--
-- Name: status_shippings id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.status_shippings ALTER COLUMN id SET DEFAULT nextval('public.status_shippings_id_seq'::regclass);


--
-- Name: sub_categories id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.sub_categories ALTER COLUMN id SET DEFAULT nextval('public.sub_categories_id_seq'::regclass);


--
-- Name: suspension_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.suspension_types ALTER COLUMN id SET DEFAULT nextval('public.suspension_types_id_seq'::regclass);


--
-- Name: trailer_categories id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories ALTER COLUMN id SET DEFAULT nextval('public.trailer_categories_id_seq'::regclass);


--
-- Name: trailer_heights id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_heights ALTER COLUMN id SET DEFAULT nextval('public.trailer_heights_id_seq'::regclass);


--
-- Name: trailer_lengths id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_lengths ALTER COLUMN id SET DEFAULT nextval('public.trailer_lengths_id_seq'::regclass);


--
-- Name: trailer_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_types ALTER COLUMN id SET DEFAULT nextval('public.trailer_types_id_seq'::regclass);


--
-- Name: trailer_widths id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_widths ALTER COLUMN id SET DEFAULT nextval('public.trailer_widths_id_seq'::regclass);


--
-- Name: trailers id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers ALTER COLUMN id SET DEFAULT nextval('public.trailers_id_seq'::regclass);


--
-- Name: turn_types id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.turn_types ALTER COLUMN id SET DEFAULT nextval('public.turn_types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_work_articles id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users_work_articles ALTER COLUMN id SET DEFAULT nextval('public.users_work_articles_id_seq'::regclass);


--
-- Name: work_articles id; Type: DEFAULT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.work_articles ALTER COLUMN id SET DEFAULT nextval('public.work_articles_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
8	image	Item	1	8	2020-09-10 03:44:38.095246
83	image	Trailer	1	83	2020-10-01 22:56:59.665428
86	image	Item	5	86	2020-10-06 22:36:10.408958
87	image	Item	4	87	2020-10-07 00:13:55.432723
88	image	Item	2	88	2020-10-12 23:27:54.628019
89	image	Item	3	89	2020-10-12 23:33:05.282718
91	image	Item	6	91	2020-10-19 17:35:59.974239
92	image	Item	52	92	2020-10-22 01:07:10.886702
93	image	TrailerType	1	93	2020-10-26 23:17:24.785109
96	image	Item	59	96	2021-01-06 07:47:59.224646
97	image	Item	63	97	2021-01-06 07:59:20.501584
98	image	Item	55	98	2021-01-06 08:04:49.530802
99	image	Item	16	99	2021-03-03 03:13:24.797104
103	image	Item	69	103	2021-03-10 20:16:10.424432
104	image	Item	72	104	2021-03-18 18:57:31.952019
105	image	Item	58	105	2021-03-31 23:32:23.162474
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
8	59Y2g5CXJRkPp5eBdkEv36LF	trailers_default.png	image/png	{"identified":true}	190229	mhjOnt4JzWCGD1xo46JQsA==	2020-09-10 03:44:38.092829
10	xCfE1Jp5z7RZsfukPy6TPmt9	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.447193
11	D8ZZZ674WxvMn48ckVGeXQoL	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.543
12	vwuoDLvQVVETd64uyGaQrmEq	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.606376
13	1FvTPWfeYTPn9Gbek1PzkeKt	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.665679
14	j5NJhZydRBtWtpkcgds5Nh1X	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.728989
15	c7ySJbxtLvGx4ZsWpXy6mVZn	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.79172
16	t1ZvPdAuEr97ezPTaMiQ48cM	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.857314
17	qkCs8dH33Jhtv6Mfi6wuz9oZ	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.911699
18	V94AL5f1Mh4bJrnzNHy81rSZ	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:11.96546
19	EPxYFUBgH5gX5n51JTSRAKLg	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.022229
20	WcTn8pF2nqws67DqwpjCvnid	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.078357
21	kidRxEQfyhwX6zozxoC6j7nq	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.136689
22	ox4sMsuDd8qU81Qd5G4PzcPZ	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.195037
23	tGBEAw1FiAZyZ3qzaayXJ8z9	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.251815
24	iS3xUe1KfvtUpPt6HhDsrprW	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.308519
25	1iESEdu1eup5k4nwFL7hHYmh	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.368763
26	siniU5FhbTpswixF6vcRwBoH	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.43824
27	5iS3o4SBEUj6ujG1B2k4RWUH	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.493318
28	w6EFkR33hHQwzAUEW2BaDSBC	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.544825
29	XWtmhW6jmZteDnrh7d4C86Xe	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.60366
30	viPpduZycnw4W3hsb9sqPgWM	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:01:12.659519
31	7oFXABXZ3u2H2gCs44fNBFQX	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.575218
32	i6iHJuMqPLhbYiZBZTjQhJqF	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.630859
33	AcKYh3fNfm6na75dFxUSzfbm	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.686149
34	C1pSJjfTVVW5FUv9XTtcdvif	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.741911
35	usDqGvBvH4GgQYLBp7UAcLHi	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.800008
36	iGfTiiRfTUhhcANoS3yGoQrj	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.873663
37	XPqsvCZL8QWumSYD7Hwoa78V	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.932374
38	sTU3faUdBbBMqXm4C8MQ2ijw	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:13.987705
39	U87ZTqvf7io4hnCy99ky7HtF	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.044307
40	8Buzs3o9rUv8HuU4RqHxAwaf	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.101834
41	vRu76JfGcjfXK8EuTfmiDNjM	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.162832
42	GDhp8CYczmmPzYjLPakUn9oP	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.219228
43	o3RMp39DxCHzLUtbP1zqSbTR	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.27685
44	r6gqZppuKqnTE1qGZeDqqs9s	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.33706
45	9FwLJJUi6RoUin7Q5G3tZZRb	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.397023
46	GsHsgzi6sVHRibqMaT9zCsfP	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.453258
47	7PFwBfwdSm3D1piFsWwbpPF3	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.516061
48	zUxCrip4U1xv1wNyXjemznfU	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.573804
49	r5bgSUVspkegqXDy1mb1tq7p	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.631056
50	69d7Aew7mjqtb7NrarFyi1Yi	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:02:14.695223
52	DnUBHa4GhbHn7PrmMHKi1iLD	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.083929
53	Tf3ZvJdpnQCeYmFQhGKG8YpV	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.225952
54	saVJocpFzsNrgAEZDmehg99i	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.291692
55	FV5BGWohTYTyKiWGoCn5nKg1	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.350766
56	FpLqBrfcSDaECbtCvG8aPgeF	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.415311
57	rsV8zA2T8pxAapfG3XmSjmEz	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.487245
58	252yvAoH8CVnJPq5yCs385dY	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.546442
59	9fsK6uaok5D9fx9jtGC2ZJWv	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.605311
60	Sv7AuJuH9zrAYEpNDJGtG9KW	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.666304
61	vvYrBiLk4zRj6Lze8y6duyM6	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.721108
62	SUteMNZKz1iHitTbS7UNBk5h	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.78819
63	zC58UvYp5E73FFa6xZuYcvNC	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.85163
64	qY24pafKh9AZrBiYAHjiGU4X	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.916845
66	nPqDB37PNpnVG9MuPvYsQXqP	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:27.050992
68	CoD8hbkAauTz489AFE4cRKca	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:27.163854
70	qXo4i2Z2WmExzWAv6q8xsr3t	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:27.274472
65	G8TCSwo1tyykMgJbztU3wYSb	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:26.981579
67	43uogMZjE6C53iT4EtqM5eep	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:27.105415
69	brdbqHufsLyKRRxndQnirmYR	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:27.2183
71	4A5bQSnyaK5t1FgK3Xtm9Pt2	bg.jpg	image/jpeg	{"identified":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 06:09:27.328741
78	ugytRwfjmQpa4MaQDuiXuSAM	jon.jpg	image/jpeg	{"identified":true}	63596	ZWFlfTsB0waRb+30kFlbKw==	2020-09-25 06:47:31.217006
81	PKDPuku1tBLVvpFkY3ZuhRQS	jon.jpg	image/jpeg	{"identified":true}	63596	ZWFlfTsB0waRb+30kFlbKw==	2020-09-25 06:56:58.216974
82	cBWKj6PMYU7UVnJ9vX9farJH	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-09-25 07:23:22.682505
83	cp9bDRqczserdj1EDNs7LE8o	jon.jpg	image/jpeg	{"identified":true,"width":640,"height":640,"analyzed":true}	63596	ZWFlfTsB0waRb+30kFlbKw==	2020-10-01 22:56:59.655823
99	NzHSPm8JVScxgkbV1hfJZJZM	orden_medico_estudio.jpeg	image/jpeg	{"identified":true,"width":960,"height":1280,"analyzed":true}	118909	wp1QnDV3Yg2G8bYQj4DRrA==	2021-03-03 03:13:24.757888
85	6cJmCBu8sL68YXuRUUjyGBGc	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-10-06 22:24:11.444473
86	sCFw6Ga6Gzmqj6kpY2sPT6QC	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-10-06 22:36:10.405098
87	vxsee8n8Lt2KnGEoSH3Ss6Dr	jon.jpg	image/jpeg	{"identified":true,"width":640,"height":640,"analyzed":true}	63596	ZWFlfTsB0waRb+30kFlbKw==	2020-10-07 00:13:55.429681
88	Jt6VQzJBCTskJ3mL4jXozQNT	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-10-12 23:27:54.598175
89	YSKPp6QBkbTaMkPDeDL6ewms	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-10-12 23:33:05.278988
91	H5zvP7FgbTrSkyo74gB8ViJP	Comprobante de Pago	image/jpeg	{"identified":true,"width":640,"height":640,"analyzed":true}	63596	ZWFlfTsB0waRb+30kFlbKw==	2020-10-19 17:35:59.931519
92	LLHvf4p7j2B7S4HcPCq2j2PW	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-10-22 01:07:10.882488
93	NZZiy2dkULU8AF2AMJ8Qg1nD	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2020-10-26 23:17:24.764273
96	WLguyjCr99jEiAusm8rXsKde	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2021-01-06 07:47:59.221699
97	d9GkaKCcsLUWZpSrHPVQeFE6	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2021-01-06 07:59:20.499219
98	n6BaRpx7A1FdsuW3DKuXLE5B	bg.jpg	image/jpeg	{"identified":true,"width":1800,"height":1012,"analyzed":true}	394091	l0t3HwJt685SkuPtqW7xFQ==	2021-01-06 08:04:49.528796
103	nEoJWQBtHccmKSWb6DD4R3hK	WhatsApp Image 2020-09-30 at 8.10.37 PM.jpeg	image/jpeg	{"identified":true,"width":963,"height":467,"analyzed":true}	95635	d3UaVOudpvC4t30BY8PvVg==	2021-03-10 20:16:10.422237
104	7FDudAnd1GvRDrBhw9uPkuZN	pp.jpeg	image/jpeg	{"identified":true,"width":640,"height":640,"analyzed":true}	62076	1iH8kxozV+bVsgWLTUF07w==	2021-03-18 18:57:31.941792
105	ENxf9Kiu6vYjLBLutNUBQBjo	Screen Shot 2020-04-01 at 11.53.33.png	image/png	{"identified":true,"width":2130,"height":774,"analyzed":true}	751349	+ar/TcIe/SfwBrLBLkfBpw==	2021-03-31 23:32:23.132969
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-08-28 22:20:37.752452	2020-08-28 22:20:37.752452
\.


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
1	1	Item	\N	\N	1	User	\N	create	---\nname: Remolque Cuau\ndescription: Remolque cuau test\nmodel: CB4007M05T\nserial_number: 3BZBP0714LC010760\npurchased_date: 01/09/2020\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.5e5\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode: '123421'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id: 2\nto_assing:\nsale_price:\nremission: '33337'\naccessory: sin accesorios\n	1	\N	::1	f5b1d2af-7bc8-4d91-88f2-7973e3ed2f34	2020-09-07 19:15:59.329419
2	2	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 2'"\ndescription: "'Remolque 2'"\nmodel: "'*CB4007M05T*'"\nserial_number: "'*3BZBP0714LC010760*'"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195301'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33337'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	3782a4ef-4dca-4e0b-9e4f-03e053164f7f	2020-09-09 06:00:18.190741
3	3	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 3'"\ndescription: "'Remolque 3'"\nmodel: "'*CB4008M08T*'"\nserial_number: "'*3BZBP0810LC010754*'"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195298'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33336'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	5c476718-143d-48f5-bda9-7ddb16b7e085	2020-09-09 06:00:18.237273
4	4	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 4'"\ndescription: "'Remolque 4'"\nmodel: "'*CB4008M08T*'"\nserial_number: "'*3BZBP0819LC010753*'"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195299'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33338'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	8d0c8a23-7b97-46c1-8214-9e1c84a2f25b	2020-09-09 06:00:18.248369
5	5	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 5'"\ndescription: "'Remolque 5'"\nmodel: "'*CB5010A15T*'"\nserial_number: "'*3BZBN1013LC009962*'"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'193531'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33230'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	ab1dfabf-fe1a-483d-a2a1-86f7d156565c	2020-09-09 06:00:18.259113
6	6	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 6'"\ndescription: "'Remolque 6'"\nmodel: "'*CB5010M15T*'"\nserial_number: "'*3BZBP1015LC008161*'"\npurchased_date: 20/04/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190229'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33223'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	3598c58d-6f4c-472c-88cb-358bd498e7c9	2020-09-09 06:00:18.271942
7	7	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 7'"\ndescription: "'Remolque 7'"\nmodel: "'*CB5010M15T*'"\nserial_number: "'*3BZBP1018LC010759*'"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195291'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33328'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	1c69a1ba-1338-4fb7-be54-8ae71c1da29b	2020-09-09 06:00:18.284101
8	8	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 8'"\ndescription: "'Remolque 8'"\nmodel: "'*CB5010M15T*'"\nserial_number: "'*3BZBP1016LC010761*'"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195290'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33331'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	6e3288ae-93d6-4c95-b076-b7116ce83cf0	2020-09-09 06:00:18.297826
9	9	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 9'"\ndescription: "'Remolque 9'"\nmodel: "'*CB6514M15T*'"\nserial_number: "'*3BZBP1417LC009953*'"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'193530'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33244'"\naccessory: "'Puerta Rampa'"\nacquisition_date:\n	1	\N	\N	2aa4c361-0c5c-4cd9-b8fd-b236ec92c86b	2020-09-09 06:00:18.309094
10	10	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 10'"\ndescription: "'Remolque 10'"\nmodel: "'*CB6514M15T*'"\nserial_number: "'*3BZBP1413LC010730*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195279'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33343'"\naccessory: "'puerta rampa'"\nacquisition_date:\n	1	\N	\N	1920da53-b13d-4cc1-8b4a-55b3685daf62	2020-09-09 06:00:18.320411
11	11	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 11'"\ndescription: "'Remolque 11'"\nmodel: "'*CB6514M15T*'"\nserial_number: "'*3BZBP1417LC010729*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195278'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33341'"\naccessory: "'puerta rampa'"\nacquisition_date:\n	1	\N	\N	0f9ffc5e-d932-4efa-a466-eaae69062994	2020-09-09 06:00:18.329988
12	12	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 12'"\ndescription: "'Remolque 12'"\nmodel: "'*CB6514M15T*'"\nserial_number: "'*3BZBP1415LC010728*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195277'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33342'"\naccessory: "'puerta rampa'"\nacquisition_date:\n	1	\N	\N	6aab97d9-84aa-4854-bed3-85d72b2c9df4	2020-09-09 06:00:18.341749
146	42	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	8aa8918e-4617-493c-9b77-5dd7402ef53c	2020-09-10 20:52:46.681157
147	43	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	40c871ab-e58e-4cd0-b0b0-90ab0cde0e2c	2020-09-10 20:52:46.690255
148	44	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	2faa98ca-86ab-41d8-935d-73981e911ac3	2020-09-10 20:52:46.700886
13	13	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 13'"\ndescription: "'Remolque 13'"\nmodel: "'*CB6514M15T*'"\nserial_number: "'*3BZBP1413LC010727*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195276'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33340'"\naccessory: "'puerta rampa'"\nacquisition_date:\n	1	\N	\N	e664d9f5-ef1d-4378-b69c-aacd4488be57	2020-09-09 06:00:18.355593
14	14	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 14'"\ndescription: "'Remolque 14'"\nmodel: "'*CB5012M30T*'"\nserial_number: "'*3BZBP1223LC010769*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195307'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33330'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	8fb632a4-f323-4b0a-8373-835aab2600e4	2020-09-09 06:00:18.367276
15	15	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 15'"\ndescription: "'Remolque 15'"\nmodel: "'*CB5012A30T*'"\nserial_number: "'*3BZBN1228LC010756*'"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195294'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33324'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	2799edee-44eb-4686-98f3-a3bfa7934373	2020-09-09 06:00:18.377164
16	16	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 16'"\ndescription: "'Remolque 16'"\nmodel: "'*CB5012A30T*'"\nserial_number: "'*3BZBN1226LC010755*'"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195297'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33335'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	c48e7fd9-7830-453d-97f1-b32d90a13170	2020-09-09 06:00:18.388002
17	17	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 17'"\ndescription: "'Remolque 17'"\nmodel: "'*CB5014M30T*'"\nserial_number: "'*3BZBP142XKC001482*'"\npurchased_date: 18/09/0021\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'159786'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'31286*'"\naccessory: "'sin accesorios'"\nacquisition_date:\n	1	\N	\N	c74b1702-c595-43d9-9aa7-00652429e403	2020-09-09 06:00:18.398365
18	18	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 18'"\ndescription: "'Remolque 18'"\nmodel: "'*CB6514M30T*'"\nserial_number: "'*3BZBP1423LC009098*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191848'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33173'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	cdf9b1ba-c189-4844-a1d3-76b3e8182723	2020-09-09 06:00:18.412023
19	19	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 19'"\ndescription: "'Remolque 19'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1621LC009095*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191859'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33179'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	f7625071-7c0f-4643-8442-d865db308479	2020-09-09 06:00:18.424043
20	20	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 20'"\ndescription: "'Remolque 20'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1620LC008326*'"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190428'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33200'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	45584821-48c0-4291-b564-d919b65d8921	2020-09-09 06:00:18.436154
21	21	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 21'"\ndescription: "'Remolque 21'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1629LC008325*'"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190427'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33191'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	5e19acf2-4a67-41e4-a003-3298e9d4eb79	2020-09-09 06:00:18.448214
22	22	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 22'"\ndescription: "'Remolque 22'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1627LC008324*'"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190424'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33195'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	e9c738ea-de2f-4eae-ae03-59db918fe80d	2020-09-09 06:00:18.462044
23	23	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 23'"\ndescription: "'Remolque 23'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1625LC008323*'"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190420'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33196'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	eab2d5c6-b6a4-4267-a85d-9449f0346779	2020-09-09 06:00:18.483923
24	24	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 24'"\ndescription: "'Remolque 24'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1621LC009453*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192500'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33215'"\naccessory: "''"\nacquisition_date:\n	1	\N	\N	ad4dded4-add7-441d-843d-40fc859be5db	2020-09-09 06:00:18.494655
149	45	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	72b8ff11-43af-428c-9b3a-8da58ffbc7e9	2020-09-10 20:52:46.711635
150	46	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	041cb965-25df-4774-8f0b-d1aef2ac418d	2020-09-10 20:52:46.720868
151	47	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	d0634bfb-924d-4c42-8281-9f7c4e77fa3c	2020-09-10 20:52:46.729233
25	25	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 25'"\ndescription: "'Remolque 25'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1628LC009451*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192503'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33214'"\naccessory: "''"\nacquisition_date:\n	1	\N	\N	5f84c1f0-58c7-43f5-b2be-1efdc4fd7a44	2020-09-09 06:00:18.5072
26	26	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 26'"\ndescription: "'Remolque 26'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1629LC010768*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195306'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33323'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	631cd76f-97a7-41cb-9db5-d867c86bf62f	2020-09-09 06:00:18.517903
27	27	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 27'"\ndescription: "'Remolque 27'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1627LC010767*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195305'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33325'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	f42c6234-aed6-4fdd-930a-9814e29f8273	2020-09-09 06:00:18.529684
28	28	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 28'"\ndescription: "'Remolque 28'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1625LC010766*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195304'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33334'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	2952712d-efbb-4183-b2d4-0df333128f1e	2020-09-09 06:00:18.541251
29	29	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 29'"\ndescription: "'Remolque 29'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1623LC010765*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195303'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33339'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	45be8654-ab40-49d2-a67c-ed3f59502b8c	2020-09-09 06:00:18.551812
30	30	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 30'"\ndescription: "'Remolque 30'"\nmodel: "'*CB7016MR30T*'"\nserial_number: "'*3BZBP1621LC010764*'"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'195302'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33326'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	3a937c28-2c60-48d3-8024-cee195e5dde0	2020-09-09 06:00:18.562032
31	31	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 31'"\ndescription: "'Remolque 31'"\nmodel: "'*CB7016AR30T*'"\nserial_number: "'*3BZBN162XLC009103*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191854'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33217'"\naccessory: "''"\nacquisition_date:\n	1	\N	\N	7fb6216e-5a5e-4868-8ea1-cebda053de15	2020-09-09 06:00:18.572763
32	32	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 32'"\ndescription: "'Remolque 32'"\nmodel: "'*CB7016AR30T*'"\nserial_number: "'*3BZBN1625LC009106*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191857'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33167'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	2a1ab7f5-453a-4db9-a416-fe87de93b752	2020-09-09 06:00:18.583541
33	33	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 33'"\ndescription: "'Remolque 33'"\nmodel: "'*CB7016AR30T*'"\nserial_number: "'*3BZBN1626LC009096*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191858'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33172'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	a2214c48-08db-4c97-b11c-f62d4de6a284	2020-09-09 06:00:18.593442
34	34	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 34'"\ndescription: "'Remolque 34'"\nmodel: "'*CB7016AR30T*'"\nserial_number: "'*3BZBN1621LC009989*'"\npurchased_date: 20/06/0018\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'193569'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33242'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	622d3522-b379-43af-a863-3fe5ea37ec36	2020-09-09 06:00:18.604959
35	35	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 35'"\ndescription: "'Remolque 35'"\nmodel: "'*CB7016AR30T*'"\nserial_number: "'*3BZBN1629LC009965*'"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'193548'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33239'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	df2cee87-fc7d-444b-ae3d-693c5c928d0f	2020-09-09 06:00:18.614354
36	36	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 36'"\ndescription: "'Remolque 36'"\nmodel: "'*CB7016AR30TRC*'"\nserial_number: "'*3BZBN1629LC008329*'"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190431'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33183'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	b6da7a6e-ed32-49e8-b845-de5f07e0e320	2020-09-09 06:00:18.625615
152	48	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	aed0ed42-e455-4bb9-a67a-193db4f15d71	2020-09-10 20:52:46.736332
153	49	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	34257050-bb4b-40c7-b9c5-197bd62f672b	2020-09-10 20:52:46.745605
154	50	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	688a57d3-e986-4382-9a43-31a5ffd1f7a1	2020-09-10 20:52:46.753685
37	37	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 37'"\ndescription: "'Remolque 37'"\nmodel: "'*CB7016AR30TRC*'"\nserial_number: "'*3BZBN1627LC008328*'"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190430'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33188'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	9cd21ad0-e061-40e6-b671-850f7d070246	2020-09-09 06:00:18.636389
38	38	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 38'"\ndescription: "'Remolque 38'"\nmodel: "'*CB7016AR30TRC*'"\nserial_number: "'*3BZBN1625LC008327*'"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190429'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33185'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	dc2e1333-8f49-4c2d-a014-f03900e29147	2020-09-09 06:00:18.647781
39	39	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 39'"\ndescription: "'Remolque 39'"\nmodel: "'*CB7016AR30TRC*'"\nserial_number: "'*3BZBN1625LC009963*'"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'193545'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33237'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	1bb6e49e-c162-4a5c-b638-3fdb3bb2a0fb	2020-09-09 06:00:18.657979
40	40	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 40'"\ndescription: "'Remolque 40'"\nmodel: "'*CB7020MR60T*'"\nserial_number: "'*3BZBP2028LC009092*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191862'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33169'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	e7a3cec7-fcb9-4e7f-8d90-b3796348ffad	2020-09-09 06:00:18.668279
41	41	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 41'"\ndescription: "'Remolque 41'"\nmodel: "'*RG5010M15TRDR*'"\nserial_number: "'*3BZGP1013LC009461*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192524'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33227'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	9e976317-60c9-4fc1-aa81-132f12a1830c	2020-09-09 06:00:18.679542
42	42	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 42'"\ndescription: "'Remolque 42'"\nmodel: "'*RG5010M30TRDR*'"\nserial_number: "'*3BZGP1020LC009460*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192525'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33226'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	f6cbf2d8-5859-4bd2-88f1-abf024d79f13	2020-09-09 06:00:18.691647
43	43	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 43'"\ndescription: "'Remolque 43'"\nmodel: "'*RG5012M30TRDR*'"\nserial_number: "'*3BZGP1222LC008310*'"\npurchased_date: 20/04/0020\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'190373'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33127'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	4eb9f624-5fd3-43a9-9089-4d152c2e0e6f	2020-09-09 06:00:18.702824
44	44	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 44'"\ndescription: "'Remolque 44'"\nmodel: "'*RG5012M30TRDR*'"\nserial_number: "'*3BZGP1225LC007281*'"\npurchased_date: 20/03/0013\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'188575'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33085'"\naccessory: "'PUERTA RAMPA'"\nacquisition_date:\n	1	\N	\N	b476ad38-14df-49fa-8e06-1c92d99b1619	2020-09-09 06:00:18.713277
45	45	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 45'"\ndescription: "'Remolque 45'"\nmodel: "'*RG5012M30TRDR*'"\nserial_number: "'*3BZGP1226LC007869*'"\npurchased_date: 20/04/0001\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'189616'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33083'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	d2dcbeab-e96f-471e-9339-57ff9033e6da	2020-09-09 06:00:18.729922
46	46	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 46'"\ndescription: "'Remolque 46'"\nmodel: "'*RG5012M30TRDR*'"\nserial_number: "'*3BZGP1227LC002258*'"\npurchased_date: 19/10/0014\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'179621'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33084'"\naccessory: "'SIN ACCESORIOS'"\nacquisition_date:\n	1	\N	\N	5d1b5213-c34c-42a0-aac0-4de5f4f03084	2020-09-09 06:00:18.742859
47	47	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 47'"\ndescription: "'Remolque 47'"\nmodel: "'*RG5012M30TRDR*'"\nserial_number: "'*3BZGP1220LC009102*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191853'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33181'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	5ddd9607-48aa-4e5e-96a4-15e03652c863	2020-09-09 06:00:18.753919
48	48	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 48'"\ndescription: "'Remolque 48'"\nmodel: "'*RG5012M30TRDR*'"\nserial_number: "'*3BZGP1227LC009100*'"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'191851'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33166'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	7bf0550a-c2fc-464e-8db2-86533de18611	2020-09-09 06:00:18.765418
155	51	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	e46202e0-ae40-4705-90b3-4c4678fa305b	2020-09-10 20:52:46.762156
196	21	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	f5623113-26c6-43c2-af42-d97c6ae2d4ee	2020-10-06 19:36:36.827417
197	22	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	953e466d-77ac-4890-8551-ca7d5e70e22d	2020-10-06 19:36:36.83303
49	49	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 49'"\ndescription: "'Remolque 49'"\nmodel: "'*RG5014M30TRDR*'"\nserial_number: "'*3BZGP142XLC009444*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192499'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33213'"\naccessory: "''"\nacquisition_date:\n	1	\N	\N	8ce554b3-f161-4adc-ae19-6c9f93c067e6	2020-09-09 06:00:18.77631
50	50	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 50'"\ndescription: "'Remolque 50'"\nmodel: "'*RG5014M30TRDR*'"\nserial_number: "'*3BZGP1428LC009457*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192530'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33235'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	a2a06145-1c7b-4c1d-a67a-4df26d1654ce	2020-09-09 06:00:18.787069
51	51	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 51'"\ndescription: "'Remolque 51'"\nmodel: "'*RG5014M30TRDR*'"\nserial_number: "'*3BZGP1426LC009456*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192531'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33235'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	ddcecea4-e6cb-4a28-8655-06cc5303aebc	2020-09-09 06:00:18.797236
52	52	Item	\N	\N	\N	\N	\N	create	---\nname: "'Remolque 52'"\ndescription: "'Remolque 52'"\nmodel: "'*RG5016M30TRDR*'"\nserial_number: "'*3BZGP1628LC009455*'"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: "'192532'"\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: "'33248'"\naccessory: "'Sin Accesorios'"\nacquisition_date:\n	1	\N	\N	83abaa58-b307-421c-904b-68f994f76ba1	2020-09-09 06:00:18.808612
53	1	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 2\ndescription: Remolque 2\nmodel: "*CB4007M05T*"\nserial_number: "*3BZBP0714LC010760*"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195301'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33337'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	b521800b-1cc7-4d03-8bea-6d85a7fdf833	2020-09-09 06:28:44.200899
54	2	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 3\ndescription: Remolque 3\nmodel: "*CB4008M08T*"\nserial_number: "*3BZBP0810LC010754*"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195298'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33336'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	a6ac1223-1436-4b9f-aa70-a5b5bc09d353	2020-09-09 06:28:44.2216
55	3	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 4\ndescription: Remolque 4\nmodel: "*CB4008M08T*"\nserial_number: "*3BZBP0819LC010753*"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195299'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33338'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	5555165d-72ec-46e5-850a-7ff038eec1d9	2020-09-09 06:28:44.233404
56	4	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 5\ndescription: Remolque 5\nmodel: "*CB5010A15T*"\nserial_number: "*3BZBN1013LC009962*"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '193531'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33230'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	548d6390-404b-4eda-bbba-1671af2e7902	2020-09-09 06:28:44.24771
57	5	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 6\ndescription: Remolque 6\nmodel: "*CB5010M15T*"\nserial_number: "*3BZBP1015LC008161*"\npurchased_date: 20/04/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190229'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33223'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	fb2fc969-2d66-4910-a15a-6376ab861f7c	2020-09-09 06:28:44.260585
58	6	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 7\ndescription: Remolque 7\nmodel: "*CB5010M15T*"\nserial_number: "*3BZBP1018LC010759*"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195291'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33328'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	7199ac4e-4b1f-4900-b674-5a5b80ecf17f	2020-09-09 06:28:44.272859
59	7	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 8\ndescription: Remolque 8\nmodel: "*CB5010M15T*"\nserial_number: "*3BZBP1016LC010761*"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195290'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33331'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	2d4b0b7a-5bc8-47a6-acf2-1ecbf5dc76a4	2020-09-09 06:28:44.285084
60	8	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 9\ndescription: Remolque 9\nmodel: "*CB6514M15T*"\nserial_number: "*3BZBP1417LC009953*"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '193530'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33244'\naccessory: Puerta Rampa\nacquisition_date:\n	2	\N	\N	12127c15-115e-48b4-9292-d48d3e157245	2020-09-09 06:28:44.295351
61	9	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 10\ndescription: Remolque 10\nmodel: "*CB6514M15T*"\nserial_number: "*3BZBP1413LC010730*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195279'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33343'\naccessory: puerta rampa\nacquisition_date:\n	2	\N	\N	16b0e899-5a4d-4adf-b9cf-a029f4eeee41	2020-09-09 06:28:44.30685
62	10	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 11\ndescription: Remolque 11\nmodel: "*CB6514M15T*"\nserial_number: "*3BZBP1417LC010729*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195278'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33341'\naccessory: puerta rampa\nacquisition_date:\n	2	\N	\N	6ad326b8-199d-4c39-a24e-b3f0232b8351	2020-09-09 06:28:44.323682
63	11	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 12\ndescription: Remolque 12\nmodel: "*CB6514M15T*"\nserial_number: "*3BZBP1415LC010728*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195277'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33342'\naccessory: puerta rampa\nacquisition_date:\n	2	\N	\N	fda4eae0-5a2f-4d5b-8ecc-513abb4ab158	2020-09-09 06:28:44.33512
64	12	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 13\ndescription: Remolque 13\nmodel: "*CB6514M15T*"\nserial_number: "*3BZBP1413LC010727*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195276'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33340'\naccessory: puerta rampa\nacquisition_date:\n	2	\N	\N	aef862e6-9ce6-4592-bb58-35d300d1aa27	2020-09-09 06:28:44.346001
65	13	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 14\ndescription: Remolque 14\nmodel: "*CB5012M30T*"\nserial_number: "*3BZBP1223LC010769*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195307'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33330'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	4f523750-fe35-443c-8fb5-b66d376049ad	2020-09-09 06:28:44.356497
66	14	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 15\ndescription: Remolque 15\nmodel: "*CB5012A30T*"\nserial_number: "*3BZBN1228LC010756*"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195294'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33324'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	0d1942aa-c624-4b5d-a4fa-897f7e324b54	2020-09-09 06:28:44.366568
67	15	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 16\ndescription: Remolque 16\nmodel: "*CB5012A30T*"\nserial_number: "*3BZBN1226LC010755*"\npurchased_date: 20/07/0011\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195297'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33335'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	e2c85353-eb47-4239-952b-472e1b56b1a6	2020-09-09 06:28:44.376843
68	16	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 17\ndescription: Remolque 17\nmodel: "*CB5014M30T*"\nserial_number: "*3BZBP142XKC001482*"\npurchased_date: 18/09/0021\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '159786'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: 31286*\naccessory: sin accesorios\nacquisition_date:\n	2	\N	\N	dfc3eb38-d750-46c6-a8bd-169965a5d3d8	2020-09-09 06:28:44.387137
69	17	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 18\ndescription: Remolque 18\nmodel: "*CB6514M30T*"\nserial_number: "*3BZBP1423LC009098*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191848'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33173'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	eb3872c5-b463-4b08-892b-0fe74fef9676	2020-09-09 06:28:44.398379
70	18	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 19\ndescription: Remolque 19\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1621LC009095*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191859'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33179'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	83f042a0-f611-417c-b239-e9ac67dae375	2020-09-09 06:28:44.40901
71	19	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 20\ndescription: Remolque 20\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1620LC008326*"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190428'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33200'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	1c06b12c-302c-4ad0-817d-292ffdada786	2020-09-09 06:28:44.420819
72	20	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 21\ndescription: Remolque 21\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1629LC008325*"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190427'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33191'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	f9f92427-0bdc-467b-89f3-50ac095e1cf7	2020-09-09 06:28:44.433423
73	21	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 22\ndescription: Remolque 22\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1627LC008324*"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190424'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33195'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	5821fe3d-02b6-4241-8baf-574d8a3dc0b3	2020-09-09 06:28:44.443607
74	22	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 23\ndescription: Remolque 23\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1625LC008323*"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190420'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33196'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	2eb3614c-8589-4a15-8798-c4fbda224850	2020-09-09 06:28:44.453627
75	23	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 24\ndescription: Remolque 24\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1621LC009453*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192500'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33215'\naccessory: ''\nacquisition_date:\n	2	\N	\N	626a835f-aa92-4797-a630-8c005ad5396a	2020-09-09 06:28:44.465869
76	24	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 25\ndescription: Remolque 25\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1628LC009451*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192503'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33214'\naccessory: ''\nacquisition_date:\n	2	\N	\N	6c8fc565-3f62-41e9-8477-e29d6ce724c1	2020-09-09 06:28:44.47632
77	25	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 26\ndescription: Remolque 26\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1629LC010768*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195306'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33323'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	8c957ce0-7eac-4880-87bd-179ef0b3a2c3	2020-09-09 06:28:44.486102
78	26	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 27\ndescription: Remolque 27\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1627LC010767*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195305'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33325'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	370c5838-a30f-4fd4-a4e2-f72033add2ae	2020-09-09 06:28:44.496999
79	27	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 28\ndescription: Remolque 28\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1625LC010766*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195304'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33334'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	8968d865-9288-4a1e-989c-c29d83100bfc	2020-09-09 06:28:44.508123
80	28	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 29\ndescription: Remolque 29\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1623LC010765*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195303'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33339'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	0354e935-0b45-49e9-b38c-47d7368ae8b5	2020-09-09 06:28:44.51883
81	29	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 30\ndescription: Remolque 30\nmodel: "*CB7016MR30T*"\nserial_number: "*3BZBP1621LC010764*"\npurchased_date: 20/07/0010\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '195302'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33326'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	1d73128d-08b3-40e3-a073-6dcecf3a9424	2020-09-09 06:28:44.543348
82	30	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 31\ndescription: Remolque 31\nmodel: "*CB7016AR30T*"\nserial_number: "*3BZBN162XLC009103*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191854'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33217'\naccessory: ''\nacquisition_date:\n	2	\N	\N	40c9104f-63d0-4e19-b908-e4c65b9b6e3d	2020-09-09 06:28:44.558907
83	31	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 32\ndescription: Remolque 32\nmodel: "*CB7016AR30T*"\nserial_number: "*3BZBN1625LC009106*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191857'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33167'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	94402c5d-d3c7-4c5b-8f88-8263cf195c89	2020-09-09 06:28:44.569445
84	32	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 33\ndescription: Remolque 33\nmodel: "*CB7016AR30T*"\nserial_number: "*3BZBN1626LC009096*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191858'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33172'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	6ab2dbb5-611e-44ba-bc9d-c4d2ac5198bb	2020-09-09 06:28:44.581471
85	33	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 34\ndescription: Remolque 34\nmodel: "*CB7016AR30T*"\nserial_number: "*3BZBN1621LC009989*"\npurchased_date: 20/06/0018\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '193569'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33242'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	8b0a3ff1-c8ac-48e2-bae8-0f27014d51e3	2020-09-09 06:28:44.595373
86	34	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 35\ndescription: Remolque 35\nmodel: "*CB7016AR30T*"\nserial_number: "*3BZBN1629LC009965*"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '193548'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33239'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	f94370a5-b8b4-4197-8d55-4c1a3f9d196f	2020-09-09 06:28:44.606393
87	35	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 36\ndescription: Remolque 36\nmodel: "*CB7016AR30TRC*"\nserial_number: "*3BZBN1629LC008329*"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190431'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33183'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	95cb57e1-70d4-42ee-808b-c463c944f175	2020-09-09 06:28:44.616448
195	20	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	5cf1c92a-9fb1-4fb1-b464-ef7422ae9995	2020-10-06 19:36:36.821038
88	36	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 37\ndescription: Remolque 37\nmodel: "*CB7016AR30TRC*"\nserial_number: "*3BZBN1627LC008328*"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190430'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33188'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	3944151c-1d77-4c27-8b2a-4a5e31ff459d	2020-09-09 06:28:44.629191
89	37	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 38\ndescription: Remolque 38\nmodel: "*CB7016AR30TRC*"\nserial_number: "*3BZBN1625LC008327*"\npurchased_date: 20/04/0023\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190429'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33185'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	bdf8b39f-e9da-41d4-906a-3925dcd876b1	2020-09-09 06:28:44.638952
90	38	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 39\ndescription: Remolque 39\nmodel: "*CB7016AR30TRC*"\nserial_number: "*3BZBN1625LC009963*"\npurchased_date: 20/06/0017\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '193545'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33237'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	f89afd08-249d-4338-b6c5-cf41bd0282bb	2020-09-09 06:28:44.649612
91	39	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 40\ndescription: Remolque 40\nmodel: "*CB7020MR60T*"\nserial_number: "*3BZBP2028LC009092*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191862'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33169'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	91642d01-9c5c-4c9b-bfaa-53458b30d7a2	2020-09-09 06:28:44.661362
92	40	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 41\ndescription: Remolque 41\nmodel: "*RG5010M15TRDR*"\nserial_number: "*3BZGP1013LC009461*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192524'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33227'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	b144022b-4dce-4d89-99c1-70565860a54e	2020-09-09 06:28:44.672231
93	41	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 42\ndescription: Remolque 42\nmodel: "*RG5010M30TRDR*"\nserial_number: "*3BZGP1020LC009460*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192525'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33226'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	c3554846-481f-49d7-9ba3-fb51f251c4de	2020-09-09 06:28:44.682593
94	42	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 43\ndescription: Remolque 43\nmodel: "*RG5012M30TRDR*"\nserial_number: "*3BZGP1222LC008310*"\npurchased_date: 20/04/0020\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '190373'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33127'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	e486c4de-1bb2-47e2-a983-b5d923192a00	2020-09-09 06:28:44.693496
95	43	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 44\ndescription: Remolque 44\nmodel: "*RG5012M30TRDR*"\nserial_number: "*3BZGP1225LC007281*"\npurchased_date: 20/03/0013\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '188575'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33085'\naccessory: PUERTA RAMPA\nacquisition_date:\n	2	\N	\N	d89a31a7-67f3-45d2-8989-eb883824846b	2020-09-09 06:28:44.705412
96	44	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 45\ndescription: Remolque 45\nmodel: "*RG5012M30TRDR*"\nserial_number: "*3BZGP1226LC007869*"\npurchased_date: 20/04/0001\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '189616'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33083'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	51d291ea-2dea-4636-ab96-c3bde6351f49	2020-09-09 06:28:44.716936
97	45	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 46\ndescription: Remolque 46\nmodel: "*RG5012M30TRDR*"\nserial_number: "*3BZGP1227LC002258*"\npurchased_date: 19/10/0014\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '179621'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33084'\naccessory: SIN ACCESORIOS\nacquisition_date:\n	2	\N	\N	419cb8d3-64d9-45a6-8932-87d97a27296e	2020-09-09 06:28:44.727926
98	46	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 47\ndescription: Remolque 47\nmodel: "*RG5012M30TRDR*"\nserial_number: "*3BZGP1220LC009102*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191853'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33181'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	c2df5175-3b35-454b-8ad6-2579b0eab5fc	2020-09-09 06:28:44.739303
99	47	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 48\ndescription: Remolque 48\nmodel: "*RG5012M30TRDR*"\nserial_number: "*3BZGP1227LC009100*"\npurchased_date: 20/05/0022\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '191851'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33166'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	b15be1a5-73eb-4139-8c24-bd6e4ef1a6b0	2020-09-09 06:28:44.749719
100	48	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 49\ndescription: Remolque 49\nmodel: "*RG5014M30TRDR*"\nserial_number: "*3BZGP142XLC009444*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192499'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33213'\naccessory: ''\nacquisition_date:\n	2	\N	\N	1d41354a-e329-4937-afe8-42df27208040	2020-09-09 06:28:44.761477
101	49	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 50\ndescription: Remolque 50\nmodel: "*RG5014M30TRDR*"\nserial_number: "*3BZGP1428LC009457*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192530'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33235'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	1c652a1b-c4f0-470d-9f79-9ad21a490b27	2020-09-09 06:28:44.771704
102	50	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 51\ndescription: Remolque 51\nmodel: "*RG5014M30TRDR*"\nserial_number: "*3BZGP1426LC009456*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192531'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33235'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	b204e179-86bb-4f22-96e6-2c5433857159	2020-09-09 06:28:44.785447
103	51	Item	\N	\N	\N	\N	\N	create	---\nname: Remolque 52\ndescription: Remolque 52\nmodel: "*RG5016M30TRDR*"\nserial_number: "*3BZGP1628LC009455*"\npurchased_date: 20/06/0004\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 1\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode: '192532'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission: '33248'\naccessory: Sin Accesorios\nacquisition_date:\n	2	\N	\N	9ee9fef2-eaac-421a-bcfc-4b53b2b0860d	2020-09-09 06:28:44.796165
104	1	Item	\N	\N	1	User	\N	update	---\nprice:\n-\n- !ruby/object:BigDecimal 18:0.0\ncategory_id:\n-\n- 2\nstatus_item_id:\n- 1\n- 2\n	3	\N	::1	1c4a4ba5-735e-4e4f-9298-dcc0fdc6ea32	2020-09-10 03:44:38.124017
105	1	Item	\N	\N	1	User	\N	update	---\nprice:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.505e5\n	4	\N	::1	bfe26136-432c-4fcd-afe8-0f82f0769974	2020-09-10 03:47:18.58873
106	2	Item	\N	\N	1	User	\N	update	---\nprice:\n-\n- !ruby/object:BigDecimal 18:0.0\ncategory_id:\n-\n- 2\nstatus_item_id:\n- 1\n- 2\n	3	\N	::1	09006c4e-87c8-4d05-be63-64d379709640	2020-09-10 03:51:46.390477
107	6	Item	\N	\N	1	User	\N	update	---\nprice:\n-\n- !ruby/object:BigDecimal 18:0.5e5\ncategory_id:\n-\n- 2\nstatus_item_id:\n- 1\n- 2\n	3	\N	::1	3ab9d7a1-0f8d-4caf-bf35-7a8842ea24c3	2020-09-10 03:57:36.625987
108	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	5bc3c4a8-6b66-4b01-9171-761bdedc4673	2020-09-10 20:52:46.24258
109	4	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	b10fbb31-dc6d-47fe-9a2b-2efed5929ab3	2020-09-10 20:52:46.264482
110	5	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	0e1a6796-8acd-4b71-a712-cbd423d81168	2020-09-10 20:52:46.273005
111	7	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	c1227440-1b12-4e18-8e60-af3bc84a6956	2020-09-10 20:52:46.281402
112	8	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	2fb65506-4ccf-4889-a84b-a4d7dd99a4d3	2020-09-10 20:52:46.290434
113	9	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	1d3a1bb3-056b-4a86-a682-37d51a52f341	2020-09-10 20:52:46.29948
114	10	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	15bccde0-749f-480c-8be1-1dc6a5daed80	2020-09-10 20:52:46.308319
115	11	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	a9f90f57-4ae3-433e-be21-492c64ac6be0	2020-09-10 20:52:46.321937
116	12	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	0402f591-a009-4e7a-891f-7f69289483c4	2020-09-10 20:52:46.330126
117	13	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	26eece3f-9922-4964-b0b7-f22fcb7b79d0	2020-09-10 20:52:46.341354
118	14	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	9af11df3-a0f1-4f80-b1f7-95fb953798b5	2020-09-10 20:52:46.351122
119	15	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	218e0c5d-ff18-4a42-a1ab-97b69b150845	2020-09-10 20:52:46.360469
120	16	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	bb9e162f-e83e-4dff-8503-710ff566db21	2020-09-10 20:52:46.369502
121	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	1a849858-f7a4-488d-8771-9d9391c443ee	2020-09-10 20:52:46.377748
122	18	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	4c584d1a-5395-40c0-90ad-3ce1749a1f91	2020-09-10 20:52:46.387147
123	19	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	ee8b48a4-2af5-47ef-9d41-d7cff49bf7e2	2020-09-10 20:52:46.397926
124	20	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	c17228ca-8a47-47e1-97b5-bc5918f2e19b	2020-09-10 20:52:46.409482
125	21	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	b1e491ff-f5c4-4cbe-9791-a4127c046d3f	2020-09-10 20:52:46.419149
126	22	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	689ca894-c642-4441-b1b9-02cd65824af4	2020-09-10 20:52:46.427823
127	23	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	091d0b16-c001-4342-ba4f-d2fb5689d145	2020-09-10 20:52:46.440279
128	24	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	b7e9f408-fc88-46fc-9aa1-01682af3f104	2020-09-10 20:52:46.453465
129	25	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	85c37d3f-18d8-4c6c-b2d1-87ed4dc062e5	2020-09-10 20:52:46.466708
130	26	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	744e3c39-9a2e-4120-83a0-cc0448dee50e	2020-09-10 20:52:46.47849
131	27	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	b5edbdec-8eeb-490d-ad27-fbbf8f6bb5b5	2020-09-10 20:52:46.492464
132	28	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	fdeec793-d849-42dc-a6c5-5dbdd16b8472	2020-09-10 20:52:46.508115
133	29	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	9d6be4f8-ac9a-4310-8bbd-e8c2cd4fbabd	2020-09-10 20:52:46.51973
134	30	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	51f37f62-49f3-46ec-bb73-0f55632dbc5b	2020-09-10 20:52:46.529692
135	31	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	6a0473ca-78e5-436e-a4d1-d37a327a3fae	2020-09-10 20:52:46.546932
136	32	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	ccf66800-d7f4-4c43-81ab-dbb3e76a0938	2020-09-10 20:52:46.560918
137	33	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	1b7d3fa8-b073-4086-98f2-2f0f0c99c0c2	2020-09-10 20:52:46.572272
138	34	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	9472c525-6912-4a63-949b-150716325ec4	2020-09-10 20:52:46.583122
139	35	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	0c76f328-759e-4ff6-bd01-ad6d767b2664	2020-09-10 20:52:46.607268
140	36	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	ddb7b744-227e-4556-add8-490bb1e01e46	2020-09-10 20:52:46.616467
141	37	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	0fea0891-f18f-4a40-94a6-5704e39f6142	2020-09-10 20:52:46.624299
142	38	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	ebc8dd6d-5c29-4f5a-910f-0baf0a7cd689	2020-09-10 20:52:46.631293
143	39	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	52f73a82-27a9-4b42-b2c9-0ed48ecc7e15	2020-09-10 20:52:46.656525
144	40	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	eb9c74be-dc65-4720-971b-f63325de3304	2020-09-10 20:52:46.665001
145	41	Item	\N	\N	\N	\N	\N	update	---\nstatus_item_id:\n- 1\n- 2\n	3	\N	\N	9dd87701-52d6-415a-90bd-69c1b85c55ed	2020-09-10 20:52:46.673424
156	1	Client	\N	\N	1	User	\N	create	---\nname: Test\nlast_name: Test\nmaiden_name: Test\naddress: direccion\npostal_code: '123123'\nemail: test@test.com\nphone_number: '123123212'\ncellphone: '32123123'\ncontact: Oscar\n	1	\N	::1	2a3ae4f4-b359-4303-b131-6dc4b7e827eb	2020-09-10 22:49:50.851835
157	52	Item	\N	\N	1	User	\N	create	---\nname: Remolque Irapuato\ndescription: Remolque Irapuato\nmodel: CB4007M05T\nserial_number: qwe123123454\npurchased_date: 12/06/2020\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.505e5\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id: 4\nprovider_id:\ndepartment_id: 3\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode: '12343'\nmaintenance_date:\nmaintenance_done: true\nbranch_id: 3\ncategory_id: 2\nto_assing:\nsale_price:\nremission: '33337'\naccessory: sin accesorios\nacquisition_date:\ntrailer_id:\n	2	\N	::1	0dc0f09a-b05c-47dd-b108-04f47b6854f9	2020-09-10 23:05:12.287484
158	52	Item	\N	\N	1	User	\N	update	---\nname:\n- Remolque Irapuato\n- Remolque Ira\n	3	\N	::1	0c8fbd9f-9174-4aed-897b-59ca2d8a2ff9	2020-09-10 23:06:44.261385
159	42	Item	\N	\N	1	User	\N	update	---\nprice:\n-\n- !ruby/object:BigDecimal 18:0.0\ncategory_id:\n-\n- 2\n	4	\N	::1	e07b8e25-fe18-42e5-a670-0f59a45fb375	2020-09-10 23:15:57.28241
160	52	Item	\N	\N	1	User	\N	update	---\nname:\n- Remolque Ira\n- Remolque\n	4	\N	::1	66ff9ea0-0b56-4f44-a1ac-ad76f4814299	2020-09-23 21:48:10.277092
161	52	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\npayment_type:\n-\n- 1\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.312312e6\n	5	\N	::1	3a5411d2-7e8e-4360-a397-b277f04b7d8f	2020-09-25 06:23:42.076294
162	52	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nsale_price:\n- !ruby/object:BigDecimal 18:0.312312e6\n- !ruby/object:BigDecimal 18:0.2e4\n	6	\N	::1	e4106e51-1f16-410e-8528-b49fcce0e59e	2020-09-25 06:28:14.754316
163	52	Item	\N	\N	1	User	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.2e4\n- !ruby/object:BigDecimal 18:0.232322e6\n	7	\N	::1	1d6b5ece-8f85-4f48-95a6-e443d24e2796	2020-09-25 06:38:22.727278
164	52	Item	\N	\N	1	User	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.232322e6\n- !ruby/object:BigDecimal 18:0.33222e5\n	8	\N	::1	84da11d3-5432-46b3-8d1c-63dbbd607340	2020-09-25 06:39:48.297698
165	52	Item	\N	\N	1	User	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.33222e5\n- !ruby/object:BigDecimal 18:0.333333e6\n	9	\N	::1	ceed2767-480a-425c-b7ed-0f39d0f0eeda	2020-09-25 06:47:31.228868
166	52	Item	\N	\N	1	User	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.333333e6\n- !ruby/object:BigDecimal 18:0.3122222e7\n	10	\N	::1	a6536fed-7d3f-4c42-b20e-4f44b9376222	2020-09-25 06:48:23.963489
167	52	Item	\N	\N	\N	\N	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.3122222e7\n- !ruby/object:BigDecimal 18:0.1e4\n	11	\N	\N	a1f15aa3-3b27-40f6-abf0-a77ef0136425	2020-09-25 06:52:03.222132
168	52	Item	\N	\N	1	User	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.1e4\n- !ruby/object:BigDecimal 18:0.313131e6\n	12	\N	::1	5911b8db-290b-43bc-9cc6-00a032e3e208	2020-09-25 06:56:58.255162
169	52	Item	\N	\N	1	User	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.313131e6\n- !ruby/object:BigDecimal 18:0.333333e6\n	13	\N	::1	a1ec80a0-787c-4660-acbc-fd49e2346746	2020-09-25 07:23:22.722595
170	1	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	5	\N	\N	29105224-0d69-4c95-bdbe-0cd9db20b4fa	2020-10-02 01:53:05.102606
171	1	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nstatus_item_id:\n- 2\n- 3\npayment_type:\n-\n- 1\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.0\n	6	\N	::1	82eb82ab-644a-4c83-9b5c-3ba590794887	2020-10-03 20:09:55.094102
172	53	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel:\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id:\nuser_id: 6\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done: true\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: sin accesorios\nacquisition_date:\ntrailer_id: 2\npayment_type:\nfiscal_voucher_id:\nclient_id: 1\nadvance_payment:\n	1	\N	::1	cf7ecfae-4e8d-43c9-9d35-5974163cef8e	2020-10-06 16:36:56.580498
173	54	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel:\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 3\nuser_id: 11\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done: true\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: sin accesorios\nacquisition_date:\ntrailer_id: 1\npayment_type:\nfiscal_voucher_id:\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.2e5\n	1	\N	::1	9f97e5a5-dc5b-43b3-b916-cfb131fa2587	2020-10-06 16:53:31.754705
174	3	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nstatus_item_id:\n- 2\n- 3\npayment_type:\n-\n- 1\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.3e5\n	4	\N	::1	8dca6b0d-76a9-4bea-ad03-63e2ed5b5d95	2020-10-06 19:27:46.204296
175	52	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	14	\N	\N	4c3396f4-c787-4a25-a6cb-21d504dbe660	2020-10-06 19:36:36.619675
176	53	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n- 2\n- 1\n	2	\N	\N	edf9382d-c0df-433a-9300-ba4bff86bfd5	2020-10-06 19:36:36.650758
177	3	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	5	\N	\N	fa63c737-58ae-4b7b-8329-cea518ca6f35	2020-10-06 19:36:36.667605
178	2	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	8593c21c-0f57-43bb-a250-3c0e46ab1763	2020-10-06 19:36:36.676736
179	6	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	1518155f-c9d6-49a2-8eed-5d81f581a747	2020-10-06 19:36:36.68425
180	4	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	d6ed58c3-1592-4b2f-a8d6-80b97d846add	2020-10-06 19:36:36.695109
181	5	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	a752b2cc-c05c-42a0-a7cc-e56ee687e62a	2020-10-06 19:36:36.704343
182	7	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	0ea11000-2fea-4ed2-a91e-be19f1099108	2020-10-06 19:36:36.714715
183	8	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	5db84cef-1411-41f1-9b13-afd843f2b688	2020-10-06 19:36:36.723809
184	9	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	cd63e15b-561c-4c37-8933-5c57732a894c	2020-10-06 19:36:36.731442
185	10	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	325e827b-f08a-4c7c-9503-6f6de8842bd0	2020-10-06 19:36:36.75461
186	11	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	0c76afc5-dd21-4557-91d2-f9046db66eef	2020-10-06 19:36:36.762242
187	12	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	dc5715d8-5c30-4a56-8b62-5491f8fd2fbb	2020-10-06 19:36:36.768374
188	13	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	cb9f8731-dd7f-4176-aeb1-ad4654c045ad	2020-10-06 19:36:36.774291
189	14	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	df7803d0-7d24-42e3-9d21-bec0c06aab20	2020-10-06 19:36:36.780644
190	15	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	b63ed19b-a166-4d77-8160-51f651b57a4c	2020-10-06 19:36:36.786145
191	16	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	042e39a1-c14f-419f-9841-6b8f16b9034a	2020-10-06 19:36:36.793184
192	17	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	855e8911-d85b-4c35-b1f9-58a6a5293761	2020-10-06 19:36:36.800187
193	18	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	f7044294-7433-49bd-a129-cc55286236aa	2020-10-06 19:36:36.807
194	19	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	ac4d4dc2-4983-4968-8087-bda499fac30c	2020-10-06 19:36:36.814873
198	23	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	b8971e6d-6ce2-4cdf-af53-58e645723683	2020-10-06 19:36:36.841074
199	24	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	39f559a6-48d0-4268-bc7b-13276c06c469	2020-10-06 19:36:36.850924
200	25	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	c20b82f7-d84e-41ac-aada-1afc67fe2d2c	2020-10-06 19:36:36.85866
201	26	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	184d8d4e-a41c-4f20-b09c-f3b8e981feb7	2020-10-06 19:36:36.866064
202	27	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	b380f187-9ffd-41dc-8936-6c35a5412c8a	2020-10-06 19:36:36.873602
203	28	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	0e937978-0d22-40e7-bf71-b24fff62eafe	2020-10-06 19:36:36.881058
204	29	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	40cafc38-80a6-44eb-8137-951f4dae7389	2020-10-06 19:36:36.887648
205	30	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	4e5b9a96-f74a-47fb-b729-1f4271665551	2020-10-06 19:36:36.893743
206	31	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	2a8544e7-aeff-4b33-a49b-bab42e005fd7	2020-10-06 19:36:36.899219
207	32	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	0a3f00ef-9f55-46e5-bd45-44dba8d3fe52	2020-10-06 19:36:36.905349
208	33	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	050cbe79-eb57-4d42-8b28-62b91465913e	2020-10-06 19:36:36.911525
209	34	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	a62e672b-9327-48a1-94e9-ae45c7d5fbdd	2020-10-06 19:36:36.917592
210	35	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	a39dbfdb-2f77-421b-a278-946b516157ac	2020-10-06 19:36:36.923901
211	36	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	5d7c18f6-9fad-4c80-965e-df6b4cccc942	2020-10-06 19:36:36.930661
212	37	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	ea94187e-d40b-4288-ad6a-ec3bf7834c69	2020-10-06 19:36:36.937127
213	38	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	f2026f0a-8c5b-4b35-9350-cbcfac3e4253	2020-10-06 19:36:36.943018
214	42	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	5	\N	\N	15cbe371-42c5-4855-a6fc-ec1531784425	2020-10-06 19:36:36.948877
215	39	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	b211be11-fd81-46e6-b304-e278b8e24288	2020-10-06 19:36:36.954869
216	40	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	4b40e07f-d08a-4376-9ef3-f3b30fa79a6f	2020-10-06 19:36:36.963824
217	41	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	5dc1004e-2de9-44a0-949a-6943fe3b9e21	2020-10-06 19:36:36.970577
218	43	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	76639f43-fd37-43a1-8838-2e48de3dd974	2020-10-06 19:36:36.97802
219	44	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	8be6e27c-480b-4078-80bd-edb23c26e191	2020-10-06 19:36:36.983813
220	45	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	926aaf32-ee18-49ee-9de6-832a94da34ff	2020-10-06 19:36:36.990235
221	46	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	e4f126f8-de27-424c-810d-d3b86d2b4daf	2020-10-06 19:36:36.998671
222	47	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	03904b36-c1d6-4ed0-a9f5-1fb31e546b99	2020-10-06 19:36:37.006181
223	48	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	f5eca155-b6dd-43fb-9f47-49bff01f0b6f	2020-10-06 19:36:37.013313
224	49	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	4264fc28-268b-4eb2-a230-59e80be1abe8	2020-10-06 19:36:37.021163
225	50	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	89fefd17-cfd3-465c-8138-273276bbbbd0	2020-10-06 19:36:37.031467
226	51	Item	\N	\N	\N	\N	\N	update	---\ntrailer_id:\n-\n- 1\n	4	\N	\N	8d8259eb-eac1-44dd-bd34-ef58045ecc74	2020-10-06 19:36:37.039004
227	3	Item	\N	\N	1	User	\N	update	---\nprice:\n-\n- !ruby/object:BigDecimal 18:0.0\nstatus_item_id:\n- 3\n- 2\n	6	\N	::1	3364fdb2-c892-4e97-abeb-3f3ea29a4a0f	2020-10-06 20:01:46.48711
228	5	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nstatus_item_id:\n- 2\n- 3\npayment_type:\n-\n- 1\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.4e5\n	5	\N	::1	1821ee6a-a8e0-4e20-9662-c818430b37c2	2020-10-06 22:24:11.498314
229	5	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 3\n- 5\npayment_type:\n- 1\n- 2\nsale_price:\n- !ruby/object:BigDecimal 18:0.4e5\n- !ruby/object:BigDecimal 18:0.0\n	6	\N	::1	2bb294ce-0a70-4c70-997c-1d533a1d5d7b	2020-10-06 22:36:10.418183
230	55	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel:\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id: 7\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done: true\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: Varios\nacquisition_date:\ntrailer_id: 2\npayment_type:\nfiscal_voucher_id:\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.1e6\n	1	\N	::1	10ba0453-ae3b-493d-9e9d-d8a6bc29fd16	2020-10-07 00:09:35.463926
231	4	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nstatus_item_id:\n- 2\n- 1\npayment_type:\n-\n- 2\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.49999e5\n	5	\N	::1	9cabbca7-5a63-48b0-a60b-f9dcdc541e67	2020-10-07 00:13:55.459235
232	55	Item	\N	\N	1	User	\N	update	---\ncode:\n-\n- '123421'\nserial_number:\n-\n- r34r34r34r34r\npurchased_date:\n-\n- 24/10/2020\nprice:\n-\n- !ruby/object:BigDecimal 18:0.45555e5\ndepartment_id:\n- 1\n-\nstatus_item_id:\n- 5\n- 2\nbranch_id:\n-\n- 2\nremission:\n-\n- '33338'\n	2	\N	::1	fbe845cd-2be7-4ea1-ab42-0b1f2f7e8abb	2020-10-07 00:22:56.313226
233	55	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	3	\N	\N	627ad237-9302-4724-add5-afc203384305	2020-10-09 21:23:13.664445
234	52	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	15	\N	\N	5145ab04-0921-43c0-965a-6168304395e0	2020-10-09 21:23:13.712256
235	53	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	3	\N	\N	bfba0497-b5b1-44d1-b6d9-488fd584f66e	2020-10-09 21:23:13.7196
236	3	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	7	\N	\N	1f40d9e8-cbcc-443d-b393-803a8baaad9a	2020-10-09 21:23:13.726759
237	1	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	7	\N	\N	292a7243-89e1-4b49-a32f-472095a14a8e	2020-10-09 21:23:13.735765
238	54	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	2	\N	\N	7f9e99e4-58ed-4fc2-aa60-b005ea8ab35a	2020-10-09 21:23:13.744212
239	2	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	a4a2c916-4725-44c2-86bf-e398931fd142	2020-10-09 21:23:13.752206
240	6	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	31211a6e-edc7-4024-8edf-3395c4c882c5	2020-10-09 21:23:13.759444
241	7	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	e86ee995-0f09-4e18-ad40-e0ea87f998ad	2020-10-09 21:23:13.766183
242	8	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	8c05e111-93fe-4688-bfb6-d76385206292	2020-10-09 21:23:13.773368
243	9	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	1cca32e9-52b8-4aef-97a4-97c379308497	2020-10-09 21:23:13.780036
244	10	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	1fc669e2-6239-4d3a-9452-8557a3f978d5	2020-10-09 21:23:13.79273
245	11	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	57f9df66-d0df-4360-8c72-883f39a23698	2020-10-09 21:23:13.802056
246	12	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	1179500a-a1a9-443d-b1e2-fd97c74a4958	2020-10-09 21:23:13.812031
247	13	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	473a6883-ad58-4e72-9c83-813aeb9dd817	2020-10-09 21:23:13.819271
248	14	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	30b842fb-7932-4f97-b509-fbc3e45c8c34	2020-10-09 21:23:13.826004
249	15	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	9ddba2b2-42a1-444d-826b-f29ea5070649	2020-10-09 21:23:13.832951
250	16	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	ea9b5411-64a3-4e0d-9623-4bbe1743a17c	2020-10-09 21:23:13.841968
251	17	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	8190daa0-2549-476d-801a-0394463cf540	2020-10-09 21:23:13.850595
252	18	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	eb957727-77a2-4420-8d14-d4c2664a4a23	2020-10-09 21:23:13.858638
253	19	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	e1bb89aa-a1af-46d5-9a2a-699eed4d7bc5	2020-10-09 21:23:13.865773
254	20	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	6844891f-1ac4-434a-a513-5c453d9e5124	2020-10-09 21:23:13.8732
255	21	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	02cc83b7-dbc9-4b5f-a4e5-84507595ef8c	2020-10-09 21:23:13.880086
256	22	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	84a2ec72-e96d-491c-9da9-fb9487b7a659	2020-10-09 21:23:13.888528
257	23	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	0576a2ce-17a7-446a-af95-b0e14d035343	2020-10-09 21:23:13.896935
258	24	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	787cb031-bb81-4cd3-ba8e-9f0364d29722	2020-10-09 21:23:13.905796
259	25	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	ba727a28-2c0c-42ed-abea-6a5d256cd334	2020-10-09 21:23:13.912826
260	26	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	596364b9-ef24-4099-a5b4-d4b0938cff85	2020-10-09 21:23:13.919732
261	27	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	860a19ed-7a59-41aa-8013-1d42b7146fb4	2020-10-09 21:23:13.92638
262	28	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	9dc15607-f7dc-4958-b6fc-7679ff4fdd10	2020-10-09 21:23:13.937383
263	29	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	d8cfe09c-05a9-409f-a7e4-145c68258e0c	2020-10-09 21:23:13.94774
264	30	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	5cc1890e-03b3-48e3-88aa-dd3de0c6bf4a	2020-10-09 21:23:13.9583
265	31	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	c166211f-b52b-44ed-af26-042a8afd6617	2020-10-09 21:23:13.965838
266	32	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	abd6f39f-5ec8-44ec-84a7-d3986b7b35e8	2020-10-09 21:23:13.981726
267	33	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	6d410c6b-f617-457c-b79e-d6bbf8f393d5	2020-10-09 21:23:13.991299
268	34	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	f0791c4e-b984-4e0a-87da-84b5db088ab3	2020-10-09 21:23:13.998978
269	35	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	b677b931-cedb-4c5c-81f9-8829fda43e9e	2020-10-09 21:23:14.006847
270	36	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	56b1182c-481e-4f90-a2ec-6c2974f627bb	2020-10-09 21:23:14.013771
271	37	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	817e9206-c90b-4cca-aab4-0e0f924d810e	2020-10-09 21:23:14.020889
272	38	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	e3cdc4f5-958b-4c0a-ae77-e9576507ae29	2020-10-09 21:23:14.028351
273	5	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	7	\N	\N	ba06e6d0-10d8-4ece-a02f-92e464d16a1d	2020-10-09 21:23:14.035539
274	4	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	6	\N	\N	12ec4d96-073b-4a03-a894-87d311b29408	2020-10-09 21:23:14.044194
275	42	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	6	\N	\N	832009bb-862e-4a95-85db-c3fa72f5c5b4	2020-10-09 21:23:14.051789
276	39	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	17b56ad1-6192-48fc-bd5b-3c233bd0d199	2020-10-09 21:23:14.059672
277	40	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	b6e42306-f056-44ba-ae4e-d20d4536ccdb	2020-10-09 21:23:14.066362
278	41	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	98514282-ca61-45aa-bd18-fa7e4804cdb1	2020-10-09 21:23:14.073836
279	43	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	06ffc4d7-c8f9-412e-ab8d-65d06aac56e9	2020-10-09 21:23:14.081831
280	44	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	cb6648d0-be07-4a79-970b-1c36f4d9e66c	2020-10-09 21:23:14.095781
281	45	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	1d0c8ecb-7f86-4f7a-9dda-c50c71b260b9	2020-10-09 21:23:14.104746
282	46	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	3fa2961c-809c-4028-b086-e82236c956ce	2020-10-09 21:23:14.117798
283	47	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	4d762ef6-42ef-4621-88fb-0bca214d9f79	2020-10-09 21:23:14.133103
284	48	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	79f10ab9-006a-4dac-af81-cd1fb46d27f8	2020-10-09 21:23:14.14952
285	49	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	b230bb25-651b-425b-b6f9-7060fb95232d	2020-10-09 21:23:14.15903
286	50	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	c74534ad-5995-4b86-9cc6-5c5b96557d18	2020-10-09 21:23:14.166224
287	51	Item	\N	\N	\N	\N	\N	update	---\nstatus_shipping_id:\n-\n- 1\n	5	\N	\N	ec5e408e-6b9a-41f1-a72f-74ddf27e0994	2020-10-09 21:23:14.17267
288	56	Item	\N	\N	\N	\N	\N	create	---\nname:\ndescription:\nmodel:\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id:\nuser_id:\nbrand_id:\nstatus_item_id: 1\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id:\ncategory_id:\nto_assing:\nsale_price: !ruby/object:BigDecimal 18:0.2e5\nremission: '33333'\naccessory: sin accesorios\nacquisition_date:\ntrailer_id: 1\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 1\n	1	\N	::1	7da83837-6e28-4ca6-84b2-e3f03f4e411a	2020-10-10 19:39:46.517646
289	2	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nstatus_item_id:\n- 2\n- 3\npayment_type:\n-\n- 1\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.3e5\n	6	\N	::1	332cfd27-cc5b-438f-aabe-f6f62940d840	2020-10-12 17:24:46.407156
290	2	Item	\N	\N	1	User	\N	update	---\ndescription:\n- Remolque 3\n- Hola beibi\nclient_id:\n-\n- 1\nfiscal_voucher_id:\n-\n- 5\n	7	\N	::1	3804345a-a7e4-4078-86d6-76346b121cbf	2020-10-12 17:39:48.243074
291	2	Item	\N	\N	\N	\N	\N	update	---\ndescription:\n- Hola beibi\n- Hola bbb\nfiscal_voucher_id:\n- 5\n- 7\n	8	\N	::1	77edc6ca-dde4-4441-beac-39cbf13c4310	2020-10-12 22:49:03.572958
292	2	Item	\N	\N	\N	\N	\N	update	---\ndescription:\n- Hola bbb\n- Hola chiquita\nfiscal_voucher_id:\n- 7\n- 13\n	9	\N	::1	e2a9856b-d1da-48a0-91e8-563fc5dae79d	2020-10-12 22:50:21.147035
293	2	Item	\N	\N	1	User	\N	update	---\ndescription:\n- Hola chiquita\n- ''\nsale_price:\n- !ruby/object:BigDecimal 18:0.3e5\n-\n	10	\N	::1	437d6300-02c7-47ba-86e3-c122d5ac7381	2020-10-12 23:21:09.149456
294	2	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 3\n- 1\npayment_type:\n- 1\n- 2\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.3e5\n	11	\N	::1	8e349db6-dfec-4baf-a1b6-b52d833f12fc	2020-10-12 23:27:54.639168
295	3	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npayment_type:\n- 1\n- 2\n	8	\N	::1	e789d902-1b12-4dd2-ba34-52ebe9befe4b	2020-10-12 23:33:05.312343
296	57	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel:\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 3\nuser_id: 11\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: sin accesorios\nacquisition_date:\ntrailer_id: 2\npayment_type:\nfiscal_voucher_id:\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.3e5\nstatus_shipping_id: 1\n	1	\N	::1	62c62839-9871-4c0c-acdd-65ddab2574f7	2020-10-14 01:47:29.910937
297	57	Item	\N	\N	1	User	\N	update	---\ncode:\n-\n- '123421'\nserial_number:\n-\n- asdasd1111\nprice:\n-\n- !ruby/object:BigDecimal 18:0.3e5\nstatus_item_id:\n- 5\n- 2\nstatus_shipping_id:\n- 1\n- 2\nbranch_id:\n-\n- 3\nremission:\n-\n- '33337'\nacquisition_date:\n-\n- 01/10/2020\n	2	\N	::1	96e2ae03-d16c-4b50-8a11-4be35811c6e4	2020-10-14 02:01:36.320471
298	57	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	3	\N	::1	0ef71349-ae4e-4713-b195-25e645b91d76	2020-10-14 02:04:57.810288
299	55	Item	\N	\N	1	User	\N	update	---\nuser_id:\n- 7\n- 1\nstatus_item_id:\n- 2\n- 3\npayment_type:\n-\n- 2\n	4	\N	::1	83d6f984-8773-4075-bfe2-b4694fc612a1	2020-10-14 02:08:39.74897
300	55	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 3\n- 2\nstatus_shipping_id:\n- 1\n- 2\n	5	\N	::1	41f76e0c-7b1a-469e-92ed-e2a52c6fee78	2020-10-14 02:12:48.897035
301	55	Item	\N	\N	1	User	\N	update	---\nstatus_shipping_id:\n- 2\n- 3\n	6	\N	::1	6a5be93c-369f-46bc-8b84-c60492cd2ce4	2020-10-15 20:19:30.807112
303	6	Item	\N	\N	\N	\N	\N	update	---\nuser_id:\n-\n- 1\npayment_type:\n-\n- 3\n	6	\N	::1	cf1f0e84-09dd-4679-8d94-6cd5f5972f6e	2020-10-19 17:36:00.033224
304	52	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 3\n- 1\npayment_type:\n- 1\n- 2\n	16	\N	::1	020d1e1f-619a-4c94-afdf-9940a4270aa2	2020-10-22 01:07:10.955726
305	52	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	17	\N	::1	71728bde-80c3-47fd-8b9c-a2c5c98e41cb	2020-10-22 01:07:19.438155
306	58	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CB1005MRH15T\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.0\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory:\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id:\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\n	1	\N	::1	f1650124-9706-4e5c-89a0-7caff24762af	2020-11-10 00:13:07.197871
307	59	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS1005RHRCM15TFHN2DGBJGRDTL\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.0\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id: 1\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: 1\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: 1\nfender_type_id:\nturn_type_id:\ndivition_type_id: 1\nsuspension_type_id:\nroof_type_id:\n	1	\N	::1	335cae9c-0ee0-4629-95fc-0c81e18039b9	2020-11-12 02:30:36.973651
308	59	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TFHN2DGBJGRDTL\n- CS1005RHRCM15TN2DFA\nbrake_type_id:\n- 1\n-\nfender_type_id:\n-\n- 1\nhydraulic_jack_id:\n- 1\n-\npull_type_id:\n- 1\n-\nreinforcement_type_id:\n- 1\n-\n	2	\N	::1	55e790d9-1bdd-4181-b7c1-830086f42387	2020-11-12 02:49:29.329371
309	59	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TN2DFA\n- CS1005RHRCM15TFHN2DFA\nbrake_type_id:\n-\n- 1\n	3	\N	::1	6e2f038f-4842-48c9-a62c-0667a3fb7fad	2020-11-12 02:53:35.368288
310	59	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TFHN2DFA\n- CS1005RHRCM15TFHN2DFAGBJGRDTLSB\nhydraulic_jack_id:\n-\n- 1\npull_type_id:\n-\n- 1\nreinforcement_type_id:\n-\n- 1\nsuspension_type_id:\n-\n- 1\n	4	\N	::1	6f7bdb23-0dd1-4f93-9005-613ff46e74da	2020-11-12 02:54:10.254713
311	59	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TFHN2DFAGBJGRDTLSB\n- CS1005RHRCM15TFHN2DFAGBJGRDTLSBVTT\nturn_type_id:\n-\n- 1\n	5	\N	::1	6b19f5f6-7dbf-409b-827b-2fabf9101d42	2020-11-12 02:57:56.990287
312	59	Item	\N	\N	1	User	\N	update	---\nroof_type_id:\n-\n- 1\n	6	\N	::1	3cb9d7bb-c804-46f6-9bc4-dee749851b41	2020-11-12 03:00:20.250478
313	59	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TFHN2DFAGBJGRDTLSBVTT\n- CS1005RHRCM15TFH2DFAGBJGRDTLSBVTT\ncolor_id:\n- 1\n-\n	7	\N	::1	bfed2c12-b19d-471e-a35f-8b4ef8e0ce79	2020-11-12 06:12:38.215451
314	59	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TFH2DFAGBJGRDTLSBVTT\n- CS1005RHRCM15TFHN2DFAGBJGRDTLSBVTT\ncolor_id:\n-\n- 1\n	8	\N	::1	7f3ded71-7c69-45fc-bc67-c4b98edc10e6	2020-11-12 06:14:09.797487
315	59	Item	\N	\N	1	User	\N	update	---\ncategories_description:\n-\n- 'TRAILER:  Caja Seca. LARGO:  10 pies. ANCHO:  5 pies. PISO:  Piso de Madera. RAMPA:  Rampa\n  Hidraulica. CAPACIDAD:  1.5 Toneladas. REDILA:  Redila Cerrada. FRENO:  Freno Hidraulico.\n  COLOR:  Negro. DIVISION:  Doble. FENDER:  Fender Antiderrapante. JALON:  Jalon tipo\n  gancho. GATO HIDRAULICO:  De botella. REFUERZO:  Refuerzo Doble. TECHO:  Techo de\n  Lamina. SUSPENSION:  Suspension Ballesta. VOLTEO:  Volteo Tipo Tijera. '\n	9	\N	::1	c3a26bfc-7355-411c-bfd8-496df0955be9	2020-11-12 06:23:32.852606
316	60	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS1005RHM15TFHN2DJGRD\nserial_number: fffwefwefwef\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.0\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id: 1\nfender_type_id:\nturn_type_id:\ndivition_type_id: 1\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER:  Caja Seca. LARGO:  10 pies. ANCHO:  5 pies. PISO:  Piso\n  de Madera. RAMPA:  Rampa Hidraulica. CAPACIDAD:  1.5 Toneladas. FRENO:  Freno Hidraulico.\n  COLOR:  Negro. '\n	1	\N	::1	f4266df0-ae88-4850-8cdc-5f065d02d020	2020-11-12 06:27:31.28205
317	60	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHM15TFHN2DJGRD\n- CS1005RHM15TFHN\ndivition_type_id:\n- 1\n-\npull_type_id:\n- 1\n-\nreinforcement_type_id:\n- 1\n-\n	2	\N	::1	c5a290da-67d8-47ce-bcaf-0fdb2faade5e	2020-11-12 06:30:05.818589
318	60	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHM15TFHN\n- CS1005RHM15TFHNFAGBRD\nfender_type_id:\n-\n- 1\nhydraulic_jack_id:\n-\n- 1\nreinforcement_type_id:\n-\n- 1\n	3	\N	::1	3b485b22-d044-4eca-b5f3-49c66a307f55	2020-11-12 06:31:03.481577
338	3	Item	\N	\N	1	User	\N	update	---\nmodel:\n- "*CB4008M08T*"\n- ''\nprice:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.2e5\nstatus_item_id:\n- 1\n- 2\nstatus_shipping_id:\n- 1\n- 3\ncategories_description:\n-\n- ''\n	9	\N	::1	2754bcdd-a53b-4fd6-b9a1-95cad5afa478	2021-01-06 07:29:22.981795
319	60	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHM15TFHNFAGBRD\n- CS1005RHM15TFHNFAGBJGRD\npull_type_id:\n-\n- 1\ncategories_description:\n- 'TRAILER:  Caja Seca. LARGO:  10 pies. ANCHO:  5 pies. PISO:  Piso de Madera. RAMPA:  Rampa\n  Hidraulica. CAPACIDAD:  1.5 Toneladas. FRENO:  Freno Hidraulico. COLOR:  Negro. '\n- 'TRAILER:  Caja Seca. LARGO:  10 pies. ANCHO:  5 pies. PISO:  Piso de Madera. RAMPA:  Rampa\n  Hidraulica. CAPACIDAD:  1.5 Toneladas. FRENO:  Freno Hidraulico. COLOR:  Negro.\n  FENDER:  Fender Antiderrapante. GATO HIDRAULICO:  De botella. REFUERZO:  Refuerzo\n  Doble. '\n	4	\N	::1	478f2cab-83a5-4103-aea7-7edfa72fa2e5	2020-11-12 06:31:21.420277
320	61	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS1005RHM15TFHNFAGBJGTLSBVTT\nserial_number: GGGGGGSSSS\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.0\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: 1\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id: 1\nturn_type_id: 1\ndivition_type_id:\nsuspension_type_id: 1\nroof_type_id: 1\ncategories_description: 'TRAILER: CS.LARGO: 10.ANCHO: 05.RAMPA: RH.PISO: M.CAPACIDAD:\n  15T.FRENO: FH.COLOR: N.FENDER: FA.GATO HIDRAULICO: GB.JALON: JG.TECHO: TL.SUSPENSION:\n  SB.VOLTEO: VTT.'\n	1	\N	::1	3403429d-4327-44c6-a604-f007eedab4a6	2020-11-12 06:45:24.470259
321	61	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHM15TFHNFAGBJGTLSBVTT\n- CS1005RHRCM15TFHNFAGBJGTLSBVTT\nredila_type_id:\n-\n- 1\ncategories_description:\n- 'TRAILER: CS.LARGO: 10.ANCHO: 05.RAMPA: RH.PISO: M.CAPACIDAD: 15T.FRENO: FH.COLOR:\n  N.FENDER: FA.GATO HIDRAULICO: GB.JALON: JG.TECHO: TL.SUSPENSION: SB.VOLTEO: VTT.'\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.REDILA:\n  Redila Cerrada.PISO: Piso de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR:\n  Negro.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.JALON: Jalon tipo\n  gancho.TECHO: Techo de Lamina.SUSPENSION: Suspension Ballesta.VOLTEO: Volteo Tipo\n  Tijera.'\n	2	\N	::1	13ac7ccf-7d70-4d67-8d3b-ed747550d8e8	2020-11-12 06:46:16.791714
322	62	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS1005RHM15TFHNJGTLSBVTT\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id: 8\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.4e5\nstatus_shipping_id: 1\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id: 1\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id: 1\nroof_type_id: 1\ncategories_description: 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa\n  Hidraulica.PISO: Piso de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR:\n  Negro.JALON: Jalon tipo gancho.TECHO: Techo de Lamina.SUSPENSION: Suspension Ballesta.VOLTEO:\n  Volteo Tipo Tijera.'\n	1	\N	::1	df3ed7c4-a905-4658-b75d-f9cb9f7f72e7	2020-11-12 07:21:13.596447
323	62	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHM15TFHNJGTLSBVTT\n- CS1005RHM15TFHNFAJGTLSBVTT\nuser_id:\n- 8\n-\nfender_type_id:\n-\n- 1\ncategories_description:\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.PISO: Piso\n  de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR: Negro.JALON: Jalon\n  tipo gancho.TECHO: Techo de Lamina.SUSPENSION: Suspension Ballesta.VOLTEO: Volteo\n  Tipo Tijera.'\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.PISO: Piso\n  de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR: Negro.FENDER:\n  Fender Antiderrapante.JALON: Jalon tipo gancho.TECHO: Techo de Lamina.SUSPENSION:\n  Suspension Ballesta.VOLTEO: Volteo Tipo Tijera.'\n	2	\N	::1	d0da0726-c7df-4ef3-8c38-cf61cb448247	2020-11-12 07:23:00.857298
324	62	Item	\N	\N	1	User	\N	update	---\ndepartment_id:\n- 1\n-\nturn_type_id:\n-\n- 1\n	3	\N	::1	5fb737d3-f382-4ed0-897a-3232586472c2	2020-11-12 07:24:14.931039
325	62	Item	\N	\N	1	User	\N	update	---\ndepartment_id:\n-\n- 1\nuser_id:\n-\n- 8\n	4	\N	::1	e8f04a15-6fc2-434f-8705-2e2efbaa6350	2020-11-12 07:25:55.402385
326	62	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHM15TFHNFAJGTLSBVTT\n- CS1005RHM15TFHNFAJGVTT\ncategories_description:\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.PISO: Piso\n  de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR: Negro.FENDER:\n  Fender Antiderrapante.JALON: Jalon tipo gancho.TECHO: Techo de Lamina.SUSPENSION:\n  Suspension Ballesta.VOLTEO: Volteo Tipo Tijera.'\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.PISO: Piso\n  de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR: Negro.FENDER:\n  Fender Antiderrapante.JALON: Jalon tipo gancho.VOLTEO: Volteo Tipo Tijera.'\n	5	\N	::1	fb32a270-4d1c-4611-adc4-5e7c6ab9905b	2020-11-12 07:31:23.691203
327	59	Item	\N	\N	1	User	\N	update	---\nserial_number:\n- ''\n- OKOKOKOK\ncategories_description:\n- 'TRAILER:  Caja Seca. LARGO:  10 pies. ANCHO:  5 pies. PISO:  Piso de Madera. RAMPA:  Rampa\n  Hidraulica. CAPACIDAD:  1.5 Toneladas. REDILA:  Redila Cerrada. FRENO:  Freno Hidraulico.\n  COLOR:  Negro. DIVISION:  Doble. FENDER:  Fender Antiderrapante. JALON:  Jalon tipo\n  gancho. GATO HIDRAULICO:  De botella. REFUERZO:  Refuerzo Doble. TECHO:  Techo de\n  Lamina. SUSPENSION:  Suspension Ballesta. VOLTEO:  Volteo Tipo Tijera. '\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.REDILA:\n  Redila Cerrada.PISO: Piso de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR:\n  Negro.DIVISION: Doble.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.JALON:\n  Jalon tipo gancho.REFUERZO: Refuerzo Doble.TECHO: Techo de Lamina.SUSPENSION: Suspension\n  Ballesta.VOLTEO: Volteo Tipo Tijera.'\n	10	\N	::1	42cd0847-4ce6-450f-a4a8-fde00e94693a	2020-11-12 07:39:26.901886
328	63	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: JD\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.0\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 3\nuser_id:\nbrand_id: 48\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 3\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id:\ntrailer_height_id:\nramp_type_id:\nredila_type_id:\ntrailer_type_id:\nfloor_type_id:\ncapacity_id:\nduck_tail:\ngooseneck:\ntrailer_width_id:\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'MARCA: Jhon Deer.'\n	1	\N	::1	51a54197-ffeb-4356-8b42-52ac4cd434f0	2020-11-13 00:41:04.856987
329	64	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0510MRH15TFHNFAGB\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.0\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id: 1\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id: 1\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER: Caja Seca.ANCHO: 5 pies.LARGO: 10 pies.PISO: Piso\n  de Madera.RAMPA: Rampa Hidraulica.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR:\n  Negro.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.'\n	1	\N	::1	8d39861e-76f2-48ae-9802-036e6bd06b21	2020-11-13 23:14:52.38537
330	61	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TFHNFAGBJGTLSBVTT\n- CB0510M15TRCVTTFHNFAGBJGSB\nramp_type_id:\n- 1\n-\ntrailer_type_id:\n- 2\n- 1\nroof_type_id:\n- 1\n-\ncategories_description:\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.REDILA:\n  Redila Cerrada.PISO: Piso de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR:\n  Negro.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.JALON: Jalon tipo\n  gancho.TECHO: Techo de Lamina.SUSPENSION: Suspension Ballesta.VOLTEO: Volteo Tipo\n  Tijera.'\n- 'TRAILER: Cama Baja.ANCHO: 5 pies.LARGO: 10 pies.PISO: Piso de Madera.CAPACIDAD:\n  1.5 Toneladas.REDILA: Redila Cerrada.VOLTEO: Volteo Tipo Tijera.FRENO: Freno Hidraulico.COLOR:\n  Negro.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.JALON: Jalon tipo\n  gancho.SUSPENSION: Suspension Ballesta.'\n	3	\N	::1	00e79623-3260-49e1-8f63-8c60b6a925f7	2020-11-13 23:21:15.390505
331	2	Client	\N	\N	1	User	\N	create	---\nname: Cliente\nlast_name: 'Apellido '\nmaiden_name: Materno\naddress: 'Agricultura #901'\npostal_code: '31600'\nemail: lientec@test.com\nphone_number: '123222332'\ncellphone: '12312312'\ncontact: Oscar\nrfc: '123'\nsuburb: Cuauhtemoc\nstate_id: 8\ncity_id: 220\n	1	\N	::1	70ef3e9d-32b3-4914-b505-373b943be2ff	2020-11-14 20:41:00.698742
332	65	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: ''\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id:\nuser_id:\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 1\ncolor:\ntrailer_length_id:\ntrailer_height_id:\nramp_type_id:\nredila_type_id:\ntrailer_type_id:\nfloor_type_id:\ncapacity_id:\nduck_tail:\ngooseneck:\ntrailer_width_id:\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: ''\n	1	\N	::1	8dde0701-ece5-482a-a706-bc6948ca69ef	2020-11-18 01:03:12.888539
333	66	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: ''\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id:\nuser_id: 1\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 1\ncolor:\ntrailer_length_id:\ntrailer_height_id:\nramp_type_id:\nredila_type_id:\ntrailer_type_id:\nfloor_type_id:\ncapacity_id:\nduck_tail:\ngooseneck:\ntrailer_width_id:\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: ''\n	1	\N	::1	df57f6dc-a530-4aae-aefc-dce7534b1578	2020-11-24 23:55:59.899513
334	67	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0510MRH15TFHN\nserial_number: '33333333'\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.23e5\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 3\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 3\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ningun accesorio\nacquisition_date: 01/01/2021\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO:\n  Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno\n  Hidraulico. COLOR: Negro. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	466f1b92-2812-4c8a-96a0-281c0de369bd	2021-01-05 18:54:59.144316
335	67	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS0510MRH15TFHN\n- CS051015TFHN\ncategories_description:\n- 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA:\n  Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. '\n- 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. CAPACIDAD: 1.5 Toneladas. FRENO:\n  Freno Hidraulico. COLOR: Negro. '\n	2	\N	::1	1f663695-4ff6-4b5e-85b5-66ab0a513bbe	2021-01-05 22:08:26.204839
336	68	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0510MRH15TFHN\nserial_number: '4414141'\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.3e5\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: sin accesiorios\nacquisition_date: 02/01/2021\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO:\n  Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno\n  Hidraulico. COLOR: Negro. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	e573caca-8cff-4bd4-a794-1dcf1fd874d1	2021-01-06 00:39:34.091107
337	2	Item	\N	\N	1	User	\N	update	---\nmodel:\n- "*CB4008M08T*"\n- ''\nprice:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.25e5\nstatus_item_id:\n- 1\n- 2\nstatus_shipping_id:\n- 1\n- 3\ncategories_description:\n-\n- ''\n	12	\N	::1	423cb8ce-0cff-4543-b01d-afa2457ee503	2021-01-06 07:28:53.286631
370	75	Item	\N	\N	1	User	\N	update	---\nprice:\n- !ruby/object:BigDecimal 18:0.1e4\n-\n	2	\N	::1	71d8a46d-8dff-4c30-a9f5-66dc3f42a9e6	2021-03-24 01:45:05.138844
339	4	Item	\N	\N	1	User	\N	update	---\nmodel:\n- "*CB5010A15T*"\n- ''\nprice:\n-\n- !ruby/object:BigDecimal 18:0.11e5\nstatus_item_id:\n- 1\n- 2\nstatus_shipping_id:\n- 1\n- 3\nacquisition_date:\n-\n- 07/01/2021\ncategories_description:\n-\n- ''\n	7	\N	::1	7fb97ba5-2827-4fd8-ba25-32677a97f476	2021-01-06 07:30:02.88225
340	59	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS1005RHRCM15TFHN2DFAGBJGRDTLSBVTT\n- CS0510MRH15TRCTLVTTFHN2DFAGBJGSB\nprice:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.2e5\nacquisition_date:\n-\n- 07/01/2021\ncategories_description:\n- 'TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.REDILA:\n  Redila Cerrada.PISO: Piso de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR:\n  Negro.DIVISION: Doble.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.JALON:\n  Jalon tipo gancho.REFUERZO: Refuerzo Doble.TECHO: Techo de Lamina.SUSPENSION: Suspension\n  Ballesta.VOLTEO: Volteo Tipo Tijera.'\n- 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA:\n  Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. REDILA: Redila Cerrada. TECHO: Techo\n  de Lamina. VOLTEO: Volteo Tipo Tijera. FRENO: Freno Hidraulico. COLOR: Negro. DIVISION:\n  Doble. FENDER: Fender Antiderrapante. GATO HIDRAULICO: De botella. JALON: Jalon\n  tipo gancho. SUSPENSION: Suspension Ballesta. '\n	11	\N	::1	ed4f261e-c66c-40a0-ad39-6dabb42f3ba3	2021-01-06 07:46:42.751532
341	59	Item	\N	\N	1	User	\N	update	---\naccessory:\n- ''\n- sin accesorios\nacquisition_date:\n- 07/01/2021\n- 01/01/2021\n	12	\N	::1	8df60dc5-3411-44d0-85f3-81c5ed55c378	2021-01-06 07:47:05.947833
342	59	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nstatus_item_id:\n- 2\n- 1\npayment_type:\n-\n- 2\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.2e5\n	13	\N	::1	615e4e9a-0166-4eae-b9f4-b4a7e5143587	2021-01-06 07:47:59.232915
343	59	Item	\N	\N	1	User	\N	update	---\nplanet_percentage:\n-\n- !ruby/object:BigDecimal 18:0.6e2\nbranch_percentage:\n-\n- !ruby/object:BigDecimal 18:0.4e2\n	14	\N	::1	7f011d7f-c5b0-4c83-be86-13bb8b56dcd4	2021-01-06 07:51:41.341345
344	63	Item	\N	\N	1	User	\N	update	---\nmodel:\n- JD\n- CS0510MRHN2DJD\nserial_number:\n- ''\n- OOOOOOff\nprice:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.4e5\nacquisition_date:\n-\n- 01/01/2021\ntrailer_length_id:\n-\n- 1\nramp_type_id:\n-\n- 1\ntrailer_type_id:\n-\n- 2\nfloor_type_id:\n-\n- 1\ncolor_id:\n-\n- 1\ndivition_type_id:\n-\n- 1\ntrailer_width_id:\n-\n- 1\ncategories_description:\n- 'MARCA: Jhon Deer.'\n- 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA:\n  Rampa Hidraulica. COLOR: Negro. DIVISION: Doble. MARCA: Jhon Deer. '\n	2	\N	::1	1204dc70-eb72-4024-bab8-d9c763c7c328	2021-01-06 07:57:36.547559
345	63	Item	\N	\N	1	User	\N	update	---\nuser_id:\n-\n- 1\nstatus_item_id:\n- 2\n- 1\npayment_type:\n-\n- 2\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.7e5\n	3	\N	::1	41997f50-ca69-44d5-970a-3e159f21d39b	2021-01-06 07:59:20.508279
346	63	Item	\N	\N	1	User	\N	update	---\nplanet_percentage:\n-\n- !ruby/object:BigDecimal 18:0.8e2\nbranch_percentage:\n-\n- !ruby/object:BigDecimal 18:0.2e2\n	4	\N	::1	5e004727-a187-4c99-8743-ab0ccd1e3b51	2021-01-06 08:00:21.760991
347	63	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	5	\N	::1	daf92dfd-2f4a-42d2-9ccf-4d815b26e43e	2021-01-06 08:03:46.162974
348	55	Item	\N	\N	1	User	\N	update	---\nmodel:\n-\n- CS0510MRH15TFHN\ndepartment_id:\n-\n- 3\nbranch_id:\n- 2\n- 3\nacquisition_date:\n-\n- 02/01/2021\ntrailer_length_id:\n-\n- 1\nramp_type_id:\n-\n- 1\ntrailer_type_id:\n-\n- 2\nfloor_type_id:\n-\n- 1\ncapacity_id:\n-\n- 1\nbrake_type_id:\n-\n- 1\ncolor_id:\n-\n- 1\ntrailer_width_id:\n-\n- 1\ncategories_description:\n-\n- 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA:\n  Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. '\n	7	\N	::1	8c28bfa5-68c3-41df-a900-4e0daea7049c	2021-01-06 08:04:19.754509
349	55	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.84e5\n	8	\N	::1	7b33bc3e-342e-4aef-ac34-8e843c2ed457	2021-01-06 08:04:49.537415
350	55	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	9	\N	::1	f3c3430f-0f7c-45da-8e8b-620efcaf7818	2021-01-06 08:05:07.019248
351	1	Item	\N	\N	\N	\N	\N	update	---\nsale_price:\n- !ruby/object:BigDecimal 18:0.0\n- !ruby/object:BigDecimal 18:0.95e5\n	8	\N	\N	b5aaa470-8133-4aad-acfd-3117ad033fdb	2021-01-06 08:13:21.611699
354	57	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 3\ndescription:\n-\n- gggg\npurchased_date:\n-\n- 23/02/2021\nuser_id:\n- 11\n- 1\nclient_id:\n- 1\n- 2\nfiscal_voucher_id:\n-\n- 2\npayment_type:\n-\n- 1\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.5555e4\n	4	\N	::1	78ae8fa0-c694-4ad1-acd5-f665478ce8af	2021-02-23 20:40:30.708138
355	16	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 1\npurchased_date:\n- 18/09/0021\n- 03/03/2021\nuser_id:\n-\n- 1\npayment_type:\n-\n- 2\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.79999e5\n	6	\N	::1	45e4af17-beb2-4037-a867-d7b345d82434	2021-03-03 03:13:24.841139
356	16	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 1\n- 4\n	7	\N	::1	a16dab4a-834d-413f-b773-ed2c8d374ea1	2021-03-03 03:15:31.053476
357	69	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0510MRH15TFHN\nserial_number: testy\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.2e5\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id:\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 2\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: testy\nacquisition_date: 04/03/2021\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO:\n  Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno\n  Hidraulico. COLOR: Negro. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	b410366a-f4b1-4358-8ff8-2fc00b8fa162	2021-03-10 19:47:18.39775
361	69	Item	\N	\N	1	User	\N	update	---\ndepartment_id:\n-\n- 4\n	2	\N	::1	58d2a7ac-fb56-4091-b366-a7f8761eadb5	2021-03-10 20:13:21.035774
362	69	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n-\n- 10/03/2021\nuser_id:\n-\n- 1\nadvance_payment:\n-\n- !ruby/object:BigDecimal 18:0.1e4\npayment_type:\n-\n- 4\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.3e4\n	3	\N	::1	946085ce-3e76-48af-ad8b-97da757298d5	2021-03-10 20:16:10.430892
363	70	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0510MRH15TFHN\nserial_number: test\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.1e3\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 4\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 2\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date: 06/03/2021\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO:\n  Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno\n  Hidraulico. COLOR: Negro. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	113e01cd-3375-48c2-a244-ba20ae7a09e0	2021-03-15 21:03:34.755131
364	71	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: ''\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.4e3\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 4\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 2\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id:\ntrailer_height_id:\nramp_type_id:\nredila_type_id:\ntrailer_type_id:\nfloor_type_id:\ncapacity_id:\nduck_tail:\ngooseneck:\ntrailer_width_id:\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: ''\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	2a432cb1-1fa2-4ce6-b081-be5f7669892e	2021-03-15 22:44:33.965556
365	72	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: ''\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.1e4\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 4\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 2\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id:\ntrailer_height_id:\nramp_type_id:\nredila_type_id:\ntrailer_type_id:\nfloor_type_id:\ncapacity_id:\nduck_tail:\ngooseneck:\ntrailer_width_id:\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: ''\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	79319b86-f7af-4c4d-ba46-1a13bc64a90f	2021-03-18 18:56:34.909955
366	72	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n-\n- 18/03/2021\nuser_id:\n-\n- 1\nadvance_payment:\n-\n- !ruby/object:BigDecimal 18:0.7e3\npayment_type:\n-\n- 4\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.15e4\n	2	\N	::1	235f9531-62b2-4998-a464-08e5bdc82bc8	2021-03-18 18:57:31.976784
367	73	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0515TTL\nserial_number: oooo\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.5e1\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 4\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 2\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: mmm\nacquisition_date: 05/03/2021\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id:\ntrailer_height_id:\nramp_type_id:\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id:\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id: 1\ncategories_description: 'TRAILER: Caja Seca. ANCHO: 5 pies. CAPACIDAD: 1.5 Toneladas.\n  TECHO: Techo de Lamina. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	3176d32a-e6cc-43f9-be88-a2765d91601c	2021-03-19 06:50:53.211876
368	74	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: GRHTLFHR\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 4\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 2\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id:\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 3\nfloor_type_id:\ncapacity_id:\nduck_tail:\ngooseneck:\ntrailer_width_id:\ncolor_id: 2\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id: 1\ncategories_description: 'TRAILER: Ganaderos. RAMPA: Rampa Hidraulica. TECHO: Techo\n  de Lamina. FRENO: Freno Hidraulico. COLOR: Rosa. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	10b66639-b416-4aa2-b3a9-de587b509ad4	2021-03-24 01:37:29.696049
369	75	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: ''\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.1e4\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 3\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 3\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: ''\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	769ec770-e706-4edf-a7d1-60271c66bb3c	2021-03-24 01:43:47.962879
371	76	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CB10JD\nserial_number: ''\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.12e2\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id: 48\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id:\nredila_type_id:\ntrailer_type_id: 1\nfloor_type_id:\ncapacity_id:\nduck_tail:\ngooseneck:\ntrailer_width_id:\ncolor_id:\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id:\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER: Cama Baja. LARGO: 10 pies. MARCA: Jhon Deer. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	82340136-2135-4a46-9808-b8ea30778a48	2021-03-24 23:49:13.772873
372	77	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0510MRH15TFHN\nserial_number: 1rrrrrrr\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice: !ruby/object:BigDecimal 18:0.1e4\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 1\nuser_id:\nbrand_id:\nstatus_item_id: 2\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id: 1\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date: 25/02/2021\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id:\nadvance_payment:\nstatus_shipping_id: 3\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id:\ncategories_description: 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO:\n  Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno\n  Hidraulico. COLOR: Negro. '\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	53efb8d1-5c93-4c23-b402-ef38cfb9dee3	2021-03-30 06:51:59.951568
373	77	Item	\N	\N	1	User	\N	update	---\nmodel:\n- CS0510MRH15TFHN\n- CS0510MRH15TFHNFA\nfender_type_id:\n-\n- 1\ncategories_description:\n- 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA:\n  Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. '\n- 'TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA:\n  Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro.\n  FENDER: Fender Antiderrapante. '\n	2	\N	::1	1ebfbac9-26f8-4126-866f-292e3f22bf1d	2021-03-30 06:59:03.157568
374	78	Item	\N	\N	1	User	\N	create	---\nname:\ndescription:\nmodel: CS0510MRH15TTLFHN\nserial_number:\npurchased_date:\nin_service_date:\ntime_unit_service:\ntime_quantity_service:\nprice:\ntime_unit_depreciation:\ntime_quantity_depreciation:\nsub_category_id:\nprovider_id:\ndepartment_id: 3\nuser_id: 12\nbrand_id:\nstatus_item_id: 5\ncode:\nmaintenance_date:\nmaintenance_done:\nbranch_id:\ncategory_id:\nto_assing:\nsale_price:\nremission:\naccessory: ''\nacquisition_date:\ntrailer_id:\npayment_type:\nfiscal_voucher_id:\nclient_id: 1\nadvance_payment: !ruby/object:BigDecimal 18:0.5e5\nstatus_shipping_id: 1\ncolor:\ntrailer_length_id: 1\ntrailer_height_id:\nramp_type_id: 1\nredila_type_id:\ntrailer_type_id: 2\nfloor_type_id: 1\ncapacity_id: 1\nduck_tail:\ngooseneck:\ntrailer_width_id: 1\ncolor_id: 1\nhydraulic_jack_id:\npull_type_id:\nbrake_type_id: 1\nreinforcement_type_id:\nfender_type_id:\nturn_type_id:\ndivition_type_id:\nsuspension_type_id:\nroof_type_id: 1\ncategories_description:\nseller_percentage:\nplanet_percentage:\nbranch_percentage:\n	1	\N	::1	2f530497-6435-4dc0-8886-66c28d63ec22	2021-03-30 07:02:48.031879
375	1	Item	\N	\N	1	User	\N	update	---\nseller_percentage:\n-\n- !ruby/object:BigDecimal 18:0.3e2\nplanet_percentage:\n-\n- !ruby/object:BigDecimal 18:0.5e2\nbranch_percentage:\n-\n- !ruby/object:BigDecimal 18:0.2e2\n	9	\N	::1	857f267f-ab92-455c-86ca-49be421c1d27	2021-03-31 01:00:36.497304
376	58	Item	\N	\N	1	User	\N	update	---\nstatus_item_id:\n- 2\n- 6\npurchased_date:\n-\n- 31/03/2021\nuser_id:\n-\n- 1\nadvance_payment:\n-\n- !ruby/object:BigDecimal 18:0.2e4\npayment_type:\n-\n- 4\nsale_price:\n-\n- !ruby/object:BigDecimal 18:0.1e5\n	2	\N	::1	fd83c521-b476-4598-8c98-f6a36e9553a7	2021-03-31 23:32:23.237313
\.


--
-- Data for Name: brake_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.brake_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Freno Hidraulico	FH	t	2020-11-09 07:50:25.705156	2020-11-09 07:50:25.705156
2	Feno loco	FL	t	2021-03-16 10:04:24.662994	2021-03-16 10:04:24.662994
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.branches (id, name, description, city_id, company_id, manager_id, created_at, updated_at, state_id, code, last_code, fleet_cost) FROM stdin;
1	Remolques Cuauhtemoc	\N	907	1	4	2020-08-13 20:42:46.161328	2021-03-15 21:02:21.226632	17	12312	\N	48.0
3	Irapuato	\N	327	1	9	2020-09-10 22:25:30.926268	2021-03-18 18:54:19.150772	\N	GIII	\N	30.0
2	Chihuahua	\N	199	1	4	2020-09-04 04:40:49.971786	2021-03-24 01:43:10.733334	8	CUAMX1	\N	30.0
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.brands (id, name, description, created_at, updated_at, model_part, status) FROM stdin;
48	Jhon Deer	\N	2020-11-13 00:39:28.341283	2020-11-13 00:39:28.341283	JD	t
\.


--
-- Data for Name: capacities; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.capacities (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	1.5 Toneladas	15T	t	2020-10-26 20:38:56.598285	2020-10-26 20:38:56.598285
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.categories (id, name, description, status, created_at, updated_at, company_id) FROM stdin;
2	Cama Baja	CB	t	2020-08-13 20:53:56.942164	2020-10-21 22:11:19.995795	1
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.cities (id, name, state_id, created_at, updated_at) FROM stdin;
1	Aguascalientes	1	2020-08-13 15:04:05.736956	2020-08-13 15:04:05.736956
2	San Francisco de los Romo	1	2020-08-13 15:04:05.739712	2020-08-13 15:04:05.739712
3	El Llano	1	2020-08-13 15:04:05.741417	2020-08-13 15:04:05.741417
4	Rincón de Romos	1	2020-08-13 15:04:05.743045	2020-08-13 15:04:05.743045
5	Cosío	1	2020-08-13 15:04:05.744702	2020-08-13 15:04:05.744702
6	San José de Gracia	1	2020-08-13 15:04:05.746282	2020-08-13 15:04:05.746282
7	Tepezalá	1	2020-08-13 15:04:05.747838	2020-08-13 15:04:05.747838
8	Pabellón de Arteaga	1	2020-08-13 15:04:05.749231	2020-08-13 15:04:05.749231
9	Asientos	1	2020-08-13 15:04:05.750673	2020-08-13 15:04:05.750673
10	Calvillo	1	2020-08-13 15:04:05.752064	2020-08-13 15:04:05.752064
11	Jesús María	1	2020-08-13 15:04:05.753525	2020-08-13 15:04:05.753525
12	Mexicali	2	2020-08-13 15:04:05.754965	2020-08-13 15:04:05.754965
13	Tecate	2	2020-08-13 15:04:05.756362	2020-08-13 15:04:05.756362
14	Tijuana	2	2020-08-13 15:04:05.757821	2020-08-13 15:04:05.757821
15	Playas de Rosarito	2	2020-08-13 15:04:05.759397	2020-08-13 15:04:05.759397
16	Ensenada	2	2020-08-13 15:04:05.76075	2020-08-13 15:04:05.76075
17	La Paz	3	2020-08-13 15:04:05.762227	2020-08-13 15:04:05.762227
18	Los Cabos	3	2020-08-13 15:04:05.763872	2020-08-13 15:04:05.763872
19	Comondú	3	2020-08-13 15:04:05.765597	2020-08-13 15:04:05.765597
20	Loreto	3	2020-08-13 15:04:05.767296	2020-08-13 15:04:05.767296
21	Mulegé	3	2020-08-13 15:04:05.769106	2020-08-13 15:04:05.769106
22	Campeche	4	2020-08-13 15:04:05.770797	2020-08-13 15:04:05.770797
23	Carmen	4	2020-08-13 15:04:05.772512	2020-08-13 15:04:05.772512
24	Palizada	4	2020-08-13 15:04:05.774168	2020-08-13 15:04:05.774168
25	Candelaria	4	2020-08-13 15:04:05.775865	2020-08-13 15:04:05.775865
26	Escárcega	4	2020-08-13 15:04:05.777427	2020-08-13 15:04:05.777427
27	Champotón	4	2020-08-13 15:04:05.779094	2020-08-13 15:04:05.779094
28	Hopelchén	4	2020-08-13 15:04:05.780525	2020-08-13 15:04:05.780525
29	Calakmul	4	2020-08-13 15:04:05.781925	2020-08-13 15:04:05.781925
30	Tenabo	4	2020-08-13 15:04:05.783352	2020-08-13 15:04:05.783352
31	Hecelchakán	4	2020-08-13 15:04:05.784805	2020-08-13 15:04:05.784805
32	Calkiní	4	2020-08-13 15:04:05.786072	2020-08-13 15:04:05.786072
33	Saltillo	5	2020-08-13 15:04:05.787345	2020-08-13 15:04:05.787345
34	Arteaga	5	2020-08-13 15:04:05.788658	2020-08-13 15:04:05.788658
35	Juárez	5	2020-08-13 15:04:05.790081	2020-08-13 15:04:05.790081
36	Progreso	5	2020-08-13 15:04:05.791507	2020-08-13 15:04:05.791507
37	Escobedo	5	2020-08-13 15:04:05.793109	2020-08-13 15:04:05.793109
38	San Buenaventura	5	2020-08-13 15:04:05.794768	2020-08-13 15:04:05.794768
39	Abasolo	5	2020-08-13 15:04:05.796377	2020-08-13 15:04:05.796377
40	Candela	5	2020-08-13 15:04:05.797835	2020-08-13 15:04:05.797835
41	Frontera	5	2020-08-13 15:04:05.799388	2020-08-13 15:04:05.799388
42	Monclova	5	2020-08-13 15:04:05.800903	2020-08-13 15:04:05.800903
43	Castaños	5	2020-08-13 15:04:05.802351	2020-08-13 15:04:05.802351
44	Ramos Arizpe	5	2020-08-13 15:04:05.803724	2020-08-13 15:04:05.803724
45	General Cepeda	5	2020-08-13 15:04:05.804944	2020-08-13 15:04:05.804944
46	Piedras Negras	5	2020-08-13 15:04:05.806264	2020-08-13 15:04:05.806264
47	Nava	5	2020-08-13 15:04:05.807825	2020-08-13 15:04:05.807825
48	Acuña	5	2020-08-13 15:04:05.809177	2020-08-13 15:04:05.809177
49	Múzquiz	5	2020-08-13 15:04:05.811034	2020-08-13 15:04:05.811034
50	Jiménez	5	2020-08-13 15:04:05.812595	2020-08-13 15:04:05.812595
51	Zaragoza	5	2020-08-13 15:04:05.814094	2020-08-13 15:04:05.814094
52	Morelos	5	2020-08-13 15:04:05.815557	2020-08-13 15:04:05.815557
53	Allende	5	2020-08-13 15:04:05.81693	2020-08-13 15:04:05.81693
54	Villa Unión	5	2020-08-13 15:04:05.818374	2020-08-13 15:04:05.818374
55	Guerrero	5	2020-08-13 15:04:05.819862	2020-08-13 15:04:05.819862
56	Hidalgo	5	2020-08-13 15:04:05.821378	2020-08-13 15:04:05.821378
57	Sabinas	5	2020-08-13 15:04:05.822833	2020-08-13 15:04:05.822833
58	San Juan de Sabinas	5	2020-08-13 15:04:05.824264	2020-08-13 15:04:05.824264
59	Torreón	5	2020-08-13 15:04:05.825516	2020-08-13 15:04:05.825516
60	Matamoros	5	2020-08-13 15:04:05.826858	2020-08-13 15:04:05.826858
61	Viesca	5	2020-08-13 15:04:05.828124	2020-08-13 15:04:05.828124
62	Ocampo	5	2020-08-13 15:04:05.829583	2020-08-13 15:04:05.829583
63	Nadadores	5	2020-08-13 15:04:05.831746	2020-08-13 15:04:05.831746
64	Sierra Mojada	5	2020-08-13 15:04:05.833863	2020-08-13 15:04:05.833863
65	Cuatro Ciénegas	5	2020-08-13 15:04:05.835437	2020-08-13 15:04:05.835437
66	Lamadrid	5	2020-08-13 15:04:05.837057	2020-08-13 15:04:05.837057
67	Sacramento	5	2020-08-13 15:04:05.838868	2020-08-13 15:04:05.838868
68	San Pedro	5	2020-08-13 15:04:05.840618	2020-08-13 15:04:05.840618
69	Francisco I. Madero	5	2020-08-13 15:04:05.84236	2020-08-13 15:04:05.84236
70	Parras	5	2020-08-13 15:04:05.843857	2020-08-13 15:04:05.843857
71	Colima	6	2020-08-13 15:04:05.845346	2020-08-13 15:04:05.845346
72	Tecomán	6	2020-08-13 15:04:05.847203	2020-08-13 15:04:05.847203
73	Manzanillo	6	2020-08-13 15:04:05.848673	2020-08-13 15:04:05.848673
74	Armería	6	2020-08-13 15:04:05.850313	2020-08-13 15:04:05.850313
75	Coquimatlán	6	2020-08-13 15:04:05.851867	2020-08-13 15:04:05.851867
76	Comala	6	2020-08-13 15:04:05.853348	2020-08-13 15:04:05.853348
77	Cuauhtémoc	6	2020-08-13 15:04:05.854778	2020-08-13 15:04:05.854778
78	Ixtlahuacán	6	2020-08-13 15:04:05.856316	2020-08-13 15:04:05.856316
79	Minatitlán	6	2020-08-13 15:04:05.857702	2020-08-13 15:04:05.857702
80	Villa de Álvarez	6	2020-08-13 15:04:05.859035	2020-08-13 15:04:05.859035
81	Tuxtla Gutiérrez	7	2020-08-13 15:04:05.86058	2020-08-13 15:04:05.86058
82	San Fernando	7	2020-08-13 15:04:05.862118	2020-08-13 15:04:05.862118
83	Berriozábal	7	2020-08-13 15:04:05.863504	2020-08-13 15:04:05.863504
84	Ocozocoautla de Espinosa	7	2020-08-13 15:04:05.865143	2020-08-13 15:04:05.865143
85	Suchiapa	7	2020-08-13 15:04:05.86669	2020-08-13 15:04:05.86669
86	Chiapa de Corzo	7	2020-08-13 15:04:05.868044	2020-08-13 15:04:05.868044
87	Osumacinta	7	2020-08-13 15:04:05.869384	2020-08-13 15:04:05.869384
88	San Cristóbal de las Casas	7	2020-08-13 15:04:05.870838	2020-08-13 15:04:05.870838
89	Chamula	7	2020-08-13 15:04:05.872491	2020-08-13 15:04:05.872491
90	Ixtapa	7	2020-08-13 15:04:05.874133	2020-08-13 15:04:05.874133
91	Zinacantán	7	2020-08-13 15:04:05.875855	2020-08-13 15:04:05.875855
92	Acala	7	2020-08-13 15:04:05.877467	2020-08-13 15:04:05.877467
93	Chiapilla	7	2020-08-13 15:04:05.878973	2020-08-13 15:04:05.878973
94	San Lucas	7	2020-08-13 15:04:05.88042	2020-08-13 15:04:05.88042
95	Teopisca	7	2020-08-13 15:04:05.882039	2020-08-13 15:04:05.882039
96	Amatenango del Valle	7	2020-08-13 15:04:05.883521	2020-08-13 15:04:05.883521
97	Chanal	7	2020-08-13 15:04:05.88512	2020-08-13 15:04:05.88512
98	Oxchuc	7	2020-08-13 15:04:05.886556	2020-08-13 15:04:05.886556
99	Huixtán	7	2020-08-13 15:04:05.888189	2020-08-13 15:04:05.888189
100	Tenejapa	7	2020-08-13 15:04:05.889808	2020-08-13 15:04:05.889808
101	Mitontic	7	2020-08-13 15:04:05.891478	2020-08-13 15:04:05.891478
102	Reforma	7	2020-08-13 15:04:05.892982	2020-08-13 15:04:05.892982
103	Juárez	7	2020-08-13 15:04:05.894525	2020-08-13 15:04:05.894525
104	Pichucalco	7	2020-08-13 15:04:05.896242	2020-08-13 15:04:05.896242
105	Sunuapa	7	2020-08-13 15:04:05.898097	2020-08-13 15:04:05.898097
106	Ostuacán	7	2020-08-13 15:04:05.899594	2020-08-13 15:04:05.899594
107	Francisco León	7	2020-08-13 15:04:05.901081	2020-08-13 15:04:05.901081
108	Ixtacomitán	7	2020-08-13 15:04:05.902401	2020-08-13 15:04:05.902401
109	Solosuchiapa	7	2020-08-13 15:04:05.903881	2020-08-13 15:04:05.903881
110	Ixtapangajoya	7	2020-08-13 15:04:05.905587	2020-08-13 15:04:05.905587
111	Tecpatán	7	2020-08-13 15:04:05.907066	2020-08-13 15:04:05.907066
112	Copainalá	7	2020-08-13 15:04:05.908424	2020-08-13 15:04:05.908424
113	Chicoasén	7	2020-08-13 15:04:05.910103	2020-08-13 15:04:05.910103
114	Coapilla	7	2020-08-13 15:04:05.911672	2020-08-13 15:04:05.911672
115	Pantepec	7	2020-08-13 15:04:05.913284	2020-08-13 15:04:05.913284
116	Tapalapa	7	2020-08-13 15:04:05.914791	2020-08-13 15:04:05.914791
117	Ocotepec	7	2020-08-13 15:04:05.916268	2020-08-13 15:04:05.916268
118	Chapultenango	7	2020-08-13 15:04:05.917802	2020-08-13 15:04:05.917802
119	Amatán	7	2020-08-13 15:04:05.919389	2020-08-13 15:04:05.919389
120	Huitiupán	7	2020-08-13 15:04:05.920655	2020-08-13 15:04:05.920655
121	Ixhuatán	7	2020-08-13 15:04:05.922032	2020-08-13 15:04:05.922032
122	Tapilula	7	2020-08-13 15:04:05.923451	2020-08-13 15:04:05.923451
123	Rayón	7	2020-08-13 15:04:05.925729	2020-08-13 15:04:05.925729
124	Pueblo Nuevo Solistahuacán	7	2020-08-13 15:04:05.927282	2020-08-13 15:04:05.927282
125	Jitotol	7	2020-08-13 15:04:05.928931	2020-08-13 15:04:05.928931
126	Bochil	7	2020-08-13 15:04:05.93052	2020-08-13 15:04:05.93052
127	Soyaló	7	2020-08-13 15:04:05.932053	2020-08-13 15:04:05.932053
128	San Juan Cancuc	7	2020-08-13 15:04:05.93375	2020-08-13 15:04:05.93375
129	Sabanilla	7	2020-08-13 15:04:05.935475	2020-08-13 15:04:05.935475
130	Simojovel	7	2020-08-13 15:04:05.937147	2020-08-13 15:04:05.937147
131	San Andrés Duraznal	7	2020-08-13 15:04:05.939011	2020-08-13 15:04:05.939011
132	El Bosque	7	2020-08-13 15:04:05.94065	2020-08-13 15:04:05.94065
133	Chalchihuitán	7	2020-08-13 15:04:05.942454	2020-08-13 15:04:05.942454
134	Larráinzar	7	2020-08-13 15:04:05.944075	2020-08-13 15:04:05.944075
135	Santiago el Pinar	7	2020-08-13 15:04:05.945596	2020-08-13 15:04:05.945596
136	Chenalhó	7	2020-08-13 15:04:05.94718	2020-08-13 15:04:05.94718
137	Aldama	7	2020-08-13 15:04:05.948767	2020-08-13 15:04:05.948767
138	Pantelhó	7	2020-08-13 15:04:05.950252	2020-08-13 15:04:05.950252
139	Sitalá	7	2020-08-13 15:04:05.951742	2020-08-13 15:04:05.951742
140	Salto de Agua	7	2020-08-13 15:04:05.953218	2020-08-13 15:04:05.953218
141	Tila	7	2020-08-13 15:04:05.954755	2020-08-13 15:04:05.954755
142	Tumbalá	7	2020-08-13 15:04:05.956281	2020-08-13 15:04:05.956281
143	Yajalón	7	2020-08-13 15:04:05.957925	2020-08-13 15:04:05.957925
144	Ocosingo	7	2020-08-13 15:04:05.959625	2020-08-13 15:04:05.959625
145	Chilón	7	2020-08-13 15:04:05.961284	2020-08-13 15:04:05.961284
146	Benemérito de las Américas	7	2020-08-13 15:04:05.962963	2020-08-13 15:04:05.962963
147	Marqués de Comillas	7	2020-08-13 15:04:05.964534	2020-08-13 15:04:05.964534
148	Palenque	7	2020-08-13 15:04:05.966271	2020-08-13 15:04:05.966271
149	La Libertad	7	2020-08-13 15:04:05.967917	2020-08-13 15:04:05.967917
150	Catazajá	7	2020-08-13 15:04:05.969626	2020-08-13 15:04:05.969626
151	Comitán de Domínguez	7	2020-08-13 15:04:05.971036	2020-08-13 15:04:05.971036
152	Tzimol	7	2020-08-13 15:04:05.972649	2020-08-13 15:04:05.972649
153	Chicomuselo	7	2020-08-13 15:04:05.974125	2020-08-13 15:04:05.974125
154	Bella Vista	7	2020-08-13 15:04:05.975656	2020-08-13 15:04:05.975656
155	Frontera Comalapa	7	2020-08-13 15:04:05.977014	2020-08-13 15:04:05.977014
156	La Trinitaria	7	2020-08-13 15:04:05.978362	2020-08-13 15:04:05.978362
157	La Independencia	7	2020-08-13 15:04:05.979679	2020-08-13 15:04:05.979679
158	Maravilla Tenejapa	7	2020-08-13 15:04:05.981222	2020-08-13 15:04:05.981222
159	Las Margaritas	7	2020-08-13 15:04:05.982609	2020-08-13 15:04:05.982609
160	Altamirano	7	2020-08-13 15:04:05.984316	2020-08-13 15:04:05.984316
161	Venustiano Carranza	7	2020-08-13 15:04:05.985916	2020-08-13 15:04:05.985916
162	Totolapa	7	2020-08-13 15:04:05.987724	2020-08-13 15:04:05.987724
163	Nicolás Ruíz	7	2020-08-13 15:04:05.989484	2020-08-13 15:04:05.989484
164	Las Rosas	7	2020-08-13 15:04:05.991116	2020-08-13 15:04:05.991116
165	La Concordia	7	2020-08-13 15:04:05.992894	2020-08-13 15:04:05.992894
166	Angel Albino Corzo	7	2020-08-13 15:04:05.994488	2020-08-13 15:04:05.994488
167	Montecristo de Guerrero	7	2020-08-13 15:04:05.996204	2020-08-13 15:04:05.996204
168	Socoltenango	7	2020-08-13 15:04:05.998228	2020-08-13 15:04:05.998228
169	Cintalapa	7	2020-08-13 15:04:05.999835	2020-08-13 15:04:05.999835
170	Jiquipilas	7	2020-08-13 15:04:06.001383	2020-08-13 15:04:06.001383
171	Arriaga	7	2020-08-13 15:04:06.002868	2020-08-13 15:04:06.002868
172	Villaflores	7	2020-08-13 15:04:06.004548	2020-08-13 15:04:06.004548
173	Tonalá	7	2020-08-13 15:04:06.005967	2020-08-13 15:04:06.005967
174	Villa Corzo	7	2020-08-13 15:04:06.007337	2020-08-13 15:04:06.007337
175	Pijijiapan	7	2020-08-13 15:04:06.008639	2020-08-13 15:04:06.008639
176	Mapastepec	7	2020-08-13 15:04:06.009992	2020-08-13 15:04:06.009992
177	Acapetahua	7	2020-08-13 15:04:06.011451	2020-08-13 15:04:06.011451
178	Acacoyagua	7	2020-08-13 15:04:06.012999	2020-08-13 15:04:06.012999
179	Escuintla	7	2020-08-13 15:04:06.014364	2020-08-13 15:04:06.014364
180	Villa Comaltitlán	7	2020-08-13 15:04:06.015713	2020-08-13 15:04:06.015713
181	Huixtla	7	2020-08-13 15:04:06.017123	2020-08-13 15:04:06.017123
182	Mazatán	7	2020-08-13 15:04:06.01875	2020-08-13 15:04:06.01875
183	Huehuetán	7	2020-08-13 15:04:06.020413	2020-08-13 15:04:06.020413
184	Tuzantán	7	2020-08-13 15:04:06.021939	2020-08-13 15:04:06.021939
185	Tapachula	7	2020-08-13 15:04:06.023299	2020-08-13 15:04:06.023299
186	Suchiate	7	2020-08-13 15:04:06.024587	2020-08-13 15:04:06.024587
187	Frontera Hidalgo	7	2020-08-13 15:04:06.025923	2020-08-13 15:04:06.025923
188	Metapa	7	2020-08-13 15:04:06.027335	2020-08-13 15:04:06.027335
189	Tuxtla Chico	7	2020-08-13 15:04:06.029041	2020-08-13 15:04:06.029041
190	Unión Juárez	7	2020-08-13 15:04:06.030461	2020-08-13 15:04:06.030461
191	Cacahoatán	7	2020-08-13 15:04:06.032627	2020-08-13 15:04:06.032627
192	Motozintla	7	2020-08-13 15:04:06.034573	2020-08-13 15:04:06.034573
193	Mazapa de Madero	7	2020-08-13 15:04:06.036163	2020-08-13 15:04:06.036163
194	Amatenango de la Frontera	7	2020-08-13 15:04:06.037609	2020-08-13 15:04:06.037609
195	Bejucal de Ocampo	7	2020-08-13 15:04:06.039225	2020-08-13 15:04:06.039225
196	La Grandeza	7	2020-08-13 15:04:06.040617	2020-08-13 15:04:06.040617
197	El Porvenir	7	2020-08-13 15:04:06.04199	2020-08-13 15:04:06.04199
198	Siltepec	7	2020-08-13 15:04:06.043454	2020-08-13 15:04:06.043454
199	Chihuahua	8	2020-08-13 15:04:06.04515	2020-08-13 15:04:06.04515
200	Cuauhtémoc	8	2020-08-13 15:04:06.046875	2020-08-13 15:04:06.046875
201	Riva Palacio	8	2020-08-13 15:04:06.048513	2020-08-13 15:04:06.048513
202	Aquiles Serdán	8	2020-08-13 15:04:06.0501	2020-08-13 15:04:06.0501
203	Bachíniva	8	2020-08-13 15:04:06.051732	2020-08-13 15:04:06.051732
204	Guerrero	8	2020-08-13 15:04:06.053337	2020-08-13 15:04:06.053337
205	Nuevo Casas Grandes	8	2020-08-13 15:04:06.055136	2020-08-13 15:04:06.055136
206	Ascensión	8	2020-08-13 15:04:06.05697	2020-08-13 15:04:06.05697
207	Janos	8	2020-08-13 15:04:06.058585	2020-08-13 15:04:06.058585
208	Casas Grandes	8	2020-08-13 15:04:06.060306	2020-08-13 15:04:06.060306
209	Galeana	8	2020-08-13 15:04:06.061972	2020-08-13 15:04:06.061972
210	Buenaventura	8	2020-08-13 15:04:06.063573	2020-08-13 15:04:06.063573
211	Gómez Farías	8	2020-08-13 15:04:06.065066	2020-08-13 15:04:06.065066
212	Ignacio Zaragoza	8	2020-08-13 15:04:06.066523	2020-08-13 15:04:06.066523
213	Madera	8	2020-08-13 15:04:06.067978	2020-08-13 15:04:06.067978
214	Namiquipa	8	2020-08-13 15:04:06.069325	2020-08-13 15:04:06.069325
215	Temósachic	8	2020-08-13 15:04:06.070734	2020-08-13 15:04:06.070734
216	Matachí	8	2020-08-13 15:04:06.072122	2020-08-13 15:04:06.072122
217	Juárez	8	2020-08-13 15:04:06.073582	2020-08-13 15:04:06.073582
218	Guadalupe	8	2020-08-13 15:04:06.074912	2020-08-13 15:04:06.074912
219	Praxedis G. Guerrero	8	2020-08-13 15:04:06.076374	2020-08-13 15:04:06.076374
220	Ahumada	8	2020-08-13 15:04:06.077648	2020-08-13 15:04:06.077648
221	Coyame del Sotol	8	2020-08-13 15:04:06.079113	2020-08-13 15:04:06.079113
222	Ojinaga	8	2020-08-13 15:04:06.080376	2020-08-13 15:04:06.080376
223	Aldama	8	2020-08-13 15:04:06.081757	2020-08-13 15:04:06.081757
224	Julimes	8	2020-08-13 15:04:06.083067	2020-08-13 15:04:06.083067
225	Manuel Benavides	8	2020-08-13 15:04:06.084391	2020-08-13 15:04:06.084391
226	Delicias	8	2020-08-13 15:04:06.085788	2020-08-13 15:04:06.085788
227	Rosales	8	2020-08-13 15:04:06.087134	2020-08-13 15:04:06.087134
228	Meoqui	8	2020-08-13 15:04:06.088494	2020-08-13 15:04:06.088494
229	Dr. Belisario Domínguez	8	2020-08-13 15:04:06.089882	2020-08-13 15:04:06.089882
230	Satevó	8	2020-08-13 15:04:06.091246	2020-08-13 15:04:06.091246
231	San Francisco de Borja	8	2020-08-13 15:04:06.092578	2020-08-13 15:04:06.092578
232	Nonoava	8	2020-08-13 15:04:06.093918	2020-08-13 15:04:06.093918
233	Guachochi	8	2020-08-13 15:04:06.09519	2020-08-13 15:04:06.09519
234	Bocoyna	8	2020-08-13 15:04:06.096643	2020-08-13 15:04:06.096643
235	Cusihuiriachi	8	2020-08-13 15:04:06.097981	2020-08-13 15:04:06.097981
236	Gran Morelos	8	2020-08-13 15:04:06.099433	2020-08-13 15:04:06.099433
237	Santa Isabel	8	2020-08-13 15:04:06.10079	2020-08-13 15:04:06.10079
238	Carichí	8	2020-08-13 15:04:06.102297	2020-08-13 15:04:06.102297
239	Uruachi	8	2020-08-13 15:04:06.103758	2020-08-13 15:04:06.103758
240	Ocampo	8	2020-08-13 15:04:06.105124	2020-08-13 15:04:06.105124
241	Moris	8	2020-08-13 15:04:06.107384	2020-08-13 15:04:06.107384
242	Chínipas	8	2020-08-13 15:04:06.109147	2020-08-13 15:04:06.109147
243	Maguarichi	8	2020-08-13 15:04:06.110928	2020-08-13 15:04:06.110928
244	Guazapares	8	2020-08-13 15:04:06.112657	2020-08-13 15:04:06.112657
245	Batopilas	8	2020-08-13 15:04:06.114232	2020-08-13 15:04:06.114232
246	Urique	8	2020-08-13 15:04:06.115854	2020-08-13 15:04:06.115854
247	Morelos	8	2020-08-13 15:04:06.117347	2020-08-13 15:04:06.117347
248	Guadalupe y Calvo	8	2020-08-13 15:04:06.118825	2020-08-13 15:04:06.118825
249	San Francisco del Oro	8	2020-08-13 15:04:06.120153	2020-08-13 15:04:06.120153
250	Rosario	8	2020-08-13 15:04:06.121666	2020-08-13 15:04:06.121666
251	Huejotitán	8	2020-08-13 15:04:06.122991	2020-08-13 15:04:06.122991
252	El Tule	8	2020-08-13 15:04:06.125879	2020-08-13 15:04:06.125879
253	Balleza	8	2020-08-13 15:04:06.1276	2020-08-13 15:04:06.1276
254	Santa Bárbara	8	2020-08-13 15:04:06.129162	2020-08-13 15:04:06.129162
255	Camargo	8	2020-08-13 15:04:06.130598	2020-08-13 15:04:06.130598
256	Saucillo	8	2020-08-13 15:04:06.131931	2020-08-13 15:04:06.131931
257	Valle de Zaragoza	8	2020-08-13 15:04:06.133236	2020-08-13 15:04:06.133236
258	La Cruz	8	2020-08-13 15:04:06.134509	2020-08-13 15:04:06.134509
259	San Francisco de Conchos	8	2020-08-13 15:04:06.13581	2020-08-13 15:04:06.13581
260	Hidalgo del Parral	8	2020-08-13 15:04:06.137255	2020-08-13 15:04:06.137255
261	Allende	8	2020-08-13 15:04:06.138758	2020-08-13 15:04:06.138758
262	López	8	2020-08-13 15:04:06.140516	2020-08-13 15:04:06.140516
263	Matamoros	8	2020-08-13 15:04:06.142143	2020-08-13 15:04:06.142143
264	Jiménez	8	2020-08-13 15:04:06.143731	2020-08-13 15:04:06.143731
265	Coronado	8	2020-08-13 15:04:06.145297	2020-08-13 15:04:06.145297
266	Álvaro Obregón	9	2020-08-13 15:04:06.146854	2020-08-13 15:04:06.146854
267	Azcapotzalco	9	2020-08-13 15:04:06.148253	2020-08-13 15:04:06.148253
268	Benito Juárez	9	2020-08-13 15:04:06.149843	2020-08-13 15:04:06.149843
269	Coyoacán	9	2020-08-13 15:04:06.152246	2020-08-13 15:04:06.152246
270	Cuajimalpa de Morelos	9	2020-08-13 15:04:06.15452	2020-08-13 15:04:06.15452
271	Cuauhtémoc	9	2020-08-13 15:04:06.156527	2020-08-13 15:04:06.156527
272	Gustavo A. Madero	9	2020-08-13 15:04:06.158412	2020-08-13 15:04:06.158412
273	Iztacalco	9	2020-08-13 15:04:06.160267	2020-08-13 15:04:06.160267
274	Iztapalapa	9	2020-08-13 15:04:06.161968	2020-08-13 15:04:06.161968
275	La Magdalena Contreras	9	2020-08-13 15:04:06.163853	2020-08-13 15:04:06.163853
276	Miguel Hidalgo	9	2020-08-13 15:04:06.165684	2020-08-13 15:04:06.165684
277	Milpa Alta	9	2020-08-13 15:04:06.167442	2020-08-13 15:04:06.167442
278	Tláhuac	9	2020-08-13 15:04:06.169305	2020-08-13 15:04:06.169305
279	Tlalpan	9	2020-08-13 15:04:06.171149	2020-08-13 15:04:06.171149
280	Venustiano Carranza	9	2020-08-13 15:04:06.17326	2020-08-13 15:04:06.17326
281	Xochimilco	9	2020-08-13 15:04:06.175754	2020-08-13 15:04:06.175754
282	Durango	10	2020-08-13 15:04:06.177899	2020-08-13 15:04:06.177899
283	Canatlán	10	2020-08-13 15:04:06.179721	2020-08-13 15:04:06.179721
284	Nuevo Ideal	10	2020-08-13 15:04:06.18152	2020-08-13 15:04:06.18152
285	Coneto de Comonfort	10	2020-08-13 15:04:06.183302	2020-08-13 15:04:06.183302
286	San Juan del Río	10	2020-08-13 15:04:06.185048	2020-08-13 15:04:06.185048
287	Canelas	10	2020-08-13 15:04:06.186667	2020-08-13 15:04:06.186667
288	Topia	10	2020-08-13 15:04:06.188296	2020-08-13 15:04:06.188296
289	Tamazula	10	2020-08-13 15:04:06.18976	2020-08-13 15:04:06.18976
290	Santiago Papasquiaro	10	2020-08-13 15:04:06.191281	2020-08-13 15:04:06.191281
291	Otáez	10	2020-08-13 15:04:06.192676	2020-08-13 15:04:06.192676
292	San Dimas	10	2020-08-13 15:04:06.194079	2020-08-13 15:04:06.194079
293	Guadalupe Victoria	10	2020-08-13 15:04:06.195479	2020-08-13 15:04:06.195479
294	Peñón Blanco	10	2020-08-13 15:04:06.196805	2020-08-13 15:04:06.196805
295	Pánuco de Coronado	10	2020-08-13 15:04:06.198178	2020-08-13 15:04:06.198178
296	Poanas	10	2020-08-13 15:04:06.199557	2020-08-13 15:04:06.199557
297	Nombre de Dios	10	2020-08-13 15:04:06.201013	2020-08-13 15:04:06.201013
298	Vicente Guerrero	10	2020-08-13 15:04:06.202359	2020-08-13 15:04:06.202359
299	Súchil	10	2020-08-13 15:04:06.203956	2020-08-13 15:04:06.203956
300	Pueblo Nuevo	10	2020-08-13 15:04:06.205326	2020-08-13 15:04:06.205326
301	Mezquital	10	2020-08-13 15:04:06.206687	2020-08-13 15:04:06.206687
302	Gómez Palacio	10	2020-08-13 15:04:06.207996	2020-08-13 15:04:06.207996
303	Lerdo	10	2020-08-13 15:04:06.209317	2020-08-13 15:04:06.209317
304	Mapimí	10	2020-08-13 15:04:06.210604	2020-08-13 15:04:06.210604
305	Tlahualilo	10	2020-08-13 15:04:06.211943	2020-08-13 15:04:06.211943
306	Hidalgo	10	2020-08-13 15:04:06.213249	2020-08-13 15:04:06.213249
307	Ocampo	10	2020-08-13 15:04:06.214505	2020-08-13 15:04:06.214505
308	Guanaceví	10	2020-08-13 15:04:06.21588	2020-08-13 15:04:06.21588
309	San Bernardo	10	2020-08-13 15:04:06.217432	2020-08-13 15:04:06.217432
310	Indé	10	2020-08-13 15:04:06.218869	2020-08-13 15:04:06.218869
311	San Pedro del Gallo	10	2020-08-13 15:04:06.220175	2020-08-13 15:04:06.220175
312	Tepehuanes	10	2020-08-13 15:04:06.221562	2020-08-13 15:04:06.221562
313	El Oro	10	2020-08-13 15:04:06.223112	2020-08-13 15:04:06.223112
314	Nazas	10	2020-08-13 15:04:06.224404	2020-08-13 15:04:06.224404
315	San Luis del Cordero	10	2020-08-13 15:04:06.225772	2020-08-13 15:04:06.225772
316	Rodeo	10	2020-08-13 15:04:06.227333	2020-08-13 15:04:06.227333
317	Cuencamé	10	2020-08-13 15:04:06.228689	2020-08-13 15:04:06.228689
318	Santa Clara	10	2020-08-13 15:04:06.230142	2020-08-13 15:04:06.230142
319	San Juan de Guadalupe	10	2020-08-13 15:04:06.23161	2020-08-13 15:04:06.23161
320	General Simón Bolívar	10	2020-08-13 15:04:06.23308	2020-08-13 15:04:06.23308
321	Guanajuato	11	2020-08-13 15:04:06.234504	2020-08-13 15:04:06.234504
322	Silao de la Victoria	11	2020-08-13 15:04:06.236185	2020-08-13 15:04:06.236185
323	Romita	11	2020-08-13 15:04:06.238488	2020-08-13 15:04:06.238488
324	San Francisco del Rincón	11	2020-08-13 15:04:06.240268	2020-08-13 15:04:06.240268
325	Purísima del Rincón	11	2020-08-13 15:04:06.241919	2020-08-13 15:04:06.241919
326	Manuel Doblado	11	2020-08-13 15:04:06.243681	2020-08-13 15:04:06.243681
327	Irapuato	11	2020-08-13 15:04:06.24525	2020-08-13 15:04:06.24525
328	Salamanca	11	2020-08-13 15:04:06.246708	2020-08-13 15:04:06.246708
329	Pueblo Nuevo	11	2020-08-13 15:04:06.24814	2020-08-13 15:04:06.24814
330	Pénjamo	11	2020-08-13 15:04:06.249762	2020-08-13 15:04:06.249762
331	Cuerámaro	11	2020-08-13 15:04:06.251161	2020-08-13 15:04:06.251161
332	Abasolo	11	2020-08-13 15:04:06.252618	2020-08-13 15:04:06.252618
333	Huanímaro	11	2020-08-13 15:04:06.254127	2020-08-13 15:04:06.254127
334	León	11	2020-08-13 15:04:06.255591	2020-08-13 15:04:06.255591
335	San Felipe	11	2020-08-13 15:04:06.257179	2020-08-13 15:04:06.257179
336	Ocampo	11	2020-08-13 15:04:06.258646	2020-08-13 15:04:06.258646
337	San Miguel de Allende	11	2020-08-13 15:04:06.260067	2020-08-13 15:04:06.260067
338	Dolores Hidalgo Cuna de la Independencia Nacional	11	2020-08-13 15:04:06.261521	2020-08-13 15:04:06.261521
339	San Diego de la Unión	11	2020-08-13 15:04:06.263081	2020-08-13 15:04:06.263081
340	San Luis de la Paz	11	2020-08-13 15:04:06.264601	2020-08-13 15:04:06.264601
341	Victoria	11	2020-08-13 15:04:06.266008	2020-08-13 15:04:06.266008
342	Xichú	11	2020-08-13 15:04:06.267519	2020-08-13 15:04:06.267519
343	Atarjea	11	2020-08-13 15:04:06.269092	2020-08-13 15:04:06.269092
344	Santa Catarina	11	2020-08-13 15:04:06.27067	2020-08-13 15:04:06.27067
345	Doctor Mora	11	2020-08-13 15:04:06.272315	2020-08-13 15:04:06.272315
346	Tierra Blanca	11	2020-08-13 15:04:06.27395	2020-08-13 15:04:06.27395
347	San José Iturbide	11	2020-08-13 15:04:06.275606	2020-08-13 15:04:06.275606
348	Celaya	11	2020-08-13 15:04:06.277199	2020-08-13 15:04:06.277199
349	Apaseo el Grande	11	2020-08-13 15:04:06.278972	2020-08-13 15:04:06.278972
350	Comonfort	11	2020-08-13 15:04:06.280818	2020-08-13 15:04:06.280818
351	Santa Cruz de Juventino Rosas	11	2020-08-13 15:04:06.283004	2020-08-13 15:04:06.283004
352	Villagrán	11	2020-08-13 15:04:06.285209	2020-08-13 15:04:06.285209
353	Cortazar	11	2020-08-13 15:04:06.286871	2020-08-13 15:04:06.286871
354	Valle de Santiago	11	2020-08-13 15:04:06.288562	2020-08-13 15:04:06.288562
355	Jaral del Progreso	11	2020-08-13 15:04:06.290341	2020-08-13 15:04:06.290341
356	Apaseo el Alto	11	2020-08-13 15:04:06.291974	2020-08-13 15:04:06.291974
357	Jerécuaro	11	2020-08-13 15:04:06.293596	2020-08-13 15:04:06.293596
358	Coroneo	11	2020-08-13 15:04:06.295099	2020-08-13 15:04:06.295099
359	Acámbaro	11	2020-08-13 15:04:06.303925	2020-08-13 15:04:06.303925
360	Tarimoro	11	2020-08-13 15:04:06.306314	2020-08-13 15:04:06.306314
361	Tarandacuao	11	2020-08-13 15:04:06.307783	2020-08-13 15:04:06.307783
362	Moroleón	11	2020-08-13 15:04:06.309304	2020-08-13 15:04:06.309304
363	Salvatierra	11	2020-08-13 15:04:06.310728	2020-08-13 15:04:06.310728
364	Yuriria	11	2020-08-13 15:04:06.31267	2020-08-13 15:04:06.31267
365	Santiago Maravatío	11	2020-08-13 15:04:06.314285	2020-08-13 15:04:06.314285
366	Uriangato	11	2020-08-13 15:04:06.315656	2020-08-13 15:04:06.315656
367	Chilpancingo de los Bravo	12	2020-08-13 15:04:06.317255	2020-08-13 15:04:06.317255
368	General Heliodoro Castillo	12	2020-08-13 15:04:06.318851	2020-08-13 15:04:06.318851
369	Leonardo Bravo	12	2020-08-13 15:04:06.320472	2020-08-13 15:04:06.320472
370	Tixtla de Guerrero	12	2020-08-13 15:04:06.322356	2020-08-13 15:04:06.322356
371	Ayutla de los Libres	12	2020-08-13 15:04:06.324076	2020-08-13 15:04:06.324076
372	Mochitlán	12	2020-08-13 15:04:06.325747	2020-08-13 15:04:06.325747
373	Quechultenango	12	2020-08-13 15:04:06.327396	2020-08-13 15:04:06.327396
374	Tecoanapa	12	2020-08-13 15:04:06.329794	2020-08-13 15:04:06.329794
375	Acapulco	12	2020-08-13 15:04:06.331683	2020-08-13 15:04:06.331683
376	Juan R. Escudero	12	2020-08-13 15:04:06.333752	2020-08-13 15:04:06.333752
377	San Marcos	12	2020-08-13 15:04:06.335769	2020-08-13 15:04:06.335769
378	Iguala de la Independencia	12	2020-08-13 15:04:06.33817	2020-08-13 15:04:06.33817
379	Huitzuco de los Figueroa	12	2020-08-13 15:04:06.339897	2020-08-13 15:04:06.339897
380	Tepecoacuilco de Trujano	12	2020-08-13 15:04:06.341498	2020-08-13 15:04:06.341498
381	Eduardo Neri	12	2020-08-13 15:04:06.343193	2020-08-13 15:04:06.343193
382	Taxco de Alarcón	12	2020-08-13 15:04:06.345884	2020-08-13 15:04:06.345884
383	Buenavista de Cuéllar	12	2020-08-13 15:04:06.347712	2020-08-13 15:04:06.347712
384	Tetipac	12	2020-08-13 15:04:06.349304	2020-08-13 15:04:06.349304
385	Pilcaya	12	2020-08-13 15:04:06.350824	2020-08-13 15:04:06.350824
386	Teloloapan	12	2020-08-13 15:04:06.352849	2020-08-13 15:04:06.352849
387	Ixcateopan de Cuauhtémoc	12	2020-08-13 15:04:06.35478	2020-08-13 15:04:06.35478
388	Pedro Ascencio Alquisiras	12	2020-08-13 15:04:06.35675	2020-08-13 15:04:06.35675
389	General Canuto A. Neri	12	2020-08-13 15:04:06.358393	2020-08-13 15:04:06.358393
390	Arcelia	12	2020-08-13 15:04:06.360169	2020-08-13 15:04:06.360169
391	Apaxtla	12	2020-08-13 15:04:06.362188	2020-08-13 15:04:06.362188
392	Cuetzala del Progreso	12	2020-08-13 15:04:06.363646	2020-08-13 15:04:06.363646
393	Cocula	12	2020-08-13 15:04:06.365235	2020-08-13 15:04:06.365235
394	Tlapehuala	12	2020-08-13 15:04:06.366781	2020-08-13 15:04:06.366781
395	Cutzamala de Pinzón	12	2020-08-13 15:04:06.368879	2020-08-13 15:04:06.368879
396	Pungarabato	12	2020-08-13 15:04:06.370734	2020-08-13 15:04:06.370734
397	Tlalchapa	12	2020-08-13 15:04:06.372387	2020-08-13 15:04:06.372387
398	Coyuca de Catalán	12	2020-08-13 15:04:06.374206	2020-08-13 15:04:06.374206
399	Ajuchitlán del Progreso	12	2020-08-13 15:04:06.376537	2020-08-13 15:04:06.376537
400	Zirándaro	12	2020-08-13 15:04:06.378146	2020-08-13 15:04:06.378146
401	San Miguel Totolapan	12	2020-08-13 15:04:06.379713	2020-08-13 15:04:06.379713
402	La Unión de Isidoro Montes de Oca	12	2020-08-13 15:04:06.381136	2020-08-13 15:04:06.381136
403	Petatlán	12	2020-08-13 15:04:06.382689	2020-08-13 15:04:06.382689
404	Coahuayutla de José María Izazaga	12	2020-08-13 15:04:06.384196	2020-08-13 15:04:06.384196
405	Zihuatanejo de Azueta	12	2020-08-13 15:04:06.385811	2020-08-13 15:04:06.385811
406	Técpan de Galeana	12	2020-08-13 15:04:06.387504	2020-08-13 15:04:06.387504
407	Atoyac de Álvarez	12	2020-08-13 15:04:06.38924	2020-08-13 15:04:06.38924
408	Benito Juárez	12	2020-08-13 15:04:06.390936	2020-08-13 15:04:06.390936
409	Coyuca de Benítez	12	2020-08-13 15:04:06.393007	2020-08-13 15:04:06.393007
410	Olinalá	12	2020-08-13 15:04:06.394622	2020-08-13 15:04:06.394622
411	Atenango del Río	12	2020-08-13 15:04:06.396285	2020-08-13 15:04:06.396285
412	Copalillo	12	2020-08-13 15:04:06.397838	2020-08-13 15:04:06.397838
413	Cualác	12	2020-08-13 15:04:06.399474	2020-08-13 15:04:06.399474
414	Chilapa de Álvarez	12	2020-08-13 15:04:06.400977	2020-08-13 15:04:06.400977
415	José Joaquín de Herrera	12	2020-08-13 15:04:06.402389	2020-08-13 15:04:06.402389
416	Ahuacuotzingo	12	2020-08-13 15:04:06.403811	2020-08-13 15:04:06.403811
417	Zitlala	12	2020-08-13 15:04:06.405157	2020-08-13 15:04:06.405157
418	Mártir de Cuilapan	12	2020-08-13 15:04:06.406864	2020-08-13 15:04:06.406864
419	Huamuxtitlán	12	2020-08-13 15:04:06.408508	2020-08-13 15:04:06.408508
420	Xochihuehuetlán	12	2020-08-13 15:04:06.410072	2020-08-13 15:04:06.410072
421	Alpoyeca	12	2020-08-13 15:04:06.41192	2020-08-13 15:04:06.41192
422	Tlapa de Comonfort	12	2020-08-13 15:04:06.413631	2020-08-13 15:04:06.413631
423	Tlalixtaquilla de Maldonado	12	2020-08-13 15:04:06.41534	2020-08-13 15:04:06.41534
424	Xalpatláhuac	12	2020-08-13 15:04:06.41678	2020-08-13 15:04:06.41678
425	Zapotitlán Tablas	12	2020-08-13 15:04:06.418267	2020-08-13 15:04:06.418267
426	Acatepec	12	2020-08-13 15:04:06.419971	2020-08-13 15:04:06.419971
427	Atlixtac	12	2020-08-13 15:04:06.42156	2020-08-13 15:04:06.42156
428	Copanatoyac	12	2020-08-13 15:04:06.423136	2020-08-13 15:04:06.423136
429	Malinaltepec	12	2020-08-13 15:04:06.424586	2020-08-13 15:04:06.424586
430	Iliatenco	12	2020-08-13 15:04:06.425965	2020-08-13 15:04:06.425965
431	Tlacoapa	12	2020-08-13 15:04:06.427369	2020-08-13 15:04:06.427369
432	Atlamajalcingo del Monte	12	2020-08-13 15:04:06.428663	2020-08-13 15:04:06.428663
433	San Luis Acatlán	12	2020-08-13 15:04:06.430246	2020-08-13 15:04:06.430246
434	Metlatónoc	12	2020-08-13 15:04:06.431896	2020-08-13 15:04:06.431896
435	Cochoapa el Grande	12	2020-08-13 15:04:06.433339	2020-08-13 15:04:06.433339
436	Alcozauca de Guerrero	12	2020-08-13 15:04:06.43464	2020-08-13 15:04:06.43464
437	Ometepec	12	2020-08-13 15:04:06.436301	2020-08-13 15:04:06.436301
438	Tlacoachistlahuaca	12	2020-08-13 15:04:06.437867	2020-08-13 15:04:06.437867
439	Xochistlahuaca	12	2020-08-13 15:04:06.439274	2020-08-13 15:04:06.439274
440	Florencio Villarreal	12	2020-08-13 15:04:06.440709	2020-08-13 15:04:06.440709
441	Cuautepec	12	2020-08-13 15:04:06.442001	2020-08-13 15:04:06.442001
442	Copala	12	2020-08-13 15:04:06.443388	2020-08-13 15:04:06.443388
443	Azoyú	12	2020-08-13 15:04:06.445053	2020-08-13 15:04:06.445053
444	Juchitán	12	2020-08-13 15:04:06.4466	2020-08-13 15:04:06.4466
445	Marquelia	12	2020-08-13 15:04:06.448218	2020-08-13 15:04:06.448218
446	Cuajinicuilapa	12	2020-08-13 15:04:06.450022	2020-08-13 15:04:06.450022
447	Igualapa	12	2020-08-13 15:04:06.451647	2020-08-13 15:04:06.451647
448	Pachuca de Soto	13	2020-08-13 15:04:06.453407	2020-08-13 15:04:06.453407
449	Mineral del Chico	13	2020-08-13 15:04:06.455024	2020-08-13 15:04:06.455024
450	Mineral del Monte	13	2020-08-13 15:04:06.45661	2020-08-13 15:04:06.45661
451	Ajacuba	13	2020-08-13 15:04:06.458263	2020-08-13 15:04:06.458263
452	San Agustín Tlaxiaca	13	2020-08-13 15:04:06.459646	2020-08-13 15:04:06.459646
453	Mineral de la Reforma	13	2020-08-13 15:04:06.461189	2020-08-13 15:04:06.461189
454	Zapotlán de Juárez	13	2020-08-13 15:04:06.462628	2020-08-13 15:04:06.462628
455	Jacala de Ledezma	13	2020-08-13 15:04:06.463972	2020-08-13 15:04:06.463972
456	Pisaflores	13	2020-08-13 15:04:06.465346	2020-08-13 15:04:06.465346
457	Pacula	13	2020-08-13 15:04:06.466711	2020-08-13 15:04:06.466711
458	La Misión	13	2020-08-13 15:04:06.468128	2020-08-13 15:04:06.468128
459	Chapulhuacán	13	2020-08-13 15:04:06.469646	2020-08-13 15:04:06.469646
460	Ixmiquilpan	13	2020-08-13 15:04:06.471183	2020-08-13 15:04:06.471183
461	Zimapán	13	2020-08-13 15:04:06.472928	2020-08-13 15:04:06.472928
462	Nicolás Flores	13	2020-08-13 15:04:06.474561	2020-08-13 15:04:06.474561
463	Cardonal	13	2020-08-13 15:04:06.476274	2020-08-13 15:04:06.476274
464	Tasquillo	13	2020-08-13 15:04:06.478154	2020-08-13 15:04:06.478154
465	Alfajayucan	13	2020-08-13 15:04:06.479792	2020-08-13 15:04:06.479792
466	Huichapan	13	2020-08-13 15:04:06.48125	2020-08-13 15:04:06.48125
467	Tecozautla	13	2020-08-13 15:04:06.482764	2020-08-13 15:04:06.482764
468	Nopala de Villagrán	13	2020-08-13 15:04:06.48431	2020-08-13 15:04:06.48431
469	Actopan	13	2020-08-13 15:04:06.485766	2020-08-13 15:04:06.485766
470	Santiago de Anaya	13	2020-08-13 15:04:06.487141	2020-08-13 15:04:06.487141
471	San Salvador	13	2020-08-13 15:04:06.488478	2020-08-13 15:04:06.488478
472	Francisco I. Madero	13	2020-08-13 15:04:06.489839	2020-08-13 15:04:06.489839
473	El Arenal	13	2020-08-13 15:04:06.491232	2020-08-13 15:04:06.491232
474	Mixquiahuala de Juárez	13	2020-08-13 15:04:06.492575	2020-08-13 15:04:06.492575
475	Progreso de Obregón	13	2020-08-13 15:04:06.493906	2020-08-13 15:04:06.493906
476	Chilcuautla	13	2020-08-13 15:04:06.495388	2020-08-13 15:04:06.495388
477	Tezontepec de Aldama	13	2020-08-13 15:04:06.496791	2020-08-13 15:04:06.496791
478	Tlahuelilpan	13	2020-08-13 15:04:06.498303	2020-08-13 15:04:06.498303
479	Tula de Allende	13	2020-08-13 15:04:06.499962	2020-08-13 15:04:06.499962
480	Tepeji del Río de Ocampo	13	2020-08-13 15:04:06.501465	2020-08-13 15:04:06.501465
481	Chapantongo	13	2020-08-13 15:04:06.508866	2020-08-13 15:04:06.508866
482	Tepetitlán	13	2020-08-13 15:04:06.517012	2020-08-13 15:04:06.517012
483	Tetepango	13	2020-08-13 15:04:06.525662	2020-08-13 15:04:06.525662
484	Tlaxcoapan	13	2020-08-13 15:04:06.528874	2020-08-13 15:04:06.528874
485	Atitalaquia	13	2020-08-13 15:04:06.530678	2020-08-13 15:04:06.530678
486	Atotonilco de Tula	13	2020-08-13 15:04:06.532516	2020-08-13 15:04:06.532516
487	Huejutla de Reyes	13	2020-08-13 15:04:06.534157	2020-08-13 15:04:06.534157
488	San Felipe Orizatlán	13	2020-08-13 15:04:06.535677	2020-08-13 15:04:06.535677
489	Jaltocán	13	2020-08-13 15:04:06.537109	2020-08-13 15:04:06.537109
490	Huautla	13	2020-08-13 15:04:06.538795	2020-08-13 15:04:06.538795
491	Atlapexco	13	2020-08-13 15:04:06.540175	2020-08-13 15:04:06.540175
492	Huazalingo	13	2020-08-13 15:04:06.541675	2020-08-13 15:04:06.541675
493	Yahualica	13	2020-08-13 15:04:06.543443	2020-08-13 15:04:06.543443
494	Xochiatipan	13	2020-08-13 15:04:06.544983	2020-08-13 15:04:06.544983
495	Molango de Escamilla	13	2020-08-13 15:04:06.546604	2020-08-13 15:04:06.546604
496	Tepehuacán de Guerrero	13	2020-08-13 15:04:06.548239	2020-08-13 15:04:06.548239
497	Lolotla	13	2020-08-13 15:04:06.54965	2020-08-13 15:04:06.54965
498	Tlanchinol	13	2020-08-13 15:04:06.551134	2020-08-13 15:04:06.551134
499	Tlahuiltepa	13	2020-08-13 15:04:06.552641	2020-08-13 15:04:06.552641
500	Juárez Hidalgo	13	2020-08-13 15:04:06.554013	2020-08-13 15:04:06.554013
501	Zacualtipán de Ángeles	13	2020-08-13 15:04:06.555464	2020-08-13 15:04:06.555464
502	Calnali	13	2020-08-13 15:04:06.556801	2020-08-13 15:04:06.556801
503	Xochicoatlán	13	2020-08-13 15:04:06.558137	2020-08-13 15:04:06.558137
504	Tianguistengo	13	2020-08-13 15:04:06.559484	2020-08-13 15:04:06.559484
505	Atotonilco el Grande	13	2020-08-13 15:04:06.560983	2020-08-13 15:04:06.560983
506	Eloxochitlán	13	2020-08-13 15:04:06.562241	2020-08-13 15:04:06.562241
507	Metztitlán	13	2020-08-13 15:04:06.563611	2020-08-13 15:04:06.563611
508	San Agustín Metzquititlán	13	2020-08-13 15:04:06.564971	2020-08-13 15:04:06.564971
509	Metepec	13	2020-08-13 15:04:06.56625	2020-08-13 15:04:06.56625
510	Huehuetla	13	2020-08-13 15:04:06.56762	2020-08-13 15:04:06.56762
511	San Bartolo Tutotepec	13	2020-08-13 15:04:06.569026	2020-08-13 15:04:06.569026
512	Agua Blanca de Iturbide	13	2020-08-13 15:04:06.570616	2020-08-13 15:04:06.570616
513	Tenango de Doria	13	2020-08-13 15:04:06.572304	2020-08-13 15:04:06.572304
514	Huasca de Ocampo	13	2020-08-13 15:04:06.573689	2020-08-13 15:04:06.573689
515	Acatlán	13	2020-08-13 15:04:06.575071	2020-08-13 15:04:06.575071
516	Omitlán de Juárez	13	2020-08-13 15:04:06.576453	2020-08-13 15:04:06.576453
517	Epazoyucan	13	2020-08-13 15:04:06.578077	2020-08-13 15:04:06.578077
518	Tulancingo de Bravo	13	2020-08-13 15:04:06.579782	2020-08-13 15:04:06.579782
519	Acaxochitlán	13	2020-08-13 15:04:06.581258	2020-08-13 15:04:06.581258
520	Cuautepec de Hinojosa	13	2020-08-13 15:04:06.582757	2020-08-13 15:04:06.582757
521	Santiago Tulantepec de Lugo Guerrero	13	2020-08-13 15:04:06.584293	2020-08-13 15:04:06.584293
522	Singuilucan	13	2020-08-13 15:04:06.585818	2020-08-13 15:04:06.585818
523	Tizayuca	13	2020-08-13 15:04:06.587352	2020-08-13 15:04:06.587352
524	Zempoala	13	2020-08-13 15:04:06.588858	2020-08-13 15:04:06.588858
525	Tolcayuca	13	2020-08-13 15:04:06.590456	2020-08-13 15:04:06.590456
526	Villa de Tezontepec	13	2020-08-13 15:04:06.592096	2020-08-13 15:04:06.592096
527	Apan	13	2020-08-13 15:04:06.593686	2020-08-13 15:04:06.593686
528	Tlanalapa	13	2020-08-13 15:04:06.595239	2020-08-13 15:04:06.595239
529	Almoloya	13	2020-08-13 15:04:06.596769	2020-08-13 15:04:06.596769
530	Emiliano Zapata	13	2020-08-13 15:04:06.598229	2020-08-13 15:04:06.598229
531	Tepeapulco	13	2020-08-13 15:04:06.599591	2020-08-13 15:04:06.599591
532	Guadalajara	14	2020-08-13 15:04:06.600971	2020-08-13 15:04:06.600971
533	Zapopan	14	2020-08-13 15:04:06.602381	2020-08-13 15:04:06.602381
534	San Cristóbal de la Barranca	14	2020-08-13 15:04:06.603847	2020-08-13 15:04:06.603847
535	Ixtlahuacán del Río	14	2020-08-13 15:04:06.605215	2020-08-13 15:04:06.605215
536	Tala	14	2020-08-13 15:04:06.606541	2020-08-13 15:04:06.606541
537	El Arenal	14	2020-08-13 15:04:06.608035	2020-08-13 15:04:06.608035
538	Amatitán	14	2020-08-13 15:04:06.609484	2020-08-13 15:04:06.609484
539	Tonalá	14	2020-08-13 15:04:06.611253	2020-08-13 15:04:06.611253
540	Zapotlanejo	14	2020-08-13 15:04:06.61321	2020-08-13 15:04:06.61321
541	Acatic	14	2020-08-13 15:04:06.614994	2020-08-13 15:04:06.614994
542	Cuquío	14	2020-08-13 15:04:06.616524	2020-08-13 15:04:06.616524
543	San Pedro Tlaquepaque	14	2020-08-13 15:04:06.618089	2020-08-13 15:04:06.618089
544	Tlajomulco de Zúñiga	14	2020-08-13 15:04:06.61969	2020-08-13 15:04:06.61969
545	El Salto	14	2020-08-13 15:04:06.622149	2020-08-13 15:04:06.622149
546	Acatlán de Juárez	14	2020-08-13 15:04:06.623732	2020-08-13 15:04:06.623732
547	Villa Corona	14	2020-08-13 15:04:06.625419	2020-08-13 15:04:06.625419
548	Zacoalco de Torres	14	2020-08-13 15:04:06.627052	2020-08-13 15:04:06.627052
549	Atemajac de Brizuela	14	2020-08-13 15:04:06.628553	2020-08-13 15:04:06.628553
550	Jocotepec	14	2020-08-13 15:04:06.629961	2020-08-13 15:04:06.629961
551	Ixtlahuacán de los Membrillos	14	2020-08-13 15:04:06.631313	2020-08-13 15:04:06.631313
552	Juanacatlán	14	2020-08-13 15:04:06.632611	2020-08-13 15:04:06.632611
553	Chapala	14	2020-08-13 15:04:06.633963	2020-08-13 15:04:06.633963
554	Poncitlán	14	2020-08-13 15:04:06.635494	2020-08-13 15:04:06.635494
555	Zapotlán del Rey	14	2020-08-13 15:04:06.637038	2020-08-13 15:04:06.637038
556	Huejuquilla el Alto	14	2020-08-13 15:04:06.638399	2020-08-13 15:04:06.638399
557	Mezquitic	14	2020-08-13 15:04:06.63977	2020-08-13 15:04:06.63977
558	Villa Guerrero	14	2020-08-13 15:04:06.641023	2020-08-13 15:04:06.641023
559	Bolaños	14	2020-08-13 15:04:06.64262	2020-08-13 15:04:06.64262
560	Totatiche	14	2020-08-13 15:04:06.644014	2020-08-13 15:04:06.644014
561	Colotlán	14	2020-08-13 15:04:06.645287	2020-08-13 15:04:06.645287
562	Santa María de los Ángeles	14	2020-08-13 15:04:06.646684	2020-08-13 15:04:06.646684
563	Huejúcar	14	2020-08-13 15:04:06.648033	2020-08-13 15:04:06.648033
564	Chimaltitán	14	2020-08-13 15:04:06.649418	2020-08-13 15:04:06.649418
565	San Martín de Bolaños	14	2020-08-13 15:04:06.651025	2020-08-13 15:04:06.651025
566	Tequila	14	2020-08-13 15:04:06.652398	2020-08-13 15:04:06.652398
567	Hostotipaquillo	14	2020-08-13 15:04:06.65359	2020-08-13 15:04:06.65359
568	Magdalena	14	2020-08-13 15:04:06.654825	2020-08-13 15:04:06.654825
569	Etzatlán	14	2020-08-13 15:04:06.656028	2020-08-13 15:04:06.656028
570	San Marcos	14	2020-08-13 15:04:06.657527	2020-08-13 15:04:06.657527
571	San Juanito de Escobedo	14	2020-08-13 15:04:06.659191	2020-08-13 15:04:06.659191
572	Ameca	14	2020-08-13 15:04:06.666778	2020-08-13 15:04:06.666778
573	Ahualulco de Mercado	14	2020-08-13 15:04:06.674857	2020-08-13 15:04:06.674857
574	Teuchitlán	14	2020-08-13 15:04:06.683397	2020-08-13 15:04:06.683397
575	San Martín Hidalgo	14	2020-08-13 15:04:06.685527	2020-08-13 15:04:06.685527
576	Guachinango	14	2020-08-13 15:04:06.68737	2020-08-13 15:04:06.68737
577	Mixtlán	14	2020-08-13 15:04:06.689335	2020-08-13 15:04:06.689335
578	Mascota	14	2020-08-13 15:04:06.691241	2020-08-13 15:04:06.691241
579	San Sebastián del Oeste	14	2020-08-13 15:04:06.692888	2020-08-13 15:04:06.692888
580	San Juan de los Lagos	14	2020-08-13 15:04:06.694484	2020-08-13 15:04:06.694484
581	Jalostotitlán	14	2020-08-13 15:04:06.695921	2020-08-13 15:04:06.695921
582	San Miguel el Alto	14	2020-08-13 15:04:06.697517	2020-08-13 15:04:06.697517
583	San Julián	14	2020-08-13 15:04:06.699002	2020-08-13 15:04:06.699002
584	Arandas	14	2020-08-13 15:04:06.700426	2020-08-13 15:04:06.700426
585	San Ignacio Cerro Gordo	14	2020-08-13 15:04:06.702134	2020-08-13 15:04:06.702134
586	Teocaltiche	14	2020-08-13 15:04:06.703777	2020-08-13 15:04:06.703777
587	Villa Hidalgo	14	2020-08-13 15:04:06.705485	2020-08-13 15:04:06.705485
588	Encarnación de Díaz	14	2020-08-13 15:04:06.707346	2020-08-13 15:04:06.707346
589	Yahualica de González Gallo	14	2020-08-13 15:04:06.709071	2020-08-13 15:04:06.709071
590	Mexticacán	14	2020-08-13 15:04:06.71059	2020-08-13 15:04:06.71059
591	Cañadas de Obregón	14	2020-08-13 15:04:06.712115	2020-08-13 15:04:06.712115
592	Valle de Guadalupe	14	2020-08-13 15:04:06.713618	2020-08-13 15:04:06.713618
593	Lagos de Moreno	14	2020-08-13 15:04:06.715078	2020-08-13 15:04:06.715078
594	Ojuelos de Jalisco	14	2020-08-13 15:04:06.716524	2020-08-13 15:04:06.716524
595	Unión de San Antonio	14	2020-08-13 15:04:06.717904	2020-08-13 15:04:06.717904
596	San Diego de Alejandría	14	2020-08-13 15:04:06.719221	2020-08-13 15:04:06.719221
597	Tepatitlán de Morelos	14	2020-08-13 15:04:06.72056	2020-08-13 15:04:06.72056
598	Tototlán	14	2020-08-13 15:04:06.722266	2020-08-13 15:04:06.722266
599	Atotonilco el Alto	14	2020-08-13 15:04:06.723826	2020-08-13 15:04:06.723826
600	Ocotlán	14	2020-08-13 15:04:06.725187	2020-08-13 15:04:06.725187
601	Jamay	14	2020-08-13 15:04:06.726632	2020-08-13 15:04:06.726632
602	La Barca	14	2020-08-13 15:04:06.728001	2020-08-13 15:04:06.728001
603	Ayotlán	14	2020-08-13 15:04:06.729231	2020-08-13 15:04:06.729231
604	Jesús María	14	2020-08-13 15:04:06.73096	2020-08-13 15:04:06.73096
605	Degollado	14	2020-08-13 15:04:06.732378	2020-08-13 15:04:06.732378
606	Unión de Tula	14	2020-08-13 15:04:06.733703	2020-08-13 15:04:06.733703
607	Ayutla	14	2020-08-13 15:04:06.735055	2020-08-13 15:04:06.735055
608	Atenguillo	14	2020-08-13 15:04:06.736311	2020-08-13 15:04:06.736311
609	Cuautla	14	2020-08-13 15:04:06.737752	2020-08-13 15:04:06.737752
610	Atengo	14	2020-08-13 15:04:06.739353	2020-08-13 15:04:06.739353
611	Talpa de Allende	14	2020-08-13 15:04:06.740712	2020-08-13 15:04:06.740712
612	Puerto Vallarta	14	2020-08-13 15:04:06.74196	2020-08-13 15:04:06.74196
613	Cabo Corrientes	14	2020-08-13 15:04:06.743228	2020-08-13 15:04:06.743228
614	Tomatlán	14	2020-08-13 15:04:06.74442	2020-08-13 15:04:06.74442
615	Cocula	14	2020-08-13 15:04:06.745854	2020-08-13 15:04:06.745854
616	Tecolotlán	14	2020-08-13 15:04:06.747433	2020-08-13 15:04:06.747433
617	Tenamaxtlán	14	2020-08-13 15:04:06.748811	2020-08-13 15:04:06.748811
618	Juchitlán	14	2020-08-13 15:04:06.75038	2020-08-13 15:04:06.75038
619	Chiquilistlán	14	2020-08-13 15:04:06.751576	2020-08-13 15:04:06.751576
620	Ejutla	14	2020-08-13 15:04:06.752867	2020-08-13 15:04:06.752867
621	El Limón	14	2020-08-13 15:04:06.754452	2020-08-13 15:04:06.754452
622	El Grullo	14	2020-08-13 15:04:06.755849	2020-08-13 15:04:06.755849
623	Tonaya	14	2020-08-13 15:04:06.757099	2020-08-13 15:04:06.757099
624	Tuxcacuesco	14	2020-08-13 15:04:06.758467	2020-08-13 15:04:06.758467
625	Villa Purificación	14	2020-08-13 15:04:06.760099	2020-08-13 15:04:06.760099
626	La Huerta	14	2020-08-13 15:04:06.761705	2020-08-13 15:04:06.761705
627	Autlán de Navarro	14	2020-08-13 15:04:06.763131	2020-08-13 15:04:06.763131
628	Casimiro Castillo	14	2020-08-13 15:04:06.764466	2020-08-13 15:04:06.764466
629	Cuautitlán de García Barragán	14	2020-08-13 15:04:06.765749	2020-08-13 15:04:06.765749
630	Cihuatlán	14	2020-08-13 15:04:06.767024	2020-08-13 15:04:06.767024
631	Zapotlán el Grande	14	2020-08-13 15:04:06.768675	2020-08-13 15:04:06.768675
632	Gómez Farías	14	2020-08-13 15:04:06.770418	2020-08-13 15:04:06.770418
633	Concepción de Buenos Aires	14	2020-08-13 15:04:06.771881	2020-08-13 15:04:06.771881
634	Atoyac	14	2020-08-13 15:04:06.773231	2020-08-13 15:04:06.773231
635	Techaluta de Montenegro	14	2020-08-13 15:04:06.774511	2020-08-13 15:04:06.774511
636	Teocuitatlán de Corona	14	2020-08-13 15:04:06.775967	2020-08-13 15:04:06.775967
637	Sayula	14	2020-08-13 15:04:06.777542	2020-08-13 15:04:06.777542
638	Tapalpa	14	2020-08-13 15:04:06.779106	2020-08-13 15:04:06.779106
639	Amacueca	14	2020-08-13 15:04:06.780434	2020-08-13 15:04:06.780434
640	Tizapán el Alto	14	2020-08-13 15:04:06.781694	2020-08-13 15:04:06.781694
641	Tuxcueca	14	2020-08-13 15:04:06.78302	2020-08-13 15:04:06.78302
642	La Manzanilla de la Paz	14	2020-08-13 15:04:06.784729	2020-08-13 15:04:06.784729
643	Mazamitla	14	2020-08-13 15:04:06.786241	2020-08-13 15:04:06.786241
644	Valle de Juárez	14	2020-08-13 15:04:06.787783	2020-08-13 15:04:06.787783
645	Quitupan	14	2020-08-13 15:04:06.789176	2020-08-13 15:04:06.789176
646	Zapotiltic	14	2020-08-13 15:04:06.790582	2020-08-13 15:04:06.790582
647	Tamazula de Gordiano	14	2020-08-13 15:04:06.792159	2020-08-13 15:04:06.792159
648	San Gabriel	14	2020-08-13 15:04:06.793633	2020-08-13 15:04:06.793633
649	Tolimán	14	2020-08-13 15:04:06.795026	2020-08-13 15:04:06.795026
650	Zapotitlán de Vadillo	14	2020-08-13 15:04:06.796361	2020-08-13 15:04:06.796361
651	Tuxpan	14	2020-08-13 15:04:06.79779	2020-08-13 15:04:06.79779
652	Tonila	14	2020-08-13 15:04:06.799134	2020-08-13 15:04:06.799134
653	Pihuamo	14	2020-08-13 15:04:06.800869	2020-08-13 15:04:06.800869
654	Tecalitlán	14	2020-08-13 15:04:06.802487	2020-08-13 15:04:06.802487
655	Jilotlán de los Dolores	14	2020-08-13 15:04:06.803857	2020-08-13 15:04:06.803857
656	Santa María del Oro	14	2020-08-13 15:04:06.805176	2020-08-13 15:04:06.805176
657	CDMX	15	2020-08-13 15:04:06.806634	2020-08-13 15:04:06.806634
658	Toluca	15	2020-08-13 15:04:06.808068	2020-08-13 15:04:06.808068
659	Acambay de Ruíz Castañeda	15	2020-08-13 15:04:06.809546	2020-08-13 15:04:06.809546
660	Aculco	15	2020-08-13 15:04:06.810939	2020-08-13 15:04:06.810939
661	Temascalcingo	15	2020-08-13 15:04:06.812284	2020-08-13 15:04:06.812284
662	Atlacomulco	15	2020-08-13 15:04:06.813859	2020-08-13 15:04:06.813859
663	Timilpan	15	2020-08-13 15:04:06.815354	2020-08-13 15:04:06.815354
664	Morelos	15	2020-08-13 15:04:06.816731	2020-08-13 15:04:06.816731
665	El Oro	15	2020-08-13 15:04:06.818013	2020-08-13 15:04:06.818013
666	San Felipe del Progreso	15	2020-08-13 15:04:06.819383	2020-08-13 15:04:06.819383
667	San José del Rincón	15	2020-08-13 15:04:06.820673	2020-08-13 15:04:06.820673
668	Jocotitlán	15	2020-08-13 15:04:06.822137	2020-08-13 15:04:06.822137
669	Ixtlahuaca	15	2020-08-13 15:04:06.823662	2020-08-13 15:04:06.823662
670	Jiquipilco	15	2020-08-13 15:04:06.825092	2020-08-13 15:04:06.825092
671	Temoaya	15	2020-08-13 15:04:06.82654	2020-08-13 15:04:06.82654
672	Almoloya de Juárez	15	2020-08-13 15:04:06.827985	2020-08-13 15:04:06.827985
673	Villa Victoria	15	2020-08-13 15:04:06.829571	2020-08-13 15:04:06.829571
674	Villa de Allende	15	2020-08-13 15:04:06.831068	2020-08-13 15:04:06.831068
675	Donato Guerra	15	2020-08-13 15:04:06.832462	2020-08-13 15:04:06.832462
676	Ixtapan del Oro	15	2020-08-13 15:04:06.8338	2020-08-13 15:04:06.8338
677	Santo Tomás	15	2020-08-13 15:04:06.835215	2020-08-13 15:04:06.835215
678	Otzoloapan	15	2020-08-13 15:04:06.836894	2020-08-13 15:04:06.836894
679	Zacazonapan	15	2020-08-13 15:04:06.838508	2020-08-13 15:04:06.838508
680	Valle de Bravo	15	2020-08-13 15:04:06.840388	2020-08-13 15:04:06.840388
681	Amanalco	15	2020-08-13 15:04:06.842056	2020-08-13 15:04:06.842056
682	Temascaltepec	15	2020-08-13 15:04:06.843716	2020-08-13 15:04:06.843716
683	Zinacantepec	15	2020-08-13 15:04:06.845058	2020-08-13 15:04:06.845058
684	Tejupilco	15	2020-08-13 15:04:06.846733	2020-08-13 15:04:06.846733
685	Luvianos	15	2020-08-13 15:04:06.848188	2020-08-13 15:04:06.848188
686	San Simón de Guerrero	15	2020-08-13 15:04:06.849559	2020-08-13 15:04:06.849559
687	Amatepec	15	2020-08-13 15:04:06.850907	2020-08-13 15:04:06.850907
688	Tlatlaya	15	2020-08-13 15:04:06.852313	2020-08-13 15:04:06.852313
689	Sultepec	15	2020-08-13 15:04:06.853669	2020-08-13 15:04:06.853669
690	Texcaltitlán	15	2020-08-13 15:04:06.855088	2020-08-13 15:04:06.855088
691	Coatepec Harinas	15	2020-08-13 15:04:06.856653	2020-08-13 15:04:06.856653
692	Villa Guerrero	15	2020-08-13 15:04:06.858263	2020-08-13 15:04:06.858263
693	Zacualpan	15	2020-08-13 15:04:06.859661	2020-08-13 15:04:06.859661
694	Almoloya de Alquisiras	15	2020-08-13 15:04:06.861059	2020-08-13 15:04:06.861059
695	Ixtapan de la Sal	15	2020-08-13 15:04:06.862797	2020-08-13 15:04:06.862797
696	Tonatico	15	2020-08-13 15:04:06.864299	2020-08-13 15:04:06.864299
697	Zumpahuacán	15	2020-08-13 15:04:06.86588	2020-08-13 15:04:06.86588
698	Lerma	15	2020-08-13 15:04:06.876754	2020-08-13 15:04:06.876754
699	Xonacatlán	15	2020-08-13 15:04:06.878311	2020-08-13 15:04:06.878311
700	Otzolotepec	15	2020-08-13 15:04:06.87985	2020-08-13 15:04:06.87985
701	San Mateo Atenco	15	2020-08-13 15:04:06.881332	2020-08-13 15:04:06.881332
702	Metepec	15	2020-08-13 15:04:06.882692	2020-08-13 15:04:06.882692
703	Mexicaltzingo	15	2020-08-13 15:04:06.884131	2020-08-13 15:04:06.884131
704	Calimaya	15	2020-08-13 15:04:06.885654	2020-08-13 15:04:06.885654
705	Chapultepec	15	2020-08-13 15:04:06.887174	2020-08-13 15:04:06.887174
706	San Antonio la Isla	15	2020-08-13 15:04:06.888798	2020-08-13 15:04:06.888798
707	Tenango del Valle	15	2020-08-13 15:04:06.89019	2020-08-13 15:04:06.89019
708	Rayón	15	2020-08-13 15:04:06.891605	2020-08-13 15:04:06.891605
709	Joquicingo	15	2020-08-13 15:04:06.892896	2020-08-13 15:04:06.892896
710	Tenancingo	15	2020-08-13 15:04:06.894172	2020-08-13 15:04:06.894172
711	Malinalco	15	2020-08-13 15:04:06.895444	2020-08-13 15:04:06.895444
712	Ocuilan	15	2020-08-13 15:04:06.896662	2020-08-13 15:04:06.896662
713	Atizapán	15	2020-08-13 15:04:06.897999	2020-08-13 15:04:06.897999
714	Almoloya del Río	15	2020-08-13 15:04:06.899652	2020-08-13 15:04:06.899652
715	Texcalyacac	15	2020-08-13 15:04:06.901398	2020-08-13 15:04:06.901398
716	Tianguistenco	15	2020-08-13 15:04:06.903119	2020-08-13 15:04:06.903119
717	Xalatlaco	15	2020-08-13 15:04:06.904832	2020-08-13 15:04:06.904832
718	Capulhuac	15	2020-08-13 15:04:06.906369	2020-08-13 15:04:06.906369
719	Ocoyoacac	15	2020-08-13 15:04:06.907886	2020-08-13 15:04:06.907886
720	Huixquilucan	15	2020-08-13 15:04:06.909367	2020-08-13 15:04:06.909367
721	Atizapán de Zaragoza	15	2020-08-13 15:04:06.910833	2020-08-13 15:04:06.910833
722	Naucalpan de Juárez	15	2020-08-13 15:04:06.912255	2020-08-13 15:04:06.912255
723	Tlalnepantla de Baz	15	2020-08-13 15:04:06.913714	2020-08-13 15:04:06.913714
724	Polotitlán	15	2020-08-13 15:04:06.915237	2020-08-13 15:04:06.915237
725	Jilotepec	15	2020-08-13 15:04:06.916759	2020-08-13 15:04:06.916759
726	Soyaniquilpan de Juárez	15	2020-08-13 15:04:06.918306	2020-08-13 15:04:06.918306
727	Villa del Carbón	15	2020-08-13 15:04:06.919683	2020-08-13 15:04:06.919683
728	Chapa de Mota	15	2020-08-13 15:04:06.921077	2020-08-13 15:04:06.921077
729	Nicolás Romero	15	2020-08-13 15:04:06.922686	2020-08-13 15:04:06.922686
730	Isidro Fabela	15	2020-08-13 15:04:06.924133	2020-08-13 15:04:06.924133
731	Jilotzingo	15	2020-08-13 15:04:06.925496	2020-08-13 15:04:06.925496
732	Tepotzotlán	15	2020-08-13 15:04:06.926921	2020-08-13 15:04:06.926921
733	Coyotepec	15	2020-08-13 15:04:06.92826	2020-08-13 15:04:06.92826
734	Huehuetoca	15	2020-08-13 15:04:06.929617	2020-08-13 15:04:06.929617
735	Cuautitlán Izcalli	15	2020-08-13 15:04:06.930967	2020-08-13 15:04:06.930967
736	Teoloyucan	15	2020-08-13 15:04:06.932314	2020-08-13 15:04:06.932314
737	Cuautitlán	15	2020-08-13 15:04:06.933876	2020-08-13 15:04:06.933876
738	Melchor Ocampo	15	2020-08-13 15:04:06.93551	2020-08-13 15:04:06.93551
739	Tultitlán	15	2020-08-13 15:04:06.937051	2020-08-13 15:04:06.937051
740	Tultepec	15	2020-08-13 15:04:06.938505	2020-08-13 15:04:06.938505
741	Ecatepec de Morelos	15	2020-08-13 15:04:06.939904	2020-08-13 15:04:06.939904
742	Zumpango	15	2020-08-13 15:04:06.941374	2020-08-13 15:04:06.941374
743	Tequixquiac	15	2020-08-13 15:04:06.942971	2020-08-13 15:04:06.942971
744	Apaxco	15	2020-08-13 15:04:06.944506	2020-08-13 15:04:06.944506
745	Hueypoxtla	15	2020-08-13 15:04:06.946077	2020-08-13 15:04:06.946077
746	Coacalco de Berriozábal	15	2020-08-13 15:04:06.947597	2020-08-13 15:04:06.947597
747	Tecámac	15	2020-08-13 15:04:06.948976	2020-08-13 15:04:06.948976
748	Jaltenco	15	2020-08-13 15:04:06.950593	2020-08-13 15:04:06.950593
749	Tonanitla	15	2020-08-13 15:04:06.952092	2020-08-13 15:04:06.952092
750	Nextlalpan	15	2020-08-13 15:04:06.953508	2020-08-13 15:04:06.953508
751	Teotihuacán	15	2020-08-13 15:04:06.954861	2020-08-13 15:04:06.954861
752	San Martín de las Pirámides	15	2020-08-13 15:04:06.956543	2020-08-13 15:04:06.956543
753	Acolman	15	2020-08-13 15:04:06.958155	2020-08-13 15:04:06.958155
754	Otumba	15	2020-08-13 15:04:06.95963	2020-08-13 15:04:06.95963
755	Axapusco	15	2020-08-13 15:04:06.960955	2020-08-13 15:04:06.960955
756	Nopaltepec	15	2020-08-13 15:04:06.962299	2020-08-13 15:04:06.962299
757	Temascalapa	15	2020-08-13 15:04:06.963814	2020-08-13 15:04:06.963814
758	Tezoyuca	15	2020-08-13 15:04:06.965372	2020-08-13 15:04:06.965372
759	Chiautla	15	2020-08-13 15:04:06.966817	2020-08-13 15:04:06.966817
760	Papalotla	15	2020-08-13 15:04:06.96834	2020-08-13 15:04:06.96834
761	Tepetlaoxtoc	15	2020-08-13 15:04:06.970134	2020-08-13 15:04:06.970134
762	Texcoco	15	2020-08-13 15:04:06.97165	2020-08-13 15:04:06.97165
763	Chiconcuac	15	2020-08-13 15:04:06.973298	2020-08-13 15:04:06.973298
764	Atenco	15	2020-08-13 15:04:06.974773	2020-08-13 15:04:06.974773
765	Chimalhuacán	15	2020-08-13 15:04:06.976319	2020-08-13 15:04:06.976319
766	Chicoloapan	15	2020-08-13 15:04:06.978088	2020-08-13 15:04:06.978088
767	La Paz	15	2020-08-13 15:04:06.979864	2020-08-13 15:04:06.979864
768	Ixtapaluca	15	2020-08-13 15:04:06.981392	2020-08-13 15:04:06.981392
769	Chalco	15	2020-08-13 15:04:06.98282	2020-08-13 15:04:06.98282
770	Valle de Chalco Solidaridad	15	2020-08-13 15:04:06.984362	2020-08-13 15:04:06.984362
771	Temamatla	15	2020-08-13 15:04:06.985732	2020-08-13 15:04:06.985732
772	Cocotitlán	15	2020-08-13 15:04:06.98714	2020-08-13 15:04:06.98714
773	Tlalmanalco	15	2020-08-13 15:04:06.988803	2020-08-13 15:04:06.988803
774	Ayapango	15	2020-08-13 15:04:06.990204	2020-08-13 15:04:06.990204
775	Tenango del Aire	15	2020-08-13 15:04:06.991859	2020-08-13 15:04:06.991859
776	Ozumba	15	2020-08-13 15:04:06.99324	2020-08-13 15:04:06.99324
777	Juchitepec	15	2020-08-13 15:04:06.994521	2020-08-13 15:04:06.994521
778	Tepetlixpa	15	2020-08-13 15:04:06.996037	2020-08-13 15:04:06.996037
779	Amecameca	15	2020-08-13 15:04:06.997484	2020-08-13 15:04:06.997484
780	Atlautla	15	2020-08-13 15:04:06.998845	2020-08-13 15:04:06.998845
781	Ecatzingo	15	2020-08-13 15:04:07.000181	2020-08-13 15:04:07.000181
782	Nezahualcóyotl	15	2020-08-13 15:04:07.001618	2020-08-13 15:04:07.001618
783	Morelia	16	2020-08-13 15:04:07.003045	2020-08-13 15:04:07.003045
784	Huaniqueo	16	2020-08-13 15:04:07.004471	2020-08-13 15:04:07.004471
785	Coeneo	16	2020-08-13 15:04:07.006177	2020-08-13 15:04:07.006177
786	Quiroga	16	2020-08-13 15:04:07.007608	2020-08-13 15:04:07.007608
787	Tzintzuntzan	16	2020-08-13 15:04:07.009007	2020-08-13 15:04:07.009007
788	Lagunillas	16	2020-08-13 15:04:07.010458	2020-08-13 15:04:07.010458
789	Acuitzio	16	2020-08-13 15:04:07.011983	2020-08-13 15:04:07.011983
790	Madero	16	2020-08-13 15:04:07.01349	2020-08-13 15:04:07.01349
791	Puruándiro	16	2020-08-13 15:04:07.014882	2020-08-13 15:04:07.014882
792	José Sixto Verduzco	16	2020-08-13 15:04:07.016359	2020-08-13 15:04:07.016359
793	Angamacutiro	16	2020-08-13 15:04:07.01778	2020-08-13 15:04:07.01778
794	Panindícuaro	16	2020-08-13 15:04:07.019323	2020-08-13 15:04:07.019323
795	Zacapu	16	2020-08-13 15:04:07.020898	2020-08-13 15:04:07.020898
796	Tlazazalca	16	2020-08-13 15:04:07.022597	2020-08-13 15:04:07.022597
797	Purépero	16	2020-08-13 15:04:07.024333	2020-08-13 15:04:07.024333
798	Jiménez	16	2020-08-13 15:04:07.025954	2020-08-13 15:04:07.025954
799	Morelos	16	2020-08-13 15:04:07.027699	2020-08-13 15:04:07.027699
800	Huandacareo	16	2020-08-13 15:04:07.029451	2020-08-13 15:04:07.029451
801	Cuitzeo	16	2020-08-13 15:04:07.03105	2020-08-13 15:04:07.03105
802	Chucándiro	16	2020-08-13 15:04:07.03258	2020-08-13 15:04:07.03258
803	Copándaro	16	2020-08-13 15:04:07.034892	2020-08-13 15:04:07.034892
804	Tarímbaro	16	2020-08-13 15:04:07.036863	2020-08-13 15:04:07.036863
805	Santa Ana Maya	16	2020-08-13 15:04:07.038411	2020-08-13 15:04:07.038411
806	Álvaro Obregón	16	2020-08-13 15:04:07.039943	2020-08-13 15:04:07.039943
807	Zinapécuaro	16	2020-08-13 15:04:07.041409	2020-08-13 15:04:07.041409
808	Indaparapeo	16	2020-08-13 15:04:07.04282	2020-08-13 15:04:07.04282
809	Queréndaro	16	2020-08-13 15:04:07.04427	2020-08-13 15:04:07.04427
810	Sahuayo	16	2020-08-13 15:04:07.046071	2020-08-13 15:04:07.046071
811	Briseñas	16	2020-08-13 15:04:07.047702	2020-08-13 15:04:07.047702
812	Cojumatlán de Régules	16	2020-08-13 15:04:07.049331	2020-08-13 15:04:07.049331
813	Venustiano Carranza	16	2020-08-13 15:04:07.050935	2020-08-13 15:04:07.050935
814	Pajacuarán	16	2020-08-13 15:04:07.052517	2020-08-13 15:04:07.052517
815	Vista Hermosa	16	2020-08-13 15:04:07.054039	2020-08-13 15:04:07.054039
816	Tanhuato	16	2020-08-13 15:04:07.055605	2020-08-13 15:04:07.055605
817	Yurécuaro	16	2020-08-13 15:04:07.056979	2020-08-13 15:04:07.056979
818	Ixtlán	16	2020-08-13 15:04:07.05834	2020-08-13 15:04:07.05834
819	La Piedad	16	2020-08-13 15:04:07.05965	2020-08-13 15:04:07.05965
820	Numarán	16	2020-08-13 15:04:07.060949	2020-08-13 15:04:07.060949
821	Churintzio	16	2020-08-13 15:04:07.062387	2020-08-13 15:04:07.062387
822	Zináparo	16	2020-08-13 15:04:07.063814	2020-08-13 15:04:07.063814
823	Penjamillo	16	2020-08-13 15:04:07.065176	2020-08-13 15:04:07.065176
824	Marcos Castellanos	16	2020-08-13 15:04:07.066571	2020-08-13 15:04:07.066571
825	Jiquilpan	16	2020-08-13 15:04:07.067928	2020-08-13 15:04:07.067928
826	Villamar	16	2020-08-13 15:04:07.069242	2020-08-13 15:04:07.069242
827	Chavinda	16	2020-08-13 15:04:07.070662	2020-08-13 15:04:07.070662
828	Zamora	16	2020-08-13 15:04:07.071994	2020-08-13 15:04:07.071994
829	Ecuandureo	16	2020-08-13 15:04:07.073295	2020-08-13 15:04:07.073295
830	Tangancícuaro	16	2020-08-13 15:04:07.074748	2020-08-13 15:04:07.074748
831	Chilchota	16	2020-08-13 15:04:07.076072	2020-08-13 15:04:07.076072
832	Jacona	16	2020-08-13 15:04:07.077361	2020-08-13 15:04:07.077361
833	Tangamandapio	16	2020-08-13 15:04:07.078963	2020-08-13 15:04:07.078963
834	Cotija	16	2020-08-13 15:04:07.08074	2020-08-13 15:04:07.08074
835	Tocumbo	16	2020-08-13 15:04:07.082455	2020-08-13 15:04:07.082455
836	Tingüindín	16	2020-08-13 15:04:07.084024	2020-08-13 15:04:07.084024
837	Uruapan	16	2020-08-13 15:04:07.085756	2020-08-13 15:04:07.085756
838	Charapan	16	2020-08-13 15:04:07.087439	2020-08-13 15:04:07.087439
839	Paracho	16	2020-08-13 15:04:07.089159	2020-08-13 15:04:07.089159
840	Cherán	16	2020-08-13 15:04:07.090772	2020-08-13 15:04:07.090772
841	Nahuatzen	16	2020-08-13 15:04:07.092351	2020-08-13 15:04:07.092351
842	Tingambato	16	2020-08-13 15:04:07.093897	2020-08-13 15:04:07.093897
843	Los Reyes	16	2020-08-13 15:04:07.095395	2020-08-13 15:04:07.095395
844	Peribán	16	2020-08-13 15:04:07.096882	2020-08-13 15:04:07.096882
845	Tancítaro	16	2020-08-13 15:04:07.09833	2020-08-13 15:04:07.09833
846	Nuevo Parangaricutiro	16	2020-08-13 15:04:07.099691	2020-08-13 15:04:07.099691
847	Buenavista	16	2020-08-13 15:04:07.101057	2020-08-13 15:04:07.101057
848	Tepalcatepec	16	2020-08-13 15:04:07.102457	2020-08-13 15:04:07.102457
849	Aguililla	16	2020-08-13 15:04:07.103738	2020-08-13 15:04:07.103738
850	Apatzingán	16	2020-08-13 15:04:07.105043	2020-08-13 15:04:07.105043
851	Parácuaro	16	2020-08-13 15:04:07.106436	2020-08-13 15:04:07.106436
852	Coahuayana	16	2020-08-13 15:04:07.107697	2020-08-13 15:04:07.107697
853	Chinicuila	16	2020-08-13 15:04:07.109092	2020-08-13 15:04:07.109092
854	Coalcomán de Vázquez Pallares	16	2020-08-13 15:04:07.110863	2020-08-13 15:04:07.110863
855	Aquila	16	2020-08-13 15:04:07.113039	2020-08-13 15:04:07.113039
856	Tumbiscatío	16	2020-08-13 15:04:07.114798	2020-08-13 15:04:07.114798
857	Arteaga	16	2020-08-13 15:04:07.116406	2020-08-13 15:04:07.116406
858	Lázaro Cárdenas	16	2020-08-13 15:04:07.118026	2020-08-13 15:04:07.118026
859	Epitacio Huerta	16	2020-08-13 15:04:07.119516	2020-08-13 15:04:07.119516
860	Contepec	16	2020-08-13 15:04:07.120996	2020-08-13 15:04:07.120996
861	Tlalpujahua	16	2020-08-13 15:04:07.122549	2020-08-13 15:04:07.122549
862	Hidalgo	16	2020-08-13 15:04:07.124043	2020-08-13 15:04:07.124043
863	Maravatío	16	2020-08-13 15:04:07.125577	2020-08-13 15:04:07.125577
864	Irimbo	16	2020-08-13 15:04:07.126956	2020-08-13 15:04:07.126956
865	Senguio	16	2020-08-13 15:04:07.128422	2020-08-13 15:04:07.128422
866	Charo	16	2020-08-13 15:04:07.129994	2020-08-13 15:04:07.129994
867	Tzitzio	16	2020-08-13 15:04:07.131623	2020-08-13 15:04:07.131623
868	Tiquicheo de Nicolás Romero	16	2020-08-13 15:04:07.133054	2020-08-13 15:04:07.133054
869	Aporo	16	2020-08-13 15:04:07.134298	2020-08-13 15:04:07.134298
870	Angangueo	16	2020-08-13 15:04:07.135595	2020-08-13 15:04:07.135595
871	Tuxpan	16	2020-08-13 15:04:07.137027	2020-08-13 15:04:07.137027
872	Ocampo	16	2020-08-13 15:04:07.138484	2020-08-13 15:04:07.138484
873	Jungapeo	16	2020-08-13 15:04:07.139862	2020-08-13 15:04:07.139862
874	Zitácuaro	16	2020-08-13 15:04:07.141381	2020-08-13 15:04:07.141381
875	Tuzantla	16	2020-08-13 15:04:07.14301	2020-08-13 15:04:07.14301
876	Juárez	16	2020-08-13 15:04:07.144592	2020-08-13 15:04:07.144592
877	Susupuato	16	2020-08-13 15:04:07.146152	2020-08-13 15:04:07.146152
878	Pátzcuaro	16	2020-08-13 15:04:07.147812	2020-08-13 15:04:07.147812
879	Erongarícuaro	16	2020-08-13 15:04:07.149228	2020-08-13 15:04:07.149228
880	Huiramba	16	2020-08-13 15:04:07.150764	2020-08-13 15:04:07.150764
881	Tacámbaro	16	2020-08-13 15:04:07.152537	2020-08-13 15:04:07.152537
882	Turicato	16	2020-08-13 15:04:07.154083	2020-08-13 15:04:07.154083
883	Ziracuaretiro	16	2020-08-13 15:04:07.155583	2020-08-13 15:04:07.155583
884	Taretan	16	2020-08-13 15:04:07.157356	2020-08-13 15:04:07.157356
885	Gabriel Zamora	16	2020-08-13 15:04:07.159062	2020-08-13 15:04:07.159062
886	Nuevo Urecho	16	2020-08-13 15:04:07.160682	2020-08-13 15:04:07.160682
887	Múgica	16	2020-08-13 15:04:07.162327	2020-08-13 15:04:07.162327
888	Salvador Escalante	16	2020-08-13 15:04:07.163796	2020-08-13 15:04:07.163796
889	Ario	16	2020-08-13 15:04:07.165247	2020-08-13 15:04:07.165247
890	La Huacana	16	2020-08-13 15:04:07.166585	2020-08-13 15:04:07.166585
891	Churumuco	16	2020-08-13 15:04:07.167915	2020-08-13 15:04:07.167915
892	Nocupétaro	16	2020-08-13 15:04:07.169345	2020-08-13 15:04:07.169345
893	Carácuaro	16	2020-08-13 15:04:07.170739	2020-08-13 15:04:07.170739
894	Huetamo	16	2020-08-13 15:04:07.172129	2020-08-13 15:04:07.172129
895	San Lucas	16	2020-08-13 15:04:07.173514	2020-08-13 15:04:07.173514
896	Cuernavaca	17	2020-08-13 15:04:07.17497	2020-08-13 15:04:07.17497
897	Huitzilac	17	2020-08-13 15:04:07.176431	2020-08-13 15:04:07.176431
898	Tepoztlán	17	2020-08-13 15:04:07.177757	2020-08-13 15:04:07.177757
899	Tlalnepantla	17	2020-08-13 15:04:07.179153	2020-08-13 15:04:07.179153
900	Tlayacapan	17	2020-08-13 15:04:07.180486	2020-08-13 15:04:07.180486
901	Jiutepec	17	2020-08-13 15:04:07.182068	2020-08-13 15:04:07.182068
902	Temixco	17	2020-08-13 15:04:07.183749	2020-08-13 15:04:07.183749
903	Miacatlán	17	2020-08-13 15:04:07.185361	2020-08-13 15:04:07.185361
904	Coatlán del Río	17	2020-08-13 15:04:07.186953	2020-08-13 15:04:07.186953
905	Tetecala	17	2020-08-13 15:04:07.188611	2020-08-13 15:04:07.188611
906	Mazatepec	17	2020-08-13 15:04:07.19009	2020-08-13 15:04:07.19009
907	Amacuzac	17	2020-08-13 15:04:07.19161	2020-08-13 15:04:07.19161
908	Puente de Ixtla	17	2020-08-13 15:04:07.193021	2020-08-13 15:04:07.193021
909	Ayala	17	2020-08-13 15:04:07.194267	2020-08-13 15:04:07.194267
910	Yautepec	17	2020-08-13 15:04:07.195644	2020-08-13 15:04:07.195644
911	Cuautla	17	2020-08-13 15:04:07.196951	2020-08-13 15:04:07.196951
912	Emiliano Zapata	17	2020-08-13 15:04:07.198341	2020-08-13 15:04:07.198341
913	Tlaltizapán de Zapata	17	2020-08-13 15:04:07.199922	2020-08-13 15:04:07.199922
914	Zacatepec	17	2020-08-13 15:04:07.201383	2020-08-13 15:04:07.201383
915	Xochitepec	17	2020-08-13 15:04:07.202709	2020-08-13 15:04:07.202709
916	Tetela del Volcán	17	2020-08-13 15:04:07.204222	2020-08-13 15:04:07.204222
917	Yecapixtla	17	2020-08-13 15:04:07.205887	2020-08-13 15:04:07.205887
918	Totolapan	17	2020-08-13 15:04:07.207448	2020-08-13 15:04:07.207448
919	Atlatlahucan	17	2020-08-13 15:04:07.208962	2020-08-13 15:04:07.208962
920	Ocuituco	17	2020-08-13 15:04:07.210549	2020-08-13 15:04:07.210549
921	Temoac	17	2020-08-13 15:04:07.212212	2020-08-13 15:04:07.212212
922	Zacualpan	17	2020-08-13 15:04:07.213843	2020-08-13 15:04:07.213843
923	Jojutla	17	2020-08-13 15:04:07.215463	2020-08-13 15:04:07.215463
924	Tepalcingo	17	2020-08-13 15:04:07.217214	2020-08-13 15:04:07.217214
925	Jonacatepec	17	2020-08-13 15:04:07.218995	2020-08-13 15:04:07.218995
926	Axochiapan	17	2020-08-13 15:04:07.220578	2020-08-13 15:04:07.220578
927	Jantetelco	17	2020-08-13 15:04:07.222131	2020-08-13 15:04:07.222131
928	Tlaquiltenango	17	2020-08-13 15:04:07.223634	2020-08-13 15:04:07.223634
929	Tepic	18	2020-08-13 15:04:07.225111	2020-08-13 15:04:07.225111
930	Tuxpan	18	2020-08-13 15:04:07.226584	2020-08-13 15:04:07.226584
931	Santiago Ixcuintla	18	2020-08-13 15:04:07.227811	2020-08-13 15:04:07.227811
932	Acaponeta	18	2020-08-13 15:04:07.22923	2020-08-13 15:04:07.22923
933	Tecuala	18	2020-08-13 15:04:07.230717	2020-08-13 15:04:07.230717
934	Huajicori	18	2020-08-13 15:04:07.232233	2020-08-13 15:04:07.232233
935	Del Nayar	18	2020-08-13 15:04:07.233757	2020-08-13 15:04:07.233757
936	La Yesca	18	2020-08-13 15:04:07.235397	2020-08-13 15:04:07.235397
937	Ruíz	18	2020-08-13 15:04:07.237009	2020-08-13 15:04:07.237009
938	Rosamorada	18	2020-08-13 15:04:07.238614	2020-08-13 15:04:07.238614
939	Compostela	18	2020-08-13 15:04:07.240157	2020-08-13 15:04:07.240157
940	Bahía de Banderas	18	2020-08-13 15:04:07.241582	2020-08-13 15:04:07.241582
941	San Blas	18	2020-08-13 15:04:07.243016	2020-08-13 15:04:07.243016
942	Xalisco	18	2020-08-13 15:04:07.244462	2020-08-13 15:04:07.244462
943	San Pedro Lagunillas	18	2020-08-13 15:04:07.245925	2020-08-13 15:04:07.245925
944	Santa María del Oro	18	2020-08-13 15:04:07.249523	2020-08-13 15:04:07.249523
945	Jala	18	2020-08-13 15:04:07.251748	2020-08-13 15:04:07.251748
946	Ahuacatlán	18	2020-08-13 15:04:07.253677	2020-08-13 15:04:07.253677
947	Ixtlán del Río	18	2020-08-13 15:04:07.255529	2020-08-13 15:04:07.255529
948	Amatlán de Cañas	18	2020-08-13 15:04:07.257263	2020-08-13 15:04:07.257263
949	Monterrey	19	2020-08-13 15:04:07.258946	2020-08-13 15:04:07.258946
950	Anáhuac	19	2020-08-13 15:04:07.260485	2020-08-13 15:04:07.260485
951	Lampazos de Naranjo	19	2020-08-13 15:04:07.262101	2020-08-13 15:04:07.262101
952	Mina	19	2020-08-13 15:04:07.263686	2020-08-13 15:04:07.263686
953	Bustamante	19	2020-08-13 15:04:07.265171	2020-08-13 15:04:07.265171
954	Sabinas Hidalgo	19	2020-08-13 15:04:07.266692	2020-08-13 15:04:07.266692
955	Villaldama	19	2020-08-13 15:04:07.268183	2020-08-13 15:04:07.268183
956	Vallecillo	19	2020-08-13 15:04:07.26969	2020-08-13 15:04:07.26969
957	Parás	19	2020-08-13 15:04:07.271289	2020-08-13 15:04:07.271289
958	Salinas Victoria	19	2020-08-13 15:04:07.272919	2020-08-13 15:04:07.272919
959	Ciénega de Flores	19	2020-08-13 15:04:07.274569	2020-08-13 15:04:07.274569
960	Hidalgo	19	2020-08-13 15:04:07.276046	2020-08-13 15:04:07.276046
961	Abasolo	19	2020-08-13 15:04:07.277676	2020-08-13 15:04:07.277676
962	Higueras	19	2020-08-13 15:04:07.279482	2020-08-13 15:04:07.279482
963	General Zuazua	19	2020-08-13 15:04:07.281143	2020-08-13 15:04:07.281143
964	Agualeguas	19	2020-08-13 15:04:07.28273	2020-08-13 15:04:07.28273
965	General Treviño	19	2020-08-13 15:04:07.284243	2020-08-13 15:04:07.284243
966	Cerralvo	19	2020-08-13 15:04:07.285908	2020-08-13 15:04:07.285908
967	Melchor Ocampo	19	2020-08-13 15:04:07.288358	2020-08-13 15:04:07.288358
968	García	19	2020-08-13 15:04:07.290544	2020-08-13 15:04:07.290544
969	General Escobedo	19	2020-08-13 15:04:07.293036	2020-08-13 15:04:07.293036
970	Santa Catarina	19	2020-08-13 15:04:07.295147	2020-08-13 15:04:07.295147
971	San Pedro Garza García	19	2020-08-13 15:04:07.297032	2020-08-13 15:04:07.297032
972	San Nicolás de los Garza	19	2020-08-13 15:04:07.299123	2020-08-13 15:04:07.299123
973	El Carmen	19	2020-08-13 15:04:07.301089	2020-08-13 15:04:07.301089
974	Apodaca	19	2020-08-13 15:04:07.303709	2020-08-13 15:04:07.303709
975	Pesquería	19	2020-08-13 15:04:07.306035	2020-08-13 15:04:07.306035
976	Marín	19	2020-08-13 15:04:07.308039	2020-08-13 15:04:07.308039
977	Doctor González	19	2020-08-13 15:04:07.309789	2020-08-13 15:04:07.309789
978	Los Ramones	19	2020-08-13 15:04:07.311841	2020-08-13 15:04:07.311841
979	Los Herreras	19	2020-08-13 15:04:07.314645	2020-08-13 15:04:07.314645
980	Los Aldamas	19	2020-08-13 15:04:07.316493	2020-08-13 15:04:07.316493
981	Doctor Coss	19	2020-08-13 15:04:07.318509	2020-08-13 15:04:07.318509
982	General Bravo	19	2020-08-13 15:04:07.321099	2020-08-13 15:04:07.321099
983	China	19	2020-08-13 15:04:07.324595	2020-08-13 15:04:07.324595
984	Guadalupe	19	2020-08-13 15:04:07.326623	2020-08-13 15:04:07.326623
985	Juárez	19	2020-08-13 15:04:07.328032	2020-08-13 15:04:07.328032
986	Santiago	19	2020-08-13 15:04:07.329496	2020-08-13 15:04:07.329496
987	Allende	19	2020-08-13 15:04:07.330987	2020-08-13 15:04:07.330987
988	General Terán	19	2020-08-13 15:04:07.332317	2020-08-13 15:04:07.332317
989	Cadereyta Jiménez	19	2020-08-13 15:04:07.333806	2020-08-13 15:04:07.333806
990	Montemorelos	19	2020-08-13 15:04:07.33532	2020-08-13 15:04:07.33532
991	Rayones	19	2020-08-13 15:04:07.336735	2020-08-13 15:04:07.336735
992	Linares	19	2020-08-13 15:04:07.338285	2020-08-13 15:04:07.338285
993	Iturbide	19	2020-08-13 15:04:07.339892	2020-08-13 15:04:07.339892
994	Galeana	19	2020-08-13 15:04:07.341279	2020-08-13 15:04:07.341279
995	Hualahuises	19	2020-08-13 15:04:07.34274	2020-08-13 15:04:07.34274
996	Doctor Arroyo	19	2020-08-13 15:04:07.34426	2020-08-13 15:04:07.34426
997	Aramberri	19	2020-08-13 15:04:07.346134	2020-08-13 15:04:07.346134
998	General Zaragoza	19	2020-08-13 15:04:07.348272	2020-08-13 15:04:07.348272
999	Mier y Noriega	19	2020-08-13 15:04:07.350969	2020-08-13 15:04:07.350969
1000	Oaxaca de Juárez	20	2020-08-13 15:04:07.355581	2020-08-13 15:04:07.355581
1001	Villa de Etla	20	2020-08-13 15:04:07.357361	2020-08-13 15:04:07.357361
1002	San Juan Bautista Atatlahuca	20	2020-08-13 15:04:07.358982	2020-08-13 15:04:07.358982
1003	San Jerónimo Sosola	20	2020-08-13 15:04:07.360656	2020-08-13 15:04:07.360656
1004	San Juan Bautista Jayacatlán	20	2020-08-13 15:04:07.362146	2020-08-13 15:04:07.362146
1005	San Francisco Telixtlahuaca	20	2020-08-13 15:04:07.363637	2020-08-13 15:04:07.363637
1006	Santiago Tenango	20	2020-08-13 15:04:07.365154	2020-08-13 15:04:07.365154
1007	San Pablo Huitzo	20	2020-08-13 15:04:07.366561	2020-08-13 15:04:07.366561
1008	San Juan del Estado	20	2020-08-13 15:04:07.367956	2020-08-13 15:04:07.367956
1009	Magdalena Apasco	20	2020-08-13 15:04:07.369636	2020-08-13 15:04:07.369636
1010	Santiago Suchilquitongo	20	2020-08-13 15:04:07.371568	2020-08-13 15:04:07.371568
1011	San Juan Bautista Guelache	20	2020-08-13 15:04:07.381372	2020-08-13 15:04:07.381372
1012	Reyes Etla	20	2020-08-13 15:04:07.383107	2020-08-13 15:04:07.383107
1013	Nazareno Etla	20	2020-08-13 15:04:07.384695	2020-08-13 15:04:07.384695
1014	San Andrés Zautla	20	2020-08-13 15:04:07.386269	2020-08-13 15:04:07.386269
1015	San Agustín Etla	20	2020-08-13 15:04:07.387871	2020-08-13 15:04:07.387871
1016	Soledad Etla	20	2020-08-13 15:04:07.389309	2020-08-13 15:04:07.389309
1017	Santo Tomás Mazaltepec	20	2020-08-13 15:04:07.390766	2020-08-13 15:04:07.390766
1018	Guadalupe Etla	20	2020-08-13 15:04:07.392205	2020-08-13 15:04:07.392205
1019	San Pablo Etla	20	2020-08-13 15:04:07.393668	2020-08-13 15:04:07.393668
1020	San Felipe Tejalápam	20	2020-08-13 15:04:07.395705	2020-08-13 15:04:07.395705
1021	San Lorenzo Cacaotepec	20	2020-08-13 15:04:07.397839	2020-08-13 15:04:07.397839
1022	Santa María Peñoles	20	2020-08-13 15:04:07.399929	2020-08-13 15:04:07.399929
1023	Santiago Tlazoyaltepec	20	2020-08-13 15:04:07.401657	2020-08-13 15:04:07.401657
1024	Tlalixtac de Cabrera	20	2020-08-13 15:04:07.403423	2020-08-13 15:04:07.403423
1025	San Jacinto Amilpas	20	2020-08-13 15:04:07.405221	2020-08-13 15:04:07.405221
1026	San Andrés Huayápam	20	2020-08-13 15:04:07.406695	2020-08-13 15:04:07.406695
1027	San Agustín Yatareni	20	2020-08-13 15:04:07.408126	2020-08-13 15:04:07.408126
1028	Santo Domingo Tomaltepec	20	2020-08-13 15:04:07.409538	2020-08-13 15:04:07.409538
1029	Santa María del Tule	20	2020-08-13 15:04:07.410937	2020-08-13 15:04:07.410937
1030	San Juan Bautista Tuxtepec	20	2020-08-13 15:04:07.412289	2020-08-13 15:04:07.412289
1031	Loma Bonita	20	2020-08-13 15:04:07.413665	2020-08-13 15:04:07.413665
1032	San José Independencia	20	2020-08-13 15:04:07.414936	2020-08-13 15:04:07.414936
1033	Cosolapa	20	2020-08-13 15:04:07.416314	2020-08-13 15:04:07.416314
1034	Acatlán de Pérez Figueroa	20	2020-08-13 15:04:07.417861	2020-08-13 15:04:07.417861
1035	San Miguel Soyaltepec	20	2020-08-13 15:04:07.419679	2020-08-13 15:04:07.419679
1036	Ayotzintepec	20	2020-08-13 15:04:07.421317	2020-08-13 15:04:07.421317
1037	San Pedro Ixcatlán	20	2020-08-13 15:04:07.422855	2020-08-13 15:04:07.422855
1038	San José Chiltepec	20	2020-08-13 15:04:07.424394	2020-08-13 15:04:07.424394
1039	San Felipe Jalapa de Díaz	20	2020-08-13 15:04:07.425793	2020-08-13 15:04:07.425793
1040	Santa María Jacatepec	20	2020-08-13 15:04:07.427116	2020-08-13 15:04:07.427116
1041	San Lucas Ojitlán	20	2020-08-13 15:04:07.428617	2020-08-13 15:04:07.428617
1042	San Juan Bautista Valle Nacional	20	2020-08-13 15:04:07.429988	2020-08-13 15:04:07.429988
1043	San Felipe Usila	20	2020-08-13 15:04:07.431345	2020-08-13 15:04:07.431345
1044	Huautla de Jiménez	20	2020-08-13 15:04:07.433001	2020-08-13 15:04:07.433001
1045	Santa María Chilchotla	20	2020-08-13 15:04:07.435173	2020-08-13 15:04:07.435173
1046	Santa Ana Ateixtlahuaca	20	2020-08-13 15:04:07.436967	2020-08-13 15:04:07.436967
1047	San Lorenzo Cuaunecuiltitla	20	2020-08-13 15:04:07.438554	2020-08-13 15:04:07.438554
1048	San Francisco Huehuetlán	20	2020-08-13 15:04:07.440237	2020-08-13 15:04:07.440237
1049	San Pedro Ocopetatillo	20	2020-08-13 15:04:07.441817	2020-08-13 15:04:07.441817
1050	Santa Cruz Acatepec	20	2020-08-13 15:04:07.443339	2020-08-13 15:04:07.443339
1051	Eloxochitlán de Flores Magón	20	2020-08-13 15:04:07.444804	2020-08-13 15:04:07.444804
1052	Santiago Texcalcingo	20	2020-08-13 15:04:07.446349	2020-08-13 15:04:07.446349
1053	Teotitlán de Flores Magón	20	2020-08-13 15:04:07.448129	2020-08-13 15:04:07.448129
1054	Santa María Teopoxco	20	2020-08-13 15:04:07.449641	2020-08-13 15:04:07.449641
1055	San Martín Toxpalan	20	2020-08-13 15:04:07.451051	2020-08-13 15:04:07.451051
1056	San Jerónimo Tecóatl	20	2020-08-13 15:04:07.452466	2020-08-13 15:04:07.452466
1057	Santa María la Asunción	20	2020-08-13 15:04:07.454012	2020-08-13 15:04:07.454012
1058	Huautepec	20	2020-08-13 15:04:07.455438	2020-08-13 15:04:07.455438
1059	San Juan Coatzóspam	20	2020-08-13 15:04:07.456964	2020-08-13 15:04:07.456964
1060	San Lucas Zoquiápam	20	2020-08-13 15:04:07.458323	2020-08-13 15:04:07.458323
1061	San Antonio Nanahuatípam	20	2020-08-13 15:04:07.460143	2020-08-13 15:04:07.460143
1062	San José Tenango	20	2020-08-13 15:04:07.461971	2020-08-13 15:04:07.461971
1063	San Mateo Yoloxochitlán	20	2020-08-13 15:04:07.463803	2020-08-13 15:04:07.463803
1064	San Bartolomé Ayautla	20	2020-08-13 15:04:07.465499	2020-08-13 15:04:07.465499
1065	Mazatlán Villa de Flores	20	2020-08-13 15:04:07.467321	2020-08-13 15:04:07.467321
1066	San Juan de los Cués	20	2020-08-13 15:04:07.468981	2020-08-13 15:04:07.468981
1067	Santa María Tecomavaca	20	2020-08-13 15:04:07.470593	2020-08-13 15:04:07.470593
1068	Santa María Ixcatlán	20	2020-08-13 15:04:07.472129	2020-08-13 15:04:07.472129
1069	San Juan Bautista Cuicatlán	20	2020-08-13 15:04:07.473504	2020-08-13 15:04:07.473504
1070	Cuyamecalco Villa de Zaragoza	20	2020-08-13 15:04:07.474991	2020-08-13 15:04:07.474991
1071	Santa Ana Cuauhtémoc	20	2020-08-13 15:04:07.476792	2020-08-13 15:04:07.476792
1072	Chiquihuitlán de Benito Juárez	20	2020-08-13 15:04:07.478252	2020-08-13 15:04:07.478252
1073	San Pedro Teutila	20	2020-08-13 15:04:07.479671	2020-08-13 15:04:07.479671
1074	San Miguel Santa Flor	20	2020-08-13 15:04:07.48119	2020-08-13 15:04:07.48119
1075	Santa María Tlalixtac	20	2020-08-13 15:04:07.482653	2020-08-13 15:04:07.482653
1076	San Andrés Teotilálpam	20	2020-08-13 15:04:07.484047	2020-08-13 15:04:07.484047
1077	San Francisco Chapulapa	20	2020-08-13 15:04:07.48556	2020-08-13 15:04:07.48556
1078	Concepción Pápalo	20	2020-08-13 15:04:07.487057	2020-08-13 15:04:07.487057
1079	Santos Reyes Pápalo	20	2020-08-13 15:04:07.488448	2020-08-13 15:04:07.488448
1080	San Juan Bautista Tlacoatzintepec	20	2020-08-13 15:04:07.489936	2020-08-13 15:04:07.489936
1081	Santa María Pápalo	20	2020-08-13 15:04:07.491417	2020-08-13 15:04:07.491417
1082	San Juan Tepeuxila	20	2020-08-13 15:04:07.49292	2020-08-13 15:04:07.49292
1083	San Pedro Sochiápam	20	2020-08-13 15:04:07.494784	2020-08-13 15:04:07.494784
1084	Valerio Trujano	20	2020-08-13 15:04:07.496676	2020-08-13 15:04:07.496676
1085	San Pedro Jocotipac	20	2020-08-13 15:04:07.498911	2020-08-13 15:04:07.498911
1086	Santa María Texcatitlán	20	2020-08-13 15:04:07.501442	2020-08-13 15:04:07.501442
1087	San Pedro Jaltepetongo	20	2020-08-13 15:04:07.503399	2020-08-13 15:04:07.503399
1088	Santiago Nacaltepec	20	2020-08-13 15:04:07.505332	2020-08-13 15:04:07.505332
1089	Natividad	20	2020-08-13 15:04:07.50718	2020-08-13 15:04:07.50718
1090	San Juan Quiotepec	20	2020-08-13 15:04:07.508992	2020-08-13 15:04:07.508992
1091	San Pedro Yólox	20	2020-08-13 15:04:07.510698	2020-08-13 15:04:07.510698
1092	Santiago Comaltepec	20	2020-08-13 15:04:07.512583	2020-08-13 15:04:07.512583
1093	Abejones	20	2020-08-13 15:04:07.514414	2020-08-13 15:04:07.514414
1094	San Pablo Macuiltianguis	20	2020-08-13 15:04:07.516095	2020-08-13 15:04:07.516095
1095	Ixtlán de Juárez	20	2020-08-13 15:04:07.517761	2020-08-13 15:04:07.517761
1096	San Juan Atepec	20	2020-08-13 15:04:07.519449	2020-08-13 15:04:07.519449
1097	San Pedro Yaneri	20	2020-08-13 15:04:07.52094	2020-08-13 15:04:07.52094
1098	San Miguel Aloápam	20	2020-08-13 15:04:07.522556	2020-08-13 15:04:07.522556
1099	Teococuilco de Marcos Pérez	20	2020-08-13 15:04:07.524454	2020-08-13 15:04:07.524454
1100	Santa Ana Yareni	20	2020-08-13 15:04:07.52628	2020-08-13 15:04:07.52628
1101	San Juan Evangelista Analco	20	2020-08-13 15:04:07.528002	2020-08-13 15:04:07.528002
1102	Santa María Jaltianguis	20	2020-08-13 15:04:07.529689	2020-08-13 15:04:07.529689
1103	San Miguel del Río	20	2020-08-13 15:04:07.53129	2020-08-13 15:04:07.53129
1104	San Juan Chicomezúchil	20	2020-08-13 15:04:07.533082	2020-08-13 15:04:07.533082
1105	Capulálpam de Méndez	20	2020-08-13 15:04:07.534981	2020-08-13 15:04:07.534981
1106	Nuevo Zoquiápam	20	2020-08-13 15:04:07.536809	2020-08-13 15:04:07.536809
1107	Santiago Xiacuí	20	2020-08-13 15:04:07.538489	2020-08-13 15:04:07.538489
1108	Guelatao de Juárez	20	2020-08-13 15:04:07.540049	2020-08-13 15:04:07.540049
1109	Santa Catarina Ixtepeji	20	2020-08-13 15:04:07.541661	2020-08-13 15:04:07.541661
1110	San Miguel Yotao	20	2020-08-13 15:04:07.543114	2020-08-13 15:04:07.543114
1111	Santa Catarina Lachatao	20	2020-08-13 15:04:07.54465	2020-08-13 15:04:07.54465
1112	San Miguel Amatlán	20	2020-08-13 15:04:07.546439	2020-08-13 15:04:07.546439
1113	Santa María Yavesía	20	2020-08-13 15:04:07.547944	2020-08-13 15:04:07.547944
1114	Santiago Laxopa	20	2020-08-13 15:04:07.549313	2020-08-13 15:04:07.549313
1115	San Ildefonso Villa Alta	20	2020-08-13 15:04:07.550697	2020-08-13 15:04:07.550697
1116	Santiago Camotlán	20	2020-08-13 15:04:07.552098	2020-08-13 15:04:07.552098
1117	San Juan Yaeé	20	2020-08-13 15:04:07.553642	2020-08-13 15:04:07.553642
1118	Santiago Lalopa	20	2020-08-13 15:04:07.555127	2020-08-13 15:04:07.555127
1119	San Juan Yatzona	20	2020-08-13 15:04:07.55654	2020-08-13 15:04:07.55654
1120	Villa Talea de Castro	20	2020-08-13 15:04:07.55805	2020-08-13 15:04:07.55805
1121	Tanetze de Zaragoza	20	2020-08-13 15:04:07.559855	2020-08-13 15:04:07.559855
1122	San Juan Juquila Vijanos	20	2020-08-13 15:04:07.561239	2020-08-13 15:04:07.561239
1123	San Cristóbal Lachirioag	20	2020-08-13 15:04:07.56281	2020-08-13 15:04:07.56281
1124	Santa María Temaxcalapa	20	2020-08-13 15:04:07.564506	2020-08-13 15:04:07.564506
1125	Santo Domingo Roayaga	20	2020-08-13 15:04:07.565984	2020-08-13 15:04:07.565984
1126	Santa María Yalina	20	2020-08-13 15:04:07.567663	2020-08-13 15:04:07.567663
1127	San Andrés Solaga	20	2020-08-13 15:04:07.569816	2020-08-13 15:04:07.569816
1128	San Juan Tabaá	20	2020-08-13 15:04:07.571513	2020-08-13 15:04:07.571513
1129	San Melchor Betaza	20	2020-08-13 15:04:07.573317	2020-08-13 15:04:07.573317
1130	San Andrés Yaá	20	2020-08-13 15:04:07.57543	2020-08-13 15:04:07.57543
1131	San Bartolomé Zoogocho	20	2020-08-13 15:04:07.577228	2020-08-13 15:04:07.577228
1132	San Baltazar Yatzachi el Bajo	20	2020-08-13 15:04:07.57897	2020-08-13 15:04:07.57897
1133	Santiago Zoochila	20	2020-08-13 15:04:07.580508	2020-08-13 15:04:07.580508
1134	Villa Hidalgo	20	2020-08-13 15:04:07.581953	2020-08-13 15:04:07.581953
1135	San Francisco Cajonos	20	2020-08-13 15:04:07.583424	2020-08-13 15:04:07.583424
1136	San Mateo Cajonos	20	2020-08-13 15:04:07.584853	2020-08-13 15:04:07.584853
1137	San Pedro Cajonos	20	2020-08-13 15:04:07.586342	2020-08-13 15:04:07.586342
1138	Santo Domingo Xagacía	20	2020-08-13 15:04:07.587773	2020-08-13 15:04:07.587773
1139	San Pablo Yaganiza	20	2020-08-13 15:04:07.589268	2020-08-13 15:04:07.589268
1140	Santiago Choápam	20	2020-08-13 15:04:07.590713	2020-08-13 15:04:07.590713
1141	Santiago Jocotepec	20	2020-08-13 15:04:07.592408	2020-08-13 15:04:07.592408
1142	San Juan Lalana	20	2020-08-13 15:04:07.593942	2020-08-13 15:04:07.593942
1143	Santiago Yaveo	20	2020-08-13 15:04:07.595968	2020-08-13 15:04:07.595968
1144	San Juan Petlapa	20	2020-08-13 15:04:07.597708	2020-08-13 15:04:07.597708
1145	San Juan Comaltepec	20	2020-08-13 15:04:07.600845	2020-08-13 15:04:07.600845
1146	Heroica Ciudad de Huajuapan de León	20	2020-08-13 15:04:07.60326	2020-08-13 15:04:07.60326
1147	Santiago Chazumba	20	2020-08-13 15:04:07.604994	2020-08-13 15:04:07.604994
1148	Cosoltepec	20	2020-08-13 15:04:07.606542	2020-08-13 15:04:07.606542
1149	San Pedro y San Pablo Tequixtepec	20	2020-08-13 15:04:07.608274	2020-08-13 15:04:07.608274
1150	San Juan Bautista Suchitepec	20	2020-08-13 15:04:07.609785	2020-08-13 15:04:07.609785
1151	Santa Catarina Zapoquila	20	2020-08-13 15:04:07.611414	2020-08-13 15:04:07.611414
1152	Santiago Miltepec	20	2020-08-13 15:04:07.612999	2020-08-13 15:04:07.612999
1153	San Jerónimo Silacayoapilla	20	2020-08-13 15:04:07.614497	2020-08-13 15:04:07.614497
1154	Zapotitlán Palmas	20	2020-08-13 15:04:07.616027	2020-08-13 15:04:07.616027
1155	San Andrés Dinicuiti	20	2020-08-13 15:04:07.617622	2020-08-13 15:04:07.617622
1156	Santiago Cacaloxtepec	20	2020-08-13 15:04:07.61921	2020-08-13 15:04:07.61921
1157	Asunción Cuyotepeji	20	2020-08-13 15:04:07.620827	2020-08-13 15:04:07.620827
1158	Santa María Camotlán	20	2020-08-13 15:04:07.622355	2020-08-13 15:04:07.622355
1159	Santiago Huajolotitlán	20	2020-08-13 15:04:07.623954	2020-08-13 15:04:07.623954
1160	Santiago Tamazola	20	2020-08-13 15:04:07.625534	2020-08-13 15:04:07.625534
1161	San Juan Cieneguilla	20	2020-08-13 15:04:07.627225	2020-08-13 15:04:07.627225
1162	Zapotitlán Lagunas	20	2020-08-13 15:04:07.62869	2020-08-13 15:04:07.62869
1163	San Juan Ihualtepec	20	2020-08-13 15:04:07.630184	2020-08-13 15:04:07.630184
1164	San Nicolás Hidalgo	20	2020-08-13 15:04:07.631593	2020-08-13 15:04:07.631593
1590	Naupan	21	2020-08-13 15:04:08.369398	2020-08-13 15:04:08.369398
1165	Guadalupe de Ramírez	20	2020-08-13 15:04:07.633266	2020-08-13 15:04:07.633266
1166	San Andrés Tepetlapa	20	2020-08-13 15:04:07.634966	2020-08-13 15:04:07.634966
1167	San Miguel Ahuehuetitlán	20	2020-08-13 15:04:07.63647	2020-08-13 15:04:07.63647
1168	San Mateo Nejápam	20	2020-08-13 15:04:07.638359	2020-08-13 15:04:07.638359
1169	San Juan Bautista Tlachichilco	20	2020-08-13 15:04:07.63998	2020-08-13 15:04:07.63998
1170	Tezoatlán de Segura y Luna	20	2020-08-13 15:04:07.641474	2020-08-13 15:04:07.641474
1171	Fresnillo de Trujano	20	2020-08-13 15:04:07.643036	2020-08-13 15:04:07.643036
1172	Santiago Ayuquililla	20	2020-08-13 15:04:07.644605	2020-08-13 15:04:07.644605
1173	San José Ayuquila	20	2020-08-13 15:04:07.646487	2020-08-13 15:04:07.646487
1174	San Martín Zacatepec	20	2020-08-13 15:04:07.648126	2020-08-13 15:04:07.648126
1175	San Miguel Amatitlán	20	2020-08-13 15:04:07.649664	2020-08-13 15:04:07.649664
1176	Mariscala de Juárez	20	2020-08-13 15:04:07.651317	2020-08-13 15:04:07.651317
1177	Santa Cruz Tacache de Mina	20	2020-08-13 15:04:07.652841	2020-08-13 15:04:07.652841
1178	San Simón Zahuatlán	20	2020-08-13 15:04:07.654373	2020-08-13 15:04:07.654373
1179	San Marcos Arteaga	20	2020-08-13 15:04:07.655936	2020-08-13 15:04:07.655936
1180	San Jorge Nuchita	20	2020-08-13 15:04:07.657679	2020-08-13 15:04:07.657679
1181	Santos Reyes Yucuná	20	2020-08-13 15:04:07.659239	2020-08-13 15:04:07.659239
1182	Santo Domingo Tonalá	20	2020-08-13 15:04:07.660781	2020-08-13 15:04:07.660781
1183	Santo Domingo Yodohino	20	2020-08-13 15:04:07.662352	2020-08-13 15:04:07.662352
1184	San Juan Bautista Coixtlahuaca	20	2020-08-13 15:04:07.663927	2020-08-13 15:04:07.663927
1185	Tepelmeme Villa de Morelos	20	2020-08-13 15:04:07.665458	2020-08-13 15:04:07.665458
1186	Concepción Buenavista	20	2020-08-13 15:04:07.66704	2020-08-13 15:04:07.66704
1187	Santiago Ihuitlán Plumas	20	2020-08-13 15:04:07.668814	2020-08-13 15:04:07.668814
1188	Tlacotepec Plumas	20	2020-08-13 15:04:07.670398	2020-08-13 15:04:07.670398
1189	San Francisco Teopan	20	2020-08-13 15:04:07.672011	2020-08-13 15:04:07.672011
1190	Santa Magdalena Jicotlán	20	2020-08-13 15:04:07.673642	2020-08-13 15:04:07.673642
1191	San Mateo Tlapiltepec	20	2020-08-13 15:04:07.675179	2020-08-13 15:04:07.675179
1192	San Miguel Tequixtepec	20	2020-08-13 15:04:07.676768	2020-08-13 15:04:07.676768
1193	San Miguel Tulancingo	20	2020-08-13 15:04:07.678436	2020-08-13 15:04:07.678436
1194	Santiago Tepetlapa	20	2020-08-13 15:04:07.679972	2020-08-13 15:04:07.679972
1195	San Cristóbal Suchixtlahuaca	20	2020-08-13 15:04:07.681714	2020-08-13 15:04:07.681714
1196	Santa María Nativitas	20	2020-08-13 15:04:07.683227	2020-08-13 15:04:07.683227
1197	Silacayoápam	20	2020-08-13 15:04:07.68473	2020-08-13 15:04:07.68473
1198	Santiago Yucuyachi	20	2020-08-13 15:04:07.686171	2020-08-13 15:04:07.686171
1199	San Lorenzo Victoria	20	2020-08-13 15:04:07.687834	2020-08-13 15:04:07.687834
1200	San Agustín Atenango	20	2020-08-13 15:04:07.689458	2020-08-13 15:04:07.689458
1201	Calihualá	20	2020-08-13 15:04:07.691129	2020-08-13 15:04:07.691129
1202	Santa Cruz de Bravo	20	2020-08-13 15:04:07.69297	2020-08-13 15:04:07.69297
1203	Ixpantepec Nieves	20	2020-08-13 15:04:07.694921	2020-08-13 15:04:07.694921
1204	San Francisco Tlapancingo	20	2020-08-13 15:04:07.696723	2020-08-13 15:04:07.696723
1205	Santiago del Río	20	2020-08-13 15:04:07.698514	2020-08-13 15:04:07.698514
1206	San Pedro y San Pablo Teposcolula	20	2020-08-13 15:04:07.700194	2020-08-13 15:04:07.700194
1207	La Trinidad Vista Hermosa	20	2020-08-13 15:04:07.701726	2020-08-13 15:04:07.701726
1208	Villa de Tamazulápam del Progreso	20	2020-08-13 15:04:07.703344	2020-08-13 15:04:07.703344
1209	San Pedro Nopala	20	2020-08-13 15:04:07.704954	2020-08-13 15:04:07.704954
1210	Teotongo	20	2020-08-13 15:04:07.706629	2020-08-13 15:04:07.706629
1211	San Antonio Acutla	20	2020-08-13 15:04:07.708206	2020-08-13 15:04:07.708206
1212	Villa Tejúpam de la Unión	20	2020-08-13 15:04:07.709788	2020-08-13 15:04:07.709788
1213	Santo Domingo Tonaltepec	20	2020-08-13 15:04:07.711434	2020-08-13 15:04:07.711434
1214	Villa de Chilapa de Díaz	20	2020-08-13 15:04:07.713178	2020-08-13 15:04:07.713178
1215	San Antonino Monte Verde	20	2020-08-13 15:04:07.7148	2020-08-13 15:04:07.7148
1216	San Andrés Lagunas	20	2020-08-13 15:04:07.716454	2020-08-13 15:04:07.716454
1217	San Pedro Yucunama	20	2020-08-13 15:04:07.718238	2020-08-13 15:04:07.718238
1218	San Juan Teposcolula	20	2020-08-13 15:04:07.719939	2020-08-13 15:04:07.719939
1219	San Bartolo Soyaltepec	20	2020-08-13 15:04:07.721637	2020-08-13 15:04:07.721637
1220	Santiago Yolomécatl	20	2020-08-13 15:04:07.723638	2020-08-13 15:04:07.723638
1221	San Sebastián Nicananduta	20	2020-08-13 15:04:07.725634	2020-08-13 15:04:07.725634
1222	Santo Domingo Tlatayápam	20	2020-08-13 15:04:07.727312	2020-08-13 15:04:07.727312
1223	Santa María Nduayaco	20	2020-08-13 15:04:07.729181	2020-08-13 15:04:07.729181
1224	San Vicente Nuñú	20	2020-08-13 15:04:07.737554	2020-08-13 15:04:07.737554
1225	San Pedro Topiltepec	20	2020-08-13 15:04:07.746437	2020-08-13 15:04:07.746437
1226	Santiago Nejapilla	20	2020-08-13 15:04:07.754909	2020-08-13 15:04:07.754909
1227	Asunción Nochixtlán	20	2020-08-13 15:04:07.770228	2020-08-13 15:04:07.770228
1228	San Miguel Huautla	20	2020-08-13 15:04:07.779255	2020-08-13 15:04:07.779255
1229	San Miguel Chicahua	20	2020-08-13 15:04:07.781761	2020-08-13 15:04:07.781761
1230	Santa María Apazco	20	2020-08-13 15:04:07.783773	2020-08-13 15:04:07.783773
1231	Santiago Apoala	20	2020-08-13 15:04:07.785887	2020-08-13 15:04:07.785887
1232	Santa María Chachoápam	20	2020-08-13 15:04:07.787861	2020-08-13 15:04:07.787861
1233	San Pedro Coxcaltepec Cántaros	20	2020-08-13 15:04:07.789803	2020-08-13 15:04:07.789803
1234	Santiago Huauclilla	20	2020-08-13 15:04:07.791613	2020-08-13 15:04:07.791613
1235	Santo Domingo Yanhuitlán	20	2020-08-13 15:04:07.793529	2020-08-13 15:04:07.793529
1236	San Andrés Sinaxtla	20	2020-08-13 15:04:07.795826	2020-08-13 15:04:07.795826
1237	San Juan Yucuita	20	2020-08-13 15:04:07.798208	2020-08-13 15:04:07.798208
1238	San Juan Sayultepec	20	2020-08-13 15:04:07.800361	2020-08-13 15:04:07.800361
1239	Santiago Tillo	20	2020-08-13 15:04:07.802292	2020-08-13 15:04:07.802292
1240	San Francisco Chindúa	20	2020-08-13 15:04:07.804242	2020-08-13 15:04:07.804242
1241	San Mateo Etlatongo	20	2020-08-13 15:04:07.806179	2020-08-13 15:04:07.806179
1242	Santa Inés de Zaragoza	20	2020-08-13 15:04:07.808052	2020-08-13 15:04:07.808052
1243	Santiago Juxtlahuaca	20	2020-08-13 15:04:07.809851	2020-08-13 15:04:07.809851
1244	San Miguel Tlacotepec	20	2020-08-13 15:04:07.81126	2020-08-13 15:04:07.81126
1245	San Sebastián Tecomaxtlahuaca	20	2020-08-13 15:04:07.813047	2020-08-13 15:04:07.813047
1246	Santos Reyes Tepejillo	20	2020-08-13 15:04:07.814686	2020-08-13 15:04:07.814686
1247	San Juan Mixtepec -Dto. 08 -	20	2020-08-13 15:04:07.816456	2020-08-13 15:04:07.816456
1248	San Martín Peras	20	2020-08-13 15:04:07.818217	2020-08-13 15:04:07.818217
1249	Coicoyán de las Flores	20	2020-08-13 15:04:07.819978	2020-08-13 15:04:07.819978
1250	Heroica Ciudad de Tlaxiaco	20	2020-08-13 15:04:07.821574	2020-08-13 15:04:07.821574
1251	San Juan Ñumí	20	2020-08-13 15:04:07.823033	2020-08-13 15:04:07.823033
1252	San Pedro Mártir Yucuxaco	20	2020-08-13 15:04:07.824538	2020-08-13 15:04:07.824538
1253	San Martín Huamelúlpam	20	2020-08-13 15:04:07.825914	2020-08-13 15:04:07.825914
1254	Santa Cruz Tayata	20	2020-08-13 15:04:07.827311	2020-08-13 15:04:07.827311
1255	Santiago Nundiche	20	2020-08-13 15:04:07.828711	2020-08-13 15:04:07.828711
1256	Santa María del Rosario	20	2020-08-13 15:04:07.830204	2020-08-13 15:04:07.830204
1257	San Juan Achiutla	20	2020-08-13 15:04:07.831562	2020-08-13 15:04:07.831562
1258	Santa Catarina Tayata	20	2020-08-13 15:04:07.83298	2020-08-13 15:04:07.83298
1259	San Cristóbal Amoltepec	20	2020-08-13 15:04:07.834411	2020-08-13 15:04:07.834411
1260	San Miguel Achiutla	20	2020-08-13 15:04:07.835886	2020-08-13 15:04:07.835886
1261	San Martín Itunyoso	20	2020-08-13 15:04:07.837409	2020-08-13 15:04:07.837409
1262	Magdalena Peñasco	20	2020-08-13 15:04:07.838946	2020-08-13 15:04:07.838946
1263	San Bartolomé Yucuañe	20	2020-08-13 15:04:07.840337	2020-08-13 15:04:07.840337
1264	Santa Cruz Nundaco	20	2020-08-13 15:04:07.841824	2020-08-13 15:04:07.841824
1265	San Agustín Tlacotepec	20	2020-08-13 15:04:07.843223	2020-08-13 15:04:07.843223
1266	Santo Tomás Ocotepec	20	2020-08-13 15:04:07.844637	2020-08-13 15:04:07.844637
1267	San Antonio Sinicahua	20	2020-08-13 15:04:07.846071	2020-08-13 15:04:07.846071
1268	San Mateo Peñasco	20	2020-08-13 15:04:07.847407	2020-08-13 15:04:07.847407
1269	Santa María Tataltepec	20	2020-08-13 15:04:07.84883	2020-08-13 15:04:07.84883
1270	San Pedro Molinos	20	2020-08-13 15:04:07.850272	2020-08-13 15:04:07.850272
1271	Santa María Yosoyúa	20	2020-08-13 15:04:07.851761	2020-08-13 15:04:07.851761
1272	San Juan Teita	20	2020-08-13 15:04:07.853341	2020-08-13 15:04:07.853341
1273	Magdalena Jaltepec	20	2020-08-13 15:04:07.854778	2020-08-13 15:04:07.854778
1274	Magdalena Yodocono de Porfirio Díaz	20	2020-08-13 15:04:07.856275	2020-08-13 15:04:07.856275
1275	San Miguel Tecomatlán	20	2020-08-13 15:04:07.857762	2020-08-13 15:04:07.857762
1276	Magdalena Zahuatlán	20	2020-08-13 15:04:07.859146	2020-08-13 15:04:07.859146
1277	San Francisco Nuxaño	20	2020-08-13 15:04:07.860571	2020-08-13 15:04:07.860571
1278	San Pedro Tidaá	20	2020-08-13 15:04:07.861962	2020-08-13 15:04:07.861962
1279	San Francisco Jaltepetongo	20	2020-08-13 15:04:07.863448	2020-08-13 15:04:07.863448
1280	Santiago Tilantongo	20	2020-08-13 15:04:07.864914	2020-08-13 15:04:07.864914
1281	San Juan Diuxi	20	2020-08-13 15:04:07.866755	2020-08-13 15:04:07.866755
1282	San Andrés Nuxiño	20	2020-08-13 15:04:07.868397	2020-08-13 15:04:07.868397
1283	San Juan Tamazola	20	2020-08-13 15:04:07.870052	2020-08-13 15:04:07.870052
1284	Santo Domingo Nuxaá	20	2020-08-13 15:04:07.871653	2020-08-13 15:04:07.871653
1285	Yutanduchi de Guerrero	20	2020-08-13 15:04:07.873297	2020-08-13 15:04:07.873297
1286	San Pedro Teozacoalco	20	2020-08-13 15:04:07.874919	2020-08-13 15:04:07.874919
1287	San Miguel Piedras	20	2020-08-13 15:04:07.876747	2020-08-13 15:04:07.876747
1288	San Mateo Sindihui	20	2020-08-13 15:04:07.878742	2020-08-13 15:04:07.878742
1289	Heroica Ciudad de Juchitán de Zaragoza	20	2020-08-13 15:04:07.88055	2020-08-13 15:04:07.88055
1290	Ciudad Ixtepec	20	2020-08-13 15:04:07.882268	2020-08-13 15:04:07.882268
1291	El Espinal	20	2020-08-13 15:04:07.883867	2020-08-13 15:04:07.883867
1292	Santo Domingo Ingenio	20	2020-08-13 15:04:07.88543	2020-08-13 15:04:07.88543
1293	Santa María Xadani	20	2020-08-13 15:04:07.887069	2020-08-13 15:04:07.887069
1294	Santiago Niltepec	20	2020-08-13 15:04:07.889092	2020-08-13 15:04:07.889092
1295	San Dionisio del Mar	20	2020-08-13 15:04:07.890872	2020-08-13 15:04:07.890872
1296	Asunción Ixtaltepec	20	2020-08-13 15:04:07.892711	2020-08-13 15:04:07.892711
1297	San Francisco del Mar	20	2020-08-13 15:04:07.894492	2020-08-13 15:04:07.894492
1298	Unión Hidalgo	20	2020-08-13 15:04:07.896296	2020-08-13 15:04:07.896296
1299	San Miguel Chimalapa	20	2020-08-13 15:04:07.898041	2020-08-13 15:04:07.898041
1300	Santo Domingo Zanatepec	20	2020-08-13 15:04:07.899658	2020-08-13 15:04:07.899658
1301	Reforma de Pineda	20	2020-08-13 15:04:07.922098	2020-08-13 15:04:07.922098
1302	San Francisco Ixhuatán	20	2020-08-13 15:04:07.923447	2020-08-13 15:04:07.923447
1303	San Pedro Tapanatepec	20	2020-08-13 15:04:07.9249	2020-08-13 15:04:07.9249
1304	Chahuites	20	2020-08-13 15:04:07.926424	2020-08-13 15:04:07.926424
1305	Santiago Zacatepec	20	2020-08-13 15:04:07.92799	2020-08-13 15:04:07.92799
1306	Santo Domingo Tepuxtepec	20	2020-08-13 15:04:07.929776	2020-08-13 15:04:07.929776
1307	San Juan Cotzocón	20	2020-08-13 15:04:07.931486	2020-08-13 15:04:07.931486
1308	San Juan Mazatlán	20	2020-08-13 15:04:07.933211	2020-08-13 15:04:07.933211
1309	Totontepec Villa de Morelos	20	2020-08-13 15:04:07.934925	2020-08-13 15:04:07.934925
1310	Mixistlán de la Reforma	20	2020-08-13 15:04:07.936561	2020-08-13 15:04:07.936561
1311	Santa María Tlahuitoltepec	20	2020-08-13 15:04:07.938201	2020-08-13 15:04:07.938201
1312	Santa María Alotepec	20	2020-08-13 15:04:07.939711	2020-08-13 15:04:07.939711
1313	Santiago Atitlán	20	2020-08-13 15:04:07.941171	2020-08-13 15:04:07.941171
1314	Tamazulápam del Espíritu Santo	20	2020-08-13 15:04:07.942625	2020-08-13 15:04:07.942625
1315	San Pedro y San Pablo Ayutla	20	2020-08-13 15:04:07.944052	2020-08-13 15:04:07.944052
1316	Santa María Tepantlali	20	2020-08-13 15:04:07.945443	2020-08-13 15:04:07.945443
1317	San Miguel Quetzaltepec	20	2020-08-13 15:04:07.946839	2020-08-13 15:04:07.946839
1318	Asunción Cacalotepec	20	2020-08-13 15:04:07.94859	2020-08-13 15:04:07.94859
1319	San Pedro Ocotepec	20	2020-08-13 15:04:07.950134	2020-08-13 15:04:07.950134
1320	San Lucas Camotlán	20	2020-08-13 15:04:07.951715	2020-08-13 15:04:07.951715
1321	Santiago Ixcuintepec	20	2020-08-13 15:04:07.953326	2020-08-13 15:04:07.953326
1322	Matías Romero Avendaño	20	2020-08-13 15:04:07.954667	2020-08-13 15:04:07.954667
1323	San Juan Guichicovi	20	2020-08-13 15:04:07.955999	2020-08-13 15:04:07.955999
1324	Santo Domingo Petapa	20	2020-08-13 15:04:07.957475	2020-08-13 15:04:07.957475
1325	Santa María Chimalapa	20	2020-08-13 15:04:07.959149	2020-08-13 15:04:07.959149
1326	Santa María Petapa	20	2020-08-13 15:04:07.960624	2020-08-13 15:04:07.960624
1327	El Barrio de la Soledad	20	2020-08-13 15:04:07.962126	2020-08-13 15:04:07.962126
1328	Tlacolula de Matamoros	20	2020-08-13 15:04:07.963481	2020-08-13 15:04:07.963481
1329	San Sebastián Abasolo	20	2020-08-13 15:04:07.964824	2020-08-13 15:04:07.964824
1330	Villa Díaz Ordaz	20	2020-08-13 15:04:07.966241	2020-08-13 15:04:07.966241
1331	Santa María Guelacé	20	2020-08-13 15:04:07.967624	2020-08-13 15:04:07.967624
1332	Teotitlán del Valle	20	2020-08-13 15:04:07.969057	2020-08-13 15:04:07.969057
1333	San Francisco Lachigoló	20	2020-08-13 15:04:07.970514	2020-08-13 15:04:07.970514
1334	San Sebastián Teitipac	20	2020-08-13 15:04:07.971946	2020-08-13 15:04:07.971946
1335	Santa Ana del Valle	20	2020-08-13 15:04:07.973452	2020-08-13 15:04:07.973452
1336	San Pablo Villa de Mitla	20	2020-08-13 15:04:07.974894	2020-08-13 15:04:07.974894
1337	Santiago Matatlán	20	2020-08-13 15:04:07.976357	2020-08-13 15:04:07.976357
1338	Santo Domingo Albarradas	20	2020-08-13 15:04:07.977856	2020-08-13 15:04:07.977856
1339	Rojas de Cuauhtémoc	20	2020-08-13 15:04:07.979226	2020-08-13 15:04:07.979226
1340	San Juan Teitipac	20	2020-08-13 15:04:07.980614	2020-08-13 15:04:07.980614
1341	Santa Cruz Papalutla	20	2020-08-13 15:04:07.982017	2020-08-13 15:04:07.982017
1342	Magdalena Teitipac	20	2020-08-13 15:04:07.983346	2020-08-13 15:04:07.983346
1343	San Jerónimo Tlacochahuaya	20	2020-08-13 15:04:07.984663	2020-08-13 15:04:07.984663
1344	San Juan Guelavía	20	2020-08-13 15:04:07.985995	2020-08-13 15:04:07.985995
1345	San Lucas Quiaviní	20	2020-08-13 15:04:07.987273	2020-08-13 15:04:07.987273
1346	San Juan del Río	20	2020-08-13 15:04:07.988711	2020-08-13 15:04:07.988711
1347	San Bartolomé Quialana	20	2020-08-13 15:04:07.990169	2020-08-13 15:04:07.990169
1348	San Lorenzo Albarradas	20	2020-08-13 15:04:07.991436	2020-08-13 15:04:07.991436
1349	San Pedro Totolápam	20	2020-08-13 15:04:07.993053	2020-08-13 15:04:07.993053
1350	San Pedro Quiatoni	20	2020-08-13 15:04:07.994879	2020-08-13 15:04:07.994879
1351	Santa María Zoquitlán	20	2020-08-13 15:04:07.996547	2020-08-13 15:04:07.996547
1352	San Dionisio Ocotepec	20	2020-08-13 15:04:07.998071	2020-08-13 15:04:07.998071
1353	San Carlos Yautepec	20	2020-08-13 15:04:07.999633	2020-08-13 15:04:07.999633
1354	San Juan Juquila Mixes	20	2020-08-13 15:04:08.001198	2020-08-13 15:04:08.001198
1355	Nejapa de Madero	20	2020-08-13 15:04:08.002668	2020-08-13 15:04:08.002668
1356	Santa Ana Tavela	20	2020-08-13 15:04:08.004104	2020-08-13 15:04:08.004104
1357	San Juan Lajarcia	20	2020-08-13 15:04:08.005366	2020-08-13 15:04:08.005366
1358	San Bartolo Yautepec	20	2020-08-13 15:04:08.006696	2020-08-13 15:04:08.006696
1359	Santa María Ecatepec	20	2020-08-13 15:04:08.008134	2020-08-13 15:04:08.008134
1360	Asunción Tlacolulita	20	2020-08-13 15:04:08.009527	2020-08-13 15:04:08.009527
1361	San Pedro Mártir Quiechapa	20	2020-08-13 15:04:08.010997	2020-08-13 15:04:08.010997
1362	Santa María Quiegolani	20	2020-08-13 15:04:08.012402	2020-08-13 15:04:08.012402
1363	Santa Catarina Quioquitani	20	2020-08-13 15:04:08.013677	2020-08-13 15:04:08.013677
1364	Santa Catalina Quierí	20	2020-08-13 15:04:08.015146	2020-08-13 15:04:08.015146
1365	Salina Cruz	20	2020-08-13 15:04:08.016881	2020-08-13 15:04:08.016881
1366	Santiago Lachiguiri	20	2020-08-13 15:04:08.018392	2020-08-13 15:04:08.018392
1367	Santa María Jalapa del Marqués	20	2020-08-13 15:04:08.019843	2020-08-13 15:04:08.019843
1368	Santa María Totolapilla	20	2020-08-13 15:04:08.021593	2020-08-13 15:04:08.021593
1369	Santiago Laollaga	20	2020-08-13 15:04:08.023166	2020-08-13 15:04:08.023166
1370	Guevea de Humboldt	20	2020-08-13 15:04:08.024619	2020-08-13 15:04:08.024619
1371	Santo Domingo Chihuitán	20	2020-08-13 15:04:08.026366	2020-08-13 15:04:08.026366
1372	Santa María Guienagati	20	2020-08-13 15:04:08.027944	2020-08-13 15:04:08.027944
1373	Magdalena Tequisistlán	20	2020-08-13 15:04:08.029356	2020-08-13 15:04:08.029356
1374	Magdalena Tlacotepec	20	2020-08-13 15:04:08.031162	2020-08-13 15:04:08.031162
1375	San Pedro Comitancillo	20	2020-08-13 15:04:08.032786	2020-08-13 15:04:08.032786
1376	Santa María Mixtequilla	20	2020-08-13 15:04:08.034251	2020-08-13 15:04:08.034251
1377	Santo Domingo Tehuantepec	20	2020-08-13 15:04:08.035986	2020-08-13 15:04:08.035986
1378	San Pedro Huamelula	20	2020-08-13 15:04:08.037611	2020-08-13 15:04:08.037611
1379	San Pedro Huilotepec	20	2020-08-13 15:04:08.039075	2020-08-13 15:04:08.039075
1380	San Mateo del Mar	20	2020-08-13 15:04:08.040803	2020-08-13 15:04:08.040803
1381	San Blas Atempa	20	2020-08-13 15:04:08.042455	2020-08-13 15:04:08.042455
1382	Santiago Astata	20	2020-08-13 15:04:08.043842	2020-08-13 15:04:08.043842
1383	San Miguel Tenango	20	2020-08-13 15:04:08.045191	2020-08-13 15:04:08.045191
1384	Miahuatlán de Porfirio Díaz	20	2020-08-13 15:04:08.046681	2020-08-13 15:04:08.046681
1385	San Nicolás	20	2020-08-13 15:04:08.048172	2020-08-13 15:04:08.048172
1386	San Simón Almolongas	20	2020-08-13 15:04:08.049536	2020-08-13 15:04:08.049536
1387	San Luis Amatlán	20	2020-08-13 15:04:08.050917	2020-08-13 15:04:08.050917
1388	San José Lachiguiri	20	2020-08-13 15:04:08.052385	2020-08-13 15:04:08.052385
1389	Sitio de Xitlapehua	20	2020-08-13 15:04:08.053835	2020-08-13 15:04:08.053835
1390	San Francisco Logueche	20	2020-08-13 15:04:08.055612	2020-08-13 15:04:08.055612
1391	Santa Ana	20	2020-08-13 15:04:08.057419	2020-08-13 15:04:08.057419
1392	Santa Cruz Xitla	20	2020-08-13 15:04:08.059145	2020-08-13 15:04:08.059145
1393	Monjas	20	2020-08-13 15:04:08.060746	2020-08-13 15:04:08.060746
1394	San Ildefonso Amatlán	20	2020-08-13 15:04:08.06231	2020-08-13 15:04:08.06231
1395	Santa Catarina Cuixtla	20	2020-08-13 15:04:08.063722	2020-08-13 15:04:08.063722
1396	San José del Peñasco	20	2020-08-13 15:04:08.065256	2020-08-13 15:04:08.065256
1397	San Cristóbal Amatlán	20	2020-08-13 15:04:08.066965	2020-08-13 15:04:08.066965
1398	San Juan Mixtepec -Dto. 26 -	20	2020-08-13 15:04:08.068736	2020-08-13 15:04:08.068736
1399	San Pedro Mixtepec -Dto. 26 -	20	2020-08-13 15:04:08.070324	2020-08-13 15:04:08.070324
1400	Santa Lucía Miahuatlán	20	2020-08-13 15:04:08.071917	2020-08-13 15:04:08.071917
1401	San Jerónimo Coatlán	20	2020-08-13 15:04:08.073356	2020-08-13 15:04:08.073356
1402	San Sebastián Coatlán	20	2020-08-13 15:04:08.074829	2020-08-13 15:04:08.074829
1403	San Pablo Coatlán	20	2020-08-13 15:04:08.076231	2020-08-13 15:04:08.076231
1404	San Mateo Río Hondo	20	2020-08-13 15:04:08.077543	2020-08-13 15:04:08.077543
1405	Santo Tomás Tamazulapan	20	2020-08-13 15:04:08.079034	2020-08-13 15:04:08.079034
1406	San Andrés Paxtlán	20	2020-08-13 15:04:08.080493	2020-08-13 15:04:08.080493
1407	Santa María Ozolotepec	20	2020-08-13 15:04:08.081796	2020-08-13 15:04:08.081796
1408	San Miguel Coatlán	20	2020-08-13 15:04:08.083596	2020-08-13 15:04:08.083596
1409	San Sebastián Río Hondo	20	2020-08-13 15:04:08.085082	2020-08-13 15:04:08.085082
1410	San Miguel Suchixtepec	20	2020-08-13 15:04:08.086552	2020-08-13 15:04:08.086552
1411	Santo Domingo Ozolotepec	20	2020-08-13 15:04:08.087998	2020-08-13 15:04:08.087998
1412	San Francisco Ozolotepec	20	2020-08-13 15:04:08.089448	2020-08-13 15:04:08.089448
1413	Santiago Xanica	20	2020-08-13 15:04:08.090799	2020-08-13 15:04:08.090799
1414	San Marcial Ozolotepec	20	2020-08-13 15:04:08.09232	2020-08-13 15:04:08.09232
1415	San Juan Ozolotepec	20	2020-08-13 15:04:08.093666	2020-08-13 15:04:08.093666
1416	San Pedro Pochutla	20	2020-08-13 15:04:08.09539	2020-08-13 15:04:08.09539
1417	Santo Domingo de Morelos	20	2020-08-13 15:04:08.097121	2020-08-13 15:04:08.097121
1418	Santa Catarina Loxicha	20	2020-08-13 15:04:08.098842	2020-08-13 15:04:08.098842
1419	San Agustín Loxicha	20	2020-08-13 15:04:08.100546	2020-08-13 15:04:08.100546
1420	San Baltazar Loxicha	20	2020-08-13 15:04:08.102324	2020-08-13 15:04:08.102324
1421	Santa María Colotepec	20	2020-08-13 15:04:08.103991	2020-08-13 15:04:08.103991
1422	San Bartolomé Loxicha	20	2020-08-13 15:04:08.10559	2020-08-13 15:04:08.10559
1423	Santa María Tonameca	20	2020-08-13 15:04:08.107197	2020-08-13 15:04:08.107197
1424	Candelaria Loxicha	20	2020-08-13 15:04:08.108588	2020-08-13 15:04:08.108588
1425	Pluma Hidalgo	20	2020-08-13 15:04:08.110234	2020-08-13 15:04:08.110234
1426	San Pedro el Alto	20	2020-08-13 15:04:08.111997	2020-08-13 15:04:08.111997
1427	San Mateo Piñas	20	2020-08-13 15:04:08.11357	2020-08-13 15:04:08.11357
1428	Santa María Huatulco	20	2020-08-13 15:04:08.115178	2020-08-13 15:04:08.115178
1429	San Miguel del Puerto	20	2020-08-13 15:04:08.116848	2020-08-13 15:04:08.116848
1430	Putla Villa de Guerrero	20	2020-08-13 15:04:08.118593	2020-08-13 15:04:08.118593
1431	Constancia del Rosario	20	2020-08-13 15:04:08.120438	2020-08-13 15:04:08.120438
1432	Mesones Hidalgo	20	2020-08-13 15:04:08.122155	2020-08-13 15:04:08.122155
1433	Santa María Zacatepec	20	2020-08-13 15:04:08.123843	2020-08-13 15:04:08.123843
1434	San Pedro Amuzgos	20	2020-08-13 15:04:08.125686	2020-08-13 15:04:08.125686
1435	La Reforma	20	2020-08-13 15:04:08.127595	2020-08-13 15:04:08.127595
1436	Santa María Ipalapa	20	2020-08-13 15:04:08.129401	2020-08-13 15:04:08.129401
1437	Chalcatongo de Hidalgo	20	2020-08-13 15:04:08.130923	2020-08-13 15:04:08.130923
1438	Santa María Yucuhiti	20	2020-08-13 15:04:08.132493	2020-08-13 15:04:08.132493
1439	San Esteban Atatlahuca	20	2020-08-13 15:04:08.134152	2020-08-13 15:04:08.134152
1440	Santa Catarina Ticuá	20	2020-08-13 15:04:08.135831	2020-08-13 15:04:08.135831
1441	Santiago Nuyoó	20	2020-08-13 15:04:08.137257	2020-08-13 15:04:08.137257
1442	Santa Catarina Yosonotú	20	2020-08-13 15:04:08.138606	2020-08-13 15:04:08.138606
1443	San Miguel el Grande	20	2020-08-13 15:04:08.139818	2020-08-13 15:04:08.139818
1444	Santo Domingo Ixcatlán	20	2020-08-13 15:04:08.141153	2020-08-13 15:04:08.141153
1445	San Pablo Tijaltepec	20	2020-08-13 15:04:08.142591	2020-08-13 15:04:08.142591
1446	Santa Cruz Tacahua	20	2020-08-13 15:04:08.144026	2020-08-13 15:04:08.144026
1447	Santa Lucía Monteverde	20	2020-08-13 15:04:08.145488	2020-08-13 15:04:08.145488
1448	San Andrés Cabecera Nueva	20	2020-08-13 15:04:08.147103	2020-08-13 15:04:08.147103
1449	Santa María Yolotepec	20	2020-08-13 15:04:08.148859	2020-08-13 15:04:08.148859
1450	Santiago Yosondúa	20	2020-08-13 15:04:08.150514	2020-08-13 15:04:08.150514
1451	Santa Cruz Itundujia	20	2020-08-13 15:04:08.152147	2020-08-13 15:04:08.152147
1452	Zimatlán de Álvarez	20	2020-08-13 15:04:08.153771	2020-08-13 15:04:08.153771
1453	San Bernardo Mixtepec	20	2020-08-13 15:04:08.155227	2020-08-13 15:04:08.155227
1454	Santa Cruz Mixtepec	20	2020-08-13 15:04:08.156691	2020-08-13 15:04:08.156691
1455	San Miguel Mixtepec	20	2020-08-13 15:04:08.158101	2020-08-13 15:04:08.158101
1456	Santa María Atzompa	20	2020-08-13 15:04:08.159547	2020-08-13 15:04:08.159547
1457	San Andrés Ixtlahuaca	20	2020-08-13 15:04:08.161042	2020-08-13 15:04:08.161042
1458	Santa Cruz Amilpas	20	2020-08-13 15:04:08.162407	2020-08-13 15:04:08.162407
1459	Santa Cruz Xoxocotlán	20	2020-08-13 15:04:08.163635	2020-08-13 15:04:08.163635
1460	Santa Lucía del Camino	20	2020-08-13 15:04:08.165035	2020-08-13 15:04:08.165035
1461	San Pedro Ixtlahuaca	20	2020-08-13 15:04:08.166473	2020-08-13 15:04:08.166473
1462	San Antonio de la Cal	20	2020-08-13 15:04:08.167943	2020-08-13 15:04:08.167943
1463	San Agustín de las Juntas	20	2020-08-13 15:04:08.169439	2020-08-13 15:04:08.169439
1464	San Pablo Huixtepec	20	2020-08-13 15:04:08.170845	2020-08-13 15:04:08.170845
1465	Ánimas Trujano	20	2020-08-13 15:04:08.172228	2020-08-13 15:04:08.172228
1466	San Jacinto Tlacotepec	20	2020-08-13 15:04:08.17352	2020-08-13 15:04:08.17352
1467	San Raymundo Jalpan	20	2020-08-13 15:04:08.174868	2020-08-13 15:04:08.174868
1468	Trinidad Zaachila	20	2020-08-13 15:04:08.176453	2020-08-13 15:04:08.176453
1469	Santa María Coyotepec	20	2020-08-13 15:04:08.178166	2020-08-13 15:04:08.178166
1470	San Bartolo Coyotepec	20	2020-08-13 15:04:08.180527	2020-08-13 15:04:08.180527
1471	Santa Inés Yatzeche	20	2020-08-13 15:04:08.182435	2020-08-13 15:04:08.182435
1472	Ciénega de Zimatlán	20	2020-08-13 15:04:08.184071	2020-08-13 15:04:08.184071
1473	San Antonio Huitepec	20	2020-08-13 15:04:08.185701	2020-08-13 15:04:08.185701
1474	Villa de Zaachila	20	2020-08-13 15:04:08.187101	2020-08-13 15:04:08.187101
1475	San Sebastián Tutla	20	2020-08-13 15:04:08.188429	2020-08-13 15:04:08.188429
1476	San Miguel Peras	20	2020-08-13 15:04:08.189845	2020-08-13 15:04:08.189845
1477	San Pablo Cuatro Venados	20	2020-08-13 15:04:08.191222	2020-08-13 15:04:08.191222
1478	Santa Inés del Monte	20	2020-08-13 15:04:08.192581	2020-08-13 15:04:08.192581
1479	Santa Gertrudis	20	2020-08-13 15:04:08.193981	2020-08-13 15:04:08.193981
1480	San Antonino el Alto	20	2020-08-13 15:04:08.19536	2020-08-13 15:04:08.19536
1481	Magdalena Mixtepec	20	2020-08-13 15:04:08.196678	2020-08-13 15:04:08.196678
1482	Santa Catarina Quiané	20	2020-08-13 15:04:08.197978	2020-08-13 15:04:08.197978
1483	Ayoquezco de Aldama	20	2020-08-13 15:04:08.199303	2020-08-13 15:04:08.199303
1484	Santa Ana Tlapacoyan	20	2020-08-13 15:04:08.20077	2020-08-13 15:04:08.20077
1485	Santa Cruz Zenzontepec	20	2020-08-13 15:04:08.202172	2020-08-13 15:04:08.202172
1486	San Francisco Cahuacuá	20	2020-08-13 15:04:08.203387	2020-08-13 15:04:08.203387
1487	San Mateo Yucutindoo	20	2020-08-13 15:04:08.20471	2020-08-13 15:04:08.20471
1488	Santiago Textitlán	20	2020-08-13 15:04:08.20605	2020-08-13 15:04:08.20605
1489	Santiago Amoltepec	20	2020-08-13 15:04:08.207456	2020-08-13 15:04:08.207456
1490	Santa María Zaniza	20	2020-08-13 15:04:08.208733	2020-08-13 15:04:08.208733
1491	Santo Domingo Teojomulco	20	2020-08-13 15:04:08.210025	2020-08-13 15:04:08.210025
1492	Cuilápam de Guerrero	20	2020-08-13 15:04:08.21128	2020-08-13 15:04:08.21128
1493	Villa Sola de Vega	20	2020-08-13 15:04:08.212583	2020-08-13 15:04:08.212583
1494	Santa María Lachixío	20	2020-08-13 15:04:08.213953	2020-08-13 15:04:08.213953
1495	San Vicente Lachixío	20	2020-08-13 15:04:08.215424	2020-08-13 15:04:08.215424
1496	San Lorenzo Texmelúcan	20	2020-08-13 15:04:08.216719	2020-08-13 15:04:08.216719
1497	Santa María Sola	20	2020-08-13 15:04:08.217948	2020-08-13 15:04:08.217948
1498	San Francisco Sola	20	2020-08-13 15:04:08.219182	2020-08-13 15:04:08.219182
1499	San Ildefonso Sola	20	2020-08-13 15:04:08.220466	2020-08-13 15:04:08.220466
1500	Santiago Minas	20	2020-08-13 15:04:08.221693	2020-08-13 15:04:08.221693
1501	Heroica Ciudad de Ejutla de Crespo	20	2020-08-13 15:04:08.22298	2020-08-13 15:04:08.22298
1502	San Martín Tilcajete	20	2020-08-13 15:04:08.224416	2020-08-13 15:04:08.224416
1503	Santo Tomás Jalieza	20	2020-08-13 15:04:08.225859	2020-08-13 15:04:08.225859
1504	San Juan Chilateca	20	2020-08-13 15:04:08.227284	2020-08-13 15:04:08.227284
1505	Ocotlán de Morelos	20	2020-08-13 15:04:08.228608	2020-08-13 15:04:08.228608
1506	Santa Ana Zegache	20	2020-08-13 15:04:08.229959	2020-08-13 15:04:08.229959
1507	Santiago Apóstol	20	2020-08-13 15:04:08.231494	2020-08-13 15:04:08.231494
1508	San Antonino Castillo Velasco	20	2020-08-13 15:04:08.232864	2020-08-13 15:04:08.232864
1509	Asunción Ocotlán	20	2020-08-13 15:04:08.234207	2020-08-13 15:04:08.234207
1510	San Pedro Mártir	20	2020-08-13 15:04:08.23559	2020-08-13 15:04:08.23559
1511	San Dionisio Ocotlán	20	2020-08-13 15:04:08.23811	2020-08-13 15:04:08.23811
1512	Magdalena Ocotlán	20	2020-08-13 15:04:08.239794	2020-08-13 15:04:08.239794
1513	San Miguel Tilquiápam	20	2020-08-13 15:04:08.24144	2020-08-13 15:04:08.24144
1514	Santa Catarina Minas	20	2020-08-13 15:04:08.243014	2020-08-13 15:04:08.243014
1515	San Baltazar Chichicápam	20	2020-08-13 15:04:08.244617	2020-08-13 15:04:08.244617
1516	San Pedro Apóstol	20	2020-08-13 15:04:08.246286	2020-08-13 15:04:08.246286
1517	Santa Lucía Ocotlán	20	2020-08-13 15:04:08.247823	2020-08-13 15:04:08.247823
1518	San Jerónimo Taviche	20	2020-08-13 15:04:08.24931	2020-08-13 15:04:08.24931
1519	San Andrés Zabache	20	2020-08-13 15:04:08.250946	2020-08-13 15:04:08.250946
1520	San José del Progreso	20	2020-08-13 15:04:08.252504	2020-08-13 15:04:08.252504
1521	Yaxe	20	2020-08-13 15:04:08.253888	2020-08-13 15:04:08.253888
1522	San Pedro Taviche	20	2020-08-13 15:04:08.255405	2020-08-13 15:04:08.255405
1523	San Martín de los Cansecos	20	2020-08-13 15:04:08.256971	2020-08-13 15:04:08.256971
1524	San Martín Lachilá	20	2020-08-13 15:04:08.258425	2020-08-13 15:04:08.258425
1525	La Pe	20	2020-08-13 15:04:08.260033	2020-08-13 15:04:08.260033
1526	La Compañía	20	2020-08-13 15:04:08.261446	2020-08-13 15:04:08.261446
1527	Coatecas Altas	20	2020-08-13 15:04:08.262823	2020-08-13 15:04:08.262823
1528	San Juan Lachigalla	20	2020-08-13 15:04:08.264376	2020-08-13 15:04:08.264376
1529	San Agustín Amatengo	20	2020-08-13 15:04:08.265954	2020-08-13 15:04:08.265954
1530	Taniche	20	2020-08-13 15:04:08.267427	2020-08-13 15:04:08.267427
1531	San Miguel Ejutla	20	2020-08-13 15:04:08.268834	2020-08-13 15:04:08.268834
1532	Yogana	20	2020-08-13 15:04:08.270374	2020-08-13 15:04:08.270374
1533	San Vicente Coatlán	20	2020-08-13 15:04:08.271934	2020-08-13 15:04:08.271934
1534	Santiago Pinotepa Nacional	20	2020-08-13 15:04:08.273468	2020-08-13 15:04:08.273468
1535	San Juan Cacahuatepec	20	2020-08-13 15:04:08.275117	2020-08-13 15:04:08.275117
1536	San Juan Bautista Lo de Soto	20	2020-08-13 15:04:08.276836	2020-08-13 15:04:08.276836
1537	Mártires de Tacubaya	20	2020-08-13 15:04:08.278537	2020-08-13 15:04:08.278537
1538	San Sebastián Ixcapa	20	2020-08-13 15:04:08.28009	2020-08-13 15:04:08.28009
1539	San Antonio Tepetlapa	20	2020-08-13 15:04:08.281683	2020-08-13 15:04:08.281683
1540	Santa María Cortijo	20	2020-08-13 15:04:08.283189	2020-08-13 15:04:08.283189
1541	Santiago Llano Grande	20	2020-08-13 15:04:08.284718	2020-08-13 15:04:08.284718
1542	San Miguel Tlacamama	20	2020-08-13 15:04:08.286086	2020-08-13 15:04:08.286086
1543	Santiago Tapextla	20	2020-08-13 15:04:08.287534	2020-08-13 15:04:08.287534
1544	San José Estancia Grande	20	2020-08-13 15:04:08.289054	2020-08-13 15:04:08.289054
1545	Santo Domingo Armenta	20	2020-08-13 15:04:08.290663	2020-08-13 15:04:08.290663
1546	Santiago Jamiltepec	20	2020-08-13 15:04:08.292056	2020-08-13 15:04:08.292056
1547	San Pedro Atoyac	20	2020-08-13 15:04:08.293688	2020-08-13 15:04:08.293688
1548	San Juan Colorado	20	2020-08-13 15:04:08.295333	2020-08-13 15:04:08.295333
1549	Santiago Ixtayutla	20	2020-08-13 15:04:08.297077	2020-08-13 15:04:08.297077
1550	San Pedro Jicayán	20	2020-08-13 15:04:08.298577	2020-08-13 15:04:08.298577
1551	Pinotepa de Don Luis	20	2020-08-13 15:04:08.300154	2020-08-13 15:04:08.300154
1552	San Lorenzo	20	2020-08-13 15:04:08.301656	2020-08-13 15:04:08.301656
1553	San Agustín Chayuco	20	2020-08-13 15:04:08.303219	2020-08-13 15:04:08.303219
1554	San Andrés Huaxpaltepec	20	2020-08-13 15:04:08.304744	2020-08-13 15:04:08.304744
1555	Santa Catarina Mechoacán	20	2020-08-13 15:04:08.306348	2020-08-13 15:04:08.306348
1556	Santiago Tetepec	20	2020-08-13 15:04:08.307716	2020-08-13 15:04:08.307716
1557	Santa María Huazolotitlán	20	2020-08-13 15:04:08.309349	2020-08-13 15:04:08.309349
1558	Villa de Tututepec de Melchor Ocampo	20	2020-08-13 15:04:08.31094	2020-08-13 15:04:08.31094
1559	Tataltepec de Valdés	20	2020-08-13 15:04:08.312387	2020-08-13 15:04:08.312387
1560	San Juan Quiahije	20	2020-08-13 15:04:08.313994	2020-08-13 15:04:08.313994
1561	San Miguel Panixtlahuaca	20	2020-08-13 15:04:08.315574	2020-08-13 15:04:08.315574
1562	Santa Catarina Juquila	20	2020-08-13 15:04:08.31722	2020-08-13 15:04:08.31722
1563	San Pedro Juchatengo	20	2020-08-13 15:04:08.318909	2020-08-13 15:04:08.318909
1564	Santiago Yaitepec	20	2020-08-13 15:04:08.320518	2020-08-13 15:04:08.320518
1565	San Juan Lachao	20	2020-08-13 15:04:08.322108	2020-08-13 15:04:08.322108
1566	Santa María Temaxcaltepec	20	2020-08-13 15:04:08.323727	2020-08-13 15:04:08.323727
1567	Santos Reyes Nopala	20	2020-08-13 15:04:08.331915	2020-08-13 15:04:08.331915
1568	San Gabriel Mixtepec	20	2020-08-13 15:04:08.333967	2020-08-13 15:04:08.333967
1569	San Pedro Mixtepec -Dto. 22 -	20	2020-08-13 15:04:08.335597	2020-08-13 15:04:08.335597
1570	Ahuazotepec	21	2020-08-13 15:04:08.33717	2020-08-13 15:04:08.33717
1571	Puebla	21	2020-08-13 15:04:08.338637	2020-08-13 15:04:08.338637
1572	Tlaltenango	21	2020-08-13 15:04:08.340126	2020-08-13 15:04:08.340126
1573	San Miguel Xoxtla	21	2020-08-13 15:04:08.341663	2020-08-13 15:04:08.341663
1574	Juan C. Bonilla	21	2020-08-13 15:04:08.343163	2020-08-13 15:04:08.343163
1575	Coronango	21	2020-08-13 15:04:08.344761	2020-08-13 15:04:08.344761
1576	Cuautlancingo	21	2020-08-13 15:04:08.346341	2020-08-13 15:04:08.346341
1577	San Pedro Cholula	21	2020-08-13 15:04:08.347954	2020-08-13 15:04:08.347954
1578	San Andrés Cholula	21	2020-08-13 15:04:08.349463	2020-08-13 15:04:08.349463
1579	Ocoyucan	21	2020-08-13 15:04:08.351126	2020-08-13 15:04:08.351126
1580	Amozoc	21	2020-08-13 15:04:08.352661	2020-08-13 15:04:08.352661
1581	Francisco Z. Mena	21	2020-08-13 15:04:08.354377	2020-08-13 15:04:08.354377
1582	Pantepec	21	2020-08-13 15:04:08.356184	2020-08-13 15:04:08.356184
1583	Venustiano Carranza	21	2020-08-13 15:04:08.357853	2020-08-13 15:04:08.357853
1584	Jalpan	21	2020-08-13 15:04:08.359486	2020-08-13 15:04:08.359486
1585	Tlaxco	21	2020-08-13 15:04:08.361417	2020-08-13 15:04:08.361417
1586	Tlacuilotepec	21	2020-08-13 15:04:08.362998	2020-08-13 15:04:08.362998
1587	Xicotepec	21	2020-08-13 15:04:08.364784	2020-08-13 15:04:08.364784
1588	Pahuatlán	21	2020-08-13 15:04:08.366402	2020-08-13 15:04:08.366402
1589	Honey	21	2020-08-13 15:04:08.367858	2020-08-13 15:04:08.367858
1591	Huauchinango	21	2020-08-13 15:04:08.370827	2020-08-13 15:04:08.370827
1592	Juan Galindo	21	2020-08-13 15:04:08.37216	2020-08-13 15:04:08.37216
1593	Tlaola	21	2020-08-13 15:04:08.373496	2020-08-13 15:04:08.373496
1594	Zihuateutla	21	2020-08-13 15:04:08.374975	2020-08-13 15:04:08.374975
1595	Jopala	21	2020-08-13 15:04:08.376582	2020-08-13 15:04:08.376582
1596	Tlapacoya	21	2020-08-13 15:04:08.378086	2020-08-13 15:04:08.378086
1597	Chignahuapan	21	2020-08-13 15:04:08.379631	2020-08-13 15:04:08.379631
1598	Zacatlán	21	2020-08-13 15:04:08.381236	2020-08-13 15:04:08.381236
1599	Chiconcuautla	21	2020-08-13 15:04:08.382854	2020-08-13 15:04:08.382854
1600	Ahuacatlán	21	2020-08-13 15:04:08.384485	2020-08-13 15:04:08.384485
1601	Tepetzintla	21	2020-08-13 15:04:08.38599	2020-08-13 15:04:08.38599
1602	San Felipe Tepatlán	21	2020-08-13 15:04:08.387631	2020-08-13 15:04:08.387631
1603	Amixtlán	21	2020-08-13 15:04:08.389235	2020-08-13 15:04:08.389235
1604	Tepango de Rodríguez	21	2020-08-13 15:04:08.391315	2020-08-13 15:04:08.391315
1605	Zongozotla	21	2020-08-13 15:04:08.393151	2020-08-13 15:04:08.393151
1606	Hermenegildo Galeana	21	2020-08-13 15:04:08.394774	2020-08-13 15:04:08.394774
1607	Olintla	21	2020-08-13 15:04:08.396234	2020-08-13 15:04:08.396234
1608	Coatepec	21	2020-08-13 15:04:08.397654	2020-08-13 15:04:08.397654
1609	Camocuautla	21	2020-08-13 15:04:08.399019	2020-08-13 15:04:08.399019
1610	Hueytlalpan	21	2020-08-13 15:04:08.400546	2020-08-13 15:04:08.400546
1611	Zapotitlán de Méndez	21	2020-08-13 15:04:08.402062	2020-08-13 15:04:08.402062
1612	Huitzilan de Serdán	21	2020-08-13 15:04:08.407111	2020-08-13 15:04:08.407111
1613	Xochitlán de Vicente Suárez	21	2020-08-13 15:04:08.408719	2020-08-13 15:04:08.408719
1614	Huehuetla	21	2020-08-13 15:04:08.410196	2020-08-13 15:04:08.410196
1615	Ixtepec	21	2020-08-13 15:04:08.411662	2020-08-13 15:04:08.411662
1616	Atlequizayan	21	2020-08-13 15:04:08.413104	2020-08-13 15:04:08.413104
1617	Tenampulco	21	2020-08-13 15:04:08.414477	2020-08-13 15:04:08.414477
1618	Tuzamapan de Galeana	21	2020-08-13 15:04:08.415928	2020-08-13 15:04:08.415928
1619	Caxhuacan	21	2020-08-13 15:04:08.417331	2020-08-13 15:04:08.417331
1620	Jonotla	21	2020-08-13 15:04:08.419035	2020-08-13 15:04:08.419035
1621	Zoquiapan	21	2020-08-13 15:04:08.420683	2020-08-13 15:04:08.420683
1622	Nauzontla	21	2020-08-13 15:04:08.422144	2020-08-13 15:04:08.422144
1623	Cuetzalan del Progreso	21	2020-08-13 15:04:08.423736	2020-08-13 15:04:08.423736
1624	Ayotoxco de Guerrero	21	2020-08-13 15:04:08.42523	2020-08-13 15:04:08.42523
1625	Hueytamalco	21	2020-08-13 15:04:08.426735	2020-08-13 15:04:08.426735
1626	Acateno	21	2020-08-13 15:04:08.428185	2020-08-13 15:04:08.428185
1627	Cuautempan	21	2020-08-13 15:04:08.429624	2020-08-13 15:04:08.429624
1628	Aquixtla	21	2020-08-13 15:04:08.431042	2020-08-13 15:04:08.431042
1629	Tetela de Ocampo	21	2020-08-13 15:04:08.432453	2020-08-13 15:04:08.432453
1630	Xochiapulco	21	2020-08-13 15:04:08.434043	2020-08-13 15:04:08.434043
1631	Zacapoaxtla	21	2020-08-13 15:04:08.435554	2020-08-13 15:04:08.435554
1632	Zaragoza	21	2020-08-13 15:04:08.437313	2020-08-13 15:04:08.437313
1633	Ixtacamaxtitlán	21	2020-08-13 15:04:08.439053	2020-08-13 15:04:08.439053
1634	Zautla	21	2020-08-13 15:04:08.440952	2020-08-13 15:04:08.440952
1635	Ocotepec	21	2020-08-13 15:04:08.442816	2020-08-13 15:04:08.442816
1636	Libres	21	2020-08-13 15:04:08.445539	2020-08-13 15:04:08.445539
1637	Teziutlán	21	2020-08-13 15:04:08.447596	2020-08-13 15:04:08.447596
1638	Tlatlauquitepec	21	2020-08-13 15:04:08.448987	2020-08-13 15:04:08.448987
1639	Yaonáhuac	21	2020-08-13 15:04:08.450261	2020-08-13 15:04:08.450261
1640	Hueyapan	21	2020-08-13 15:04:08.451829	2020-08-13 15:04:08.451829
1641	Teteles de Avila Castillo	21	2020-08-13 15:04:08.453443	2020-08-13 15:04:08.453443
1642	Atempan	21	2020-08-13 15:04:08.45489	2020-08-13 15:04:08.45489
1643	Chignautla	21	2020-08-13 15:04:08.456309	2020-08-13 15:04:08.456309
1644	Xiutetelco	21	2020-08-13 15:04:08.457667	2020-08-13 15:04:08.457667
1645	Cuyoaco	21	2020-08-13 15:04:08.458966	2020-08-13 15:04:08.458966
1646	Tepeyahualco	21	2020-08-13 15:04:08.460353	2020-08-13 15:04:08.460353
1647	San Martín Texmelucan	21	2020-08-13 15:04:08.461773	2020-08-13 15:04:08.461773
1648	Tlahuapan	21	2020-08-13 15:04:08.463327	2020-08-13 15:04:08.463327
1649	San Matías Tlalancaleca	21	2020-08-13 15:04:08.465172	2020-08-13 15:04:08.465172
1650	San Salvador el Verde	21	2020-08-13 15:04:08.467177	2020-08-13 15:04:08.467177
1651	San Felipe Teotlalcingo	21	2020-08-13 15:04:08.469597	2020-08-13 15:04:08.469597
1652	Chiautzingo	21	2020-08-13 15:04:08.472618	2020-08-13 15:04:08.472618
1653	Huejotzingo	21	2020-08-13 15:04:08.474403	2020-08-13 15:04:08.474403
1654	Domingo Arenas	21	2020-08-13 15:04:08.476281	2020-08-13 15:04:08.476281
1655	Calpan	21	2020-08-13 15:04:08.47792	2020-08-13 15:04:08.47792
1656	San Nicolás de los Ranchos	21	2020-08-13 15:04:08.479654	2020-08-13 15:04:08.479654
1657	Atlixco	21	2020-08-13 15:04:08.48154	2020-08-13 15:04:08.48154
1658	Nealtican	21	2020-08-13 15:04:08.48309	2020-08-13 15:04:08.48309
1659	San Jerónimo Tecuanipan	21	2020-08-13 15:04:08.486522	2020-08-13 15:04:08.486522
1660	San Gregorio Atzompa	21	2020-08-13 15:04:08.489141	2020-08-13 15:04:08.489141
1661	Tochimilco	21	2020-08-13 15:04:08.490685	2020-08-13 15:04:08.490685
1662	Tianguismanalco	21	2020-08-13 15:04:08.492341	2020-08-13 15:04:08.492341
1663	Santa Isabel Cholula	21	2020-08-13 15:04:08.493886	2020-08-13 15:04:08.493886
1664	Huaquechula	21	2020-08-13 15:04:08.495293	2020-08-13 15:04:08.495293
1665	San Diego la Mesa Tochimiltzingo	21	2020-08-13 15:04:08.496786	2020-08-13 15:04:08.496786
1666	Tepeojuma	21	2020-08-13 15:04:08.498361	2020-08-13 15:04:08.498361
1667	Izúcar de Matamoros	21	2020-08-13 15:04:08.499864	2020-08-13 15:04:08.499864
1668	Atzitzihuacán	21	2020-08-13 15:04:08.501349	2020-08-13 15:04:08.501349
1669	Acteopan	21	2020-08-13 15:04:08.50275	2020-08-13 15:04:08.50275
1670	Cohuecan	21	2020-08-13 15:04:08.504875	2020-08-13 15:04:08.504875
1671	Tepemaxalco	21	2020-08-13 15:04:08.507266	2020-08-13 15:04:08.507266
1672	Tlapanalá	21	2020-08-13 15:04:08.508877	2020-08-13 15:04:08.508877
1673	Tepexco	21	2020-08-13 15:04:08.510356	2020-08-13 15:04:08.510356
1674	Tilapa	21	2020-08-13 15:04:08.511707	2020-08-13 15:04:08.511707
1675	Chietla	21	2020-08-13 15:04:08.513101	2020-08-13 15:04:08.513101
1676	Atzala	21	2020-08-13 15:04:08.514681	2020-08-13 15:04:08.514681
1677	Teopantlán	21	2020-08-13 15:04:08.516059	2020-08-13 15:04:08.516059
1678	San Martín Totoltepec	21	2020-08-13 15:04:08.51768	2020-08-13 15:04:08.51768
1679	Xochiltepec	21	2020-08-13 15:04:08.519022	2020-08-13 15:04:08.519022
1680	Epatlán	21	2020-08-13 15:04:08.520316	2020-08-13 15:04:08.520316
1681	Ahuatlán	21	2020-08-13 15:04:08.521668	2020-08-13 15:04:08.521668
1682	Coatzingo	21	2020-08-13 15:04:08.523306	2020-08-13 15:04:08.523306
1683	Santa Catarina Tlaltempan	21	2020-08-13 15:04:08.524785	2020-08-13 15:04:08.524785
1684	Chigmecatitlán	21	2020-08-13 15:04:08.526266	2020-08-13 15:04:08.526266
1685	Zacapala	21	2020-08-13 15:04:08.527593	2020-08-13 15:04:08.527593
1686	Tepexi de Rodríguez	21	2020-08-13 15:04:08.528914	2020-08-13 15:04:08.528914
1687	Teotlalco	21	2020-08-13 15:04:08.530407	2020-08-13 15:04:08.530407
1688	Jolalpan	21	2020-08-13 15:04:08.531792	2020-08-13 15:04:08.531792
1689	Huehuetlán el Chico	21	2020-08-13 15:04:08.533113	2020-08-13 15:04:08.533113
1690	Chiautla	21	2020-08-13 15:04:08.534477	2020-08-13 15:04:08.534477
1691	Cohetzala	21	2020-08-13 15:04:08.535833	2020-08-13 15:04:08.535833
1692	Xicotlán	21	2020-08-13 15:04:08.537152	2020-08-13 15:04:08.537152
1693	Chila de la Sal	21	2020-08-13 15:04:08.538437	2020-08-13 15:04:08.538437
1694	Ixcamilpa de Guerrero	21	2020-08-13 15:04:08.540391	2020-08-13 15:04:08.540391
1695	Albino Zertuche	21	2020-08-13 15:04:08.541992	2020-08-13 15:04:08.541992
1696	Tulcingo	21	2020-08-13 15:04:08.54354	2020-08-13 15:04:08.54354
1697	Tehuitzingo	21	2020-08-13 15:04:08.545016	2020-08-13 15:04:08.545016
1698	Cuayuca de Andrade	21	2020-08-13 15:04:08.546503	2020-08-13 15:04:08.546503
1699	Santa Inés Ahuatempan	21	2020-08-13 15:04:08.547836	2020-08-13 15:04:08.547836
1700	Axutla	21	2020-08-13 15:04:08.549097	2020-08-13 15:04:08.549097
1701	Chinantla	21	2020-08-13 15:04:08.550437	2020-08-13 15:04:08.550437
1702	Ahuehuetitla	21	2020-08-13 15:04:08.552047	2020-08-13 15:04:08.552047
1703	San Pablo Anicano	21	2020-08-13 15:04:08.553586	2020-08-13 15:04:08.553586
1704	Tecomatlán	21	2020-08-13 15:04:08.555112	2020-08-13 15:04:08.555112
1705	Piaxtla	21	2020-08-13 15:04:08.55647	2020-08-13 15:04:08.55647
1706	Guadalupe	21	2020-08-13 15:04:08.557839	2020-08-13 15:04:08.557839
1707	Ixcaquixtla	21	2020-08-13 15:04:08.559142	2020-08-13 15:04:08.559142
1708	Coyotepec	21	2020-08-13 15:04:08.560399	2020-08-13 15:04:08.560399
1709	Xayacatlán de Bravo	21	2020-08-13 15:04:08.561807	2020-08-13 15:04:08.561807
1710	Totoltepec de Guerrero	21	2020-08-13 15:04:08.563151	2020-08-13 15:04:08.563151
1711	Acatlán	21	2020-08-13 15:04:08.564429	2020-08-13 15:04:08.564429
1712	San Jerónimo Xayacatlán	21	2020-08-13 15:04:08.565855	2020-08-13 15:04:08.565855
1713	San Pedro Yeloixtlahuaca	21	2020-08-13 15:04:08.567229	2020-08-13 15:04:08.567229
1714	Petlalcingo	21	2020-08-13 15:04:08.568594	2020-08-13 15:04:08.568594
1715	San Miguel Ixitlán	21	2020-08-13 15:04:08.56994	2020-08-13 15:04:08.56994
1716	Chila	21	2020-08-13 15:04:08.571339	2020-08-13 15:04:08.571339
1717	Rafael Lara Grajales	21	2020-08-13 15:04:08.572716	2020-08-13 15:04:08.572716
1718	San José Chiapa	21	2020-08-13 15:04:08.574078	2020-08-13 15:04:08.574078
1719	Oriental	21	2020-08-13 15:04:08.575405	2020-08-13 15:04:08.575405
1720	San Nicolás Buenos Aires	21	2020-08-13 15:04:08.576823	2020-08-13 15:04:08.576823
1721	Guadalupe Victoria	21	2020-08-13 15:04:08.578224	2020-08-13 15:04:08.578224
1722	Tlachichuca	21	2020-08-13 15:04:08.579652	2020-08-13 15:04:08.579652
1723	Lafragua	21	2020-08-13 15:04:08.581052	2020-08-13 15:04:08.581052
1724	Chilchotla	21	2020-08-13 15:04:08.582388	2020-08-13 15:04:08.582388
1725	Quimixtlán	21	2020-08-13 15:04:08.583774	2020-08-13 15:04:08.583774
1726	Chichiquila	21	2020-08-13 15:04:08.585165	2020-08-13 15:04:08.585165
1727	Tepatlaxco de Hidalgo	21	2020-08-13 15:04:08.586593	2020-08-13 15:04:08.586593
1728	Acajete	21	2020-08-13 15:04:08.587916	2020-08-13 15:04:08.587916
1729	Nopalucan	21	2020-08-13 15:04:08.589344	2020-08-13 15:04:08.589344
1730	Mazapiltepec de Juárez	21	2020-08-13 15:04:08.590726	2020-08-13 15:04:08.590726
1731	Soltepec	21	2020-08-13 15:04:08.592084	2020-08-13 15:04:08.592084
1732	Acatzingo	21	2020-08-13 15:04:08.593433	2020-08-13 15:04:08.593433
1733	San Salvador el Seco	21	2020-08-13 15:04:08.594806	2020-08-13 15:04:08.594806
1734	General Felipe Ángeles	21	2020-08-13 15:04:08.596193	2020-08-13 15:04:08.596193
1735	Aljojuca	21	2020-08-13 15:04:08.597511	2020-08-13 15:04:08.597511
1736	San Juan Atenco	21	2020-08-13 15:04:08.598904	2020-08-13 15:04:08.598904
1737	Tepeaca	21	2020-08-13 15:04:08.600587	2020-08-13 15:04:08.600587
1738	Cuautinchán	21	2020-08-13 15:04:08.60204	2020-08-13 15:04:08.60204
1739	Tecali de Herrera	21	2020-08-13 15:04:08.603407	2020-08-13 15:04:08.603407
1740	Mixtla	21	2020-08-13 15:04:08.604812	2020-08-13 15:04:08.604812
1741	Santo Tomás Hueyotlipan	21	2020-08-13 15:04:08.606245	2020-08-13 15:04:08.606245
1742	Tzicatlacoyan	21	2020-08-13 15:04:08.607698	2020-08-13 15:04:08.607698
1743	Huehuetlán el Grande	21	2020-08-13 15:04:08.609012	2020-08-13 15:04:08.609012
1744	La Magdalena Tlatlauquitepec	21	2020-08-13 15:04:08.610274	2020-08-13 15:04:08.610274
1745	San Juan Atzompa	21	2020-08-13 15:04:08.611755	2020-08-13 15:04:08.611755
1746	Huatlatlauca	21	2020-08-13 15:04:08.613226	2020-08-13 15:04:08.613226
1747	Los Reyes de Juárez	21	2020-08-13 15:04:08.614679	2020-08-13 15:04:08.614679
1748	Cuapiaxtla de Madero	21	2020-08-13 15:04:08.616041	2020-08-13 15:04:08.616041
1749	San Salvador Huixcolotla	21	2020-08-13 15:04:08.617793	2020-08-13 15:04:08.617793
1750	Quecholac	21	2020-08-13 15:04:08.619529	2020-08-13 15:04:08.619529
1751	Tecamachalco	21	2020-08-13 15:04:08.621232	2020-08-13 15:04:08.621232
1752	Palmar de Bravo	21	2020-08-13 15:04:08.622879	2020-08-13 15:04:08.622879
1753	Chalchicomula de Sesma	21	2020-08-13 15:04:08.624552	2020-08-13 15:04:08.624552
1754	Atzitzintla	21	2020-08-13 15:04:08.62619	2020-08-13 15:04:08.62619
1755	Esperanza	21	2020-08-13 15:04:08.627763	2020-08-13 15:04:08.627763
1756	Cañada Morelos	21	2020-08-13 15:04:08.629174	2020-08-13 15:04:08.629174
1757	Tlanepantla	21	2020-08-13 15:04:08.630942	2020-08-13 15:04:08.630942
1758	Tochtepec	21	2020-08-13 15:04:08.632669	2020-08-13 15:04:08.632669
1759	Atoyatempan	21	2020-08-13 15:04:08.634305	2020-08-13 15:04:08.634305
1760	Tepeyahualco de Cuauhtémoc	21	2020-08-13 15:04:08.635909	2020-08-13 15:04:08.635909
1761	Huitziltepec	21	2020-08-13 15:04:08.637448	2020-08-13 15:04:08.637448
1762	Molcaxac	21	2020-08-13 15:04:08.638968	2020-08-13 15:04:08.638968
1763	Xochitlán Todos Santos	21	2020-08-13 15:04:08.641093	2020-08-13 15:04:08.641093
1764	Yehualtepec	21	2020-08-13 15:04:08.643316	2020-08-13 15:04:08.643316
1765	Tlacotepec de Benito Juárez	21	2020-08-13 15:04:08.644858	2020-08-13 15:04:08.644858
1766	Juan N. Méndez	21	2020-08-13 15:04:08.646279	2020-08-13 15:04:08.646279
1767	Tehuacán	21	2020-08-13 15:04:08.647638	2020-08-13 15:04:08.647638
1768	Tepanco de López	21	2020-08-13 15:04:08.648941	2020-08-13 15:04:08.648941
1769	Chapulco	21	2020-08-13 15:04:08.65033	2020-08-13 15:04:08.65033
1770	Santiago Miahuatlán	21	2020-08-13 15:04:08.651797	2020-08-13 15:04:08.651797
1771	Nicolás Bravo	21	2020-08-13 15:04:08.653126	2020-08-13 15:04:08.653126
1772	Atexcal	21	2020-08-13 15:04:08.654629	2020-08-13 15:04:08.654629
1773	San Antonio Cañada	21	2020-08-13 15:04:08.655949	2020-08-13 15:04:08.655949
1774	Zapotitlán	21	2020-08-13 15:04:08.657355	2020-08-13 15:04:08.657355
1775	San Gabriel Chilac	21	2020-08-13 15:04:08.658868	2020-08-13 15:04:08.658868
1776	Caltepec	21	2020-08-13 15:04:08.660437	2020-08-13 15:04:08.660437
1777	Vicente Guerrero	21	2020-08-13 15:04:08.661817	2020-08-13 15:04:08.661817
1778	Ajalpan	21	2020-08-13 15:04:08.663121	2020-08-13 15:04:08.663121
1779	Eloxochitlán	21	2020-08-13 15:04:08.664506	2020-08-13 15:04:08.664506
1780	Zoquitlán	21	2020-08-13 15:04:08.66587	2020-08-13 15:04:08.66587
1781	San Sebastián Tlacotepec	21	2020-08-13 15:04:08.667565	2020-08-13 15:04:08.667565
1782	Altepexi	21	2020-08-13 15:04:08.669423	2020-08-13 15:04:08.669423
1783	Zinacatepec	21	2020-08-13 15:04:08.671096	2020-08-13 15:04:08.671096
1784	San José Miahuatlán	21	2020-08-13 15:04:08.672728	2020-08-13 15:04:08.672728
1785	Coxcatlán	21	2020-08-13 15:04:08.674396	2020-08-13 15:04:08.674396
1786	Coyomeapan	21	2020-08-13 15:04:08.676101	2020-08-13 15:04:08.676101
1787	Querétaro	22	2020-08-13 15:04:08.677875	2020-08-13 15:04:08.677875
1788	El Marqués	22	2020-08-13 15:04:08.679658	2020-08-13 15:04:08.679658
1789	Colón	22	2020-08-13 15:04:08.681354	2020-08-13 15:04:08.681354
1790	Pinal de Amoles	22	2020-08-13 15:04:08.683104	2020-08-13 15:04:08.683104
1791	Jalpan de Serra	22	2020-08-13 15:04:08.684932	2020-08-13 15:04:08.684932
1792	Landa de Matamoros	22	2020-08-13 15:04:08.686547	2020-08-13 15:04:08.686547
1793	Arroyo Seco	22	2020-08-13 15:04:08.688156	2020-08-13 15:04:08.688156
1794	Peñamiller	22	2020-08-13 15:04:08.689641	2020-08-13 15:04:08.689641
1795	Cadereyta de Montes	22	2020-08-13 15:04:08.691103	2020-08-13 15:04:08.691103
1796	San Joaquín	22	2020-08-13 15:04:08.692532	2020-08-13 15:04:08.692532
1797	Tolimán	22	2020-08-13 15:04:08.693887	2020-08-13 15:04:08.693887
1798	Ezequiel Montes	22	2020-08-13 15:04:08.695437	2020-08-13 15:04:08.695437
1799	Pedro Escobedo	22	2020-08-13 15:04:08.696872	2020-08-13 15:04:08.696872
1800	Tequisquiapan	22	2020-08-13 15:04:08.69926	2020-08-13 15:04:08.69926
1801	San Juan del Río	22	2020-08-13 15:04:08.71096	2020-08-13 15:04:08.71096
1802	Amealco de Bonfil	22	2020-08-13 15:04:08.741338	2020-08-13 15:04:08.741338
1803	Corregidora	22	2020-08-13 15:04:08.753397	2020-08-13 15:04:08.753397
1804	Huimilpan	22	2020-08-13 15:04:08.763104	2020-08-13 15:04:08.763104
1805	Othón P. Blanco	23	2020-08-13 15:04:08.764758	2020-08-13 15:04:08.764758
1806	Felipe Carrillo Puerto	23	2020-08-13 15:04:08.76673	2020-08-13 15:04:08.76673
1807	Lázaro Cárdenas	23	2020-08-13 15:04:08.768852	2020-08-13 15:04:08.768852
1808	Isla Mujeres	23	2020-08-13 15:04:08.773513	2020-08-13 15:04:08.773513
1809	Benito Juárez	23	2020-08-13 15:04:08.776692	2020-08-13 15:04:08.776692
1810	Cozumel	23	2020-08-13 15:04:08.782289	2020-08-13 15:04:08.782289
1811	Solidaridad	23	2020-08-13 15:04:08.788434	2020-08-13 15:04:08.788434
1812	Tulum	23	2020-08-13 15:04:08.792598	2020-08-13 15:04:08.792598
1813	José María Morelos	23	2020-08-13 15:04:08.796371	2020-08-13 15:04:08.796371
1814	Bacalar	23	2020-08-13 15:04:08.817133	2020-08-13 15:04:08.817133
1815	San Luis Potosí	24	2020-08-13 15:04:08.824951	2020-08-13 15:04:08.824951
1816	Soledad de Graciano Sánchez	24	2020-08-13 15:04:08.826842	2020-08-13 15:04:08.826842
1817	Cerro de San Pedro	24	2020-08-13 15:04:08.828479	2020-08-13 15:04:08.828479
1818	Ahualulco	24	2020-08-13 15:04:08.830928	2020-08-13 15:04:08.830928
1819	Mexquitic de Carmona	24	2020-08-13 15:04:08.832986	2020-08-13 15:04:08.832986
1820	Villa de Arriaga	24	2020-08-13 15:04:08.834432	2020-08-13 15:04:08.834432
1821	Vanegas	24	2020-08-13 15:04:08.836038	2020-08-13 15:04:08.836038
1822	Cedral	24	2020-08-13 15:04:08.838941	2020-08-13 15:04:08.838941
1823	Catorce	24	2020-08-13 15:04:08.841515	2020-08-13 15:04:08.841515
1824	Charcas	24	2020-08-13 15:04:08.843449	2020-08-13 15:04:08.843449
1825	Salinas	24	2020-08-13 15:04:08.845652	2020-08-13 15:04:08.845652
1826	Santo Domingo	24	2020-08-13 15:04:08.847711	2020-08-13 15:04:08.847711
1827	Villa de Ramos	24	2020-08-13 15:04:08.849265	2020-08-13 15:04:08.849265
1828	Matehuala	24	2020-08-13 15:04:08.85072	2020-08-13 15:04:08.85072
1829	Villa de la Paz	24	2020-08-13 15:04:08.852208	2020-08-13 15:04:08.852208
1830	Villa de Guadalupe	24	2020-08-13 15:04:08.854419	2020-08-13 15:04:08.854419
1831	Guadalcázar	24	2020-08-13 15:04:08.861388	2020-08-13 15:04:08.861388
1832	Moctezuma	24	2020-08-13 15:04:08.863494	2020-08-13 15:04:08.863494
1833	Venado	24	2020-08-13 15:04:08.865016	2020-08-13 15:04:08.865016
1834	Villa de Arista	24	2020-08-13 15:04:08.866493	2020-08-13 15:04:08.866493
1835	Villa Hidalgo	24	2020-08-13 15:04:08.867961	2020-08-13 15:04:08.867961
1836	Armadillo de los Infante	24	2020-08-13 15:04:08.869471	2020-08-13 15:04:08.869471
1837	Ciudad Valles	24	2020-08-13 15:04:08.870894	2020-08-13 15:04:08.870894
1838	Ebano	24	2020-08-13 15:04:08.878087	2020-08-13 15:04:08.878087
1839	Tamuín	24	2020-08-13 15:04:08.885404	2020-08-13 15:04:08.885404
1840	El Naranjo	24	2020-08-13 15:04:08.892767	2020-08-13 15:04:08.892767
1841	Ciudad del Maíz	24	2020-08-13 15:04:08.898916	2020-08-13 15:04:08.898916
1842	Alaquines	24	2020-08-13 15:04:08.900485	2020-08-13 15:04:08.900485
1843	Cárdenas	24	2020-08-13 15:04:08.901945	2020-08-13 15:04:08.901945
1844	Cerritos	24	2020-08-13 15:04:08.903288	2020-08-13 15:04:08.903288
1845	Villa Juárez	24	2020-08-13 15:04:08.904668	2020-08-13 15:04:08.904668
1846	San Nicolás Tolentino	24	2020-08-13 15:04:08.906069	2020-08-13 15:04:08.906069
1847	Villa de Reyes	24	2020-08-13 15:04:08.907467	2020-08-13 15:04:08.907467
1848	Zaragoza	24	2020-08-13 15:04:08.908865	2020-08-13 15:04:08.908865
1849	Santa María del Río	24	2020-08-13 15:04:08.910308	2020-08-13 15:04:08.910308
1850	Tierra Nueva	24	2020-08-13 15:04:08.911677	2020-08-13 15:04:08.911677
1851	Rioverde	24	2020-08-13 15:04:08.913033	2020-08-13 15:04:08.913033
1852	Ciudad Fernández	24	2020-08-13 15:04:08.914444	2020-08-13 15:04:08.914444
1853	San Ciro de Acosta	24	2020-08-13 15:04:08.917883	2020-08-13 15:04:08.917883
1854	Tamasopo	24	2020-08-13 15:04:08.919425	2020-08-13 15:04:08.919425
1855	Rayón	24	2020-08-13 15:04:08.920838	2020-08-13 15:04:08.920838
1856	Aquismón	24	2020-08-13 15:04:08.922219	2020-08-13 15:04:08.922219
1857	Lagunillas	24	2020-08-13 15:04:08.923591	2020-08-13 15:04:08.923591
1858	Santa Catarina	24	2020-08-13 15:04:08.924979	2020-08-13 15:04:08.924979
1859	Tancanhuitz	24	2020-08-13 15:04:08.926428	2020-08-13 15:04:08.926428
1860	Tanlajás	24	2020-08-13 15:04:08.927816	2020-08-13 15:04:08.927816
1861	San Vicente Tancuayalab	24	2020-08-13 15:04:08.929261	2020-08-13 15:04:08.929261
1862	San Antonio	24	2020-08-13 15:04:08.930611	2020-08-13 15:04:08.930611
1863	Tanquián de Escobedo	24	2020-08-13 15:04:08.932035	2020-08-13 15:04:08.932035
1864	Tampamolón Corona	24	2020-08-13 15:04:08.933391	2020-08-13 15:04:08.933391
1865	Coxcatlán	24	2020-08-13 15:04:08.934802	2020-08-13 15:04:08.934802
1866	Huehuetlán	24	2020-08-13 15:04:08.936176	2020-08-13 15:04:08.936176
1867	Xilitla	24	2020-08-13 15:04:08.937558	2020-08-13 15:04:08.937558
1868	Axtla de Terrazas	24	2020-08-13 15:04:08.939064	2020-08-13 15:04:08.939064
1869	Tampacán	24	2020-08-13 15:04:08.94047	2020-08-13 15:04:08.94047
1870	San Martín Chalchicuautla	24	2020-08-13 15:04:08.941927	2020-08-13 15:04:08.941927
1871	Tamazunchale	24	2020-08-13 15:04:08.943301	2020-08-13 15:04:08.943301
1872	Matlapa	24	2020-08-13 15:04:08.947284	2020-08-13 15:04:08.947284
1873	Culiacán	25	2020-08-13 15:04:08.949589	2020-08-13 15:04:08.949589
1874	Navolato	25	2020-08-13 15:04:08.95123	2020-08-13 15:04:08.95123
1875	Badiraguato	25	2020-08-13 15:04:08.954475	2020-08-13 15:04:08.954475
1876	Cosalá	25	2020-08-13 15:04:08.958613	2020-08-13 15:04:08.958613
1877	Mocorito	25	2020-08-13 15:04:08.961283	2020-08-13 15:04:08.961283
1878	Guasave	25	2020-08-13 15:04:08.962747	2020-08-13 15:04:08.962747
1879	Ahome	25	2020-08-13 15:04:08.964147	2020-08-13 15:04:08.964147
1880	Salvador Alvarado	25	2020-08-13 15:04:08.965569	2020-08-13 15:04:08.965569
1881	Angostura	25	2020-08-13 15:04:08.966995	2020-08-13 15:04:08.966995
1882	Choix	25	2020-08-13 15:04:08.968414	2020-08-13 15:04:08.968414
1883	El Fuerte	25	2020-08-13 15:04:08.969766	2020-08-13 15:04:08.969766
1884	Sinaloa	25	2020-08-13 15:04:08.971137	2020-08-13 15:04:08.971137
1885	Mazatlán	25	2020-08-13 15:04:08.97247	2020-08-13 15:04:08.97247
1886	Escuinapa	25	2020-08-13 15:04:08.973846	2020-08-13 15:04:08.973846
1887	Concordia	25	2020-08-13 15:04:08.975252	2020-08-13 15:04:08.975252
1888	Elota	25	2020-08-13 15:04:08.976651	2020-08-13 15:04:08.976651
1889	Rosario	25	2020-08-13 15:04:08.978218	2020-08-13 15:04:08.978218
1890	San Ignacio	25	2020-08-13 15:04:08.981258	2020-08-13 15:04:08.981258
1891	Hermosillo	26	2020-08-13 15:04:08.982864	2020-08-13 15:04:08.982864
1892	San Miguel de Horcasitas	26	2020-08-13 15:04:08.984244	2020-08-13 15:04:08.984244
1893	Carbó	26	2020-08-13 15:04:08.985675	2020-08-13 15:04:08.985675
1894	San Luis Río Colorado	26	2020-08-13 15:04:08.992478	2020-08-13 15:04:08.992478
1895	Puerto Peñasco	26	2020-08-13 15:04:08.994051	2020-08-13 15:04:08.994051
1896	General Plutarco Elías Calles	26	2020-08-13 15:04:08.99549	2020-08-13 15:04:08.99549
1897	Caborca	26	2020-08-13 15:04:08.996861	2020-08-13 15:04:08.996861
1898	Altar	26	2020-08-13 15:04:08.998478	2020-08-13 15:04:08.998478
1899	Tubutama	26	2020-08-13 15:04:08.999976	2020-08-13 15:04:08.999976
1900	Atil	26	2020-08-13 15:04:09.001329	2020-08-13 15:04:09.001329
1901	Oquitoa	26	2020-08-13 15:04:09.002775	2020-08-13 15:04:09.002775
1902	Sáric	26	2020-08-13 15:04:09.004144	2020-08-13 15:04:09.004144
1903	Benjamín Hill	26	2020-08-13 15:04:09.005472	2020-08-13 15:04:09.005472
1904	Trincheras	26	2020-08-13 15:04:09.006832	2020-08-13 15:04:09.006832
1905	Pitiquito	26	2020-08-13 15:04:09.008134	2020-08-13 15:04:09.008134
1906	Nogales	26	2020-08-13 15:04:09.009427	2020-08-13 15:04:09.009427
1907	Imuris	26	2020-08-13 15:04:09.010722	2020-08-13 15:04:09.010722
1908	Santa Cruz	26	2020-08-13 15:04:09.011996	2020-08-13 15:04:09.011996
1909	Magdalena	26	2020-08-13 15:04:09.013313	2020-08-13 15:04:09.013313
1910	Naco	26	2020-08-13 15:04:09.014593	2020-08-13 15:04:09.014593
1911	Agua Prieta	26	2020-08-13 15:04:09.015894	2020-08-13 15:04:09.015894
1912	Fronteras	26	2020-08-13 15:04:09.017206	2020-08-13 15:04:09.017206
1913	Nacozari de García	26	2020-08-13 15:04:09.018561	2020-08-13 15:04:09.018561
1914	Bavispe	26	2020-08-13 15:04:09.019887	2020-08-13 15:04:09.019887
1915	Bacerac	26	2020-08-13 15:04:09.023102	2020-08-13 15:04:09.023102
1916	Huachinera	26	2020-08-13 15:04:09.024691	2020-08-13 15:04:09.024691
1917	Nácori Chico	26	2020-08-13 15:04:09.026136	2020-08-13 15:04:09.026136
1918	Granados	26	2020-08-13 15:04:09.027477	2020-08-13 15:04:09.027477
1919	Bacadéhuachi	26	2020-08-13 15:04:09.028767	2020-08-13 15:04:09.028767
1920	Cumpas	26	2020-08-13 15:04:09.030095	2020-08-13 15:04:09.030095
1921	Huásabas	26	2020-08-13 15:04:09.031413	2020-08-13 15:04:09.031413
1922	Moctezuma	26	2020-08-13 15:04:09.032806	2020-08-13 15:04:09.032806
1923	Villa Hidalgo	26	2020-08-13 15:04:09.034198	2020-08-13 15:04:09.034198
1924	Santa Ana	26	2020-08-13 15:04:09.035557	2020-08-13 15:04:09.035557
1925	Cananea	26	2020-08-13 15:04:09.036895	2020-08-13 15:04:09.036895
1926	Arizpe	26	2020-08-13 15:04:09.038337	2020-08-13 15:04:09.038337
1927	Cucurpe	26	2020-08-13 15:04:09.039749	2020-08-13 15:04:09.039749
1928	Bacoachi	26	2020-08-13 15:04:09.041046	2020-08-13 15:04:09.041046
1929	San Pedro de la Cueva	26	2020-08-13 15:04:09.042385	2020-08-13 15:04:09.042385
1930	Divisaderos	26	2020-08-13 15:04:09.043687	2020-08-13 15:04:09.043687
1931	Tepache	26	2020-08-13 15:04:09.045001	2020-08-13 15:04:09.045001
1932	Villa Pesqueira	26	2020-08-13 15:04:09.046396	2020-08-13 15:04:09.046396
1933	Opodepe	26	2020-08-13 15:04:09.047715	2020-08-13 15:04:09.047715
1934	Huépac	26	2020-08-13 15:04:09.049033	2020-08-13 15:04:09.049033
1935	Banámichi	26	2020-08-13 15:04:09.05039	2020-08-13 15:04:09.05039
1936	Ures	26	2020-08-13 15:04:09.053339	2020-08-13 15:04:09.053339
1937	Aconchi	26	2020-08-13 15:04:09.05477	2020-08-13 15:04:09.05477
1938	Baviácora	26	2020-08-13 15:04:09.056185	2020-08-13 15:04:09.056185
1939	San Felipe de Jesús	26	2020-08-13 15:04:09.057727	2020-08-13 15:04:09.057727
1940	Rayón	26	2020-08-13 15:04:09.059136	2020-08-13 15:04:09.059136
1941	Cajeme	26	2020-08-13 15:04:09.0605	2020-08-13 15:04:09.0605
1942	Navojoa	26	2020-08-13 15:04:09.061834	2020-08-13 15:04:09.061834
1943	Huatabampo	26	2020-08-13 15:04:09.063157	2020-08-13 15:04:09.063157
1944	Bácum	26	2020-08-13 15:04:09.064439	2020-08-13 15:04:09.064439
1945	Etchojoa	26	2020-08-13 15:04:09.065742	2020-08-13 15:04:09.065742
1946	Benito Juárez	26	2020-08-13 15:04:09.067198	2020-08-13 15:04:09.067198
1947	Empalme	26	2020-08-13 15:04:09.068557	2020-08-13 15:04:09.068557
1948	Guaymas	26	2020-08-13 15:04:09.069847	2020-08-13 15:04:09.069847
1949	San Ignacio Río Muerto	26	2020-08-13 15:04:09.071202	2020-08-13 15:04:09.071202
1950	La Colorada	26	2020-08-13 15:04:09.072555	2020-08-13 15:04:09.072555
1951	Mazatán	26	2020-08-13 15:04:09.073907	2020-08-13 15:04:09.073907
1952	Suaqui Grande	26	2020-08-13 15:04:09.07525	2020-08-13 15:04:09.07525
1953	Sahuaripa	26	2020-08-13 15:04:09.076589	2020-08-13 15:04:09.076589
1954	San Javier	26	2020-08-13 15:04:09.077916	2020-08-13 15:04:09.077916
1955	Soyopa	26	2020-08-13 15:04:09.079226	2020-08-13 15:04:09.079226
1956	Bacanora	26	2020-08-13 15:04:09.080537	2020-08-13 15:04:09.080537
1957	Arivechi	26	2020-08-13 15:04:09.081824	2020-08-13 15:04:09.081824
1958	Rosario	26	2020-08-13 15:04:09.083177	2020-08-13 15:04:09.083177
1959	Quiriego	26	2020-08-13 15:04:09.086002	2020-08-13 15:04:09.086002
1960	Onavas	26	2020-08-13 15:04:09.08749	2020-08-13 15:04:09.08749
1961	Alamos	26	2020-08-13 15:04:09.088896	2020-08-13 15:04:09.088896
1962	Yécora	26	2020-08-13 15:04:09.090219	2020-08-13 15:04:09.090219
1963	Centro	27	2020-08-13 15:04:09.09156	2020-08-13 15:04:09.09156
1964	Jalpa de Méndez	27	2020-08-13 15:04:09.093008	2020-08-13 15:04:09.093008
1965	Nacajuca	27	2020-08-13 15:04:09.09439	2020-08-13 15:04:09.09439
1966	Comalcalco	27	2020-08-13 15:04:09.09573	2020-08-13 15:04:09.09573
1967	Huimanguillo	27	2020-08-13 15:04:09.09707	2020-08-13 15:04:09.09707
1968	Cárdenas	27	2020-08-13 15:04:09.098425	2020-08-13 15:04:09.098425
1969	Paraíso	27	2020-08-13 15:04:09.099926	2020-08-13 15:04:09.099926
1970	Cunduacán	27	2020-08-13 15:04:09.101347	2020-08-13 15:04:09.101347
1971	Macuspana	27	2020-08-13 15:04:09.102807	2020-08-13 15:04:09.102807
1972	Centla	27	2020-08-13 15:04:09.104366	2020-08-13 15:04:09.104366
1973	Jonuta	27	2020-08-13 15:04:09.106838	2020-08-13 15:04:09.106838
1974	Teapa	27	2020-08-13 15:04:09.108272	2020-08-13 15:04:09.108272
1975	Jalapa	27	2020-08-13 15:04:09.109689	2020-08-13 15:04:09.109689
1976	Tacotalpa	27	2020-08-13 15:04:09.111104	2020-08-13 15:04:09.111104
1977	Tenosique	27	2020-08-13 15:04:09.112491	2020-08-13 15:04:09.112491
1978	Balancán	27	2020-08-13 15:04:09.113911	2020-08-13 15:04:09.113911
1979	Emiliano Zapata	27	2020-08-13 15:04:09.118152	2020-08-13 15:04:09.118152
1980	Villahermosa	27	2020-08-13 15:04:09.119806	2020-08-13 15:04:09.119806
1981	Victoria	28	2020-08-13 15:04:09.124177	2020-08-13 15:04:09.124177
1982	Llera	28	2020-08-13 15:04:09.12699	2020-08-13 15:04:09.12699
1983	Güémez	28	2020-08-13 15:04:09.128693	2020-08-13 15:04:09.128693
1984	Casas	28	2020-08-13 15:04:09.131787	2020-08-13 15:04:09.131787
1985	Matamoros	28	2020-08-13 15:04:09.133453	2020-08-13 15:04:09.133453
1986	Valle Hermoso	28	2020-08-13 15:04:09.135087	2020-08-13 15:04:09.135087
1987	San Fernando	28	2020-08-13 15:04:09.136711	2020-08-13 15:04:09.136711
1988	Cruillas	28	2020-08-13 15:04:09.141039	2020-08-13 15:04:09.141039
1989	San Nicolás	28	2020-08-13 15:04:09.142914	2020-08-13 15:04:09.142914
1990	Soto la Marina	28	2020-08-13 15:04:09.145419	2020-08-13 15:04:09.145419
1991	Jiménez	28	2020-08-13 15:04:09.147037	2020-08-13 15:04:09.147037
1992	San Carlos	28	2020-08-13 15:04:09.149385	2020-08-13 15:04:09.149385
1993	Abasolo	28	2020-08-13 15:04:09.15193	2020-08-13 15:04:09.15193
1994	Padilla	28	2020-08-13 15:04:09.158014	2020-08-13 15:04:09.158014
1995	Hidalgo	28	2020-08-13 15:04:09.160534	2020-08-13 15:04:09.160534
1996	Mainero	28	2020-08-13 15:04:09.162284	2020-08-13 15:04:09.162284
1997	Villagrán	28	2020-08-13 15:04:09.165044	2020-08-13 15:04:09.165044
1998	Tula	28	2020-08-13 15:04:09.166642	2020-08-13 15:04:09.166642
1999	Jaumave	28	2020-08-13 15:04:09.169886	2020-08-13 15:04:09.169886
2000	Miquihuana	28	2020-08-13 15:04:09.179422	2020-08-13 15:04:09.179422
2001	Bustamante	28	2020-08-13 15:04:09.18696	2020-08-13 15:04:09.18696
2002	Palmillas	28	2020-08-13 15:04:09.19677	2020-08-13 15:04:09.19677
2003	Ocampo	28	2020-08-13 15:04:09.206052	2020-08-13 15:04:09.206052
2004	Nuevo Laredo	28	2020-08-13 15:04:09.215124	2020-08-13 15:04:09.215124
2005	Miguel Alemán	28	2020-08-13 15:04:09.224462	2020-08-13 15:04:09.224462
2006	Guerrero	28	2020-08-13 15:04:09.233742	2020-08-13 15:04:09.233742
2007	Mier	28	2020-08-13 15:04:09.244275	2020-08-13 15:04:09.244275
2008	Gustavo Díaz Ordaz	28	2020-08-13 15:04:09.251574	2020-08-13 15:04:09.251574
2009	Camargo	28	2020-08-13 15:04:09.26702	2020-08-13 15:04:09.26702
2010	Reynosa	28	2020-08-13 15:04:09.278261	2020-08-13 15:04:09.278261
2011	Río Bravo	28	2020-08-13 15:04:09.294129	2020-08-13 15:04:09.294129
2012	Méndez	28	2020-08-13 15:04:09.318773	2020-08-13 15:04:09.318773
2013	Burgos	28	2020-08-13 15:04:09.344571	2020-08-13 15:04:09.344571
2014	Tampico	28	2020-08-13 15:04:09.359944	2020-08-13 15:04:09.359944
2015	Ciudad Madero	28	2020-08-13 15:04:09.371651	2020-08-13 15:04:09.371651
2016	Altamira	28	2020-08-13 15:04:09.385208	2020-08-13 15:04:09.385208
2017	Aldama	28	2020-08-13 15:04:09.399066	2020-08-13 15:04:09.399066
2018	González	28	2020-08-13 15:04:09.413876	2020-08-13 15:04:09.413876
2019	Xicoténcatl	28	2020-08-13 15:04:09.423909	2020-08-13 15:04:09.423909
2020	Gómez Farías	28	2020-08-13 15:04:09.43241	2020-08-13 15:04:09.43241
2021	El Mante	28	2020-08-13 15:04:09.442786	2020-08-13 15:04:09.442786
2022	Antiguo Morelos	28	2020-08-13 15:04:09.451208	2020-08-13 15:04:09.451208
2023	Nuevo Morelos	28	2020-08-13 15:04:09.458756	2020-08-13 15:04:09.458756
2024	Tlaxcala	29	2020-08-13 15:04:09.465825	2020-08-13 15:04:09.465825
2025	Ixtacuixtla de Mariano Matamoros	29	2020-08-13 15:04:09.473337	2020-08-13 15:04:09.473337
2026	Santa Ana Nopalucan	29	2020-08-13 15:04:09.480788	2020-08-13 15:04:09.480788
2027	Panotla	29	2020-08-13 15:04:09.488389	2020-08-13 15:04:09.488389
2028	Totolac	29	2020-08-13 15:04:09.495781	2020-08-13 15:04:09.495781
2029	Tepeyanco	29	2020-08-13 15:04:09.503086	2020-08-13 15:04:09.503086
2030	Santa Isabel Xiloxoxtla	29	2020-08-13 15:04:09.512435	2020-08-13 15:04:09.512435
2031	San Juan Huactzinco	29	2020-08-13 15:04:09.519567	2020-08-13 15:04:09.519567
2032	Calpulalpan	29	2020-08-13 15:04:09.527044	2020-08-13 15:04:09.527044
2033	Sanctórum de Lázaro Cárdenas	29	2020-08-13 15:04:09.535002	2020-08-13 15:04:09.535002
2034	Benito Juárez	29	2020-08-13 15:04:09.542536	2020-08-13 15:04:09.542536
2035	Hueyotlipan	29	2020-08-13 15:04:09.550019	2020-08-13 15:04:09.550019
2036	Tlaxco	29	2020-08-13 15:04:09.557711	2020-08-13 15:04:09.557711
2037	Nanacamilpa de Mariano Arista	29	2020-08-13 15:04:09.564963	2020-08-13 15:04:09.564963
2038	Españita	29	2020-08-13 15:04:09.571922	2020-08-13 15:04:09.571922
2039	Apizaco	29	2020-08-13 15:04:09.57979	2020-08-13 15:04:09.57979
2040	Atlangatepec	29	2020-08-13 15:04:09.586945	2020-08-13 15:04:09.586945
2041	Muñoz de Domingo Arenas	29	2020-08-13 15:04:09.59449	2020-08-13 15:04:09.59449
2042	Tetla de la Solidaridad	29	2020-08-13 15:04:09.609718	2020-08-13 15:04:09.609718
2043	Xaltocan	29	2020-08-13 15:04:09.616954	2020-08-13 15:04:09.616954
2044	San Lucas Tecopilco	29	2020-08-13 15:04:09.624761	2020-08-13 15:04:09.624761
2045	Yauhquemehcan	29	2020-08-13 15:04:09.631824	2020-08-13 15:04:09.631824
2046	Xaloztoc	29	2020-08-13 15:04:09.638881	2020-08-13 15:04:09.638881
2047	Tocatlán	29	2020-08-13 15:04:09.64591	2020-08-13 15:04:09.64591
2048	Tzompantepec	29	2020-08-13 15:04:09.653297	2020-08-13 15:04:09.653297
2049	San José Teacalco	29	2020-08-13 15:04:09.660913	2020-08-13 15:04:09.660913
2050	Huamantla	29	2020-08-13 15:04:09.667789	2020-08-13 15:04:09.667789
2051	Terrenate	29	2020-08-13 15:04:09.674974	2020-08-13 15:04:09.674974
2052	Lázaro Cárdenas	29	2020-08-13 15:04:09.682594	2020-08-13 15:04:09.682594
2053	Emiliano Zapata	29	2020-08-13 15:04:09.689694	2020-08-13 15:04:09.689694
2054	Atltzayanca	29	2020-08-13 15:04:09.696832	2020-08-13 15:04:09.696832
2055	Cuapiaxtla	29	2020-08-13 15:04:09.704146	2020-08-13 15:04:09.704146
2056	El Carmen Tequexquitla	29	2020-08-13 15:04:09.71095	2020-08-13 15:04:09.71095
2057	Ixtenco	29	2020-08-13 15:04:09.717798	2020-08-13 15:04:09.717798
2058	Ziltlaltépec de Trinidad Sánchez Santos	29	2020-08-13 15:04:09.725327	2020-08-13 15:04:09.725327
2059	Apetatitlán de Antonio Carvajal	29	2020-08-13 15:04:09.732602	2020-08-13 15:04:09.732602
2060	Amaxac de Guerrero	29	2020-08-13 15:04:09.739974	2020-08-13 15:04:09.739974
2061	Santa Cruz Tlaxcala	29	2020-08-13 15:04:09.747369	2020-08-13 15:04:09.747369
2062	Cuaxomulco	29	2020-08-13 15:04:09.754253	2020-08-13 15:04:09.754253
2063	Contla de Juan Cuamatzi	29	2020-08-13 15:04:09.761322	2020-08-13 15:04:09.761322
2064	Tepetitla de Lardizábal	29	2020-08-13 15:04:09.76896	2020-08-13 15:04:09.76896
2065	Natívitas	29	2020-08-13 15:04:09.776405	2020-08-13 15:04:09.776405
2066	Santa Apolonia Teacalco	29	2020-08-13 15:04:09.7837	2020-08-13 15:04:09.7837
2067	Tetlatlahuca	29	2020-08-13 15:04:09.790938	2020-08-13 15:04:09.790938
2068	San Damián Texóloc	29	2020-08-13 15:04:09.798425	2020-08-13 15:04:09.798425
2069	San Jerónimo Zacualpan	29	2020-08-13 15:04:09.805514	2020-08-13 15:04:09.805514
2070	Zacatelco	29	2020-08-13 15:04:09.81279	2020-08-13 15:04:09.81279
2071	San Lorenzo Axocomanitla	29	2020-08-13 15:04:09.821049	2020-08-13 15:04:09.821049
2072	Santa Catarina Ayometla	29	2020-08-13 15:04:09.828133	2020-08-13 15:04:09.828133
2073	Xicohtzinco	29	2020-08-13 15:04:09.83546	2020-08-13 15:04:09.83546
2074	Papalotla de Xicohténcatl	29	2020-08-13 15:04:09.84284	2020-08-13 15:04:09.84284
2075	Chiautempan	29	2020-08-13 15:04:09.85119	2020-08-13 15:04:09.85119
2076	La Magdalena Tlaltelulco	29	2020-08-13 15:04:09.859364	2020-08-13 15:04:09.859364
2077	San Francisco Tetlanohcan	29	2020-08-13 15:04:09.866652	2020-08-13 15:04:09.866652
2078	Teolocholco	29	2020-08-13 15:04:09.873949	2020-08-13 15:04:09.873949
2079	Acuamanala de Miguel Hidalgo	29	2020-08-13 15:04:09.881299	2020-08-13 15:04:09.881299
2080	Santa Cruz Quilehtla	29	2020-08-13 15:04:09.888652	2020-08-13 15:04:09.888652
2081	Mazatecochco de José María Morelos	29	2020-08-13 15:04:09.896025	2020-08-13 15:04:09.896025
2082	Tenancingo	29	2020-08-13 15:04:09.897543	2020-08-13 15:04:09.897543
2083	San Pablo del Monte	29	2020-08-13 15:04:09.898965	2020-08-13 15:04:09.898965
2084	Xalapa	30	2020-08-13 15:04:09.900298	2020-08-13 15:04:09.900298
2085	Tlalnelhuayocan	30	2020-08-13 15:04:09.90169	2020-08-13 15:04:09.90169
2086	Xico	30	2020-08-13 15:04:09.903055	2020-08-13 15:04:09.903055
2087	Ixhuacán de los Reyes	30	2020-08-13 15:04:09.90448	2020-08-13 15:04:09.90448
2088	Ayahualulco	30	2020-08-13 15:04:09.905937	2020-08-13 15:04:09.905937
2089	Perote	30	2020-08-13 15:04:09.907375	2020-08-13 15:04:09.907375
2090	Banderilla	30	2020-08-13 15:04:09.908701	2020-08-13 15:04:09.908701
2091	Rafael Lucio	30	2020-08-13 15:04:09.910001	2020-08-13 15:04:09.910001
2092	Acajete	30	2020-08-13 15:04:09.91129	2020-08-13 15:04:09.91129
2093	Las Vigas de Ramírez	30	2020-08-13 15:04:09.912574	2020-08-13 15:04:09.912574
2094	Villa Aldama	30	2020-08-13 15:04:09.913852	2020-08-13 15:04:09.913852
2095	Tlacolulan	30	2020-08-13 15:04:09.918197	2020-08-13 15:04:09.918197
2096	Tonayán	30	2020-08-13 15:04:09.919832	2020-08-13 15:04:09.919832
2097	Coacoatzintla	30	2020-08-13 15:04:09.921328	2020-08-13 15:04:09.921328
2098	Jilotepec	30	2020-08-13 15:04:09.922829	2020-08-13 15:04:09.922829
2099	Naolinco	30	2020-08-13 15:04:09.92435	2020-08-13 15:04:09.92435
2100	Miahuatlán	30	2020-08-13 15:04:09.925776	2020-08-13 15:04:09.925776
2101	Acatlán	30	2020-08-13 15:04:09.927199	2020-08-13 15:04:09.927199
2102	Tepetlán	30	2020-08-13 15:04:09.928694	2020-08-13 15:04:09.928694
2103	Juchique de Ferrer	30	2020-08-13 15:04:09.935917	2020-08-13 15:04:09.935917
2104	Alto Lucero de Gutiérrez Barrios	30	2020-08-13 15:04:09.943524	2020-08-13 15:04:09.943524
2105	Actopan	30	2020-08-13 15:04:09.951434	2020-08-13 15:04:09.951434
2106	Coatepec	30	2020-08-13 15:04:09.959111	2020-08-13 15:04:09.959111
2107	Teocelo	30	2020-08-13 15:04:09.966677	2020-08-13 15:04:09.966677
2108	Cosautlán de Carvajal	30	2020-08-13 15:04:09.974607	2020-08-13 15:04:09.974607
2109	Emiliano Zapata	30	2020-08-13 15:04:09.982279	2020-08-13 15:04:09.982279
2110	Apazapan	30	2020-08-13 15:04:09.9895	2020-08-13 15:04:09.9895
2111	Puente Nacional	30	2020-08-13 15:04:09.996506	2020-08-13 15:04:09.996506
2112	Ursulo Galván	30	2020-08-13 15:04:10.004155	2020-08-13 15:04:10.004155
2113	Paso de Ovejas	30	2020-08-13 15:04:10.005909	2020-08-13 15:04:10.005909
2114	La Antigua	30	2020-08-13 15:04:10.007431	2020-08-13 15:04:10.007431
2115	Veracruz	30	2020-08-13 15:04:10.008874	2020-08-13 15:04:10.008874
2116	Pánuco	30	2020-08-13 15:04:10.010301	2020-08-13 15:04:10.010301
2117	Pueblo Viejo	30	2020-08-13 15:04:10.011698	2020-08-13 15:04:10.011698
2118	Tampico Alto	30	2020-08-13 15:04:10.013057	2020-08-13 15:04:10.013057
2119	Tempoal	30	2020-08-13 15:04:10.014433	2020-08-13 15:04:10.014433
2120	Ozuluama de Mascareñas	30	2020-08-13 15:04:10.015779	2020-08-13 15:04:10.015779
2121	Tantoyuca	30	2020-08-13 15:04:10.017136	2020-08-13 15:04:10.017136
2122	Platón Sánchez	30	2020-08-13 15:04:10.018477	2020-08-13 15:04:10.018477
2123	Chiconamel	30	2020-08-13 15:04:10.019794	2020-08-13 15:04:10.019794
2124	Chalma	30	2020-08-13 15:04:10.021118	2020-08-13 15:04:10.021118
2125	Chontla	30	2020-08-13 15:04:10.02243	2020-08-13 15:04:10.02243
2126	Citlaltépetl	30	2020-08-13 15:04:10.023744	2020-08-13 15:04:10.023744
2127	Ixcatepec	30	2020-08-13 15:04:10.025031	2020-08-13 15:04:10.025031
2128	Naranjos Amatlán	30	2020-08-13 15:04:10.026356	2020-08-13 15:04:10.026356
2129	El Higo	30	2020-08-13 15:04:10.02779	2020-08-13 15:04:10.02779
2130	Chinampa de Gorostiza	30	2020-08-13 15:04:10.029148	2020-08-13 15:04:10.029148
2131	Tantima	30	2020-08-13 15:04:10.030486	2020-08-13 15:04:10.030486
2132	Tamalín	30	2020-08-13 15:04:10.031821	2020-08-13 15:04:10.031821
2133	Cerro Azul	30	2020-08-13 15:04:10.033201	2020-08-13 15:04:10.033201
2134	Tepetzintla	30	2020-08-13 15:04:10.034549	2020-08-13 15:04:10.034549
2135	Tancoco	30	2020-08-13 15:04:10.035862	2020-08-13 15:04:10.035862
2136	Tamiahua	30	2020-08-13 15:04:10.03718	2020-08-13 15:04:10.03718
2137	Huayacocotla	30	2020-08-13 15:04:10.038488	2020-08-13 15:04:10.038488
2138	Ilamatlán	30	2020-08-13 15:04:10.039785	2020-08-13 15:04:10.039785
2139	Zontecomatlán de López y Fuentes	30	2020-08-13 15:04:10.041095	2020-08-13 15:04:10.041095
2140	Texcatepec	30	2020-08-13 15:04:10.042391	2020-08-13 15:04:10.042391
2141	Zacualpan	30	2020-08-13 15:04:10.043654	2020-08-13 15:04:10.043654
2142	Benito Juárez	30	2020-08-13 15:04:10.045012	2020-08-13 15:04:10.045012
2143	Tlachichilco	30	2020-08-13 15:04:10.046316	2020-08-13 15:04:10.046316
2144	Ixhuatlán de Madero	30	2020-08-13 15:04:10.047608	2020-08-13 15:04:10.047608
2145	Chicontepec	30	2020-08-13 15:04:10.04892	2020-08-13 15:04:10.04892
2146	Álamo Temapache	30	2020-08-13 15:04:10.050229	2020-08-13 15:04:10.050229
2147	Tuxpan	30	2020-08-13 15:04:10.057389	2020-08-13 15:04:10.057389
2148	Tihuatlán	30	2020-08-13 15:04:10.065422	2020-08-13 15:04:10.065422
2149	Castillo de Teayo	30	2020-08-13 15:04:10.073342	2020-08-13 15:04:10.073342
2150	Cazones de Herrera	30	2020-08-13 15:04:10.081121	2020-08-13 15:04:10.081121
2151	Zozocolco de Hidalgo	30	2020-08-13 15:04:10.088678	2020-08-13 15:04:10.088678
2152	Chumatlán	30	2020-08-13 15:04:10.096005	2020-08-13 15:04:10.096005
2153	Coxquihui	30	2020-08-13 15:04:10.10355	2020-08-13 15:04:10.10355
2154	Mecatlán	30	2020-08-13 15:04:10.111215	2020-08-13 15:04:10.111215
2155	Filomeno Mata	30	2020-08-13 15:04:10.118817	2020-08-13 15:04:10.118817
2156	Coahuitlán	30	2020-08-13 15:04:10.1265	2020-08-13 15:04:10.1265
2157	Coyutla	30	2020-08-13 15:04:10.132781	2020-08-13 15:04:10.132781
2158	Coatzintla	30	2020-08-13 15:04:10.13431	2020-08-13 15:04:10.13431
2159	Espinal	30	2020-08-13 15:04:10.135697	2020-08-13 15:04:10.135697
2160	Poza Rica de Hidalgo	30	2020-08-13 15:04:10.137057	2020-08-13 15:04:10.137057
2161	Papantla	30	2020-08-13 15:04:10.13841	2020-08-13 15:04:10.13841
2162	Gutiérrez Zamora	30	2020-08-13 15:04:10.139947	2020-08-13 15:04:10.139947
2163	Tecolutla	30	2020-08-13 15:04:10.141343	2020-08-13 15:04:10.141343
2164	Martínez de la Torre	30	2020-08-13 15:04:10.142726	2020-08-13 15:04:10.142726
2165	San Rafael	30	2020-08-13 15:04:10.144156	2020-08-13 15:04:10.144156
2166	Tlapacoyan	30	2020-08-13 15:04:10.145619	2020-08-13 15:04:10.145619
2167	Jalacingo	30	2020-08-13 15:04:10.147039	2020-08-13 15:04:10.147039
2168	Atzalan	30	2020-08-13 15:04:10.148471	2020-08-13 15:04:10.148471
2169	Altotonga	30	2020-08-13 15:04:10.149886	2020-08-13 15:04:10.149886
2170	Las Minas	30	2020-08-13 15:04:10.151322	2020-08-13 15:04:10.151322
2171	Tatatila	30	2020-08-13 15:04:10.15271	2020-08-13 15:04:10.15271
2172	Tenochtitlán	30	2020-08-13 15:04:10.160759	2020-08-13 15:04:10.160759
2173	Nautla	30	2020-08-13 15:04:10.168589	2020-08-13 15:04:10.168589
2174	Misantla	30	2020-08-13 15:04:10.175891	2020-08-13 15:04:10.175891
2175	Landero y Coss	30	2020-08-13 15:04:10.182609	2020-08-13 15:04:10.182609
2176	Chiconquiaco	30	2020-08-13 15:04:10.184889	2020-08-13 15:04:10.184889
2177	Yecuatla	30	2020-08-13 15:04:10.187128	2020-08-13 15:04:10.187128
2178	Colipa	30	2020-08-13 15:04:10.189142	2020-08-13 15:04:10.189142
2179	Vega de Alatorre	30	2020-08-13 15:04:10.191006	2020-08-13 15:04:10.191006
2180	Jalcomulco	30	2020-08-13 15:04:10.193112	2020-08-13 15:04:10.193112
2181	Tlaltetela	30	2020-08-13 15:04:10.195033	2020-08-13 15:04:10.195033
2182	Tenampa	30	2020-08-13 15:04:10.197022	2020-08-13 15:04:10.197022
2183	Totutla	30	2020-08-13 15:04:10.198927	2020-08-13 15:04:10.198927
2184	Sochiapa	30	2020-08-13 15:04:10.200816	2020-08-13 15:04:10.200816
2185	Tlacotepec de Mejía	30	2020-08-13 15:04:10.202777	2020-08-13 15:04:10.202777
2186	Huatusco	30	2020-08-13 15:04:10.204443	2020-08-13 15:04:10.204443
2187	Calcahualco	30	2020-08-13 15:04:10.206349	2020-08-13 15:04:10.206349
2188	Alpatláhuac	30	2020-08-13 15:04:10.20825	2020-08-13 15:04:10.20825
2189	Coscomatepec	30	2020-08-13 15:04:10.210226	2020-08-13 15:04:10.210226
2190	La Perla	30	2020-08-13 15:04:10.212295	2020-08-13 15:04:10.212295
2191	Chocamán	30	2020-08-13 15:04:10.214322	2020-08-13 15:04:10.214322
2192	Tomatlán	30	2020-08-13 15:04:10.216347	2020-08-13 15:04:10.216347
2193	Ixhuatlán del Café	30	2020-08-13 15:04:10.218442	2020-08-13 15:04:10.218442
2194	Tepatlaxco	30	2020-08-13 15:04:10.220609	2020-08-13 15:04:10.220609
2195	Comapa	30	2020-08-13 15:04:10.222579	2020-08-13 15:04:10.222579
2196	Zentla	30	2020-08-13 15:04:10.224197	2020-08-13 15:04:10.224197
2197	Camarón de Tejeda	30	2020-08-13 15:04:10.225835	2020-08-13 15:04:10.225835
2198	Soledad de Doblado	30	2020-08-13 15:04:10.227713	2020-08-13 15:04:10.227713
2199	Manlio Fabio Altamirano	30	2020-08-13 15:04:10.235073	2020-08-13 15:04:10.235073
2200	Jamapa	30	2020-08-13 15:04:10.242979	2020-08-13 15:04:10.242979
2201	Medellín	30	2020-08-13 15:04:10.25054	2020-08-13 15:04:10.25054
2202	Boca del Río	30	2020-08-13 15:04:10.258106	2020-08-13 15:04:10.258106
2203	Orizaba	30	2020-08-13 15:04:10.265085	2020-08-13 15:04:10.265085
2204	Rafael Delgado	30	2020-08-13 15:04:10.272375	2020-08-13 15:04:10.272375
2205	Mariano Escobedo	30	2020-08-13 15:04:10.280106	2020-08-13 15:04:10.280106
2206	Ixhuatlancillo	30	2020-08-13 15:04:10.28748	2020-08-13 15:04:10.28748
2207	Atzacan	30	2020-08-13 15:04:10.294993	2020-08-13 15:04:10.294993
2208	Ixtaczoquitlán	30	2020-08-13 15:04:10.302435	2020-08-13 15:04:10.302435
2209	Fortín	30	2020-08-13 15:04:10.309355	2020-08-13 15:04:10.309355
2210	Córdoba	30	2020-08-13 15:04:10.311034	2020-08-13 15:04:10.311034
2211	Maltrata	30	2020-08-13 15:04:10.312649	2020-08-13 15:04:10.312649
2212	Nogales	30	2020-08-13 15:04:10.314196	2020-08-13 15:04:10.314196
2213	Río Blanco	30	2020-08-13 15:04:10.315785	2020-08-13 15:04:10.315785
2214	Camerino Z. Mendoza	30	2020-08-13 15:04:10.317289	2020-08-13 15:04:10.317289
2215	Aquila	30	2020-08-13 15:04:10.318821	2020-08-13 15:04:10.318821
2216	Acultzingo	30	2020-08-13 15:04:10.326243	2020-08-13 15:04:10.326243
2217	Soledad Atzompa	30	2020-08-13 15:04:10.333369	2020-08-13 15:04:10.333369
2218	Huiloapan de Cuauhtémoc	30	2020-08-13 15:04:10.34088	2020-08-13 15:04:10.34088
2219	Tlaquilpa	30	2020-08-13 15:04:10.348399	2020-08-13 15:04:10.348399
2220	Astacinga	30	2020-08-13 15:04:10.356044	2020-08-13 15:04:10.356044
2221	Xoxocotla	30	2020-08-13 15:04:10.363714	2020-08-13 15:04:10.363714
2222	Atlahuilco	30	2020-08-13 15:04:10.371084	2020-08-13 15:04:10.371084
2223	Tequila	30	2020-08-13 15:04:10.380398	2020-08-13 15:04:10.380398
2224	San Andrés Tenejapan	30	2020-08-13 15:04:10.387964	2020-08-13 15:04:10.387964
2225	Tlilapan	30	2020-08-13 15:04:10.395604	2020-08-13 15:04:10.395604
2226	Magdalena	30	2020-08-13 15:04:10.403319	2020-08-13 15:04:10.403319
2227	Naranjal	30	2020-08-13 15:04:10.404972	2020-08-13 15:04:10.404972
2228	Coetzala	30	2020-08-13 15:04:10.406333	2020-08-13 15:04:10.406333
2229	Omealca	30	2020-08-13 15:04:10.407921	2020-08-13 15:04:10.407921
2230	Cuitláhuac	30	2020-08-13 15:04:10.40942	2020-08-13 15:04:10.40942
2231	Cuichapa	30	2020-08-13 15:04:10.410774	2020-08-13 15:04:10.410774
2232	Yanga	30	2020-08-13 15:04:10.413418	2020-08-13 15:04:10.413418
2233	Amatlán de los Reyes	30	2020-08-13 15:04:10.414955	2020-08-13 15:04:10.414955
2234	Atoyac	30	2020-08-13 15:04:10.416517	2020-08-13 15:04:10.416517
2235	Paso del Macho	30	2020-08-13 15:04:10.417901	2020-08-13 15:04:10.417901
2236	Carrillo Puerto	30	2020-08-13 15:04:10.419315	2020-08-13 15:04:10.419315
2237	Cotaxtla	30	2020-08-13 15:04:10.420665	2020-08-13 15:04:10.420665
2238	Zongolica	30	2020-08-13 15:04:10.422018	2020-08-13 15:04:10.422018
2239	Tehuipango	30	2020-08-13 15:04:10.423462	2020-08-13 15:04:10.423462
2240	Mixtla de Altamirano	30	2020-08-13 15:04:10.424813	2020-08-13 15:04:10.424813
2241	Los Reyes	30	2020-08-13 15:04:10.426335	2020-08-13 15:04:10.426335
2242	Texhuacán	30	2020-08-13 15:04:10.427687	2020-08-13 15:04:10.427687
2243	Tezonapa	30	2020-08-13 15:04:10.429106	2020-08-13 15:04:10.429106
2244	Tierra Blanca	30	2020-08-13 15:04:10.430451	2020-08-13 15:04:10.430451
2245	Tlalixcoyan	30	2020-08-13 15:04:10.431836	2020-08-13 15:04:10.431836
2246	Ignacio de la Llave	30	2020-08-13 15:04:10.433283	2020-08-13 15:04:10.433283
2247	Alvarado	30	2020-08-13 15:04:10.43471	2020-08-13 15:04:10.43471
2248	Lerdo de Tejada	30	2020-08-13 15:04:10.436124	2020-08-13 15:04:10.436124
2249	Tres Valles	30	2020-08-13 15:04:10.437497	2020-08-13 15:04:10.437497
2250	Carlos A. Carrillo	30	2020-08-13 15:04:10.439016	2020-08-13 15:04:10.439016
2251	Cosamaloapan de Carpio	30	2020-08-13 15:04:10.440474	2020-08-13 15:04:10.440474
2252	Ixmatlahuacan	30	2020-08-13 15:04:10.449019	2020-08-13 15:04:10.449019
2253	Acula	30	2020-08-13 15:04:10.450611	2020-08-13 15:04:10.450611
2254	Amatitlán	30	2020-08-13 15:04:10.452015	2020-08-13 15:04:10.452015
2255	Tlacotalpan	30	2020-08-13 15:04:10.453385	2020-08-13 15:04:10.453385
2256	Saltabarranca	30	2020-08-13 15:04:10.454764	2020-08-13 15:04:10.454764
2257	Otatitlán	30	2020-08-13 15:04:10.462073	2020-08-13 15:04:10.462073
2258	Tlacojalpan	30	2020-08-13 15:04:10.469585	2020-08-13 15:04:10.469585
2259	Tuxtilla	30	2020-08-13 15:04:10.478221	2020-08-13 15:04:10.478221
2260	Chacaltianguis	30	2020-08-13 15:04:10.485836	2020-08-13 15:04:10.485836
2261	José Azueta	30	2020-08-13 15:04:10.493486	2020-08-13 15:04:10.493486
2262	Playa Vicente	30	2020-08-13 15:04:10.501396	2020-08-13 15:04:10.501396
2263	Santiago Sochiapan	30	2020-08-13 15:04:10.508911	2020-08-13 15:04:10.508911
2264	Isla	30	2020-08-13 15:04:10.512385	2020-08-13 15:04:10.512385
2265	Juan Rodríguez Clara	30	2020-08-13 15:04:10.514	2020-08-13 15:04:10.514
2266	San Andrés Tuxtla	30	2020-08-13 15:04:10.515582	2020-08-13 15:04:10.515582
2267	Santiago Tuxtla	30	2020-08-13 15:04:10.516936	2020-08-13 15:04:10.516936
2268	Angel R. Cabada	30	2020-08-13 15:04:10.518235	2020-08-13 15:04:10.518235
2269	Hueyapan de Ocampo	30	2020-08-13 15:04:10.519701	2020-08-13 15:04:10.519701
2270	Catemaco	30	2020-08-13 15:04:10.521104	2020-08-13 15:04:10.521104
2271	Soteapan	30	2020-08-13 15:04:10.522416	2020-08-13 15:04:10.522416
2272	Mecayapan	30	2020-08-13 15:04:10.523788	2020-08-13 15:04:10.523788
2273	Tatahuicapan de Juárez	30	2020-08-13 15:04:10.525317	2020-08-13 15:04:10.525317
2274	Pajapan	30	2020-08-13 15:04:10.526675	2020-08-13 15:04:10.526675
2275	Chinameca	30	2020-08-13 15:04:10.52814	2020-08-13 15:04:10.52814
2276	Acayucan	30	2020-08-13 15:04:10.529409	2020-08-13 15:04:10.529409
2277	San Juan Evangelista	30	2020-08-13 15:04:10.530695	2020-08-13 15:04:10.530695
2278	Sayula de Alemán	30	2020-08-13 15:04:10.532053	2020-08-13 15:04:10.532053
2279	Oluta	30	2020-08-13 15:04:10.533336	2020-08-13 15:04:10.533336
2280	Soconusco	30	2020-08-13 15:04:10.534659	2020-08-13 15:04:10.534659
2281	Texistepec	30	2020-08-13 15:04:10.536109	2020-08-13 15:04:10.536109
2282	Jáltipan	30	2020-08-13 15:04:10.537407	2020-08-13 15:04:10.537407
2283	Zaragoza	30	2020-08-13 15:04:10.538736	2020-08-13 15:04:10.538736
2284	Oteapan	30	2020-08-13 15:04:10.540043	2020-08-13 15:04:10.540043
2285	Cosoleacaque	30	2020-08-13 15:04:10.541634	2020-08-13 15:04:10.541634
2286	Nanchital de Lázaro Cárdenas del Río	30	2020-08-13 15:04:10.548768	2020-08-13 15:04:10.548768
2287	Ixhuatlán del Sureste	30	2020-08-13 15:04:10.556081	2020-08-13 15:04:10.556081
2288	Moloacán	30	2020-08-13 15:04:10.563435	2020-08-13 15:04:10.563435
2289	Coatzacoalcos	30	2020-08-13 15:04:10.56957	2020-08-13 15:04:10.56957
2290	Agua Dulce	30	2020-08-13 15:04:10.571088	2020-08-13 15:04:10.571088
2291	Minatitlán	30	2020-08-13 15:04:10.572485	2020-08-13 15:04:10.572485
2292	Hidalgotitlán	30	2020-08-13 15:04:10.575426	2020-08-13 15:04:10.575426
2293	Jesús Carranza	30	2020-08-13 15:04:10.576993	2020-08-13 15:04:10.576993
2294	Las Choapas	30	2020-08-13 15:04:10.578378	2020-08-13 15:04:10.578378
2295	Uxpanapa	30	2020-08-13 15:04:10.579744	2020-08-13 15:04:10.579744
2296	Mérida	31	2020-08-13 15:04:10.581114	2020-08-13 15:04:10.581114
2297	Progreso	31	2020-08-13 15:04:10.582589	2020-08-13 15:04:10.582589
2298	Chicxulub Pueblo	31	2020-08-13 15:04:10.583999	2020-08-13 15:04:10.583999
2299	Ixil	31	2020-08-13 15:04:10.585347	2020-08-13 15:04:10.585347
2300	Conkal	31	2020-08-13 15:04:10.586674	2020-08-13 15:04:10.586674
2301	Yaxkukul	31	2020-08-13 15:04:10.588081	2020-08-13 15:04:10.588081
2302	Hunucmá	31	2020-08-13 15:04:10.589427	2020-08-13 15:04:10.589427
2303	Ucú	31	2020-08-13 15:04:10.590775	2020-08-13 15:04:10.590775
2304	Kinchil	31	2020-08-13 15:04:10.592114	2020-08-13 15:04:10.592114
2305	Tetiz	31	2020-08-13 15:04:10.593438	2020-08-13 15:04:10.593438
2306	Celestún	31	2020-08-13 15:04:10.600658	2020-08-13 15:04:10.600658
2307	Kanasín	31	2020-08-13 15:04:10.607945	2020-08-13 15:04:10.607945
2308	Timucuy	31	2020-08-13 15:04:10.616127	2020-08-13 15:04:10.616127
2309	Acanceh	31	2020-08-13 15:04:10.622336	2020-08-13 15:04:10.622336
2310	Tixpéhual	31	2020-08-13 15:04:10.623811	2020-08-13 15:04:10.623811
2311	Umán	31	2020-08-13 15:04:10.630903	2020-08-13 15:04:10.630903
2312	Telchac Pueblo	31	2020-08-13 15:04:10.638431	2020-08-13 15:04:10.638431
2313	Dzemul	31	2020-08-13 15:04:10.645796	2020-08-13 15:04:10.645796
2314	Telchac Puerto	31	2020-08-13 15:04:10.653128	2020-08-13 15:04:10.653128
2315	Cansahcab	31	2020-08-13 15:04:10.660528	2020-08-13 15:04:10.660528
2316	Sinanché	31	2020-08-13 15:04:10.66878	2020-08-13 15:04:10.66878
2317	Yobaín	31	2020-08-13 15:04:10.675936	2020-08-13 15:04:10.675936
2318	Motul	31	2020-08-13 15:04:10.683251	2020-08-13 15:04:10.683251
2319	Baca	31	2020-08-13 15:04:10.690599	2020-08-13 15:04:10.690599
2320	Mocochá	31	2020-08-13 15:04:10.698024	2020-08-13 15:04:10.698024
2321	Muxupip	31	2020-08-13 15:04:10.705681	2020-08-13 15:04:10.705681
2322	Cacalchén	31	2020-08-13 15:04:10.712917	2020-08-13 15:04:10.712917
2323	Bokobá	31	2020-08-13 15:04:10.719908	2020-08-13 15:04:10.719908
2324	Tixkokob	31	2020-08-13 15:04:10.727222	2020-08-13 15:04:10.727222
2325	Hoctún	31	2020-08-13 15:04:10.734607	2020-08-13 15:04:10.734607
2326	Tahmek	31	2020-08-13 15:04:10.741854	2020-08-13 15:04:10.741854
2327	Dzidzantún	31	2020-08-13 15:04:10.748994	2020-08-13 15:04:10.748994
2328	Temax	31	2020-08-13 15:04:10.75631	2020-08-13 15:04:10.75631
2329	Tekantó	31	2020-08-13 15:04:10.763931	2020-08-13 15:04:10.763931
2330	Teya	31	2020-08-13 15:04:10.773628	2020-08-13 15:04:10.773628
2331	Suma	31	2020-08-13 15:04:10.7808	2020-08-13 15:04:10.7808
2332	Tepakán	31	2020-08-13 15:04:10.78807	2020-08-13 15:04:10.78807
2333	Tekal de Venegas	31	2020-08-13 15:04:10.795694	2020-08-13 15:04:10.795694
2334	Izamal	31	2020-08-13 15:04:10.803356	2020-08-13 15:04:10.803356
2335	Hocabá	31	2020-08-13 15:04:10.810432	2020-08-13 15:04:10.810432
2336	Xocchel	31	2020-08-13 15:04:10.818181	2020-08-13 15:04:10.818181
2337	Seyé	31	2020-08-13 15:04:10.82557	2020-08-13 15:04:10.82557
2338	Cuzamá	31	2020-08-13 15:04:10.832946	2020-08-13 15:04:10.832946
2339	Homún	31	2020-08-13 15:04:10.840479	2020-08-13 15:04:10.840479
2340	Sanahcat	31	2020-08-13 15:04:10.847781	2020-08-13 15:04:10.847781
2341	Huhí	31	2020-08-13 15:04:10.855807	2020-08-13 15:04:10.855807
2342	Dzilam González	31	2020-08-13 15:04:10.862974	2020-08-13 15:04:10.862974
2343	Dzilam de Bravo	31	2020-08-13 15:04:10.870103	2020-08-13 15:04:10.870103
2344	Panabá	31	2020-08-13 15:04:10.877453	2020-08-13 15:04:10.877453
2345	San Felipe	31	2020-08-13 15:04:10.884942	2020-08-13 15:04:10.884942
2346	Buctzotz	31	2020-08-13 15:04:10.891854	2020-08-13 15:04:10.891854
2347	Sucilá	31	2020-08-13 15:04:10.89891	2020-08-13 15:04:10.89891
2348	Cenotillo	31	2020-08-13 15:04:10.906288	2020-08-13 15:04:10.906288
2349	Dzoncauich	31	2020-08-13 15:04:10.913307	2020-08-13 15:04:10.913307
2350	Tunkás	31	2020-08-13 15:04:10.92065	2020-08-13 15:04:10.92065
2351	Quintana Roo	31	2020-08-13 15:04:10.928039	2020-08-13 15:04:10.928039
2352	Dzitás	31	2020-08-13 15:04:10.935207	2020-08-13 15:04:10.935207
2353	Kantunil	31	2020-08-13 15:04:10.942597	2020-08-13 15:04:10.942597
2354	Sudzal	31	2020-08-13 15:04:10.950063	2020-08-13 15:04:10.950063
2355	Tekit	31	2020-08-13 15:04:10.957501	2020-08-13 15:04:10.957501
2356	Sotuta	31	2020-08-13 15:04:10.964873	2020-08-13 15:04:10.964873
2357	Tizimín	31	2020-08-13 15:04:10.972357	2020-08-13 15:04:10.972357
2358	Río Lagartos	31	2020-08-13 15:04:10.979581	2020-08-13 15:04:10.979581
2359	Espita	31	2020-08-13 15:04:10.986856	2020-08-13 15:04:10.986856
2360	Temozón	31	2020-08-13 15:04:10.994221	2020-08-13 15:04:10.994221
2361	Calotmul	31	2020-08-13 15:04:11.001618	2020-08-13 15:04:11.001618
2362	Tinum	31	2020-08-13 15:04:11.00874	2020-08-13 15:04:11.00874
2363	Chankom	31	2020-08-13 15:04:11.016086	2020-08-13 15:04:11.016086
2364	Chichimilá	31	2020-08-13 15:04:11.023451	2020-08-13 15:04:11.023451
2365	Tixcacalcupul	31	2020-08-13 15:04:11.030434	2020-08-13 15:04:11.030434
2366	Kaua	31	2020-08-13 15:04:11.037791	2020-08-13 15:04:11.037791
2367	Cuncunul	31	2020-08-13 15:04:11.045052	2020-08-13 15:04:11.045052
2368	Tekom	31	2020-08-13 15:04:11.052325	2020-08-13 15:04:11.052325
2369	Chemax	31	2020-08-13 15:04:11.059742	2020-08-13 15:04:11.059742
2370	Valladolid	31	2020-08-13 15:04:11.067518	2020-08-13 15:04:11.067518
2371	Uayma	31	2020-08-13 15:04:11.074807	2020-08-13 15:04:11.074807
2372	Maxcanú	31	2020-08-13 15:04:11.082175	2020-08-13 15:04:11.082175
2373	Samahil	31	2020-08-13 15:04:11.089409	2020-08-13 15:04:11.089409
2374	Opichén	31	2020-08-13 15:04:11.096324	2020-08-13 15:04:11.096324
2375	Chocholá	31	2020-08-13 15:04:11.103679	2020-08-13 15:04:11.103679
2376	Kopomá	31	2020-08-13 15:04:11.110676	2020-08-13 15:04:11.110676
2377	Tecoh	31	2020-08-13 15:04:11.118011	2020-08-13 15:04:11.118011
2378	Abalá	31	2020-08-13 15:04:11.124251	2020-08-13 15:04:11.124251
2379	Halachó	31	2020-08-13 15:04:11.125801	2020-08-13 15:04:11.125801
2380	Muna	31	2020-08-13 15:04:11.127202	2020-08-13 15:04:11.127202
2381	Sacalum	31	2020-08-13 15:04:11.128545	2020-08-13 15:04:11.128545
2382	Maní	31	2020-08-13 15:04:11.129849	2020-08-13 15:04:11.129849
2383	Dzán	31	2020-08-13 15:04:11.131194	2020-08-13 15:04:11.131194
2384	Chapab	31	2020-08-13 15:04:11.132507	2020-08-13 15:04:11.132507
2385	Ticul	31	2020-08-13 15:04:11.133919	2020-08-13 15:04:11.133919
2386	Oxkutzcab	31	2020-08-13 15:04:11.135299	2020-08-13 15:04:11.135299
2387	Santa Elena	31	2020-08-13 15:04:11.1368	2020-08-13 15:04:11.1368
2388	Mama	31	2020-08-13 15:04:11.143534	2020-08-13 15:04:11.143534
2389	Chumayel	31	2020-08-13 15:04:11.150652	2020-08-13 15:04:11.150652
2390	Mayapán	31	2020-08-13 15:04:11.158049	2020-08-13 15:04:11.158049
2391	Teabo	31	2020-08-13 15:04:11.165474	2020-08-13 15:04:11.165474
2392	Cantamayec	31	2020-08-13 15:04:11.172827	2020-08-13 15:04:11.172827
2393	Yaxcabá	31	2020-08-13 15:04:11.180263	2020-08-13 15:04:11.180263
2394	Peto	31	2020-08-13 15:04:11.18778	2020-08-13 15:04:11.18778
2395	Chikindzonot	31	2020-08-13 15:04:11.195263	2020-08-13 15:04:11.195263
2396	Tahdziú	31	2020-08-13 15:04:11.202626	2020-08-13 15:04:11.202626
2397	Tixmehuac	31	2020-08-13 15:04:11.210054	2020-08-13 15:04:11.210054
2398	Chacsinkín	31	2020-08-13 15:04:11.217361	2020-08-13 15:04:11.217361
2399	Tzucacab	31	2020-08-13 15:04:11.224696	2020-08-13 15:04:11.224696
2400	Tekax	31	2020-08-13 15:04:11.232238	2020-08-13 15:04:11.232238
2401	Akil	31	2020-08-13 15:04:11.239755	2020-08-13 15:04:11.239755
2402	Zacatecas	32	2020-08-13 15:04:11.251342	2020-08-13 15:04:11.251342
2403	Morelos	32	2020-08-13 15:04:11.432993	2020-08-13 15:04:11.432993
2404	Vetagrande	32	2020-08-13 15:04:11.472897	2020-08-13 15:04:11.472897
2405	Concepción del Oro	32	2020-08-13 15:04:11.4809	2020-08-13 15:04:11.4809
2406	Melchor Ocampo	32	2020-08-13 15:04:11.483049	2020-08-13 15:04:11.483049
2407	Mazapil	32	2020-08-13 15:04:11.484492	2020-08-13 15:04:11.484492
2408	El Salvador	32	2020-08-13 15:04:11.486566	2020-08-13 15:04:11.486566
2409	Juan Aldama	32	2020-08-13 15:04:11.494396	2020-08-13 15:04:11.494396
2410	Miguel Auza	32	2020-08-13 15:04:11.502435	2020-08-13 15:04:11.502435
2411	General Francisco R. Murguía	32	2020-08-13 15:04:11.510185	2020-08-13 15:04:11.510185
2412	Río Grande	32	2020-08-13 15:04:11.518001	2020-08-13 15:04:11.518001
2413	Villa de Cos	32	2020-08-13 15:04:11.525216	2020-08-13 15:04:11.525216
2414	Cañitas de Felipe Pescador	32	2020-08-13 15:04:11.532661	2020-08-13 15:04:11.532661
2415	Calera	32	2020-08-13 15:04:11.54792	2020-08-13 15:04:11.54792
2416	Pánuco	32	2020-08-13 15:04:11.561843	2020-08-13 15:04:11.561843
2417	General Enrique Estrada	32	2020-08-13 15:04:11.588383	2020-08-13 15:04:11.588383
2418	Guadalupe	32	2020-08-13 15:04:11.628125	2020-08-13 15:04:11.628125
2419	Trancoso	32	2020-08-13 15:04:11.636688	2020-08-13 15:04:11.636688
2420	Genaro Codina	32	2020-08-13 15:04:11.645684	2020-08-13 15:04:11.645684
2421	Cuauhtémoc	32	2020-08-13 15:04:11.647884	2020-08-13 15:04:11.647884
2422	Ojocaliente	32	2020-08-13 15:04:11.649955	2020-08-13 15:04:11.649955
2423	General Pánfilo Natera	32	2020-08-13 15:04:11.651994	2020-08-13 15:04:11.651994
2424	Luis Moya	32	2020-08-13 15:04:11.662004	2020-08-13 15:04:11.662004
2425	Loreto	32	2020-08-13 15:04:11.686698	2020-08-13 15:04:11.686698
2426	Villa González Ortega	32	2020-08-13 15:04:11.69956	2020-08-13 15:04:11.69956
2427	Noria de Ángeles	32	2020-08-13 15:04:11.70831	2020-08-13 15:04:11.70831
2428	Villa García	32	2020-08-13 15:04:11.716328	2020-08-13 15:04:11.716328
2429	Pinos	32	2020-08-13 15:04:11.72424	2020-08-13 15:04:11.72424
2430	Villa Hidalgo	32	2020-08-13 15:04:11.731954	2020-08-13 15:04:11.731954
2431	Fresnillo	32	2020-08-13 15:04:11.739799	2020-08-13 15:04:11.739799
2432	Sombrerete	32	2020-08-13 15:04:11.747755	2020-08-13 15:04:11.747755
2433	Sain Alto	32	2020-08-13 15:04:11.760072	2020-08-13 15:04:11.760072
2434	Valparaíso	32	2020-08-13 15:04:11.768738	2020-08-13 15:04:11.768738
2435	Chalchihuites	32	2020-08-13 15:04:11.770994	2020-08-13 15:04:11.770994
2436	Jiménez del Teul	32	2020-08-13 15:04:11.773265	2020-08-13 15:04:11.773265
2437	Jerez	32	2020-08-13 15:04:11.775514	2020-08-13 15:04:11.775514
2438	Monte Escobedo	32	2020-08-13 15:04:11.777697	2020-08-13 15:04:11.777697
2439	Susticacán	32	2020-08-13 15:04:11.779557	2020-08-13 15:04:11.779557
2440	Villanueva	32	2020-08-13 15:04:11.781537	2020-08-13 15:04:11.781537
2441	Tepetongo	32	2020-08-13 15:04:11.783496	2020-08-13 15:04:11.783496
2442	El Plateado de Joaquín Amaro	32	2020-08-13 15:04:11.785694	2020-08-13 15:04:11.785694
2443	Jalpa	32	2020-08-13 15:04:11.787963	2020-08-13 15:04:11.787963
2444	Tabasco	32	2020-08-13 15:04:11.79619	2020-08-13 15:04:11.79619
2445	Huanusco	32	2020-08-13 15:04:11.804353	2020-08-13 15:04:11.804353
2446	Tlaltenango de Sánchez Román	32	2020-08-13 15:04:11.812074	2020-08-13 15:04:11.812074
2447	Momax	32	2020-08-13 15:04:11.831497	2020-08-13 15:04:11.831497
2448	Atolinga	32	2020-08-13 15:04:11.841441	2020-08-13 15:04:11.841441
2449	Tepechitlán	32	2020-08-13 15:04:11.84973	2020-08-13 15:04:11.84973
2450	Benito Juárez	32	2020-08-13 15:04:11.862766	2020-08-13 15:04:11.862766
2451	Teúl de González Ortega	32	2020-08-13 15:04:11.871974	2020-08-13 15:04:11.871974
2452	Santa María de la Paz	32	2020-08-13 15:04:11.882636	2020-08-13 15:04:11.882636
2453	Trinidad García de la Cadena	32	2020-08-13 15:04:11.890997	2020-08-13 15:04:11.890997
2454	Mezquital del Oro	32	2020-08-13 15:04:11.901585	2020-08-13 15:04:11.901585
2455	Nochistlán de Mejía	32	2020-08-13 15:04:11.908846	2020-08-13 15:04:11.908846
2456	Apulco	32	2020-08-13 15:04:11.911224	2020-08-13 15:04:11.911224
2457	Apozol	32	2020-08-13 15:04:11.913679	2020-08-13 15:04:11.913679
2458	Juchipila	32	2020-08-13 15:04:11.915377	2020-08-13 15:04:11.915377
2459	Moyahua de Estrada	32	2020-08-13 15:04:11.922803	2020-08-13 15:04:11.922803
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.clients (id, name, last_name, maiden_name, address, postal_code, email, phone_number, cellphone, contact, created_at, updated_at, rfc, suburb, state_id, city_id, company) FROM stdin;
1	Test	Test	Test	direccion	123123	test@test.com	123123212	32123123	Oscar	2020-09-10 22:49:50.780635	2020-09-10 22:49:50.780635	\N	\N	\N	\N	\N
2	Cliente	Apellido 	Materno	Agricultura #901	31600	lientec@test.com	123222332	12312312	Oscar	2020-11-14 20:41:00.651627	2020-11-14 20:41:00.651627	123	Cuauhtemoc	8	220	\N
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.colors (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Negro	N	t	2020-11-09 07:51:07.060325	2020-11-09 07:51:07.060325
2	Rosa	R	t	2020-11-10 00:03:35.198117	2021-03-18 19:18:21.258789
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.companies (id, name, description, logo, manager, address, phone, email, user_id, created_at, updated_at) FROM stdin;
1	Agrotrailers Planet	hola	\N	\N	Agricultura #901	12312312312	agroplanet@gmail.com	1	2020-08-12 01:14:38.783383	2020-09-09 16:39:14.881848
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.countries (id, name, created_at, updated_at) FROM stdin;
1	México	2020-08-13 15:02:53.520808	2020-08-13 15:02:53.520808
2	México	2020-08-13 15:03:41.956555	2020-08-13 15:03:41.956555
3	México	2020-08-13 15:04:04.355614	2020-08-13 15:04:04.355614
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.departments (id, name, description, branch_id, manager_id, created_at, updated_at, code, sequence, last_code) FROM stdin;
4	Chih	\N	2	12	2021-03-10 20:04:19.862829	2021-03-10 20:04:19.862829	CUU	2	\N
3	Irapuato Remolque	\N	3	9	2020-09-10 22:28:26.84025	2021-03-24 01:45:05.470728	Ira	3000	\N
1	Cuauhtemoc	\N	1	4	2020-08-13 20:44:29.332414	2021-03-31 23:32:24.073143	CUAU	1	\N
\.


--
-- Data for Name: divition_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.divition_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Doble	2D	t	2020-11-09 07:52:29.519576	2020-11-09 07:52:29.519576
\.


--
-- Data for Name: fender_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.fender_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Fender Antiderrapante	FA	t	2020-11-09 08:04:27.31217	2020-11-09 08:04:27.31217
\.


--
-- Data for Name: fiscal_vouchers; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.fiscal_vouchers (id, name, status, created_at, updated_at) FROM stdin;
1	Adquisición de mercancias	t	2020-09-25 03:58:42.900077	2020-09-25 03:58:42.900077
2	Aportaciones voluntarias al SAR	t	2020-09-25 03:58:42.905965	2020-09-25 03:58:42.905965
3	Comunicaciones satelitales	t	2020-09-25 03:58:42.908494	2020-09-25 03:58:42.908494
4	Comunicaciones telefónicas	t	2020-09-25 03:58:42.910804	2020-09-25 03:58:42.910804
5	Construcciones	t	2020-09-25 03:58:42.91405	2020-09-25 03:58:42.91405
6	Dados, troqueles, moldes, matrices y herramental	t	2020-09-25 03:58:42.916071	2020-09-25 03:58:42.916071
7	Depósitos en cuentas para el ahorro, primas que te..	t	2020-09-25 03:58:42.918143	2020-09-25 03:58:42.918143
8	Devoluciones, descuentos o bonificaciones	t	2020-09-25 03:58:42.920439	2020-09-25 03:58:42.920439
9	Donativos	t	2020-09-25 03:58:42.923538	2020-09-25 03:58:42.923538
10	Equipo de computo y accesorios	t	2020-09-25 03:58:42.925957	2020-09-25 03:58:42.925957
11	Equipo de transporte	t	2020-09-25 03:58:42.927988	2020-09-25 03:58:42.927988
12	Gastos de transportación escolar obligatoria	t	2020-09-25 03:58:42.930011	2020-09-25 03:58:42.930011
13	Gastos en general	t	2020-09-25 03:58:42.932135	2020-09-25 03:58:42.932135
14	Gastos funerales	t	2020-09-25 03:58:42.934561	2020-09-25 03:58:42.934561
15	Gastos médicos por incapacidad o discapacidad	t	2020-09-25 03:58:42.937795	2020-09-25 03:58:42.937795
16	Honorarios médicos, dentales y gastos hospitalarios	t	2020-09-25 03:58:42.940197	2020-09-25 03:58:42.940197
17	Intereses reales efectivamente pagados por crédito	t	2020-09-25 03:58:42.94237	2020-09-25 03:58:42.94237
18	Mobiliario y equipo de oficina por inversiones	t	2020-09-25 03:58:42.944554	2020-09-25 03:58:42.944554
19	Otra maquinaria y equipo	t	2020-09-25 03:58:42.946884	2020-09-25 03:58:42.946884
20	Pagos por servicios educativos (colegiaturas)	t	2020-09-25 03:58:42.949197	2020-09-25 03:58:42.949197
21	Por definir	t	2020-09-25 03:58:42.951262	2020-09-25 03:58:42.951262
22	Primas por seguros de gastos médicos	t	2020-09-25 03:58:42.953444	2020-09-25 03:58:42.953444
\.


--
-- Data for Name: floor_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.floor_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Piso de Madera	M	t	2020-10-26 20:19:27.781985	2020-10-26 20:19:27.781985
\.


--
-- Data for Name: hydraulic_jacks; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.hydraulic_jacks (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	De botella	GB	t	2020-11-09 07:53:18.312131	2020-11-09 07:53:29.642626
\.


--
-- Data for Name: item_files; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.item_files (id, item_id, file, file_type, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.items (id, name, description, model, serial_number, purchased_date, in_service_date, time_unit_service, time_quantity_service, price, time_unit_depreciation, time_quantity_depreciation, sub_category_id, provider_id, department_id, user_id, brand_id, status_item_id, created_at, updated_at, code, image, maintenance_date, maintenance_done, branch_id, category_id, to_assing, sale_price, remission, accessory, acquisition_date, trailer_id, payment_type, fiscal_voucher_id, client_id, advance_payment, status_shipping_id, color, trailer_length_id, trailer_height_id, ramp_type_id, redila_type_id, trailer_type_id, floor_type_id, capacity_id, duck_tail, gooseneck, trailer_width_id, color_id, hydraulic_jack_id, pull_type_id, brake_type_id, reinforcement_type_id, fender_type_id, turn_type_id, divition_type_id, suspension_type_id, roof_type_id, categories_description, seller_percentage, planet_percentage, branch_percentage) FROM stdin;
53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	5	2020-10-06 16:36:56.569773	2020-10-09 21:23:13.718008	\N	\N	\N	t	\N	\N	\N	\N	\N	sin accesorios	\N	1	\N	\N	1	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	Remolque 3			*3BZBP0810LC010754*	0011-07-20	\N	\N	\N	25000.0	\N	\N	1	\N	1	1	\N	2	2020-09-09 06:28:44.217856	2021-01-06 07:28:53.282653	195298	\N	\N	t	1	2	\N	30000.0	33336	Sin Accesorios	\N	1	2	13	1	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
52	Remolque	Remolque Irapuato	CB4007M05T	qwe123123454	2020-06-12	\N	\N	\N	50500.0	\N	\N	4	\N	3	1	\N	4	2020-09-10 23:05:12.267402	2020-10-22 01:07:19.434653	12343	\N	\N	t	3	2	\N	333333.0	33337	sin accesorios	\N	1	2	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	\N	\N	CB0510M15TRCVTTFHNFAGBJGSB	GGGGGGSSSS	\N	\N	\N	\N	0.0	\N	\N	\N	\N	1	\N	\N	2	2020-11-12 06:45:24.452526	2020-11-13 23:21:15.38263	\N	\N	\N	\N	1	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	3	\N	1	\N	\N	1	1	1	1	\N	\N	1	1	1	1	1	\N	1	1	\N	1	\N	TRAILER: Cama Baja.ANCHO: 5 pies.LARGO: 10 pies.PISO: Piso de Madera.CAPACIDAD: 1.5 Toneladas.REDILA: Redila Cerrada.VOLTEO: Volteo Tipo Tijera.FRENO: Freno Hidraulico.COLOR: Negro.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.JALON: Jalon tipo gancho.SUSPENSION: Suspension Ballesta.	\N	\N	\N
67	\N	\N	CS051015TFHN	33333333	\N	\N	\N	\N	23000.0	\N	\N	\N	\N	3	\N	\N	2	2021-01-05 18:54:59.098656	2021-01-05 22:08:26.197857	\N	\N	\N	\N	3	\N	\N	\N	\N	ningun accesorio	2021-01-01	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. 	\N	\N	\N
55	\N	\N	CS0510MRH15TFHN	r34r34r34r34r	2020-10-24	\N	\N	\N	45555.0	\N	\N	\N	\N	3	1	\N	4	2020-10-07 00:09:35.414171	2021-01-06 08:05:07.016086	123421	\N	\N	t	3	\N	\N	84000.0	33338	Varios	2021-01-02	2	2	\N	1	100000.0	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. 	\N	\N	\N
59	\N	\N	CS0510MRH15TRCTLVTTFHN2DFAGBJGSB	OKOKOKOK	\N	\N	\N	\N	20000.0	\N	\N	\N	\N	1	1	\N	1	2020-11-12 02:30:36.928055	2021-01-06 07:51:41.338227	\N	\N	\N	\N	1	\N	\N	20000.0	\N	sin accesorios	2021-01-01	\N	2	\N	\N	\N	3	\N	1	\N	1	1	2	1	1	\N	\N	1	1	1	1	1	1	1	1	1	1	1	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. REDILA: Redila Cerrada. TECHO: Techo de Lamina. VOLTEO: Volteo Tipo Tijera. FRENO: Freno Hidraulico. COLOR: Negro. DIVISION: Doble. FENDER: Fender Antiderrapante. GATO HIDRAULICO: De botella. JALON: Jalon tipo gancho. SUSPENSION: Suspension Ballesta. 	\N	60.0	40.0
16	Remolque 17	Remolque 17	*CB5014M30T*	*3BZBP142XKC001482*	2021-03-03	\N	\N	\N	\N	\N	\N	1	\N	1	1	\N	4	2020-09-09 06:28:44.384061	2021-03-03 03:15:31.050561	159786	\N	\N	t	1	\N	\N	79999.0	31286*	sin accesorios	\N	1	2	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	\N	\N	CS0510MRHN2DJD	OOOOOOff	\N	\N	\N	\N	40000.0	\N	\N	\N	\N	3	1	48	4	2020-11-13 00:41:04.797815	2021-01-06 08:03:46.159627	\N	\N	\N	\N	3	\N	\N	70000.0	\N		2021-01-01	\N	2	\N	\N	\N	3	\N	1	\N	1	\N	2	1	\N	\N	\N	1	1	\N	\N	\N	\N	\N	\N	1	\N	\N	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA: Rampa Hidraulica. COLOR: Negro. DIVISION: Doble. MARCA: Jhon Deer. 	\N	80.0	20.0
70	\N	\N	CS0510MRH15TFHN	test	\N	\N	\N	\N	100.0	\N	\N	\N	\N	4	\N	\N	2	2021-03-15 21:03:34.696137	2021-03-15 21:03:34.696137	\N	\N	\N	\N	2	\N	\N	\N	\N		2021-03-06	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. 	\N	\N	\N
73	\N	\N	CS0515TTL	oooo	\N	\N	\N	\N	5.0	\N	\N	\N	\N	4	\N	\N	2	2021-03-19 06:50:53.178102	2021-03-19 06:50:53.178102	\N	\N	\N	\N	2	\N	\N	\N	\N	mmm	2021-03-05	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	2	\N	1	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	TRAILER: Caja Seca. ANCHO: 5 pies. CAPACIDAD: 1.5 Toneladas. TECHO: Techo de Lamina. 	\N	\N	\N
75	\N	\N			\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N	2	2021-03-24 01:43:47.8537	2021-03-24 01:45:05.135156	\N	\N	\N	\N	3	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N		\N	\N	\N
77	\N	\N	CS0510MRH15TFHNFA	1rrrrrrr	\N	\N	\N	\N	1000.0	\N	\N	\N	\N	1	\N	\N	2	2021-03-30 06:51:59.881379	2021-03-30 06:59:03.135132	\N	\N	\N	\N	1	\N	\N	\N	\N		2021-02-25	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	1	\N	\N	\N	\N	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. FENDER: Fender Antiderrapante. 	\N	\N	\N
3	Remolque 4	Remolque 4		*3BZBP0819LC010753*	0011-07-20	\N	\N	\N	20000.0	\N	\N	1	\N	1	1	\N	2	2020-09-09 06:28:44.229845	2021-01-06 07:29:22.976899	195299	\N	\N	t	1	\N	\N	30000.0	33338	Sin Accesorios	\N	1	2	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
4	Remolque 5	Remolque 5		*3BZBN1013LC009962*	0017-06-20	\N	\N	\N	11000.0	\N	\N	1	\N	1	1	\N	2	2020-09-09 06:28:44.243566	2021-01-06 07:30:02.878642	193531	\N	\N	t	1	\N	\N	49999.0	33230	Sin Accesorios	2021-01-07	1	2	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
6	Remolque 7	Remolque 7	*CB5010M15T*	*3BZBP1018LC010759*	0011-07-20	\N	\N	\N	50000.0	\N	\N	1	\N	1	1	\N	2	2020-09-09 06:28:44.268653	2020-10-19 17:36:00.025485	195291	\N	\N	t	1	2	\N	\N	33328	Sin Accesorios	\N	1	3	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
64	\N	\N	CS0510MRH15TFHNFAGB		\N	\N	\N	\N	0.0	\N	\N	\N	\N	1	\N	\N	2	2020-11-13 23:14:52.300776	2020-11-13 23:14:52.300776	\N	\N	\N	\N	1	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	1	\N	1	\N	1	\N	\N	\N	\N	TRAILER: Caja Seca.ANCHO: 5 pies.LARGO: 10 pies.PISO: Piso de Madera.RAMPA: Rampa Hidraulica.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR: Negro.FENDER: Fender Antiderrapante.GATO HIDRAULICO: De botella.	\N	\N	\N
57	\N	gggg	\N	asdasd1111	2021-02-23	\N	\N	\N	30000.0	\N	\N	\N	\N	3	1	\N	3	2020-10-14 01:47:29.89229	2021-02-23 20:40:30.70312	123421	\N	\N	\N	3	\N	\N	5555.0	33337	sin accesorios	2020-10-01	2	1	2	2	30000.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	\N	\N			\N	\N	\N	\N	400.0	\N	\N	\N	\N	4	\N	\N	2	2021-03-15 22:44:33.952927	2021-03-15 22:44:33.952927	\N	\N	\N	\N	2	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
1	Remolque 2	Remolque 2	*CB4007M05T*	*3BZBP0714LC010760*	0011-07-20	\N	\N	\N	50500.0	\N	\N	1	\N	1	1	\N	3	2020-09-09 06:28:44.172651	2021-03-31 01:00:36.49043	195301	\N	\N	t	1	2	\N	95000.0	33337	Sin Accesorios	\N	1	1	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30.0	50.0	20.0
54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	11	\N	5	2020-10-06 16:53:31.747234	2020-10-09 21:23:13.74256	\N	\N	\N	t	\N	\N	\N	\N	\N	sin accesorios	\N	1	\N	\N	1	20000.0	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	Remolque 8	Remolque 8	*CB5010M15T*	*3BZBP1016LC010761*	0011-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.282073	2020-10-09 21:23:13.764612	195290	\N	\N	t	1	\N	\N	\N	33331	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	Remolque 9	Remolque 9	*CB6514M15T*	*3BZBP1417LC009953*	0017-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.29249	2020-10-09 21:23:13.771909	193530	\N	\N	t	1	\N	\N	\N	33244	Puerta Rampa	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	Remolque 10	Remolque 10	*CB6514M15T*	*3BZBP1413LC010730*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.303321	2020-10-09 21:23:13.778553	195279	\N	\N	t	1	\N	\N	\N	33343	puerta rampa	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	Remolque 11	Remolque 11	*CB6514M15T*	*3BZBP1417LC010729*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.32001	2020-10-09 21:23:13.790752	195278	\N	\N	t	1	\N	\N	\N	33341	puerta rampa	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	Remolque 12	Remolque 12	*CB6514M15T*	*3BZBP1415LC010728*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.332098	2020-10-09 21:23:13.799658	195277	\N	\N	t	1	\N	\N	\N	33342	puerta rampa	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	Remolque 13	Remolque 13	*CB6514M15T*	*3BZBP1413LC010727*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.342912	2020-10-09 21:23:13.810209	195276	\N	\N	t	1	\N	\N	\N	33340	puerta rampa	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	Remolque 14	Remolque 14	*CB5012M30T*	*3BZBP1223LC010769*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.35338	2020-10-09 21:23:13.817653	195307	\N	\N	t	1	\N	\N	\N	33330	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	Remolque 15	Remolque 15	*CB5012A30T*	*3BZBN1228LC010756*	0011-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.363636	2020-10-09 21:23:13.82463	195294	\N	\N	t	1	\N	\N	\N	33324	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	Remolque 16	Remolque 16	*CB5012A30T*	*3BZBN1226LC010755*	0011-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.373953	2020-10-09 21:23:13.831217	195297	\N	\N	t	1	\N	\N	\N	33335	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	Remolque 18	Remolque 18	*CB6514M30T*	*3BZBP1423LC009098*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.395185	2020-10-09 21:23:13.849033	191848	\N	\N	t	1	\N	\N	\N	33173	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	Remolque 19	Remolque 19	*CB7016MR30T*	*3BZBP1621LC009095*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.405317	2020-10-09 21:23:13.857002	191859	\N	\N	t	1	\N	\N	\N	33179	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	Remolque 20	Remolque 20	*CB7016MR30T*	*3BZBP1620LC008326*	0023-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.417666	2020-10-09 21:23:13.863949	190428	\N	\N	t	1	\N	\N	\N	33200	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	Remolque 21	Remolque 21	*CB7016MR30T*	*3BZBP1629LC008325*	0023-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.430086	2020-10-09 21:23:13.871609	190427	\N	\N	t	1	\N	\N	\N	33191	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	Remolque 22	Remolque 22	*CB7016MR30T*	*3BZBP1627LC008324*	0023-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.440725	2020-10-09 21:23:13.878387	190424	\N	\N	t	1	\N	\N	\N	33195	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	Remolque 23	Remolque 23	*CB7016MR30T*	*3BZBP1625LC008323*	0023-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.450627	2020-10-09 21:23:13.885962	190420	\N	\N	t	1	\N	\N	\N	33196	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	Remolque 24	Remolque 24	*CB7016MR30T*	*3BZBP1621LC009453*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.462426	2020-10-09 21:23:13.895395	192500	\N	\N	t	1	\N	\N	\N	33215		\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	Remolque 25	Remolque 25	*CB7016MR30T*	*3BZBP1628LC009451*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.473368	2020-10-09 21:23:13.903436	192503	\N	\N	t	1	\N	\N	\N	33214		\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
25	Remolque 26	Remolque 26	*CB7016MR30T*	*3BZBP1629LC010768*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.483167	2020-10-09 21:23:13.911206	195306	\N	\N	t	1	\N	\N	\N	33323	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	Remolque 27	Remolque 27	*CB7016MR30T*	*3BZBP1627LC010767*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.493849	2020-10-09 21:23:13.91824	195305	\N	\N	t	1	\N	\N	\N	33325	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	Remolque 28	Remolque 28	*CB7016MR30T*	*3BZBP1625LC010766*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.504743	2020-10-09 21:23:13.924943	195304	\N	\N	t	1	\N	\N	\N	33334	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	Remolque 29	Remolque 29	*CB7016MR30T*	*3BZBP1623LC010765*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.515667	2020-10-09 21:23:13.931863	195303	\N	\N	t	1	\N	\N	\N	33339	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	Remolque 30	Remolque 30	*CB7016MR30T*	*3BZBP1621LC010764*	0010-07-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.539304	2020-10-09 21:23:13.945779	195302	\N	\N	t	1	\N	\N	\N	33326	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	Remolque 31	Remolque 31	*CB7016AR30T*	*3BZBN162XLC009103*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.555151	2020-10-09 21:23:13.955943	191854	\N	\N	t	1	\N	\N	\N	33217		\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
31	Remolque 32	Remolque 32	*CB7016AR30T*	*3BZBN1625LC009106*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.566022	2020-10-09 21:23:13.963837	191857	\N	\N	t	1	\N	\N	\N	33167	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	Remolque 33	Remolque 33	*CB7016AR30T*	*3BZBN1626LC009096*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.578282	2020-10-09 21:23:13.980004	191858	\N	\N	t	1	\N	\N	\N	33172	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	Remolque 34	Remolque 34	*CB7016AR30T*	*3BZBN1621LC009989*	0018-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.589528	2020-10-09 21:23:13.989188	193569	\N	\N	t	1	\N	\N	\N	33242	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	Remolque 35	Remolque 35	*CB7016AR30T*	*3BZBN1629LC009965*	0017-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.603363	2020-10-09 21:23:13.997397	193548	\N	\N	t	1	\N	\N	\N	33239	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	Remolque 36	Remolque 36	*CB7016AR30TRC*	*3BZBN1629LC008329*	0023-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.613579	2020-10-09 21:23:14.004757	190431	\N	\N	t	1	\N	\N	\N	33183	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	Remolque 37	Remolque 37	*CB7016AR30TRC*	*3BZBN1627LC008328*	0023-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.625659	2020-10-09 21:23:14.012185	190430	\N	\N	t	1	\N	\N	\N	33188	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	Remolque 38	Remolque 38	*CB7016AR30TRC*	*3BZBN1625LC008327*	0023-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.635964	2020-10-09 21:23:14.019358	190429	\N	\N	t	1	\N	\N	\N	33185	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	Remolque 39	Remolque 39	*CB7016AR30TRC*	*3BZBN1625LC009963*	0017-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.646451	2020-10-09 21:23:14.026681	193545	\N	\N	t	1	\N	\N	\N	33237	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	Remolque 6	Remolque 6	*CB5010M15T*	*3BZBP1015LC008161*	0017-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	1	\N	5	2020-09-09 06:28:44.257058	2020-10-09 21:23:14.034014	190229	\N	\N	t	1	\N	\N	0.0	33223	Sin Accesorios	\N	1	2	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	Remolque 43	Remolque 43	*RG5012M30TRDR*	*3BZGP1222LC008310*	0020-04-20	\N	\N	\N	0.0	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.690383	2020-10-09 21:23:14.049983	190373	\N	\N	t	1	2	\N	\N	33127	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	\N	\N	CS1005RHM15TFHNFAGBJGRD	fffwefwefwef	\N	\N	\N	\N	0.0	\N	\N	\N	\N	1	\N	\N	2	2020-11-12 06:27:31.266288	2020-11-12 06:31:21.416003	\N	\N	\N	\N	1	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	1	1	1	1	1	\N	\N	\N	\N	TRAILER:  Caja Seca. LARGO:  10 pies. ANCHO:  5 pies. PISO:  Piso de Madera. RAMPA:  Rampa Hidraulica. CAPACIDAD:  1.5 Toneladas. FRENO:  Freno Hidraulico. COLOR:  Negro. FENDER:  Fender Antiderrapante. GATO HIDRAULICO:  De botella. REFUERZO:  Refuerzo Doble. 	\N	\N	\N
62	\N	\N	CS1005RHM15TFHNFAJGVTT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	8	\N	5	2020-11-12 07:21:13.57544	2020-11-12 07:31:23.688018	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	1	40000.0	1	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	1	1	\N	1	1	\N	1	1	TRAILER: Caja Seca.LARGO: 10 pies.ANCHO: 5 pies.RAMPA: Rampa Hidraulica.PISO: Piso de Madera.CAPACIDAD: 1.5 Toneladas.FRENO: Freno Hidraulico.COLOR: Negro.FENDER: Fender Antiderrapante.JALON: Jalon tipo gancho.VOLTEO: Volteo Tipo Tijera.	\N	\N	\N
65	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	2020-11-18 01:03:12.840555	2020-11-18 01:03:12.840555	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
68	\N	\N	CS0510MRH15TFHN	4414141	\N	\N	\N	\N	30000.0	\N	\N	\N	\N	1	\N	\N	2	2021-01-06 00:39:34.077343	2021-01-06 00:39:34.077343	\N	\N	\N	\N	1	\N	\N	\N	\N	sin accesiorios	2021-01-02	\N	\N	\N	\N	\N	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. 	\N	\N	\N
39	Remolque 40	Remolque 40	*CB7020MR60T*	*3BZBP2028LC009092*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.657382	2020-10-09 21:23:14.058106	191862	\N	\N	t	1	\N	\N	\N	33169	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	Remolque 41	Remolque 41	*RG5010M15TRDR*	*3BZGP1013LC009461*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.669188	2020-10-09 21:23:14.064833	192524	\N	\N	t	1	\N	\N	\N	33227	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	Remolque 42	Remolque 42	*RG5010M30TRDR*	*3BZGP1020LC009460*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.67931	2020-10-09 21:23:14.07186	192525	\N	\N	t	1	\N	\N	\N	33226	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	Remolque 44	Remolque 44	*RG5012M30TRDR*	*3BZGP1225LC007281*	0013-03-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.701844	2020-10-09 21:23:14.079819	188575	\N	\N	t	1	\N	\N	\N	33085	PUERTA RAMPA	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	Remolque 45	Remolque 45	*RG5012M30TRDR*	*3BZGP1226LC007869*	0001-04-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.713525	2020-10-09 21:23:14.093879	189616	\N	\N	t	1	\N	\N	\N	33083	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	Remolque 46	Remolque 46	*RG5012M30TRDR*	*3BZGP1227LC002258*	0014-10-19	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.724604	2020-10-09 21:23:14.102014	179621	\N	\N	t	1	\N	\N	\N	33084	SIN ACCESORIOS	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	Remolque 47	Remolque 47	*RG5012M30TRDR*	*3BZGP1220LC009102*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.736039	2020-10-09 21:23:14.113117	191853	\N	\N	t	1	\N	\N	\N	33181	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
47	Remolque 48	Remolque 48	*RG5012M30TRDR*	*3BZGP1227LC009100*	0022-05-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.746703	2020-10-09 21:23:14.130253	191851	\N	\N	t	1	\N	\N	\N	33166	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
48	Remolque 49	Remolque 49	*RG5014M30TRDR*	*3BZGP142XLC009444*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.758175	2020-10-09 21:23:14.146816	192499	\N	\N	t	1	\N	\N	\N	33213		\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	Remolque 50	Remolque 50	*RG5014M30TRDR*	*3BZGP1428LC009457*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.768631	2020-10-09 21:23:14.156874	192530	\N	\N	t	1	\N	\N	\N	33235	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	Remolque 51	Remolque 51	*RG5014M30TRDR*	*3BZGP1426LC009456*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.782471	2020-10-09 21:23:14.164525	192531	\N	\N	t	1	\N	\N	\N	33235	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	Remolque 52	Remolque 52	*RG5016M30TRDR*	*3BZGP1628LC009455*	0004-06-20	\N	\N	\N	\N	\N	\N	1	\N	1	\N	\N	2	2020-09-09 06:28:44.79309	2020-10-09 21:23:14.171221	192532	\N	\N	t	1	\N	\N	\N	33248	Sin Accesorios	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	\N	\N	CS0510MRH15TFHN	testy	2021-03-10	\N	\N	\N	20000.0	\N	\N	\N	\N	4	1	\N	6	2021-03-10 19:47:18.319278	2021-03-10 20:16:10.42584	\N	\N	\N	\N	2	\N	\N	3000.0	\N	testy	2021-03-04	\N	4	\N	\N	1000.0	3	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	TRAILER: Caja Seca. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. RAMPA: Rampa Hidraulica. CAPACIDAD: 1.5 Toneladas. FRENO: Freno Hidraulico. COLOR: Negro. 	\N	\N	\N
72	\N	\N			2021-03-18	\N	\N	\N	1000.0	\N	\N	\N	\N	4	1	\N	6	2021-03-18 18:56:34.846017	2021-03-18 18:57:31.962989	\N	\N	\N	\N	2	\N	\N	1500.0	\N		\N	\N	4	\N	\N	700.0	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N
74	\N	\N	GRHTLFHR		\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	\N	2	2021-03-24 01:37:29.658101	2021-03-24 01:37:29.658101	\N	\N	\N	\N	2	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	3	\N	\N	\N	1	\N	3	\N	\N	\N	\N	\N	2	\N	\N	1	\N	\N	\N	\N	\N	1	TRAILER: Ganaderos. RAMPA: Rampa Hidraulica. TECHO: Techo de Lamina. FRENO: Freno Hidraulico. COLOR: Rosa. 	\N	\N	\N
76	\N	\N	CB10JD		\N	\N	\N	\N	12.0	\N	\N	\N	\N	1	\N	48	2	2021-03-24 23:49:13.7484	2021-03-24 23:49:13.7484	\N	\N	\N	\N	1	\N	\N	\N	\N		\N	\N	\N	\N	\N	\N	3	\N	1	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	TRAILER: Cama Baja. LARGO: 10 pies. MARCA: Jhon Deer. 	\N	\N	\N
78	\N	\N	CS0510MRH15TTLFHN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	12	\N	5	2021-03-30 07:02:48.02374	2021-03-30 07:02:48.02374	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	\N	1	50000.0	1	\N	1	\N	1	\N	2	1	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	1	\N	\N	\N	\N
58	\N	\N	CB1005MRH15T		2021-03-31	\N	\N	\N	0.0	\N	\N	\N	\N	1	1	\N	6	2020-11-10 00:13:07.136574	2021-03-31 23:32:23.167607	\N	\N	\N	\N	1	\N	\N	10000.0	\N	\N	\N	\N	4	\N	\N	2000.0	3	\N	1	\N	1	\N	\N	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: items_maintenances; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.items_maintenances (id, item_id, file, maintenance_id, description, price, provider, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: maintenances; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.maintenances (id, name, description, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: offices; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.offices (id, name, description, department_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permission_roles; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.permission_roles (id, role_id, permission_id, created_at, updated_at) FROM stdin;
1	2	17	2020-08-12 00:44:00.887578	2020-08-12 00:44:00.887578
209	6	78	2020-09-10 22:13:47.419088	2020-09-10 22:13:47.419088
3	4	17	2020-08-12 00:44:00.905683	2020-08-12 00:44:00.905683
210	6	76	2020-09-10 22:13:47.4486	2020-09-10 22:13:47.4486
5	2	18	2020-08-12 00:44:00.909704	2020-08-12 00:44:00.909704
211	6	77	2020-09-10 22:13:47.454218	2020-09-10 22:13:47.454218
7	4	18	2020-08-12 00:44:00.913522	2020-08-12 00:44:00.913522
212	6	74	2020-09-10 22:13:47.460235	2020-09-10 22:13:47.460235
9	2	19	2020-08-12 00:44:00.916831	2020-08-12 00:44:00.916831
213	6	80	2020-09-10 22:13:47.466358	2020-09-10 22:13:47.466358
11	4	19	2020-08-12 00:44:00.919664	2020-08-12 00:44:00.919664
214	6	75	2020-09-10 22:13:47.499178	2020-09-10 22:13:47.499178
13	2	20	2020-08-12 00:44:00.922678	2020-08-12 00:44:00.922678
215	6	73	2020-09-10 22:13:47.504615	2020-09-10 22:13:47.504615
15	4	20	2020-08-12 00:44:00.925432	2020-08-12 00:44:00.925432
17	2	23	2020-08-12 00:44:00.928048	2020-08-12 00:44:00.928048
19	4	23	2020-08-12 00:44:00.931669	2020-08-12 00:44:00.931669
21	2	24	2020-08-12 00:44:00.93417	2020-08-12 00:44:00.93417
23	4	24	2020-08-12 00:44:00.936764	2020-08-12 00:44:00.936764
25	2	26	2020-08-12 00:44:00.939626	2020-08-12 00:44:00.939626
27	4	26	2020-08-12 00:44:00.942334	2020-08-12 00:44:00.942334
29	2	27	2020-08-12 00:44:00.945605	2020-08-12 00:44:00.945605
30	2	28	2020-08-12 00:44:00.947064	2020-08-12 00:44:00.947064
31	2	30	2020-08-12 00:44:00.948431	2020-08-12 00:44:00.948431
33	2	31	2020-08-12 00:44:00.951173	2020-08-12 00:44:00.951173
34	2	32	2020-08-12 00:44:00.952647	2020-08-12 00:44:00.952647
35	2	33	2020-08-12 00:44:00.954218	2020-08-12 00:44:00.954218
36	2	34	2020-08-12 00:44:00.955521	2020-08-12 00:44:00.955521
37	2	35	2020-08-12 00:44:00.956895	2020-08-12 00:44:00.956895
38	2	36	2020-08-12 00:44:00.95828	2020-08-12 00:44:00.95828
40	4	36	2020-08-12 00:44:00.961198	2020-08-12 00:44:00.961198
41	2	37	2020-08-12 00:44:00.962671	2020-08-12 00:44:00.962671
43	2	38	2020-08-12 00:44:00.965687	2020-08-12 00:44:00.965687
45	2	39	2020-08-12 00:44:00.968516	2020-08-12 00:44:00.968516
47	4	39	2020-08-12 00:44:00.971653	2020-08-12 00:44:00.971653
48	2	40	2020-08-12 00:44:00.977397	2020-08-12 00:44:00.977397
50	4	40	2020-08-12 00:44:00.980643	2020-08-12 00:44:00.980643
51	2	41	2020-08-12 00:44:00.981998	2020-08-12 00:44:00.981998
53	2	42	2020-08-12 00:44:00.984947	2020-08-12 00:44:00.984947
55	2	43	2020-08-12 00:44:00.988002	2020-08-12 00:44:00.988002
57	4	43	2020-08-12 00:44:00.990837	2020-08-12 00:44:00.990837
58	2	44	2020-08-12 00:44:00.992187	2020-08-12 00:44:00.992187
60	4	44	2020-08-12 00:44:00.995288	2020-08-12 00:44:00.995288
62	2	45	2020-08-12 00:44:00.998251	2020-08-12 00:44:00.998251
64	4	45	2020-08-12 00:44:01.001106	2020-08-12 00:44:01.001106
66	2	46	2020-08-12 00:44:01.004017	2020-08-12 00:44:01.004017
68	4	46	2020-08-12 00:44:01.006669	2020-08-12 00:44:01.006669
69	2	47	2020-08-12 00:44:01.007914	2020-08-12 00:44:01.007914
71	4	47	2020-08-12 00:44:01.010905	2020-08-12 00:44:01.010905
72	2	48	2020-08-12 00:44:01.012417	2020-08-12 00:44:01.012417
74	4	48	2020-08-12 00:44:01.015271	2020-08-12 00:44:01.015271
76	2	49	2020-08-12 00:44:01.018096	2020-08-12 00:44:01.018096
78	4	49	2020-08-12 00:44:01.020666	2020-08-12 00:44:01.020666
80	2	50	2020-08-12 00:44:01.023543	2020-08-12 00:44:01.023543
82	4	50	2020-08-12 00:44:01.026731	2020-08-12 00:44:01.026731
83	2	51	2020-08-12 00:44:01.028149	2020-08-12 00:44:01.028149
85	4	51	2020-08-12 00:44:01.032047	2020-08-12 00:44:01.032047
87	2	52	2020-08-12 00:44:01.03546	2020-08-12 00:44:01.03546
89	4	52	2020-08-12 00:44:01.03896	2020-08-12 00:44:01.03896
91	2	53	2020-08-12 00:44:01.042364	2020-08-12 00:44:01.042364
93	4	53	2020-08-12 00:44:01.04539	2020-08-12 00:44:01.04539
95	2	54	2020-08-12 00:44:01.048656	2020-08-12 00:44:01.048656
97	4	54	2020-08-12 00:44:01.051377	2020-08-12 00:44:01.051377
99	2	55	2020-08-12 00:44:01.0539	2020-08-12 00:44:01.0539
101	4	55	2020-08-12 00:44:01.056635	2020-08-12 00:44:01.056635
103	2	56	2020-08-12 00:44:01.059541	2020-08-12 00:44:01.059541
105	4	56	2020-08-12 00:44:01.062339	2020-08-12 00:44:01.062339
107	2	57	2020-08-12 00:44:01.065107	2020-08-12 00:44:01.065107
109	4	57	2020-08-12 00:44:01.067997	2020-08-12 00:44:01.067997
111	2	58	2020-08-12 00:44:01.070748	2020-08-12 00:44:01.070748
113	4	58	2020-08-12 00:44:01.073513	2020-08-12 00:44:01.073513
115	2	59	2020-08-12 00:44:01.075967	2020-08-12 00:44:01.075967
117	4	59	2020-08-12 00:44:01.078587	2020-08-12 00:44:01.078587
119	2	60	2020-08-12 00:44:01.082266	2020-08-12 00:44:01.082266
121	4	60	2020-08-12 00:44:01.085573	2020-08-12 00:44:01.085573
123	2	61	2020-08-12 00:44:01.08893	2020-08-12 00:44:01.08893
125	4	61	2020-08-12 00:44:01.092063	2020-08-12 00:44:01.092063
127	2	62	2020-08-12 00:44:01.094857	2020-08-12 00:44:01.094857
129	4	62	2020-08-12 00:44:01.098002	2020-08-12 00:44:01.098002
131	2	63	2020-08-12 00:44:01.100789	2020-08-12 00:44:01.100789
133	4	63	2020-08-12 00:44:01.103542	2020-08-12 00:44:01.103542
135	2	64	2020-08-12 00:44:01.106422	2020-08-12 00:44:01.106422
137	4	64	2020-08-12 00:44:01.109555	2020-08-12 00:44:01.109555
139	2	65	2020-08-12 00:44:01.112958	2020-08-12 00:44:01.112958
141	4	65	2020-08-12 00:44:01.11605	2020-08-12 00:44:01.11605
143	2	66	2020-08-12 00:44:01.118716	2020-08-12 00:44:01.118716
145	4	66	2020-08-12 00:44:01.121954	2020-08-12 00:44:01.121954
147	2	67	2020-08-12 00:44:01.124572	2020-08-12 00:44:01.124572
149	4	67	2020-08-12 00:44:01.127156	2020-08-12 00:44:01.127156
151	2	68	2020-08-12 00:44:01.130299	2020-08-12 00:44:01.130299
153	4	68	2020-08-12 00:44:01.132991	2020-08-12 00:44:01.132991
155	2	69	2020-08-12 00:44:01.135741	2020-08-12 00:44:01.135741
157	4	69	2020-08-12 00:44:01.138773	2020-08-12 00:44:01.138773
159	2	70	2020-08-12 00:44:01.141919	2020-08-12 00:44:01.141919
161	4	70	2020-08-12 00:44:01.144767	2020-08-12 00:44:01.144767
163	2	71	2020-08-12 00:44:01.147523	2020-08-12 00:44:01.147523
165	4	71	2020-08-12 00:44:01.150283	2020-08-12 00:44:01.150283
167	2	72	2020-08-12 00:44:01.153248	2020-08-12 00:44:01.153248
169	4	72	2020-08-12 00:44:01.156123	2020-08-12 00:44:01.156123
171	2	73	2020-08-12 00:44:01.159569	2020-08-12 00:44:01.159569
173	4	73	2020-08-12 00:44:01.163063	2020-08-12 00:44:01.163063
176	2	74	2020-08-12 00:44:01.167331	2020-08-12 00:44:01.167331
178	4	74	2020-08-12 00:44:01.170274	2020-08-12 00:44:01.170274
181	2	75	2020-08-12 00:44:01.175276	2020-08-12 00:44:01.175276
183	4	75	2020-08-12 00:44:01.178218	2020-08-12 00:44:01.178218
186	2	76	2020-08-12 00:44:01.183295	2020-08-12 00:44:01.183295
188	4	76	2020-08-12 00:44:01.186087	2020-08-12 00:44:01.186087
191	2	77	2020-08-12 00:44:01.190143	2020-08-12 00:44:01.190143
193	4	77	2020-08-12 00:44:01.192903	2020-08-12 00:44:01.192903
196	2	78	2020-08-12 00:44:01.197687	2020-08-12 00:44:01.197687
198	4	78	2020-08-12 00:44:01.204705	2020-08-12 00:44:01.204705
201	2	79	2020-08-12 00:44:01.208652	2020-08-12 00:44:01.208652
203	4	79	2020-08-12 00:44:01.211459	2020-08-12 00:44:01.211459
204	2	80	2020-08-12 00:44:01.212703	2020-08-12 00:44:01.212703
206	4	80	2020-08-12 00:44:01.215147	2020-08-12 00:44:01.215147
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.permissions (id, name, description, action, controller, created_at, updated_at) FROM stdin;
1	Mostrar Detalles De Un Permiso	Permite mostrar los detalles de un permiso.	show	Permissions	2020-08-12 00:43:41.27001	2020-08-12 00:43:41.27001
2	Actualizar Permiso	Permite actualizar un permiso. 	update	Permissions	2020-08-12 00:43:41.288296	2020-08-12 00:43:41.288296
3	Editar Permiso	Permite visualizar la vista editar permiso.	edit	Permissions	2020-08-12 00:43:41.291742	2020-08-12 00:43:41.291742
4	Generar Semillas	Permite generar las semillas de los permisos y sus relaciones.	generate_seeds	Permissions	2020-08-12 00:43:41.295132	2020-08-12 00:43:41.295132
5	Obtener Controladores Y Acciones	Permite obtener los controladores y acciones para generar los permisos.	get_controller_actions	Permissions	2020-08-12 00:43:41.298425	2020-08-12 00:43:41.298425
6	Mostrar Listado De Permisos	Permite mostrar un listado de los permisos.	index	Permissions	2020-08-12 00:43:41.301576	2020-08-12 00:43:41.301576
7	Nuevo Permiso	Permite visualizar la vista nuevo permiso.	new	Permissions	2020-08-12 00:43:41.304563	2020-08-12 00:43:41.304563
8	Crear Rol	Permite crear roles.	create	Roles	2020-08-12 00:43:41.307361	2020-08-12 00:43:41.307361
9	Asignar Permisos A Roles	Permite asignar permisos a un rol existente. 	assign_permissions	Roles	2020-08-12 00:43:41.310269	2020-08-12 00:43:41.310269
10	Destruir Rol	Permite destruir un rol.	destroy	Roles	2020-08-12 00:43:41.314228	2020-08-12 00:43:41.314228
11	Editar Rol	Permite visualizar la vista editar rol.	edit	Roles	2020-08-12 00:43:41.316604	2020-08-12 00:43:41.316604
12	Mostrar Listado De Roles	Permite mostrar un listado de los roles.	index	Roles	2020-08-12 00:43:41.318937	2020-08-12 00:43:41.318937
13	Nuevo Rol	Permite visualizar la vista nuevo rol.	new	Roles	2020-08-12 00:43:41.321239	2020-08-12 00:43:41.321239
14	Mostrar Permisos Asignados A Un Rol	Permite mostrar los permisos asignados de un rol.	role_permissions	Roles	2020-08-12 00:43:41.323767	2020-08-12 00:43:41.323767
15	Mostrar Detalles De Un Rol	Permite mostrar los detalles de un rol.	show	Roles	2020-08-12 00:43:41.326545	2020-08-12 00:43:41.326545
16	Actualizar Rol	Permite actualizar un rol.	update	Roles	2020-08-12 00:43:41.329152	2020-08-12 00:43:41.329152
17	Crear Usuario	Permite crear un usuario. 	create_user	Users::Registrations	2020-08-12 00:43:41.331958	2020-08-12 00:43:41.331958
18	Editar Un Usuario	Permite visualizar la vista editar de un usuario.	edit_user	Users::Registrations	2020-08-12 00:43:41.335169	2020-08-12 00:43:41.335169
19	Mostrar Listado De Usuarios	Permite mostrar un listado de los usuarios.	index	Users::Registrations	2020-08-12 00:43:41.337775	2020-08-12 00:43:41.337775
20	Nuevo Usuario	Permite visualizar la vista nuevo usuario.	new_user	Users::Registrations	2020-08-12 00:43:41.340349	2020-08-12 00:43:41.340349
21	Cambiar Contraseña De Un Usuario	Permite visualizar la vista cambiar contraseña de un usuario.	change_password	Users::Registrations	2020-08-12 00:43:41.34294	2020-08-12 00:43:41.34294
22	Guardar Contraseña De Un Usuario	Permite guardar la contraseña de un usuario. 	save_password	Users::Registrations	2020-08-12 00:43:41.3459	2020-08-12 00:43:41.3459
23	Actualizar Usuario	Permite actualizar un usuario.	update_user	Users::Registrations	2020-08-12 00:43:41.348272	2020-08-12 00:43:41.348272
24	Mostrar Detalles De Un Usuario	Permite mostrar los detalles de un usuario.	show	Users::Registrations	2020-08-12 00:43:41.350829	2020-08-12 00:43:41.350829
25	Destruir Permiso	Permite destruir un permiso.	destroy	Permissions	2020-08-12 00:43:41.353615	2020-08-12 00:43:41.353615
26	Eliminar Usuario	Permite destruir un usuario.	destroy	Users::Registrations	2020-08-12 00:43:41.356116	2020-08-12 00:43:41.356116
27	Cambiar Contraseña Propia	Permite cambiar contraseña en la edición de perfil.	update_password	Users::Registrations	2020-08-12 00:43:41.35939	2020-08-12 00:43:41.35939
28	Cambiar Datos De Perfil	Permite cambiar datos en la edición de perfil.	update_profile	Users::Registrations	2020-08-12 00:43:41.362388	2020-08-12 00:43:41.362388
29	Cambiar Imágen De Perfil	Permite cambiar imágen de perfil.	get_user_image	Users::Registrations	2020-08-12 00:43:41.365269	2020-08-12 00:43:41.365269
30	Mostrar Lista De Compañías	Permite mostrar lista de Compañías	index	Companies	2020-08-12 00:43:41.367868	2020-08-12 00:43:41.367868
31	Mostrar Vista Para Crear Una Empresa	Permite mostrar vista para crear una empresa	new	Companies	2020-08-12 00:43:41.370602	2020-08-12 00:43:41.370602
32	Crear Empresas	Permite crear empresas	create	Companies	2020-08-12 00:43:41.373745	2020-08-12 00:43:41.373745
33	Mostrar Vista Para Actualizar Una Empresa	Permite mostrar vista para actualizar una empresa	edit	Companies	2020-08-12 00:43:41.377301	2020-08-12 00:43:41.377301
34	Actualizar Una Empresa	Permite actualizar una empresa	update	Companies	2020-08-12 00:43:41.380236	2020-08-12 00:43:41.380236
35	Eliminar Empresa	Permite eliminar empresa	destroy	Companies	2020-08-12 00:43:41.382735	2020-08-12 00:43:41.382735
36	Mostrar Lista De Sucursales	Permite mostrar lista de Sucursales	index	Branches	2020-08-12 00:43:41.385834	2020-08-12 00:43:41.385834
37	Mostrar Vista Para Crear Sucursales	Permite mostrar vista para crear sucursales	new	Branches	2020-08-12 00:43:41.389081	2020-08-12 00:43:41.389081
38	Crear Sucursales	Permite crear sucursales	create	Branches	2020-08-12 00:43:41.392041	2020-08-12 00:43:41.392041
39	Mostrar Vista Para Actualizar Sucursales	Permite mostrar vista para actualizar sucursales	edit	Branches	2020-08-12 00:43:41.394882	2020-08-12 00:43:41.394882
40	Actualizar Sucursales	Permite actualizar sucursales	update	Branches	2020-08-12 00:43:41.39743	2020-08-12 00:43:41.39743
41	Eliminar Sucursales	Permite eliminar sucursales	destroy	Branches	2020-08-12 00:43:41.399776	2020-08-12 00:43:41.399776
42	Mostrar Detalles De Una Compañía	Permite mostrar detalles de una compañía	show	Companies	2020-08-12 00:43:41.402145	2020-08-12 00:43:41.402145
43	Mostrar Detalles De Una Sucursal	Permite mostrar detalles de una sucursal	show	Branches	2020-08-12 00:43:41.404681	2020-08-12 00:43:41.404681
44	Mostrar Lista De Departamentos	Permite mostrar lista de Departamentos	index	Departments	2020-08-12 00:43:41.407112	2020-08-12 00:43:41.407112
45	Mostrar Detalles De Un Departamento	Permite mostrar detalles de un departamento	show	Departments	2020-08-12 00:43:41.409897	2020-08-12 00:43:41.409897
46	Mostrar Vista Para Crear Un Departamento	Permite mostrar vista para crear un departamento	new	Departments	2020-08-12 00:43:41.413223	2020-08-12 00:43:41.413223
47	Crear Departamentos	Permite crear departamentos	create	Departments	2020-08-12 00:43:41.415858	2020-08-12 00:43:41.415858
48	Mostrar Vista Para Actualizar Un Departamento	Permite mostrar vista para actualizar un departamento	edit	Departments	2020-08-12 00:43:41.418377	2020-08-12 00:43:41.418377
49	Actualizar Departamentos	Permite actualizar departamentos	update	Departments	2020-08-12 00:43:41.420881	2020-08-12 00:43:41.420881
50	Eliminar Departamentos	Permite eliminar departamentos	destroy	Departments	2020-08-12 00:43:41.423401	2020-08-12 00:43:41.423401
51	Mostrar Lista De Empleados	Permite mostrar lista de empleados	employees_index	Users::Registrations	2020-08-12 00:43:41.429628	2020-08-12 00:43:41.429628
52	Mostrar Lista De Artículos De Trabajo	Permite mostrar lista de Artículos de Trabajo	index	WorkArticles	2020-08-12 00:43:41.432482	2020-08-12 00:43:41.432482
53	Mostrar Vista Para Crear Un Artículo De Trabajo	Permite mostrar vista para crear un artículo de trabajo	new	WorkArticles	2020-08-12 00:43:41.435001	2020-08-12 00:43:41.435001
54	Crear Artículo De Trabajo	Permite crear Artículo de Trabajo	create	WorkArticles	2020-08-12 00:43:41.438028	2020-08-12 00:43:41.438028
55	Mostrar Vista Para Actualizar Un Artículo De Trabajo	Permite mostrar vista para actualizar un artículo de trabajo	edit	WorkArticles	2020-08-12 00:43:41.441015	2020-08-12 00:43:41.441015
56	Actualizar Artículos De Trabajo	Permite actualizar Artículos de Trabajo	update	WorkArticles	2020-08-12 00:43:41.444081	2020-08-12 00:43:41.444081
57	Mostrar Detalles De Un Artículo De Trabajo	Permite mostrar detalles de un Artículo de Trabajo	show	WorkArticles	2020-08-12 00:43:41.446979	2020-08-12 00:43:41.446979
58	Eliminar Artículos De Trabajo	Permite eliminar Artículos de Trabajo	destroy	WorkArticles	2020-08-12 00:43:41.449469	2020-08-12 00:43:41.449469
59	Asignar Artículo De Trabajo A Empleado	Permite asignar artículo de trabajo a empleado	add_work_article	Users::Registrations	2020-08-12 00:43:41.451966	2020-08-12 00:43:41.451966
60	Desasignar Artículo De Trabajo A Empleado	Permite desasignar artículo de trabajo a empleado	remove_work_article	Users::Registrations	2020-08-12 00:43:41.454688	2020-08-12 00:43:41.454688
61	Actualizar Artículos	Permite actualizar artículos	update	Items	2020-08-12 00:43:41.457698	2020-08-12 00:43:41.457698
62	Mostrar Lista De Artículos De Trabajo Asignados A Un Empleado	Permite mostrar lista de Artículos de Trabajo asignados a un empleado	assign_work_articles	Users::Registrations	2020-08-12 00:43:41.460475	2020-08-12 00:43:41.460475
63	Obtener Artículos De Trabajo De Un Empleado	Permite obtener Artículos de Trabajo de un empleado	search_work_articles	Users::Registrations	2020-08-12 00:43:41.463159	2020-08-12 00:43:41.463159
64	Mostrar Lista De Artículos	Permite mostrar lista de Artículos	index	Items	2020-08-12 00:43:41.465955	2020-08-12 00:43:41.465955
65	Mostrar Vista Para Crear Un Artículo	Permite mostrar vista para crear un artículo	new	Items	2020-08-12 00:43:41.468615	2020-08-12 00:43:41.468615
66	Crear Artículos	Permite crear artículos	create	Items	2020-08-12 00:43:41.471193	2020-08-12 00:43:41.471193
67	Mostrar Vista Para Actualizar Artículos	Permite mostrar vista para actualizar artículos	edit	Items	2020-08-12 00:43:41.47395	2020-08-12 00:43:41.47395
68	Mostrar Artículos De Empleado	Permite mostrar artículos de empleado	employee_items	Departments	2020-08-12 00:43:41.476745	2020-08-12 00:43:41.476745
69	Mostrar Detalles De Un Artículo	Permite mostrar detalles de un artículo	show	Items	2020-08-12 00:43:41.479762	2020-08-12 00:43:41.479762
70	Eliminar Artículos	Permite eliminar artículos	destroy	Items	2020-08-12 00:43:41.482506	2020-08-12 00:43:41.482506
71	Asignar Artículo A Empleado	Permite asignar artículo a empleado	assign_item	Users::Registrations	2020-08-12 00:43:41.485135	2020-08-12 00:43:41.485135
72	Desasignar Artículo A Empleado	Permite desasignar artículo a empleado	unassign_item	Users::Registrations	2020-08-12 00:43:41.487549	2020-08-12 00:43:41.487549
73	Realizar Búsquedas Para Reporteador	Permite realizar búsquedas para reporteador	reporter	Items	2020-08-12 00:43:41.490048	2020-08-12 00:43:41.490048
74	Ver Los Mantenimientos Próximos	Permite ver los mantenimientos próximos	next_maintenances	Items	2020-08-12 00:43:41.492744	2020-08-12 00:43:41.492744
75	Exportador De Excel	Permite exportar los items a un excel	items_excel	Items	2020-08-12 00:43:41.49529	2020-08-12 00:43:41.49529
76	Obtener Departamentos Para Select En Reporteador	Permite obtener departamentos para select en reporteador	departments	Branches	2020-08-12 00:43:41.497938	2020-08-12 00:43:41.497938
77	Obtener Subcategorias Para Select En Reporteador	Permite obtener subcategorias para select en reporteador	sub_categories	Categories	2020-08-12 00:43:41.50048	2020-08-12 00:43:41.50048
78	Obtener Departamentos Para Select En Form De Item	Permite obtener departamentos para select en form de item	departments_for_select	Branches	2020-08-12 00:43:41.503004	2020-08-12 00:43:41.503004
79	Permite Generar El Reporte Del Checklist Del Empleado	Permite Generar el reporte del Checklist del empleado	report_check_items_user	Reports	2020-08-12 00:43:41.505577	2020-08-12 00:43:41.505577
80	Actualizar Fecha De Mantenimiento De Un Artículo	Permite actualizar fecha de mantenimiento de un artículo	change_maintenance_done	Items	2020-08-12 00:43:41.508374	2020-08-12 00:43:41.508374
81	Obtener El Ultimo Codigo De Un Departamento Para Cuando No Se Tiene Sucursal	Permite obtener el ultimo codigo del departamento	next_code	Branches	2020-08-12 00:43:41.511367	2020-08-12 00:43:41.511367
\.


--
-- Data for Name: plutus_accounts; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.plutus_accounts (id, name, type, contra, created_at, updated_at) FROM stdin;
9	Bancos	Plutus::Asset	\N	2021-01-05 18:45:03.044101	2021-01-05 18:45:03.044101
10	Clientes	Plutus::Asset	\N	2021-01-05 18:45:03.082095	2021-01-05 18:45:03.082095
11	IVA Acreditable	Plutus::Asset	\N	2021-01-05 18:45:03.121583	2021-01-05 18:45:03.121583
12	IVA Pendiente Acreditar	Plutus::Asset	\N	2021-01-05 18:45:03.160117	2021-01-05 18:45:03.160117
13	Inventarios	Plutus::Asset	\N	2021-01-05 18:45:03.198004	2021-01-05 18:45:03.198004
14	Proveedores	Plutus::Liability	\N	2021-01-05 18:45:03.288398	2021-01-05 18:45:03.288398
15	IVA Trasladado	Plutus::Liability	\N	2021-01-05 18:45:03.345104	2021-01-05 18:45:03.345104
16	IVA Pendiente Trasladado	Plutus::Liability	\N	2021-01-05 18:45:03.390316	2021-01-05 18:45:03.390316
17	Ventas	Plutus::Revenue	\N	2021-01-05 18:45:03.455722	2021-01-05 18:45:03.455722
18	Costo Ventas	Plutus::Expense	\N	2021-01-05 18:45:03.554532	2021-01-05 18:45:03.554532
19	Gastos	Plutus::Expense	\N	2021-01-05 18:45:03.614521	2021-01-05 18:45:03.614521
20	Capital	Plutus::Equity	\N	2021-01-05 18:45:05.027673	2021-01-05 18:45:05.027673
22	Compras	Plutus::Expense	\N	2021-01-06 03:10:31.906531	2021-01-06 03:10:31.906531
\.


--
-- Data for Name: plutus_amounts; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.plutus_amounts (id, type, account_id, entry_id, amount) FROM stdin;
1	Plutus::CreditAmount	2	1	45.0000000000
2	Plutus::CreditAmount	3	1	5.0000000000
3	Plutus::DebitAmount	1	1	50.0000000000
4	Plutus::CreditAmount	5	2	45.0000000000
5	Plutus::CreditAmount	6	2	5.0000000000
6	Plutus::DebitAmount	4	2	50.0000000000
7	Plutus::CreditAmount	18	3	23000.0000000000
8	Plutus::DebitAmount	13	3	23000.0000000000
9	Plutus::CreditAmount	9	4	34800.0000000000
10	Plutus::DebitAmount	21	4	30000.0000000000
11	Plutus::DebitAmount	11	4	4800.0000000000
12	Plutus::CreditAmount	18	5	30000.0000000000
13	Plutus::DebitAmount	13	5	30000.0000000000
\.


--
-- Data for Name: plutus_entries; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.plutus_entries (id, description, date, commercial_document_id, commercial_document_type, created_at, updated_at) FROM stdin;
4	Compra de Remolque	2021-01-02	\N	\N	2021-01-06 00:39:34.009151	2021-01-06 00:39:34.009151
5	Compra de Remolque ER	2021-01-02	\N	\N	2021-01-06 00:39:34.042096	2021-01-06 00:39:34.042096
\.


--
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.providers (id, name, description, contact, phone, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pull_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.pull_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Jalon tipo gancho	JG	t	2020-11-09 07:54:35.588849	2020-11-09 07:54:35.588849
\.


--
-- Data for Name: quotations; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.quotations (id, user_id, price, model, client_id, branch_id, department_id, trailer_type_id, brake_type_id, trailer_width_id, color_id, trailer_length_id, divition_type_id, floor_type_id, fender_type_id, ramp_type_id, hydraulic_jack_id, capacity_id, pull_type_id, redila_type_id, brand_id, roof_type_id, suspension_type_id, turn_type_id, accessory, categories_description, catalog, created_at, updated_at) FROM stdin;
1	4	20000.0	CB0510MFA	1	\N	1	1	\N	1	\N	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N		TRAILER: Cama Baja. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. FENDER: Fender Antiderrapante. 	\N	2021-03-30 22:54:47.004501	2021-03-30 22:55:04.703169
2	4	400000.0	CB0510MFAGB	1	\N	1	1	\N	1	\N	1	\N	1	1	\N	1	\N	\N	\N	\N	\N	\N	\N		TRAILER: Cama Baja. ANCHO: 5 pies. LARGO: 10 pies. PISO: Piso de Madera. FENDER: Fender Antiderrapante. GATO HIDRAULICO: De botella. 	\N	2021-03-31 00:35:50.485726	2021-03-31 00:36:06.548037
3	\N	\N	CB10	\N	\N	\N	1	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		TRAILER: Cama Baja. LARGO: 10 pies. 	\N	2021-03-31 00:43:59.015838	2021-03-31 00:43:59.015838
\.


--
-- Data for Name: ramp_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.ramp_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Rampa Hidraulica	RH	t	2020-10-26 20:48:30.138664	2020-10-26 20:48:30.138664
\.


--
-- Data for Name: redila_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.redila_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Redila Cerrada	RC	t	2020-10-26 20:51:07.8666	2020-10-26 20:51:07.8666
\.


--
-- Data for Name: reinforcement_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.reinforcement_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Refuerzo Doble	RD	t	2020-11-09 07:59:35.830286	2020-11-09 07:59:35.830286
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.roles (id, name, key, description, scope, created_at, updated_at) FROM stdin;
2	Administrador General	admin	Administrador general del corporativo.	0	2020-08-12 00:40:23.110785	2020-08-12 00:40:23.110785
4	Gerente	admin_sucursal	Administrador de Sucursal.	0	2020-08-12 00:40:23.124034	2020-08-12 00:40:23.124034
6	Vendedor	empleado_sin_acceso	Vendedores de remolques del sistema.	0	2020-08-12 00:40:23.128838	2020-09-09 22:50:18.287821
1	Supremo kaiosama 	god	Super administrador del sistema. Tiene acceso a todo y superpoderes.	0	2020-08-12 00:40:23.095164	2020-09-09 23:02:21.478455
7	Guest	guest	Invitado	\N	2021-02-13 00:17:29.963675	2021-02-13 00:17:29.963675
\.


--
-- Data for Name: roof_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.roof_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Techo de Lamina	TL	t	2020-11-09 08:00:34.877727	2020-11-09 08:00:34.877727
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: mac
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
20200909072307
20200909164751
20200909231442
20200909053235
20200925033506
20200925040610
20200925044313
20200925015804
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
20210309031136
20210316013108
20210316153643
20210311044737
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.states (id, name, country_id, created_at, updated_at) FROM stdin;
1	Aguascalientes	1	2020-08-13 15:03:41.974699	2020-08-13 15:03:41.974699
2	Baja California	1	2020-08-13 15:03:41.978401	2020-08-13 15:03:41.978401
3	Baja California Sur	1	2020-08-13 15:03:41.980275	2020-08-13 15:03:41.980275
4	Campeche	1	2020-08-13 15:03:41.982272	2020-08-13 15:03:41.982272
5	Coahuila	1	2020-08-13 15:03:41.984335	2020-08-13 15:03:41.984335
6	Colima	1	2020-08-13 15:03:41.986078	2020-08-13 15:03:41.986078
7	Chiapas	1	2020-08-13 15:03:41.987677	2020-08-13 15:03:41.987677
8	Chihuahua	1	2020-08-13 15:03:41.989072	2020-08-13 15:03:41.989072
9	Distrito Federal	1	2020-08-13 15:03:41.990381	2020-08-13 15:03:41.990381
10	Durango	1	2020-08-13 15:03:41.991748	2020-08-13 15:03:41.991748
11	Guanajuato	1	2020-08-13 15:03:41.993208	2020-08-13 15:03:41.993208
12	Guerrero	1	2020-08-13 15:03:41.994714	2020-08-13 15:03:41.994714
13	Hidalgo	1	2020-08-13 15:03:41.996139	2020-08-13 15:03:41.996139
14	Jalisco	1	2020-08-13 15:03:41.997767	2020-08-13 15:03:41.997767
15	México	1	2020-08-13 15:03:41.999715	2020-08-13 15:03:41.999715
16	Michoacán	1	2020-08-13 15:03:42.002929	2020-08-13 15:03:42.002929
17	Morelos	1	2020-08-13 15:03:42.004666	2020-08-13 15:03:42.004666
18	Nayarit	1	2020-08-13 15:03:42.006339	2020-08-13 15:03:42.006339
19	Nuevo León	1	2020-08-13 15:03:42.007988	2020-08-13 15:03:42.007988
20	Oaxaca	1	2020-08-13 15:03:42.009543	2020-08-13 15:03:42.009543
21	Puebla	1	2020-08-13 15:03:42.011104	2020-08-13 15:03:42.011104
22	Querétaro	1	2020-08-13 15:03:42.012763	2020-08-13 15:03:42.012763
23	Quintana Roo	1	2020-08-13 15:03:42.014164	2020-08-13 15:03:42.014164
24	San Luis Potosí	1	2020-08-13 15:03:42.015739	2020-08-13 15:03:42.015739
25	Sinaloa	1	2020-08-13 15:03:42.017776	2020-08-13 15:03:42.017776
26	Sonora	1	2020-08-13 15:03:42.019301	2020-08-13 15:03:42.019301
27	Tabasco	1	2020-08-13 15:03:42.0208	2020-08-13 15:03:42.0208
28	Tamaulipas	1	2020-08-13 15:03:42.022274	2020-08-13 15:03:42.022274
29	Tlaxcala	1	2020-08-13 15:03:42.023635	2020-08-13 15:03:42.023635
30	Veracruz	1	2020-08-13 15:03:42.025246	2020-08-13 15:03:42.025246
31	Yucatán	1	2020-08-13 15:03:42.02702	2020-08-13 15:03:42.02702
32	Zacatecas	1	2020-08-13 15:03:42.028584	2020-08-13 15:03:42.028584
33	Aguascalientes	1	2020-08-13 15:04:04.373209	2020-08-13 15:04:04.373209
34	Baja California	1	2020-08-13 15:04:04.377102	2020-08-13 15:04:04.377102
35	Baja California Sur	1	2020-08-13 15:04:04.379765	2020-08-13 15:04:04.379765
36	Campeche	1	2020-08-13 15:04:04.382475	2020-08-13 15:04:04.382475
37	Coahuila	1	2020-08-13 15:04:04.384988	2020-08-13 15:04:04.384988
38	Colima	1	2020-08-13 15:04:04.387478	2020-08-13 15:04:04.387478
39	Chiapas	1	2020-08-13 15:04:04.390419	2020-08-13 15:04:04.390419
40	Chihuahua	1	2020-08-13 15:04:04.393627	2020-08-13 15:04:04.393627
41	Distrito Federal	1	2020-08-13 15:04:04.396041	2020-08-13 15:04:04.396041
42	Durango	1	2020-08-13 15:04:04.398305	2020-08-13 15:04:04.398305
43	Guanajuato	1	2020-08-13 15:04:04.401039	2020-08-13 15:04:04.401039
44	Guerrero	1	2020-08-13 15:04:04.403495	2020-08-13 15:04:04.403495
45	Hidalgo	1	2020-08-13 15:04:04.406387	2020-08-13 15:04:04.406387
46	Jalisco	1	2020-08-13 15:04:04.408872	2020-08-13 15:04:04.408872
47	México	1	2020-08-13 15:04:04.411458	2020-08-13 15:04:04.411458
48	Michoacán	1	2020-08-13 15:04:04.414643	2020-08-13 15:04:04.414643
49	Morelos	1	2020-08-13 15:04:04.416945	2020-08-13 15:04:04.416945
50	Nayarit	1	2020-08-13 15:04:04.419121	2020-08-13 15:04:04.419121
51	Nuevo León	1	2020-08-13 15:04:04.421272	2020-08-13 15:04:04.421272
52	Oaxaca	1	2020-08-13 15:04:04.423878	2020-08-13 15:04:04.423878
53	Puebla	1	2020-08-13 15:04:04.426291	2020-08-13 15:04:04.426291
54	Querétaro	1	2020-08-13 15:04:04.429077	2020-08-13 15:04:04.429077
55	Quintana Roo	1	2020-08-13 15:04:04.431426	2020-08-13 15:04:04.431426
56	San Luis Potosí	1	2020-08-13 15:04:04.433144	2020-08-13 15:04:04.433144
57	Sinaloa	1	2020-08-13 15:04:04.435073	2020-08-13 15:04:04.435073
58	Sonora	1	2020-08-13 15:04:04.437261	2020-08-13 15:04:04.437261
59	Tabasco	1	2020-08-13 15:04:04.439747	2020-08-13 15:04:04.439747
60	Tamaulipas	1	2020-08-13 15:04:04.441779	2020-08-13 15:04:04.441779
61	Tlaxcala	1	2020-08-13 15:04:04.443763	2020-08-13 15:04:04.443763
62	Veracruz	1	2020-08-13 15:04:04.445781	2020-08-13 15:04:04.445781
63	Yucatán	1	2020-08-13 15:04:04.448749	2020-08-13 15:04:04.448749
64	Zacatecas	1	2020-08-13 15:04:04.450826	2020-08-13 15:04:04.450826
\.


--
-- Data for Name: status_items; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.status_items (id, name, description, status, created_at, updated_at, key) FROM stdin;
1	Vendido	Vendido	\N	2020-09-07 19:14:15.241987	2020-09-07 19:14:15.241987	vendido
4	Vendido y Facturado	Vendido y Facturado	\N	2020-09-07 19:14:15.248937	2020-09-07 19:14:15.248937	facturado
3	Vendido y Pendiente de Factura	Vendido y Pendiente de Factura	\N	2020-09-07 19:14:15.246931	2020-09-25 04:16:51.33658	pendiente_factura
5	Articulo Pendiente	Articulo Pendiente	\N	2020-10-06 16:32:52.826972	2020-10-06 16:32:52.826972	pendiente
2	Disponible	Disponible	t	2020-09-07 19:14:15.244623	2020-10-14 02:06:09.955491	no_vendido
6	Vendido a Credito	Vendido a Credito	t	2021-03-10 19:48:59.661443	2021-03-10 19:48:59.661443	vendido_credito
\.


--
-- Data for Name: status_shippings; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.status_shippings (id, name, description, status, key, created_at, updated_at) FROM stdin;
1	Pedido	Articulo Pedido	\N	pedido	2020-10-09 21:23:04.093891	2020-10-09 21:23:04.093891
2	Enviado	Articulo Enviado	\N	enviado	2020-10-09 21:23:04.160347	2020-10-09 21:23:04.160347
3	Recibido	Articulo Recibido	\N	recibido	2020-10-09 21:23:04.221419	2020-10-09 21:23:04.221419
\.


--
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.sub_categories (id, name, description, status, category_id, created_at, updated_at) FROM stdin;
1	Redilas 	\N	t	2	2020-08-13 20:55:21.04717	2020-08-13 20:55:21.04717
2	CABALLOS	CABALLOS	t	2	2020-09-07 19:25:54.677672	2020-09-07 19:25:54.677672
4	Deportivo	\N	t	2	2020-09-10 22:41:18.590496	2020-09-10 22:41:18.590496
3	3,000 kg	3k	t	2	2020-09-07 19:26:05.163139	2020-10-22 00:34:53.544399
\.


--
-- Data for Name: suspension_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.suspension_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Suspension Ballesta	SB	t	2020-11-09 08:01:38.498957	2020-11-09 08:01:38.498957
\.


--
-- Data for Name: trailer_categories; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.trailer_categories (id, trailer_id, trailer_length_id, trailer_height_id, ramp_type_id, redila_type_id, trailer_type_id, floor_type_id, capacity_id, trailer_width_id, color_id, hydraulic_jack_id, pull_type_id, brake_type_id, reinforcement_type_id, fender_type_id, turn_type_id, divition_type_id, suspension_type_id, roof_type_id, brand_id, created_at, updated_at, key) FROM stdin;
20	\N	\N	\N	\N	\N	3	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-16 15:56:04.558237	2021-03-16 15:56:04.558237	color_id
21	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-16 15:56:04.560829	2021-03-16 15:56:04.560829	hydraulic_jack_id
22	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2021-03-16 15:56:04.563022	2021-03-16 15:56:04.563022	brake_type_id
23	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	2021-03-16 15:56:04.565319	2021-03-16 15:56:04.565319	roof_type_id
24	\N	\N	\N	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	2021-03-17 20:20:16.658595	2021-03-17 20:20:16.658595	reinforcement_type_id
25	\N	\N	\N	1	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-17 20:20:16.688439	2021-03-17 20:20:16.688439	ramp_type_id
26	\N	\N	\N	\N	\N	3	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-17 20:22:37.158134	2021-03-17 20:22:37.158134	color_id
28	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	2021-03-18 18:33:34.705974	2021-03-18 18:33:34.705974	fender_type_id
30	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-18 18:33:34.709572	2021-03-18 18:33:34.709572	hydraulic_jack_id
31	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	2021-03-18 18:33:34.711138	2021-03-18 18:33:34.711138	reinforcement_type_id
35	\N	\N	\N	\N	\N	2	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-19 06:41:56.973928	2021-03-19 06:41:56.973928	capacity_id
36	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	2021-03-19 06:41:56.978356	2021-03-19 06:41:56.978356	roof_type_id
37	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	2021-03-19 06:41:56.980476	2021-03-19 06:41:56.980476	turn_type_id
38	\N	\N	\N	\N	\N	2	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-19 06:43:49.079379	2021-03-19 06:43:49.079379	trailer_width_id
39	\N	\N	\N	\N	\N	1	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-24 01:35:30.163912	2021-03-24 01:35:30.163912	trailer_width_id
41	\N	1	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-24 01:35:30.169203	2021-03-24 01:35:30.169203	trailer_length_id
42	\N	\N	\N	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-24 01:35:30.171735	2021-03-24 01:35:30.171735	redila_type_id
43	\N	\N	\N	\N	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-24 01:35:30.174238	2021-03-24 01:35:30.174238	floor_type_id
44	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	2021-03-24 01:35:43.707502	2021-03-24 01:35:43.707502	suspension_type_id
46	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	48	2021-03-24 23:48:37.174732	2021-03-24 23:48:37.174732	brand_id
47	\N	1	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-25 21:49:40.520031	2021-03-25 21:49:40.520031	trailer_length_id
48	\N	\N	\N	\N	\N	2	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-25 21:49:40.531654	2021-03-25 21:49:40.531654	floor_type_id
49	\N	\N	\N	1	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-25 21:49:40.534062	2021-03-25 21:49:40.534062	ramp_type_id
50	\N	\N	\N	\N	\N	2	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-25 21:49:40.536146	2021-03-25 21:49:40.536146	color_id
51	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	2021-03-25 21:50:58.669827	2021-03-25 21:50:58.669827	fender_type_id
52	\N	\N	\N	\N	1	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-25 21:50:58.673108	2021-03-25 21:50:58.673108	redila_type_id
53	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	2021-03-25 21:51:44.843982	2021-03-25 21:51:44.843982	brake_type_id
54	\N	\N	\N	\N	\N	1	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2021-03-30 23:12:39.638843	2021-03-30 23:12:39.638843	color_id
\.


--
-- Data for Name: trailer_heights; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.trailer_heights (id, name, model_part, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: trailer_lengths; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.trailer_lengths (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	10 pies	10	t	2020-10-26 22:49:58.891386	2020-10-26 22:53:00.649486
\.


--
-- Data for Name: trailer_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.trailer_types (id, name, image, status, created_at, updated_at, model_part) FROM stdin;
1	Cama Baja	\N	t	2020-10-26 23:12:35.65907	2020-10-26 23:18:44.990206	CB
2	Caja Seca	\N	t	2020-10-27 22:43:38.121129	2020-10-27 22:43:38.121129	CS
3	Ganaderos	\N	t	2021-03-16 10:34:30.193781	2021-03-16 10:34:30.193781	G
\.


--
-- Data for Name: trailer_widths; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.trailer_widths (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	5 pies	05	t	2020-10-26 22:56:25.979657	2020-10-26 22:56:25.979657
2	7.5 pies	75	t	2020-11-11 19:50:59.464178	2020-11-11 19:50:59.464178
\.


--
-- Data for Name: trailers; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.trailers (id, name, model, photo, created_at, updated_at, category_id, sub_category_id, image, status, trailer_type_id, trailer_length_id, trailer_height_id, trailer_width_id, ramp_type_id, redila_type_id, floor_type_id, capacity_id, color_id, hydraulic_jack_id, pull_type_id, brake_type_id, reinforcement_type_id, fender_type_id, turn_type_id, divition_type_id, suspension_type_id, roof_type_id, brand_id) FROM stdin;
3	Remolque Ligero Doble Rampa	CS0510MRH2DN	\N	2020-11-09 22:07:21.154121	2020-11-09 22:07:21.154121	\N	\N	\N	\N	2	1	\N	1	1	\N	1	\N	1	\N	\N	\N	\N	\N	\N	1	\N	\N	\N
2	REMOLQUE REDILAS	CS0510MRH15TNFH	\N	2020-10-02 00:42:04.138365	2020-11-09 22:27:00.099238	\N	1	\N	\N	2	1	\N	1	1	\N	1	1	1	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
1	Remolque Ligero	CB0510FHN2DRH	\N	2020-09-09 07:52:25.405254	2020-11-09 22:33:11.288113	2	1	\N	\N	1	1	\N	1	1	\N	\N	\N	1	\N	\N	1	\N	\N	\N	1	\N	\N	\N
4	Remolque mas Pedido	CB1005MRH15T	\N	2020-11-10 00:07:49.881524	2020-11-10 00:07:49.881524	\N	\N	\N	\N	1	1	\N	1	1	\N	1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: turn_types; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.turn_types (id, name, model_part, status, created_at, updated_at) FROM stdin;
1	Volteo Tipo Tijera	VTT	t	2020-11-09 08:03:31.65785	2020-11-09 08:03:31.65785
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, role_id, first_name, last_name, maiden_name, username, avatar, department_id, employee_number, received_file, current_company, token) FROM stdin;
4	gerente@plan.com	$2a$10$dN6XUTV21SsXpFGGWrI8EuX3WxePhS02SG0xILHoQsjmfNfubFfIK	\N	\N	\N	0	\N	\N	\N	\N	2020-09-03 23:04:14.912898	2020-09-04 01:05:58.641564	\N	\N	\N	\N	4	Gerente 1	Gerente 1	Gerente 1	\N	\N	1	2222	\N	0	\N
8	8zour0i4@inventory.com	$2a$10$aKZnJh7LsJl5Ps9PC9PIT.UvTsS2KLK7W90PUkTIMeZUd1k4rYWC2	\N	\N	\N	0	\N	\N	\N	\N	2020-09-10 05:24:15.053136	2020-09-10 05:24:55.16365	\N	\N	\N	\N	6	Vendedor 	Cuauhtemoc 	Remolque	\N	\N	1	1122	\N	0	\N
7	vendedor@correo.com	$2a$10$1DvTSzgniY9KzDs8Klcaou2eUPVQmp0K0FrrQwAkjSTRcS.lrS9GC	\N	\N	\N	0	\N	\N	\N	\N	2020-09-08 02:54:58.526382	2020-09-10 05:29:17.410035	\N	\N	\N	\N	6	Vendedor 2	Vendedor 2	Vendedor 2	\N	\N	1	3333	\N	0	\N
1	god@example.com	$2a$10$SN1cKMCtQFexpG0KQt5zfexC.e.j9mXlfQGfr2gpZHh9pwxSyTyOS	\N	\N	\N	16	2021-03-30 22:10:11.628277	2021-03-28 21:53:40.317634	::1	::1	2020-08-12 01:06:33.589039	2021-03-30 22:10:11.631075	\N	2020-08-12 01:06:33.461677	\N	\N	1	God	System	User	divinity	\N	1	12345	\N	0	\N
9	gerente3@correo.com	$2a$10$yjmwJNDlA0D/V58M4.FuF.1TZWI6r6NKdz/XgfnT/K5mt4V9WQ77q	\N	\N	\N	0	\N	\N	\N	\N	2020-09-10 22:16:46.944298	2020-09-10 22:16:46.944298	\N	\N	\N	\N	4	Gerente 3	Gerente 	Gerente 1	\N	\N	1	4321	\N	0	\N
6	eeeeeee2@inventory.com	$2a$10$thnTk2WuSw2M86WbEpb2Le4O0Lbih3PchaguwVgomP2oMiau9Tbzm	\N	\N	\N	0	\N	\N	\N	\N	2020-09-04 02:18:17.886775	2020-09-10 22:19:39.194691	\N	\N	\N	\N	6	Vendedor 1	Vendedor 1	Vendedor 1	\N	\N	1	7777	\N	0	\N
10	uoye5ho5@inventory.com	$2a$10$MxL4ziyJ9VkZfE8vT9GwB.2Kz1JPFuNQzumk6Evh9mDWRac83/ySS	\N	\N	\N	0	\N	\N	\N	\N	2020-09-10 22:20:45.059099	2020-09-10 22:20:45.059099	\N	\N	\N	\N	6	Test	Test	Test	\N	\N	1	8989	\N	0	\N
11	pgen0d9f@inventory.com	$2a$10$/YYMfT8wKTHTUq4HfNzAvOgJ8NDB4aIcuYcQztPgzjrfwlMSdgLxu	\N	\N	\N	0	\N	\N	\N	\N	2020-09-10 22:29:36.349574	2020-09-10 22:29:36.349574	\N	\N	\N	\N	6	Irapuato	Vendedor	Uno	\N	\N	3	8080	\N	0	\N
12	qdtucaqa@inventory.com	$2a$10$EFu1whPjXWdASCIju7assOpIPb.KU2YNxqqfZdn.lWhZXn9P6YN9S	\N	\N	\N	0	\N	\N	\N	\N	2020-11-19 23:01:21.127257	2020-11-19 23:01:21.127257	\N	\N	\N	\N	6	G	G	G	\N	\N	3	66	\N	0	\N
\.


--
-- Data for Name: users_work_articles; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.users_work_articles (id, user_id, work_article_id, reception_status, delivery_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: work_articles; Type: TABLE DATA; Schema: public; Owner: mac
--

COPY public.work_articles (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 105, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 105, true);


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.audits_id_seq', 376, true);


--
-- Name: brake_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.brake_types_id_seq', 2, true);


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.branches_id_seq', 3, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.brands_id_seq', 48, true);


--
-- Name: capacities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.capacities_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.cities_id_seq', 2459, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.clients_id_seq', 2, true);


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.colors_id_seq', 2, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.companies_id_seq', 2, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.countries_id_seq', 3, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.departments_id_seq', 4, true);


--
-- Name: divition_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.divition_types_id_seq', 1, true);


--
-- Name: fender_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.fender_types_id_seq', 1, true);


--
-- Name: fiscal_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.fiscal_vouchers_id_seq', 22, true);


--
-- Name: floor_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.floor_types_id_seq', 1, true);


--
-- Name: hydraulic_jacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.hydraulic_jacks_id_seq', 1, true);


--
-- Name: item_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.item_files_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.items_id_seq', 78, true);


--
-- Name: items_maintenances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.items_maintenances_id_seq', 1, false);


--
-- Name: maintenances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.maintenances_id_seq', 1, false);


--
-- Name: offices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.offices_id_seq', 1, false);


--
-- Name: permission_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.permission_roles_id_seq', 215, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.permissions_id_seq', 81, true);


--
-- Name: plutus_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.plutus_accounts_id_seq', 22, true);


--
-- Name: plutus_amounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.plutus_amounts_id_seq', 13, true);


--
-- Name: plutus_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.plutus_entries_id_seq', 5, true);


--
-- Name: providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.providers_id_seq', 1, false);


--
-- Name: pull_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.pull_types_id_seq', 1, true);


--
-- Name: quotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.quotations_id_seq', 3, true);


--
-- Name: ramp_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.ramp_types_id_seq', 1, true);


--
-- Name: redila_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.redila_types_id_seq', 1, true);


--
-- Name: reinforcement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.reinforcement_types_id_seq', 1, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: roof_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.roof_types_id_seq', 1, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.states_id_seq', 64, true);


--
-- Name: status_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.status_items_id_seq', 6, true);


--
-- Name: status_shippings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.status_shippings_id_seq', 3, true);


--
-- Name: sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.sub_categories_id_seq', 4, true);


--
-- Name: suspension_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.suspension_types_id_seq', 1, true);


--
-- Name: trailer_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.trailer_categories_id_seq', 54, true);


--
-- Name: trailer_heights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.trailer_heights_id_seq', 1, false);


--
-- Name: trailer_lengths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.trailer_lengths_id_seq', 1, true);


--
-- Name: trailer_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.trailer_types_id_seq', 3, true);


--
-- Name: trailer_widths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.trailer_widths_id_seq', 2, true);


--
-- Name: trailers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.trailers_id_seq', 4, true);


--
-- Name: turn_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.turn_types_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: users_work_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.users_work_articles_id_seq', 1, false);


--
-- Name: work_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mac
--

SELECT pg_catalog.setval('public.work_articles_id_seq', 1, false);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: brake_types brake_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.brake_types
    ADD CONSTRAINT brake_types_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: capacities capacities_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.capacities
    ADD CONSTRAINT capacities_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: divition_types divition_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.divition_types
    ADD CONSTRAINT divition_types_pkey PRIMARY KEY (id);


--
-- Name: fender_types fender_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.fender_types
    ADD CONSTRAINT fender_types_pkey PRIMARY KEY (id);


--
-- Name: fiscal_vouchers fiscal_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.fiscal_vouchers
    ADD CONSTRAINT fiscal_vouchers_pkey PRIMARY KEY (id);


--
-- Name: floor_types floor_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.floor_types
    ADD CONSTRAINT floor_types_pkey PRIMARY KEY (id);


--
-- Name: hydraulic_jacks hydraulic_jacks_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.hydraulic_jacks
    ADD CONSTRAINT hydraulic_jacks_pkey PRIMARY KEY (id);


--
-- Name: item_files item_files_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.item_files
    ADD CONSTRAINT item_files_pkey PRIMARY KEY (id);


--
-- Name: items_maintenances items_maintenances_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items_maintenances
    ADD CONSTRAINT items_maintenances_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: maintenances maintenances_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.maintenances
    ADD CONSTRAINT maintenances_pkey PRIMARY KEY (id);


--
-- Name: offices offices_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (id);


--
-- Name: permission_roles permission_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.permission_roles
    ADD CONSTRAINT permission_roles_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: plutus_accounts plutus_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.plutus_accounts
    ADD CONSTRAINT plutus_accounts_pkey PRIMARY KEY (id);


--
-- Name: plutus_amounts plutus_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.plutus_amounts
    ADD CONSTRAINT plutus_amounts_pkey PRIMARY KEY (id);


--
-- Name: plutus_entries plutus_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.plutus_entries
    ADD CONSTRAINT plutus_entries_pkey PRIMARY KEY (id);


--
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: pull_types pull_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.pull_types
    ADD CONSTRAINT pull_types_pkey PRIMARY KEY (id);


--
-- Name: quotations quotations_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT quotations_pkey PRIMARY KEY (id);


--
-- Name: ramp_types ramp_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.ramp_types
    ADD CONSTRAINT ramp_types_pkey PRIMARY KEY (id);


--
-- Name: redila_types redila_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.redila_types
    ADD CONSTRAINT redila_types_pkey PRIMARY KEY (id);


--
-- Name: reinforcement_types reinforcement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.reinforcement_types
    ADD CONSTRAINT reinforcement_types_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roof_types roof_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.roof_types
    ADD CONSTRAINT roof_types_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: status_items status_items_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.status_items
    ADD CONSTRAINT status_items_pkey PRIMARY KEY (id);


--
-- Name: status_shippings status_shippings_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.status_shippings
    ADD CONSTRAINT status_shippings_pkey PRIMARY KEY (id);


--
-- Name: sub_categories sub_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.sub_categories
    ADD CONSTRAINT sub_categories_pkey PRIMARY KEY (id);


--
-- Name: suspension_types suspension_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.suspension_types
    ADD CONSTRAINT suspension_types_pkey PRIMARY KEY (id);


--
-- Name: trailer_categories trailer_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT trailer_categories_pkey PRIMARY KEY (id);


--
-- Name: trailer_heights trailer_heights_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_heights
    ADD CONSTRAINT trailer_heights_pkey PRIMARY KEY (id);


--
-- Name: trailer_lengths trailer_lengths_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_lengths
    ADD CONSTRAINT trailer_lengths_pkey PRIMARY KEY (id);


--
-- Name: trailer_types trailer_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_types
    ADD CONSTRAINT trailer_types_pkey PRIMARY KEY (id);


--
-- Name: trailer_widths trailer_widths_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_widths
    ADD CONSTRAINT trailer_widths_pkey PRIMARY KEY (id);


--
-- Name: trailers trailers_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT trailers_pkey PRIMARY KEY (id);


--
-- Name: turn_types turn_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.turn_types
    ADD CONSTRAINT turn_types_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_work_articles users_work_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users_work_articles
    ADD CONSTRAINT users_work_articles_pkey PRIMARY KEY (id);


--
-- Name: work_articles work_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.work_articles
    ADD CONSTRAINT work_articles_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX associated_index ON public.audits USING btree (associated_id, associated_type);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX auditable_index ON public.audits USING btree (auditable_id, auditable_type);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: mac
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: mac
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_audits_on_created_at ON public.audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_audits_on_request_uuid ON public.audits USING btree (request_uuid);


--
-- Name: index_branches_on_city_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_branches_on_city_id ON public.branches USING btree (city_id);


--
-- Name: index_branches_on_company_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_branches_on_company_id ON public.branches USING btree (company_id);


--
-- Name: index_branches_on_state_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_branches_on_state_id ON public.branches USING btree (state_id);


--
-- Name: index_categories_on_company_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_categories_on_company_id ON public.categories USING btree (company_id);


--
-- Name: index_cities_on_state_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_cities_on_state_id ON public.cities USING btree (state_id);


--
-- Name: index_clients_on_city_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_clients_on_city_id ON public.clients USING btree (city_id);


--
-- Name: index_clients_on_state_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_clients_on_state_id ON public.clients USING btree (state_id);


--
-- Name: index_companies_on_user_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_companies_on_user_id ON public.companies USING btree (user_id);


--
-- Name: index_departments_on_branch_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_departments_on_branch_id ON public.departments USING btree (branch_id);


--
-- Name: index_entries_on_commercial_doc; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_entries_on_commercial_doc ON public.plutus_entries USING btree (commercial_document_id, commercial_document_type);


--
-- Name: index_item_files_on_item_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_item_files_on_item_id ON public.item_files USING btree (item_id);


--
-- Name: index_items_maintenances_on_item_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_maintenances_on_item_id ON public.items_maintenances USING btree (item_id);


--
-- Name: index_items_maintenances_on_maintenance_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_maintenances_on_maintenance_id ON public.items_maintenances USING btree (maintenance_id);


--
-- Name: index_items_on_brake_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_brake_type_id ON public.items USING btree (brake_type_id);


--
-- Name: index_items_on_branch_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_branch_id ON public.items USING btree (branch_id);


--
-- Name: index_items_on_brand_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_brand_id ON public.items USING btree (brand_id);


--
-- Name: index_items_on_capacity_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_capacity_id ON public.items USING btree (capacity_id);


--
-- Name: index_items_on_category_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_category_id ON public.items USING btree (category_id);


--
-- Name: index_items_on_client_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_client_id ON public.items USING btree (client_id);


--
-- Name: index_items_on_color_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_color_id ON public.items USING btree (color_id);


--
-- Name: index_items_on_department_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_department_id ON public.items USING btree (department_id);


--
-- Name: index_items_on_divition_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_divition_type_id ON public.items USING btree (divition_type_id);


--
-- Name: index_items_on_fender_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_fender_type_id ON public.items USING btree (fender_type_id);


--
-- Name: index_items_on_fiscal_voucher_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_fiscal_voucher_id ON public.items USING btree (fiscal_voucher_id);


--
-- Name: index_items_on_floor_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_floor_type_id ON public.items USING btree (floor_type_id);


--
-- Name: index_items_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_hydraulic_jack_id ON public.items USING btree (hydraulic_jack_id);


--
-- Name: index_items_on_provider_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_provider_id ON public.items USING btree (provider_id);


--
-- Name: index_items_on_pull_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_pull_type_id ON public.items USING btree (pull_type_id);


--
-- Name: index_items_on_ramp_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_ramp_type_id ON public.items USING btree (ramp_type_id);


--
-- Name: index_items_on_redila_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_redila_type_id ON public.items USING btree (redila_type_id);


--
-- Name: index_items_on_reinforcement_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_reinforcement_type_id ON public.items USING btree (reinforcement_type_id);


--
-- Name: index_items_on_roof_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_roof_type_id ON public.items USING btree (roof_type_id);


--
-- Name: index_items_on_status_item_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_status_item_id ON public.items USING btree (status_item_id);


--
-- Name: index_items_on_status_shipping_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_status_shipping_id ON public.items USING btree (status_shipping_id);


--
-- Name: index_items_on_sub_category_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_sub_category_id ON public.items USING btree (sub_category_id);


--
-- Name: index_items_on_suspension_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_suspension_type_id ON public.items USING btree (suspension_type_id);


--
-- Name: index_items_on_trailer_height_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_trailer_height_id ON public.items USING btree (trailer_height_id);


--
-- Name: index_items_on_trailer_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_trailer_id ON public.items USING btree (trailer_id);


--
-- Name: index_items_on_trailer_length_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_trailer_length_id ON public.items USING btree (trailer_length_id);


--
-- Name: index_items_on_trailer_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_trailer_type_id ON public.items USING btree (trailer_type_id);


--
-- Name: index_items_on_trailer_width_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_trailer_width_id ON public.items USING btree (trailer_width_id);


--
-- Name: index_items_on_turn_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_turn_type_id ON public.items USING btree (turn_type_id);


--
-- Name: index_items_on_user_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_items_on_user_id ON public.items USING btree (user_id);


--
-- Name: index_offices_on_department_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_offices_on_department_id ON public.offices USING btree (department_id);


--
-- Name: index_offices_on_user_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_offices_on_user_id ON public.offices USING btree (user_id);


--
-- Name: index_permission_roles_on_permission_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_permission_roles_on_permission_id ON public.permission_roles USING btree (permission_id);


--
-- Name: index_permission_roles_on_role_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_permission_roles_on_role_id ON public.permission_roles USING btree (role_id);


--
-- Name: index_plutus_accounts_on_name_and_type; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_plutus_accounts_on_name_and_type ON public.plutus_accounts USING btree (name, type);


--
-- Name: index_plutus_amounts_on_account_id_and_entry_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_plutus_amounts_on_account_id_and_entry_id ON public.plutus_amounts USING btree (account_id, entry_id);


--
-- Name: index_plutus_amounts_on_entry_id_and_account_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_plutus_amounts_on_entry_id_and_account_id ON public.plutus_amounts USING btree (entry_id, account_id);


--
-- Name: index_plutus_amounts_on_type; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_plutus_amounts_on_type ON public.plutus_amounts USING btree (type);


--
-- Name: index_plutus_entries_on_date; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_plutus_entries_on_date ON public.plutus_entries USING btree (date);


--
-- Name: index_quotations_on_brake_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_brake_type_id ON public.quotations USING btree (brake_type_id);


--
-- Name: index_quotations_on_branch_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_branch_id ON public.quotations USING btree (branch_id);


--
-- Name: index_quotations_on_brand_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_brand_id ON public.quotations USING btree (brand_id);


--
-- Name: index_quotations_on_capacity_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_capacity_id ON public.quotations USING btree (capacity_id);


--
-- Name: index_quotations_on_client_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_client_id ON public.quotations USING btree (client_id);


--
-- Name: index_quotations_on_color_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_color_id ON public.quotations USING btree (color_id);


--
-- Name: index_quotations_on_department_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_department_id ON public.quotations USING btree (department_id);


--
-- Name: index_quotations_on_divition_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_divition_type_id ON public.quotations USING btree (divition_type_id);


--
-- Name: index_quotations_on_fender_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_fender_type_id ON public.quotations USING btree (fender_type_id);


--
-- Name: index_quotations_on_floor_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_floor_type_id ON public.quotations USING btree (floor_type_id);


--
-- Name: index_quotations_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_hydraulic_jack_id ON public.quotations USING btree (hydraulic_jack_id);


--
-- Name: index_quotations_on_pull_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_pull_type_id ON public.quotations USING btree (pull_type_id);


--
-- Name: index_quotations_on_ramp_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_ramp_type_id ON public.quotations USING btree (ramp_type_id);


--
-- Name: index_quotations_on_redila_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_redila_type_id ON public.quotations USING btree (redila_type_id);


--
-- Name: index_quotations_on_roof_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_roof_type_id ON public.quotations USING btree (roof_type_id);


--
-- Name: index_quotations_on_suspension_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_suspension_type_id ON public.quotations USING btree (suspension_type_id);


--
-- Name: index_quotations_on_trailer_length_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_trailer_length_id ON public.quotations USING btree (trailer_length_id);


--
-- Name: index_quotations_on_trailer_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_trailer_type_id ON public.quotations USING btree (trailer_type_id);


--
-- Name: index_quotations_on_trailer_width_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_trailer_width_id ON public.quotations USING btree (trailer_width_id);


--
-- Name: index_quotations_on_turn_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_turn_type_id ON public.quotations USING btree (turn_type_id);


--
-- Name: index_quotations_on_user_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_quotations_on_user_id ON public.quotations USING btree (user_id);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_states_on_country_id ON public.states USING btree (country_id);


--
-- Name: index_sub_categories_on_category_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_sub_categories_on_category_id ON public.sub_categories USING btree (category_id);


--
-- Name: index_trailer_categories_on_brake_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_brake_type_id ON public.trailer_categories USING btree (brake_type_id);


--
-- Name: index_trailer_categories_on_brand_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_brand_id ON public.trailer_categories USING btree (brand_id);


--
-- Name: index_trailer_categories_on_capacity_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_capacity_id ON public.trailer_categories USING btree (capacity_id);


--
-- Name: index_trailer_categories_on_color_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_color_id ON public.trailer_categories USING btree (color_id);


--
-- Name: index_trailer_categories_on_divition_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_divition_type_id ON public.trailer_categories USING btree (divition_type_id);


--
-- Name: index_trailer_categories_on_fender_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_fender_type_id ON public.trailer_categories USING btree (fender_type_id);


--
-- Name: index_trailer_categories_on_floor_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_floor_type_id ON public.trailer_categories USING btree (floor_type_id);


--
-- Name: index_trailer_categories_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_hydraulic_jack_id ON public.trailer_categories USING btree (hydraulic_jack_id);


--
-- Name: index_trailer_categories_on_pull_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_pull_type_id ON public.trailer_categories USING btree (pull_type_id);


--
-- Name: index_trailer_categories_on_ramp_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_ramp_type_id ON public.trailer_categories USING btree (ramp_type_id);


--
-- Name: index_trailer_categories_on_redila_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_redila_type_id ON public.trailer_categories USING btree (redila_type_id);


--
-- Name: index_trailer_categories_on_reinforcement_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_reinforcement_type_id ON public.trailer_categories USING btree (reinforcement_type_id);


--
-- Name: index_trailer_categories_on_roof_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_roof_type_id ON public.trailer_categories USING btree (roof_type_id);


--
-- Name: index_trailer_categories_on_suspension_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_suspension_type_id ON public.trailer_categories USING btree (suspension_type_id);


--
-- Name: index_trailer_categories_on_trailer_height_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_trailer_height_id ON public.trailer_categories USING btree (trailer_height_id);


--
-- Name: index_trailer_categories_on_trailer_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_trailer_id ON public.trailer_categories USING btree (trailer_id);


--
-- Name: index_trailer_categories_on_trailer_length_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_trailer_length_id ON public.trailer_categories USING btree (trailer_length_id);


--
-- Name: index_trailer_categories_on_trailer_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_trailer_type_id ON public.trailer_categories USING btree (trailer_type_id);


--
-- Name: index_trailer_categories_on_trailer_width_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_trailer_width_id ON public.trailer_categories USING btree (trailer_width_id);


--
-- Name: index_trailer_categories_on_turn_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailer_categories_on_turn_type_id ON public.trailer_categories USING btree (turn_type_id);


--
-- Name: index_trailers_on_brake_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_brake_type_id ON public.trailers USING btree (brake_type_id);


--
-- Name: index_trailers_on_brand_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_brand_id ON public.trailers USING btree (brand_id);


--
-- Name: index_trailers_on_capacity_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_capacity_id ON public.trailers USING btree (capacity_id);


--
-- Name: index_trailers_on_category_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_category_id ON public.trailers USING btree (category_id);


--
-- Name: index_trailers_on_color_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_color_id ON public.trailers USING btree (color_id);


--
-- Name: index_trailers_on_divition_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_divition_type_id ON public.trailers USING btree (divition_type_id);


--
-- Name: index_trailers_on_fender_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_fender_type_id ON public.trailers USING btree (fender_type_id);


--
-- Name: index_trailers_on_floor_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_floor_type_id ON public.trailers USING btree (floor_type_id);


--
-- Name: index_trailers_on_hydraulic_jack_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_hydraulic_jack_id ON public.trailers USING btree (hydraulic_jack_id);


--
-- Name: index_trailers_on_pull_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_pull_type_id ON public.trailers USING btree (pull_type_id);


--
-- Name: index_trailers_on_ramp_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_ramp_type_id ON public.trailers USING btree (ramp_type_id);


--
-- Name: index_trailers_on_redila_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_redila_type_id ON public.trailers USING btree (redila_type_id);


--
-- Name: index_trailers_on_reinforcement_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_reinforcement_type_id ON public.trailers USING btree (reinforcement_type_id);


--
-- Name: index_trailers_on_roof_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_roof_type_id ON public.trailers USING btree (roof_type_id);


--
-- Name: index_trailers_on_sub_category_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_sub_category_id ON public.trailers USING btree (sub_category_id);


--
-- Name: index_trailers_on_suspension_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_suspension_type_id ON public.trailers USING btree (suspension_type_id);


--
-- Name: index_trailers_on_trailer_height_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_trailer_height_id ON public.trailers USING btree (trailer_height_id);


--
-- Name: index_trailers_on_trailer_length_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_trailer_length_id ON public.trailers USING btree (trailer_length_id);


--
-- Name: index_trailers_on_trailer_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_trailer_type_id ON public.trailers USING btree (trailer_type_id);


--
-- Name: index_trailers_on_trailer_width_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_trailer_width_id ON public.trailers USING btree (trailer_width_id);


--
-- Name: index_trailers_on_turn_type_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_trailers_on_turn_type_id ON public.trailers USING btree (turn_type_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: mac
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_department_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_users_on_department_id ON public.users USING btree (department_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: mac
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: mac
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_users_on_role_id ON public.users USING btree (role_id);


--
-- Name: index_users_work_articles_on_user_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_users_work_articles_on_user_id ON public.users_work_articles USING btree (user_id);


--
-- Name: index_users_work_articles_on_work_article_id; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX index_users_work_articles_on_work_article_id ON public.users_work_articles USING btree (work_article_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: mac
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: mac
--

CREATE INDEX user_index ON public.audits USING btree (user_id, user_type);


--
-- Name: trailer_categories fk_rails_00fa313820; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_00fa313820 FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: trailer_categories fk_rails_028a2abaef; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_028a2abaef FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: trailer_categories fk_rails_02ecbca6ee; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_02ecbca6ee FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: trailer_categories fk_rails_030f845d67; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_030f845d67 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: trailers fk_rails_083bf5fdf9; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_083bf5fdf9 FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: trailers fk_rails_0aed5eedc3; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_0aed5eedc3 FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: trailers fk_rails_15ab1330d4; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_15ab1330d4 FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: items fk_rails_1a336e3afc; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_1a336e3afc FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: quotations fk_rails_24ffc65c4f; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_24ffc65c4f FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: items fk_rails_251c3680fb; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_251c3680fb FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: quotations fk_rails_262f362616; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_262f362616 FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: items fk_rails_2704df0fea; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_2704df0fea FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: items fk_rails_28485f6c22; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_28485f6c22 FOREIGN KEY (status_item_id) REFERENCES public.status_items(id);


--
-- Name: items fk_rails_29e5de7d1e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_29e5de7d1e FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: quotations fk_rails_2a2e26fe19; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_2a2e26fe19 FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: trailer_categories fk_rails_2b09112e1e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_2b09112e1e FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: trailers fk_rails_3034dac85c; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_3034dac85c FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: users_work_articles fk_rails_3167acd9a5; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users_work_articles
    ADD CONSTRAINT fk_rails_3167acd9a5 FOREIGN KEY (work_article_id) REFERENCES public.work_articles(id);


--
-- Name: trailer_categories fk_rails_32022af0b0; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_32022af0b0 FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: quotations fk_rails_34ba49db94; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_34ba49db94 FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: items fk_rails_3566f10a5e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_3566f10a5e FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: items fk_rails_36708b3aa6; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_36708b3aa6 FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: trailer_categories fk_rails_39e8763a2a; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_39e8763a2a FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: trailer_categories fk_rails_3a0f925a3c; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_3a0f925a3c FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: quotations fk_rails_3b97237386; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_3b97237386 FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: states fk_rails_40bd891262; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT fk_rails_40bd891262 FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: quotations fk_rails_43ab7e57f0; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_43ab7e57f0 FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: items_maintenances fk_rails_45f9fe3c9e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items_maintenances
    ADD CONSTRAINT fk_rails_45f9fe3c9e FOREIGN KEY (maintenance_id) REFERENCES public.maintenances(id);


--
-- Name: items fk_rails_49ce6bf71a; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_49ce6bf71a FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: trailers fk_rails_4b90884e0d; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_4b90884e0d FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: trailers fk_rails_4bde881491; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_4bde881491 FOREIGN KEY (brake_type_id) REFERENCES public.brake_types(id);


--
-- Name: quotations fk_rails_518ff6f9ff; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_518ff6f9ff FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: quotations fk_rails_540dda8a10; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_540dda8a10 FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: items fk_rails_55332343fc; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_55332343fc FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: trailers fk_rails_56a4796802; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_56a4796802 FOREIGN KEY (trailer_length_id) REFERENCES public.trailer_lengths(id);


--
-- Name: categories fk_rails_5740af41d8; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_5740af41d8 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: trailers fk_rails_599f3450b1; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_599f3450b1 FOREIGN KEY (sub_category_id) REFERENCES public.sub_categories(id);


--
-- Name: cities fk_rails_59b5e22e07; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_rails_59b5e22e07 FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: trailer_categories fk_rails_59d10b8fec; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_59d10b8fec FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: branches fk_rails_5a8fb811d4; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT fk_rails_5a8fb811d4 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: trailer_categories fk_rails_5cd4b402a7; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_5cd4b402a7 FOREIGN KEY (trailer_id) REFERENCES public.trailers(id);


--
-- Name: quotations fk_rails_5ef9c57765; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_5ef9c57765 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: quotations fk_rails_604d26f78c; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_604d26f78c FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: trailers fk_rails_60ff0b2849; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_60ff0b2849 FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: users fk_rails_642f17018b; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_642f17018b FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: quotations fk_rails_6989b697c6; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_6989b697c6 FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: clients fk_rails_6b5e4c0738; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_rails_6b5e4c0738 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: offices fk_rails_6e2be765ac; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT fk_rails_6e2be765ac FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: items fk_rails_730732b132; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_730732b132 FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: trailer_categories fk_rails_767226c2df; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_767226c2df FOREIGN KEY (trailer_width_id) REFERENCES public.trailer_widths(id);


--
-- Name: trailers fk_rails_770d9d8e1e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_770d9d8e1e FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: items fk_rails_79ba7f193e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_79ba7f193e FOREIGN KEY (color_id) REFERENCES public.colors(id);


--
-- Name: trailers fk_rails_79f91b7254; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_79f91b7254 FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: items fk_rails_7b0a288977; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_7b0a288977 FOREIGN KEY (trailer_id) REFERENCES public.trailers(id);


--
-- Name: quotations fk_rails_7c77fa1bb1; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_7c77fa1bb1 FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: trailers fk_rails_7fe5507f47; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_7fe5507f47 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: trailer_categories fk_rails_83856f4ca8; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_83856f4ca8 FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: items fk_rails_8541a27257; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_8541a27257 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: items fk_rails_85a8d98e45; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_85a8d98e45 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: items fk_rails_89fb86dc8b; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_89fb86dc8b FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: trailers fk_rails_8a23d3261a; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_8a23d3261a FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: trailers fk_rails_8a8bacaad9; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_8a8bacaad9 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: quotations fk_rails_8d67c3604e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_8d67c3604e FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: sub_categories fk_rails_8e75c2ee78; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.sub_categories
    ADD CONSTRAINT fk_rails_8e75c2ee78 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: trailers fk_rails_8f134baecc; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_8f134baecc FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: quotations fk_rails_918af027d1; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_918af027d1 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: items fk_rails_96e3cdf491; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_96e3cdf491 FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: items fk_rails_977d67151a; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_977d67151a FOREIGN KEY (provider_id) REFERENCES public.providers(id);


--
-- Name: items fk_rails_99af3508f2; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_99af3508f2 FOREIGN KEY (trailer_height_id) REFERENCES public.trailer_heights(id);


--
-- Name: branches fk_rails_9d5c1c06e3; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT fk_rails_9d5c1c06e3 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: items fk_rails_a5aed87f6f; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_a5aed87f6f FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: trailer_categories fk_rails_a7020d2899; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_a7020d2899 FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: items fk_rails_ac5f5fa72d; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_ac5f5fa72d FOREIGN KEY (redila_type_id) REFERENCES public.redila_types(id);


--
-- Name: items fk_rails_ad375a4185; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_ad375a4185 FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: trailers fk_rails_ad8a4b5803; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_ad8a4b5803 FOREIGN KEY (turn_type_id) REFERENCES public.turn_types(id);


--
-- Name: items fk_rails_afd2de6b24; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_afd2de6b24 FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: trailer_categories fk_rails_afee5bd97a; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_afee5bd97a FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: items fk_rails_b0f0912311; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_b0f0912311 FOREIGN KEY (ramp_type_id) REFERENCES public.ramp_types(id);


--
-- Name: trailer_categories fk_rails_b142ba5cff; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_b142ba5cff FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: trailers fk_rails_bb32afb99f; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_bb32afb99f FOREIGN KEY (trailer_type_id) REFERENCES public.trailer_types(id);


--
-- Name: items fk_rails_bfc3e85c77; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_bfc3e85c77 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: items fk_rails_c49179e4ee; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_c49179e4ee FOREIGN KEY (fiscal_voucher_id) REFERENCES public.fiscal_vouchers(id);


--
-- Name: permission_roles fk_rails_c517d9a118; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.permission_roles
    ADD CONSTRAINT fk_rails_c517d9a118 FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: trailers fk_rails_c5daa4df74; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_c5daa4df74 FOREIGN KEY (trailer_height_id) REFERENCES public.trailer_heights(id);


--
-- Name: offices fk_rails_c780e4d374; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.offices
    ADD CONSTRAINT fk_rails_c780e4d374 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: trailers fk_rails_c987b70ad9; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_c987b70ad9 FOREIGN KEY (roof_type_id) REFERENCES public.roof_types(id);


--
-- Name: quotations fk_rails_cb40e11112; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_cb40e11112 FOREIGN KEY (hydraulic_jack_id) REFERENCES public.hydraulic_jacks(id);


--
-- Name: items fk_rails_cee0861031; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_cee0861031 FOREIGN KEY (status_shipping_id) REFERENCES public.status_shippings(id);


--
-- Name: items fk_rails_d17ec4f703; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_d17ec4f703 FOREIGN KEY (sub_category_id) REFERENCES public.sub_categories(id);


--
-- Name: trailer_categories fk_rails_d18ec678a2; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_d18ec678a2 FOREIGN KEY (trailer_height_id) REFERENCES public.trailer_heights(id);


--
-- Name: items fk_rails_d387046195; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_d387046195 FOREIGN KEY (reinforcement_type_id) REFERENCES public.reinforcement_types(id);


--
-- Name: items fk_rails_d4b6334db2; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_d4b6334db2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: branches fk_rails_d95f632f7d; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT fk_rails_d95f632f7d FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: trailer_categories fk_rails_d9b25efb21; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_d9b25efb21 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: quotations fk_rails_db04b903d7; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_db04b903d7 FOREIGN KEY (suspension_type_id) REFERENCES public.suspension_types(id);


--
-- Name: departments fk_rails_dd358b3f48; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_rails_dd358b3f48 FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: trailer_categories fk_rails_e0a90675d1; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_e0a90675d1 FOREIGN KEY (reinforcement_type_id) REFERENCES public.reinforcement_types(id);


--
-- Name: trailer_categories fk_rails_e1f6610438; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_e1f6610438 FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: quotations fk_rails_e4d84b692c; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_e4d84b692c FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: clients fk_rails_e51b1095c9; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_rails_e51b1095c9 FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: trailers fk_rails_e530fba61f; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_e530fba61f FOREIGN KEY (fender_type_id) REFERENCES public.fender_types(id);


--
-- Name: companies fk_rails_e57cb42012; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_e57cb42012 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: permission_roles fk_rails_e8b49f05fd; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.permission_roles
    ADD CONSTRAINT fk_rails_e8b49f05fd FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: quotations fk_rails_eb5da72e26; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_eb5da72e26 FOREIGN KEY (capacity_id) REFERENCES public.capacities(id);


--
-- Name: trailer_categories fk_rails_eb75ce6ec6; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailer_categories
    ADD CONSTRAINT fk_rails_eb75ce6ec6 FOREIGN KEY (divition_type_id) REFERENCES public.divition_types(id);


--
-- Name: item_files fk_rails_f049e03d8e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.item_files
    ADD CONSTRAINT fk_rails_f049e03d8e FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: users fk_rails_f29bf9cdf2; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_f29bf9cdf2 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: quotations fk_rails_f32f4ba97e; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_f32f4ba97e FOREIGN KEY (floor_type_id) REFERENCES public.floor_types(id);


--
-- Name: quotations fk_rails_f63036eec2; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_f63036eec2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_work_articles fk_rails_fbecc6c009; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.users_work_articles
    ADD CONSTRAINT fk_rails_fbecc6c009 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: items_maintenances fk_rails_fd3237a03d; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items_maintenances
    ADD CONSTRAINT fk_rails_fd3237a03d FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: quotations fk_rails_fe0f05c203; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.quotations
    ADD CONSTRAINT fk_rails_fe0f05c203 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: items fk_rails_ffc2aef5fc; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_ffc2aef5fc FOREIGN KEY (pull_type_id) REFERENCES public.pull_types(id);


--
-- Name: trailers fk_rails_ffe2b7c3d8; Type: FK CONSTRAINT; Schema: public; Owner: mac
--

ALTER TABLE ONLY public.trailers
    ADD CONSTRAINT fk_rails_ffe2b7c3d8 FOREIGN KEY (reinforcement_type_id) REFERENCES public.reinforcement_types(id);


--
-- PostgreSQL database dump complete
--

