--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.tempmailbox DROP CONSTRAINT fk646b4e209280dfb9;
ALTER TABLE ONLY public.dbmail_subscription DROP CONSTRAINT dbmail_subscription_user_id_fkey;
ALTER TABLE ONLY public.dbmail_subscription DROP CONSTRAINT dbmail_subscription_mailbox_id_fkey;
ALTER TABLE ONLY public.dbmail_sievescripts DROP CONSTRAINT dbmail_sievescripts_owner_idnr_fkey;
ALTER TABLE ONLY public.dbmail_referencesfield DROP CONSTRAINT dbmail_referencesfield_physmessage_id_fkey;
ALTER TABLE ONLY public.dbmail_partlists DROP CONSTRAINT dbmail_partlists_physmessage_id_fkey;
ALTER TABLE ONLY public.dbmail_partlists DROP CONSTRAINT dbmail_partlists_part_id_fkey;
ALTER TABLE ONLY public.dbmail_messages DROP CONSTRAINT dbmail_messages_physmessage_id_fkey;
ALTER TABLE ONLY public.dbmail_messages DROP CONSTRAINT dbmail_messages_mailbox_idnr_fkey;
ALTER TABLE ONLY public.dbmail_messageblks DROP CONSTRAINT dbmail_messageblks_physmessage_id_fkey;
ALTER TABLE ONLY public.dbmail_mailboxes DROP CONSTRAINT dbmail_mailboxes_owner_idnr_fkey;
ALTER TABLE ONLY public.dbmail_keywords DROP CONSTRAINT dbmail_keywords_fkey;
ALTER TABLE ONLY public.dbmail_header DROP CONSTRAINT dbmail_header_physmessage_id_fkey;
ALTER TABLE ONLY public.dbmail_header DROP CONSTRAINT dbmail_header_headervalue_id_fkey;
ALTER TABLE ONLY public.dbmail_header DROP CONSTRAINT dbmail_header_headername_id_fkey;
ALTER TABLE ONLY public.dbmail_filters DROP CONSTRAINT dbmail_filters_user_id_fkey;
ALTER TABLE ONLY public.dbmail_envelope DROP CONSTRAINT dbmail_envelope_physmessage_id_fkey;
ALTER TABLE ONLY public.dbmail_auto_replies DROP CONSTRAINT dbmail_auto_replies_user_idnr_fkey;
ALTER TABLE ONLY public.dbmail_auto_notifications DROP CONSTRAINT dbmail_auto_notifications_user_idnr_fkey;
ALTER TABLE ONLY public.dbmail_acl DROP CONSTRAINT dbmail_acl_user_id_fkey;
ALTER TABLE ONLY public.dbmail_acl DROP CONSTRAINT dbmail_acl_mailbox_id_fkey;
DROP INDEX public.usermap_idx_1;
DROP INDEX public.replycache_1;
DROP INDEX public.message_parts;
DROP INDEX public.dbmail_users_name_idx;
DROP INDEX public.dbmail_users_2;
DROP INDEX public.dbmail_sievescripts_2;
DROP INDEX public.dbmail_sievescripts_1;
DROP INDEX public.dbmail_referencesfield_1;
DROP INDEX public.dbmail_partlists_2;
DROP INDEX public.dbmail_partlists_1;
DROP INDEX public.dbmail_mimeparts_1;
DROP INDEX public.dbmail_messages_8;
DROP INDEX public.dbmail_messages_7;
DROP INDEX public.dbmail_messages_6;
DROP INDEX public.dbmail_messages_5;
DROP INDEX public.dbmail_messages_4;
DROP INDEX public.dbmail_messages_3;
DROP INDEX public.dbmail_messages_2;
DROP INDEX public.dbmail_messages_1;
DROP INDEX public.dbmail_messageblks_physmessage_is_header_idx;
DROP INDEX public.dbmail_messageblks_physmessage_idx;
DROP INDEX public.dbmail_mailboxes_seq;
DROP INDEX public.dbmail_mailboxes_owner_name_idx;
DROP INDEX public.dbmail_mailboxes_owner_idx;
DROP INDEX public.dbmail_mailboxes_name_idx;
DROP INDEX public.dbmail_idx_since;
DROP INDEX public.dbmail_idx_ipnumber;
DROP INDEX public.dbmail_headervalue_3;
DROP INDEX public.dbmail_headervalue_2;
DROP INDEX public.dbmail_headervalue_1;
DROP INDEX public.dbmail_headername_1;
DROP INDEX public.dbmail_header_physmessage_id_key;
DROP INDEX public.dbmail_header_headervalue_id_key;
DROP INDEX public.dbmail_header_headername_id_key;
DROP INDEX public.dbmail_envelope_2;
DROP INDEX public.dbmail_envelope_1;
DROP INDEX public.dbmail_aliases_alias_low_idx;
DROP INDEX public.dbmail_aliases_alias_idx;
ALTER TABLE ONLY public.tempmailbox DROP CONSTRAINT tempmailbox_pkey;
ALTER TABLE ONLY public.dbmail_users DROP CONSTRAINT dbmail_users_pkey;
ALTER TABLE ONLY public.dbmail_subscription DROP CONSTRAINT dbmail_subscription_pkey;
ALTER TABLE ONLY public.dbmail_sievescripts DROP CONSTRAINT dbmail_sievescripts_pkey;
ALTER TABLE ONLY public.dbmail_referencesfield DROP CONSTRAINT dbmail_referencesfield_pkey;
ALTER TABLE ONLY public.dbmail_physmessage DROP CONSTRAINT dbmail_physmessage_pkey;
ALTER TABLE ONLY public.dbmail_pbsp DROP CONSTRAINT dbmail_pbsp_pkey;
ALTER TABLE ONLY public.dbmail_mimeparts DROP CONSTRAINT dbmail_mimeparts_pkey;
ALTER TABLE ONLY public.dbmail_messages DROP CONSTRAINT dbmail_messages_pkey;
ALTER TABLE ONLY public.dbmail_messageblks DROP CONSTRAINT dbmail_messageblks_pkey;
ALTER TABLE ONLY public.dbmail_mailboxes DROP CONSTRAINT dbmail_mailboxes_pkey;
ALTER TABLE ONLY public.dbmail_keywords DROP CONSTRAINT dbmail_keywords_pkey;
ALTER TABLE ONLY public.dbmail_headervalue DROP CONSTRAINT dbmail_headervalue_pkey;
ALTER TABLE ONLY public.dbmail_headername DROP CONSTRAINT dbmail_headername_pkey;
ALTER TABLE ONLY public.dbmail_header DROP CONSTRAINT dbmail_header_pkey;
ALTER TABLE ONLY public.dbmail_filters DROP CONSTRAINT dbmail_filters_pkey;
ALTER TABLE ONLY public.dbmail_envelope DROP CONSTRAINT dbmail_envelope_pkey;
ALTER TABLE ONLY public.dbmail_auto_replies DROP CONSTRAINT dbmail_auto_replies_pkey;
ALTER TABLE ONLY public.dbmail_auto_notifications DROP CONSTRAINT dbmail_auto_notifications_pkey;
ALTER TABLE ONLY public.dbmail_aliases DROP CONSTRAINT dbmail_aliases_pkey;
ALTER TABLE ONLY public.dbmail_acl DROP CONSTRAINT dbmail_acl_pkey;
DROP TABLE public.tempmailbox;
DROP TABLE public.dbmail_users;
DROP TABLE public.dbmail_usermap;
DROP SEQUENCE public.dbmail_user_idnr_seq;
DROP VIEW public.dbmail_tofield;
DROP TABLE public.dbmail_subscription;
DROP VIEW public.dbmail_subjectfield;
DROP TABLE public.dbmail_sievescripts;
DROP SEQUENCE public.dbmail_sievescripts_idnr_seq;
DROP TABLE public.dbmail_replycache;
DROP TABLE public.dbmail_referencesfield;
DROP SEQUENCE public.dbmail_referencesfield_idnr_seq;
DROP TABLE public.dbmail_physmessage;
DROP SEQUENCE public.dbmail_physmessage_id_seq;
DROP TABLE public.dbmail_pbsp;
DROP SEQUENCE public.dbmail_seq_pbsp_id;
DROP TABLE public.dbmail_partlists;
DROP TABLE public.dbmail_mimeparts;
DROP SEQUENCE public.dbmail_mimeparts_id_seq;
DROP TABLE public.dbmail_messageblks;
DROP SEQUENCE public.dbmail_messageblk_idnr_seq;
DROP TABLE public.dbmail_mailboxes;
DROP SEQUENCE public.dbmail_mailbox_idnr_seq;
DROP TABLE public.dbmail_keywords;
DROP VIEW public.dbmail_fromfield;
DROP TABLE public.dbmail_filters;
DROP SEQUENCE public.dbmail_filters_id_seq;
DROP TABLE public.dbmail_envelope;
DROP SEQUENCE public.dbmail_envelope_idnr_seq;
DROP VIEW public.dbmail_datefield;
DROP VIEW public.dbmail_ccfield;
DROP TABLE public.dbmail_messages;
DROP SEQUENCE public.dbmail_message_idnr_seq;
DROP TABLE public.dbmail_headervalue;
DROP SEQUENCE public.dbmail_headervalue_id_seq;
DROP TABLE public.dbmail_headername;
DROP SEQUENCE public.dbmail_headername_id_seq;
DROP TABLE public.dbmail_header;
DROP TABLE public.dbmail_auto_replies;
DROP TABLE public.dbmail_auto_notifications;
DROP TABLE public.dbmail_authlog;
DROP SEQUENCE public.dbmail_authlog_id_seq;
DROP TABLE public.dbmail_aliases;
DROP SEQUENCE public.dbmail_alias_idnr_seq;
DROP TABLE public.dbmail_acl;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dbmail_acl; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_acl (
    user_id bigint NOT NULL,
    mailbox_id bigint NOT NULL,
    lookup_flag smallint DEFAULT (0)::smallint NOT NULL,
    read_flag smallint DEFAULT (0)::smallint NOT NULL,
    seen_flag smallint DEFAULT (0)::smallint NOT NULL,
    write_flag smallint DEFAULT (0)::smallint NOT NULL,
    insert_flag smallint DEFAULT (0)::smallint NOT NULL,
    post_flag smallint DEFAULT (0)::smallint NOT NULL,
    create_flag smallint DEFAULT (0)::smallint NOT NULL,
    delete_flag smallint DEFAULT (0)::smallint NOT NULL,
    deleted_flag smallint DEFAULT (0)::smallint NOT NULL,
    expunge_flag smallint DEFAULT (0)::smallint NOT NULL,
    administer_flag smallint DEFAULT (0)::smallint NOT NULL
);


ALTER TABLE public.dbmail_acl OWNER TO dbmail;

--
-- Name: dbmail_alias_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_alias_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_alias_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_aliases; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_aliases (
    alias_idnr bigint DEFAULT nextval('dbmail_alias_idnr_seq'::regclass) NOT NULL,
    alias character varying(100) NOT NULL,
    deliver_to character varying(250) NOT NULL,
    client_idnr bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.dbmail_aliases OWNER TO dbmail;

--
-- Name: dbmail_authlog_id_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_authlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_authlog_id_seq OWNER TO dbmail;

--
-- Name: dbmail_authlog; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_authlog (
    id bigint DEFAULT nextval('dbmail_authlog_id_seq'::regclass),
    userid character varying(100),
    service character varying(32),
    login_time timestamp without time zone,
    logout_time timestamp without time zone,
    src_ip character varying(16),
    src_port bigint,
    dst_ip character varying(16),
    dst_port bigint,
    status character varying(32) DEFAULT 'active'::character varying,
    bytes_rx bigint DEFAULT (0)::bigint NOT NULL,
    bytes_tx bigint DEFAULT (0)::bigint NOT NULL
);


ALTER TABLE public.dbmail_authlog OWNER TO dbmail;

--
-- Name: dbmail_auto_notifications; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_auto_notifications (
    user_idnr bigint NOT NULL,
    notify_address character varying(100)
);


ALTER TABLE public.dbmail_auto_notifications OWNER TO dbmail;

--
-- Name: dbmail_auto_replies; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_auto_replies (
    user_idnr bigint NOT NULL,
    start_date timestamp without time zone NOT NULL,
    stop_date timestamp without time zone NOT NULL,
    reply_body text
);


ALTER TABLE public.dbmail_auto_replies OWNER TO dbmail;

--
-- Name: dbmail_header; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_header (
    physmessage_id bigint NOT NULL,
    headername_id bigint NOT NULL,
    headervalue_id bigint NOT NULL
);


ALTER TABLE public.dbmail_header OWNER TO dbmail;

--
-- Name: dbmail_headername_id_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_headername_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_headername_id_seq OWNER TO dbmail;

--
-- Name: dbmail_headername; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_headername (
    id bigint DEFAULT nextval('dbmail_headername_id_seq'::regclass) NOT NULL,
    headername character varying(100) DEFAULT 'BROKEN_HEADER'::character varying NOT NULL
);


ALTER TABLE public.dbmail_headername OWNER TO dbmail;

--
-- Name: dbmail_headervalue_id_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_headervalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_headervalue_id_seq OWNER TO dbmail;

--
-- Name: dbmail_headervalue; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_headervalue (
    id bigint DEFAULT nextval('dbmail_headervalue_id_seq'::regclass) NOT NULL,
    hash character varying(256) NOT NULL,
    headervalue text DEFAULT ''::text NOT NULL,
    sortfield character varying(255) DEFAULT NULL::character varying,
    datefield timestamp without time zone
);


ALTER TABLE public.dbmail_headervalue OWNER TO dbmail;

--
-- Name: dbmail_message_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_message_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_message_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_messages; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_messages (
    message_idnr bigint DEFAULT nextval('dbmail_message_idnr_seq'::regclass) NOT NULL,
    mailbox_idnr bigint,
    physmessage_id bigint,
    seen_flag smallint DEFAULT (0)::smallint NOT NULL,
    answered_flag smallint DEFAULT (0)::smallint NOT NULL,
    deleted_flag smallint DEFAULT (0)::smallint NOT NULL,
    flagged_flag smallint DEFAULT (0)::smallint NOT NULL,
    recent_flag smallint DEFAULT (0)::smallint NOT NULL,
    draft_flag smallint DEFAULT (0)::smallint NOT NULL,
    unique_id character varying(70) NOT NULL,
    status smallint DEFAULT (0)::smallint NOT NULL
);


ALTER TABLE public.dbmail_messages OWNER TO dbmail;

--
-- Name: dbmail_ccfield; Type: VIEW; Schema: public; Owner: dbmail
--

CREATE VIEW dbmail_ccfield AS
 SELECT m.physmessage_id,
    v.sortfield AS ccfield
   FROM (((dbmail_messages m
   JOIN dbmail_header h USING (physmessage_id))
   JOIN dbmail_headername n ON ((h.headername_id = n.id)))
   JOIN dbmail_headervalue v ON ((h.headervalue_id = v.id)))
  WHERE ((n.headername)::text = 'cc'::text);


ALTER TABLE public.dbmail_ccfield OWNER TO dbmail;

--
-- Name: dbmail_datefield; Type: VIEW; Schema: public; Owner: dbmail
--

CREATE VIEW dbmail_datefield AS
 SELECT m.physmessage_id,
    v.datefield,
    v.sortfield
   FROM (((dbmail_messages m
   JOIN dbmail_header h USING (physmessage_id))
   JOIN dbmail_headername n ON ((h.headername_id = n.id)))
   JOIN dbmail_headervalue v ON ((h.headervalue_id = v.id)))
  WHERE ((n.headername)::text = 'date'::text);


ALTER TABLE public.dbmail_datefield OWNER TO dbmail;

--
-- Name: dbmail_envelope_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_envelope_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_envelope_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_envelope; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_envelope (
    physmessage_id bigint NOT NULL,
    id bigint DEFAULT nextval('dbmail_envelope_idnr_seq'::regclass) NOT NULL,
    envelope text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.dbmail_envelope OWNER TO dbmail;

--
-- Name: dbmail_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_filters_id_seq OWNER TO dbmail;

--
-- Name: dbmail_filters; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_filters (
    user_id bigint NOT NULL,
    id bigint DEFAULT nextval('dbmail_filters_id_seq'::regclass) NOT NULL,
    headername character varying(128) NOT NULL,
    headervalue character varying(255) NOT NULL,
    mailbox character varying(100) NOT NULL
);


ALTER TABLE public.dbmail_filters OWNER TO dbmail;

--
-- Name: dbmail_fromfield; Type: VIEW; Schema: public; Owner: dbmail
--

CREATE VIEW dbmail_fromfield AS
 SELECT m.physmessage_id,
    v.sortfield AS fromfield
   FROM (((dbmail_messages m
   JOIN dbmail_header h USING (physmessage_id))
   JOIN dbmail_headername n ON ((h.headername_id = n.id)))
   JOIN dbmail_headervalue v ON ((h.headervalue_id = v.id)))
  WHERE ((n.headername)::text = 'from'::text);


ALTER TABLE public.dbmail_fromfield OWNER TO dbmail;

--
-- Name: dbmail_keywords; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_keywords (
    message_idnr bigint NOT NULL,
    keyword character varying(64) NOT NULL
);


ALTER TABLE public.dbmail_keywords OWNER TO dbmail;

--
-- Name: dbmail_mailbox_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_mailbox_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_mailbox_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_mailboxes; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_mailboxes (
    mailbox_idnr bigint DEFAULT nextval('dbmail_mailbox_idnr_seq'::regclass) NOT NULL,
    owner_idnr bigint,
    name character varying(255) NOT NULL,
    seen_flag smallint DEFAULT (0)::smallint NOT NULL,
    answered_flag smallint DEFAULT (0)::smallint NOT NULL,
    deleted_flag smallint DEFAULT (0)::smallint NOT NULL,
    flagged_flag smallint DEFAULT (0)::smallint NOT NULL,
    recent_flag smallint DEFAULT (0)::smallint NOT NULL,
    draft_flag smallint DEFAULT (0)::smallint NOT NULL,
    no_inferiors smallint DEFAULT (0)::smallint NOT NULL,
    no_select smallint DEFAULT (0)::smallint NOT NULL,
    permission smallint DEFAULT (2)::smallint NOT NULL,
    seq bigint DEFAULT (0)::bigint NOT NULL,
    mailboxtype character varying(255)
);


ALTER TABLE public.dbmail_mailboxes OWNER TO dbmail;

--
-- Name: dbmail_messageblk_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_messageblk_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_messageblk_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_messageblks; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_messageblks (
    messageblk_idnr bigint DEFAULT nextval('dbmail_messageblk_idnr_seq'::regclass) NOT NULL,
    physmessage_id bigint,
    messageblk bytea NOT NULL,
    blocksize bigint DEFAULT (0)::bigint NOT NULL,
    is_header smallint DEFAULT (0)::smallint NOT NULL
);


ALTER TABLE public.dbmail_messageblks OWNER TO dbmail;

--
-- Name: dbmail_mimeparts_id_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_mimeparts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_mimeparts_id_seq OWNER TO dbmail;

--
-- Name: dbmail_mimeparts; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_mimeparts (
    id bigint DEFAULT nextval('dbmail_mimeparts_id_seq'::regclass) NOT NULL,
    hash character(256) NOT NULL,
    data bytea NOT NULL,
    size bigint NOT NULL
);


ALTER TABLE public.dbmail_mimeparts OWNER TO dbmail;

--
-- Name: dbmail_partlists; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_partlists (
    physmessage_id bigint NOT NULL,
    is_header smallint DEFAULT (0)::smallint NOT NULL,
    part_key integer DEFAULT 0 NOT NULL,
    part_depth integer DEFAULT 0 NOT NULL,
    part_order integer DEFAULT 0 NOT NULL,
    part_id bigint NOT NULL
);


ALTER TABLE public.dbmail_partlists OWNER TO dbmail;

--
-- Name: dbmail_seq_pbsp_id; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_seq_pbsp_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_seq_pbsp_id OWNER TO dbmail;

--
-- Name: dbmail_pbsp; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_pbsp (
    idnr bigint DEFAULT nextval('dbmail_seq_pbsp_id'::regclass) NOT NULL,
    since timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    ipnumber inet DEFAULT '0.0.0.0'::inet NOT NULL
);


ALTER TABLE public.dbmail_pbsp OWNER TO dbmail;

--
-- Name: dbmail_physmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_physmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_physmessage_id_seq OWNER TO dbmail;

--
-- Name: dbmail_physmessage; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_physmessage (
    id bigint DEFAULT nextval('dbmail_physmessage_id_seq'::regclass) NOT NULL,
    messagesize bigint DEFAULT (0)::bigint NOT NULL,
    rfcsize bigint DEFAULT (0)::bigint NOT NULL,
    internal_date timestamp without time zone
);


ALTER TABLE public.dbmail_physmessage OWNER TO dbmail;

--
-- Name: dbmail_referencesfield_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_referencesfield_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_referencesfield_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_referencesfield; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_referencesfield (
    physmessage_id bigint NOT NULL,
    id bigint DEFAULT nextval('dbmail_referencesfield_idnr_seq'::regclass) NOT NULL,
    referencesfield character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.dbmail_referencesfield OWNER TO dbmail;

--
-- Name: dbmail_replycache; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_replycache (
    to_addr character varying(100) DEFAULT ''::character varying NOT NULL,
    from_addr character varying(100) DEFAULT ''::character varying NOT NULL,
    handle character varying(100) DEFAULT ''::character varying,
    lastseen timestamp without time zone NOT NULL
);


ALTER TABLE public.dbmail_replycache OWNER TO dbmail;

--
-- Name: dbmail_sievescripts_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_sievescripts_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_sievescripts_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_sievescripts; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_sievescripts (
    id bigint DEFAULT nextval('dbmail_sievescripts_idnr_seq'::regclass) NOT NULL,
    owner_idnr bigint NOT NULL,
    active smallint DEFAULT (0)::smallint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    script text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.dbmail_sievescripts OWNER TO dbmail;

--
-- Name: dbmail_subjectfield; Type: VIEW; Schema: public; Owner: dbmail
--

CREATE VIEW dbmail_subjectfield AS
 SELECT m.physmessage_id,
    v.headervalue AS subjectfield
   FROM (((dbmail_messages m
   JOIN dbmail_header h USING (physmessage_id))
   JOIN dbmail_headername n ON ((h.headername_id = n.id)))
   JOIN dbmail_headervalue v ON ((h.headervalue_id = v.id)))
  WHERE ((n.headername)::text = 'subject'::text);


ALTER TABLE public.dbmail_subjectfield OWNER TO dbmail;

--
-- Name: dbmail_subscription; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_subscription (
    user_id bigint NOT NULL,
    mailbox_id bigint NOT NULL
);


ALTER TABLE public.dbmail_subscription OWNER TO dbmail;

--
-- Name: dbmail_tofield; Type: VIEW; Schema: public; Owner: dbmail
--

CREATE VIEW dbmail_tofield AS
 SELECT m.physmessage_id,
    v.sortfield AS tofield
   FROM (((dbmail_messages m
   JOIN dbmail_header h USING (physmessage_id))
   JOIN dbmail_headername n ON ((h.headername_id = n.id)))
   JOIN dbmail_headervalue v ON ((h.headervalue_id = v.id)))
  WHERE ((n.headername)::text = 'to'::text);


ALTER TABLE public.dbmail_tofield OWNER TO dbmail;

--
-- Name: dbmail_user_idnr_seq; Type: SEQUENCE; Schema: public; Owner: dbmail
--

CREATE SEQUENCE dbmail_user_idnr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbmail_user_idnr_seq OWNER TO dbmail;

--
-- Name: dbmail_usermap; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_usermap (
    login character varying(100) NOT NULL,
    sock_allow character varying(100) NOT NULL,
    sock_deny character varying(100) NOT NULL,
    userid character varying(100) NOT NULL
);


ALTER TABLE public.dbmail_usermap OWNER TO dbmail;

--
-- Name: dbmail_users; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE dbmail_users (
    user_idnr bigint DEFAULT nextval('dbmail_user_idnr_seq'::regclass) NOT NULL,
    userid character varying(100) NOT NULL,
    passwd character varying(130) NOT NULL,
    client_idnr bigint DEFAULT (0)::bigint NOT NULL,
    maxmail_size bigint DEFAULT (0)::bigint NOT NULL,
    curmail_size bigint DEFAULT (0)::bigint NOT NULL,
    maxsieve_size bigint DEFAULT (0)::bigint NOT NULL,
    cursieve_size bigint DEFAULT (0)::bigint NOT NULL,
    encryption_type character varying(20) DEFAULT ''::character varying NOT NULL,
    last_login timestamp without time zone DEFAULT '1979-11-03 22:05:58'::timestamp without time zone NOT NULL
);


ALTER TABLE public.dbmail_users OWNER TO dbmail;

--
-- Name: tempmailbox; Type: TABLE; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE TABLE tempmailbox (
    creationdate timestamp without time zone,
    refreshdate timestamp without time zone,
    mailbox_idnr bigint NOT NULL
);


ALTER TABLE public.tempmailbox OWNER TO dbmail;

--
-- Data for Name: dbmail_acl; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_acl (user_id, mailbox_id, lookup_flag, read_flag, seen_flag, write_flag, insert_flag, post_flag, create_flag, delete_flag, deleted_flag, expunge_flag, administer_flag) FROM stdin;
\.


--
-- Name: dbmail_alias_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_alias_idnr_seq', 1, false);


--
-- Data for Name: dbmail_aliases; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_aliases (alias_idnr, alias, deliver_to, client_idnr) FROM stdin;
\.


--
-- Data for Name: dbmail_authlog; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_authlog (id, userid, service, login_time, logout_time, src_ip, src_port, dst_ip, dst_port, status, bytes_rx, bytes_tx) FROM stdin;
\.


--
-- Name: dbmail_authlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_authlog_id_seq', 1, false);


--
-- Data for Name: dbmail_auto_notifications; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_auto_notifications (user_idnr, notify_address) FROM stdin;
\.


--
-- Data for Name: dbmail_auto_replies; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_auto_replies (user_idnr, start_date, stop_date, reply_body) FROM stdin;
\.


--
-- Data for Name: dbmail_envelope; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_envelope (physmessage_id, id, envelope) FROM stdin;
1	1	("Fri, 07 Mar 2014 10:43:22 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140307094322.D9F12E85CB@inode-pc-03.localdomain>")
2	2	("Fri, 07 Mar 2014 11:34:11 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140307103411.A436BE85D0@inode-pc-03.localdomain>")
3	3	("Fri, 07 Mar 2014 12:43:20 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140307114320.B20D9E85E1@inode-pc-03.localdomain>")
4	4	("Fri, 14 Mar 2014 11:03:23 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "TJybX2ek" "pippopluto.com")) NIL NIL NIL "<20140314100323.29870E85E5@inode-pc-03.localdomain>")
5	5	("Tue, 18 Mar 2014 09:42:53 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318084253.D0FF3E85E7@inode-pc-03.localdomain>")
6	6	("Tue, 18 Mar 2014 09:49:18 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318084918.7D7C4E85E6@inode-pc-03.localdomain>")
7	7	("Tue, 18 Mar 2014 10:03:54 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318090354.89C6DE85E8@inode-pc-03.localdomain>")
8	8	("Tue, 18 Mar 2014 12:53:57 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318115357.AAF37E85E7@inode-pc-03.localdomain>")
9	9	("Tue, 18 Mar 2014 16:20:06 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318152006.7916CE85EA@inode-pc-03.localdomain>")
10	10	("Tue, 18 Mar 2014 16:23:32 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318152332.DCB54E85EB@inode-pc-03.localdomain>")
11	11	("Tue, 18 Mar 2014 16:34:11 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318153411.7A068E85EA@inode-pc-03.localdomain>")
12	12	("Tue, 18 Mar 2014 16:53:23 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318155323.CD492E85EB@inode-pc-03.localdomain>")
13	13	("Tue, 18 Mar 2014 16:57:48 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318155748.D0B06E85ED@inode-pc-03.localdomain>")
14	14	("Tue, 18 Mar 2014 17:03:49 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318160349.30AB4E85ED@inode-pc-03.localdomain>")
15	15	("Tue, 18 Mar 2014 17:22:43 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318162243.E76B8E85EA@inode-pc-03.localdomain>")
16	16	("Tue, 18 Mar 2014 17:24:09 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318162409.D1F41E85EB@inode-pc-03.localdomain>")
17	17	("Tue, 18 Mar 2014 17:40:51 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318164052.01ADAE85EA@inode-pc-03.localdomain>")
18	18	("Tue, 18 Mar 2014 17:50:28 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318165028.934CFE85EA@inode-pc-03.localdomain>")
19	19	("Tue, 18 Mar 2014 18:07:43 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140318170743.5D03AE85ED@inode-pc-03.localdomain>")
20	20	("Wed, 19 Mar 2014 09:51:11 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319085111.D788BE85EE@inode-pc-03.localdomain>")
21	21	("Wed, 19 Mar 2014 09:53:54 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319085354.D14B1E85EB@inode-pc-03.localdomain>")
22	22	("Wed, 19 Mar 2014 09:59:11 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319085911.8DB21E85EE@inode-pc-03.localdomain>")
23	23	("Wed, 19 Mar 2014 10:01:52 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319090152.929CFE85ED@inode-pc-03.localdomain>")
24	24	("Wed, 19 Mar 2014 10:04:17 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319090417.9961AE85EB@inode-pc-03.localdomain>")
25	25	("Wed, 19 Mar 2014 10:06:12 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319090612.5E483E85EB@inode-pc-03.localdomain>")
26	26	("Wed, 19 Mar 2014 10:11:13 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319091113.8E288E85F0@inode-pc-03.localdomain>")
27	27	("Wed, 19 Mar 2014 10:13:58 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319091358.8D313E85F2@inode-pc-03.localdomain>")
28	28	("Wed, 19 Mar 2014 10:14:34 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319091434.0990EE85EF@inode-pc-03.localdomain>")
29	29	("Wed, 19 Mar 2014 10:19:37 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319091937.6E88EE85F1@inode-pc-03.localdomain>")
30	30	("Wed, 19 Mar 2014 10:22:37 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319092237.8523DE85F1@inode-pc-03.localdomain>")
31	31	("Wed, 19 Mar 2014 10:31:49 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319093149.56CD0E85EF@inode-pc-03.localdomain>")
32	32	("Wed, 19 Mar 2014 10:36:43 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319093643.2BC06E85F1@inode-pc-03.localdomain>")
33	33	("Wed, 19 Mar 2014 10:37:45 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319093745.284B5E85F1@inode-pc-03.localdomain>")
34	34	("Wed, 19 Mar 2014 10:39:27 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319093927.4448DE85F1@inode-pc-03.localdomain>")
35	35	("Wed, 19 Mar 2014 10:44:08 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319094408.3B66CE85F2@inode-pc-03.localdomain>")
36	36	("Wed, 19 Mar 2014 10:59:54 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319095954.D8DCAE85F2@inode-pc-03.localdomain>")
37	37	("Wed, 19 Mar 2014 14:41:31 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319134131.3E572E85EF@inode-pc-03.localdomain>")
38	38	("Wed, 19 Mar 2014 14:49:33 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319134933.DC032E85EF@inode-pc-03.localdomain>")
39	39	("Wed, 19 Mar 2014 14:50:17 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319135017.541F7E85F2@inode-pc-03.localdomain>")
40	40	("Wed, 19 Mar 2014 14:52:59 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140319135259.7F61EE85EF@inode-pc-03.localdomain>")
41	41	("Wed, 19 Mar 2014 14:57:30 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140319135730.58716E85F1@inode-pc-03.localdomain>")
42	42	("Wed, 19 Mar 2014 15:01:35 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319140135.57757E85F0@inode-pc-03.localdomain>")
43	43	("Wed, 19 Mar 2014 15:05:42 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140319140542.E5C45E85F0@inode-pc-03.localdomain>")
44	44	("Wed, 19 Mar 2014 15:21:41 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140319142141.E3213E85F1@inode-pc-03.localdomain>")
45	45	("Wed, 19 Mar 2014 15:25:39 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140319142539.67906E85F1@inode-pc-03.localdomain>")
46	46	("Thu, 20 Mar 2014 11:37:18 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140320103718.61643E85F0@inode-pc-03.localdomain>")
47	47	("Thu, 20 Mar 2014 11:46:46 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140320104646.518D8E85F1@inode-pc-03.localdomain>")
48	48	("Thu, 20 Mar 2014 11:47:17 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140320104717.4C71EE85F5@inode-pc-03.localdomain>")
49	49	("Thu, 20 Mar 2014 11:30:24 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140320103024.914CCE85F2@inode-pc-03.localdomain>")
50	50	("Thu, 20 Mar 2014 11:49:27 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140320104927.2381CE85F2@inode-pc-03.localdomain>")
51	51	("Thu, 20 Mar 2014 11:50:58 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "topolino" "pippopluto.com")) NIL NIL NIL "<20140320105058.127B4E85F0@inode-pc-03.localdomain>")
52	52	("Thu, 20 Mar 2014 11:52:05 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "paperino" "pippopluto.com")) NIL NIL NIL "<20140320105205.54AC3E85F1@inode-pc-03.localdomain>")
53	53	("Thu, 20 Mar 2014 14:13:16 +0100" NIL (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) (("root" NIL "root" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140320131316.EB52CE85F2@inode-pc-03.localdomain>")
54	54	("Wed, 26 Mar 2014 10:19:14 +0100" NIL (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326091914.610F7E85F1@inode-pc-03.localdomain>")
55	55	("Wed, 26 Mar 2014 10:41:29 +0100" NIL (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326094129.51C4BE85F0@inode-pc-03.localdomain>")
56	56	("Wed, 26 Mar 2014 11:27:35 +0100" "prova mail" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326102735.82B03E85F0@inode-pc-03.localdomain>")
57	57	("Wed, 26 Mar 2014 16:27:28 +0100" "prova mail" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326152728.06DF6E85F0@inode-pc-03.localdomain>")
58	58	("Wed, 26 Mar 2014 16:41:35 +0100" "prova mail" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326154135.EC1BDE85F0@inode-pc-03.localdomain>")
59	59	("Wed, 26 Mar 2014 17:10:17 +0100" "prova mail" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326161017.B1F7AE85F2@inode-pc-03.localdomain>")
60	60	("Wed, 26 Mar 2014 17:11:17 +0100" "prova mail" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326161117.51AF4E85F3@inode-pc-03.localdomain>")
61	61	("Wed, 26 Mar 2014 17:11:59 +0100" "prova mail" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140326161159.5C9CEE85F3@inode-pc-03.localdomain>")
62	62	("Thu, 27 Mar 2014 10:08:34 +0100" "ciao pippo" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140327090834.C4F18E85F4@inode-pc-03.localdomain>")
63	63	("Thu, 27 Mar 2014 10:18:53 +0100" "ciao pippo2" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140327091853.1CD15E85F5@inode-pc-03.localdomain>")
64	64	("Fri, 28 Mar 2014 10:59:20 +0100" NIL (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140328095920.7B439E85F5@inode-pc-03.localdomain>")
65	65	("Fri, 28 Mar 2014 17:08:31 +0100" "hello pippo" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140328160831.EEB95E85F2@inode-pc-03.localdomain>")
66	66	("Fri, 28 Mar 2014 17:09:38 +0100" "ciao pippo2" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140328160938.4B228E85F5@inode-pc-03.localdomain>")
67	67	("Fri, 28 Mar 2014 17:11:48 +0100" "ciao pippo3" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140328161148.29DC3E85F5@inode-pc-03.localdomain>")
68	68	("Fri, 28 Mar 2014 17:14:51 +0100" "ciao pippo3" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140328161451.649C6E85F2@inode-pc-03.localdomain>")
69	69	("Fri, 28 Mar 2014 17:17:21 +0100" "funzioni si o no?" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140328161721.F22E7E85F4@inode-pc-03.localdomain>")
70	70	("Fri, 28 Mar 2014 17:17:45 +0100" NIL (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140328161745.4AD43E85F5@inode-pc-03.localdomain>")
71	71	("Wed, 02 Apr 2014 15:14:45 +0200" "funzioni?" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140402131445.517FFE85F4@inode-pc-03.localdomain>")
72	72	("Wed, 02 Apr 2014 15:15:06 +0200" NIL (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140402131506.0EDDBE85F6@inode-pc-03.localdomain>")
73	73	("Thu, 03 Apr 2014 14:24:29 +0200" "ultima prova ole" (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140403122429.E5AD7E85F3@inode-pc-03.localdomain>")
74	74	("Thu, 03 Apr 2014 17:17:30 +0200" NIL (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "pippo" "pippopluto.com")) NIL NIL NIL "<20140403151730.E390EE85F6@inode-pc-03.localdomain>")
75	75	("Fri, 04 Apr 2014 16:48:12 +0200" NIL (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) (("Emanuele Chiossi" NIL "echiossi" "inode-pc-03.localdomain")) ((NIL NIL "marco" "pippopluto.com")) NIL NIL NIL "<20140404144812.4D848E85F6@inode-pc-03.localdomain>")
\.


--
-- Name: dbmail_envelope_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_envelope_idnr_seq', 75, true);


--
-- Data for Name: dbmail_filters; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_filters (user_id, id, headername, headervalue, mailbox) FROM stdin;
\.


--
-- Name: dbmail_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_filters_id_seq', 1, false);


--
-- Data for Name: dbmail_header; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_header (physmessage_id, headername_id, headervalue_id) FROM stdin;
1	1	1
1	2	2
1	3	3
1	4	4
1	5	5
1	6	6
1	7	7
1	8	8
1	9	9
2	1	10
2	2	11
2	3	3
2	4	4
2	5	5
2	6	12
2	7	7
2	8	8
2	9	9
3	1	13
3	2	14
3	3	15
3	4	4
3	5	5
3	6	16
3	7	7
3	8	8
3	9	9
4	1	17
4	2	18
4	3	19
4	4	4
4	5	5
4	6	20
4	7	7
4	8	8
4	9	9
5	1	21
5	2	22
5	3	15
5	4	4
5	5	5
5	6	23
5	7	7
5	8	8
5	9	9
6	1	24
6	2	25
6	3	15
6	4	4
6	5	5
6	6	26
6	7	7
6	8	8
6	9	9
7	1	27
7	2	28
7	3	15
7	4	4
7	5	5
7	6	29
7	7	7
7	8	8
7	9	9
8	1	30
8	2	31
8	3	15
8	4	4
8	5	5
8	6	32
8	7	7
8	8	8
8	9	9
9	1	33
9	2	34
9	3	15
9	4	4
9	5	5
9	6	35
9	7	7
9	8	8
9	9	9
10	1	36
10	2	37
10	3	15
10	4	4
10	5	5
10	6	38
10	7	7
10	8	8
10	9	9
11	1	39
11	2	40
11	3	15
11	4	4
11	5	5
11	6	41
11	7	7
11	8	8
11	9	9
12	1	42
12	2	43
12	3	15
12	4	4
12	5	5
12	6	44
12	7	7
12	8	8
12	9	9
13	1	45
13	2	46
13	3	15
13	4	4
13	5	5
13	6	47
13	7	7
13	8	8
13	9	9
14	1	48
14	2	49
14	3	15
14	4	4
14	5	5
14	6	50
14	7	7
14	8	8
14	9	9
15	1	51
15	2	52
15	3	15
15	4	4
15	5	5
15	6	53
15	7	7
15	8	8
15	9	9
16	1	54
16	2	55
16	3	15
16	4	4
16	5	5
16	6	56
16	7	7
16	8	8
16	9	9
17	1	57
17	2	58
17	3	15
17	4	4
17	5	5
17	6	59
17	7	7
17	8	8
17	9	9
18	1	60
18	2	61
18	3	15
18	4	4
18	5	5
18	6	62
18	7	7
18	8	8
18	9	9
19	1	63
19	2	64
19	3	15
19	4	4
19	5	5
19	6	65
19	7	7
19	8	8
19	9	9
20	1	66
20	2	67
20	3	15
20	4	4
20	5	5
20	6	68
20	7	7
20	8	8
20	9	9
21	1	69
21	2	70
21	3	15
21	4	4
21	5	5
21	6	71
21	7	7
21	8	8
21	9	9
22	1	72
22	2	73
22	3	15
22	4	4
22	5	5
22	6	74
22	7	7
22	8	8
22	9	9
23	1	75
23	2	76
23	3	15
23	4	4
23	5	5
23	6	77
23	7	7
23	8	8
23	9	9
24	1	78
24	2	79
24	3	15
24	4	4
24	5	5
24	6	80
24	7	7
24	8	8
24	9	9
25	1	81
25	2	82
25	3	3
25	4	4
25	5	5
25	6	83
25	7	7
25	8	8
25	9	9
26	1	84
26	2	85
26	3	3
26	4	4
26	5	5
26	6	86
26	7	7
26	8	8
26	9	9
27	1	87
27	2	88
27	3	3
27	4	4
27	5	5
27	6	89
27	7	7
27	8	8
27	9	9
28	1	90
28	2	91
28	3	3
28	4	4
28	5	5
28	6	92
28	7	7
28	8	8
28	9	9
29	1	93
29	2	94
29	3	3
29	4	4
29	5	5
29	6	95
29	7	7
29	8	8
29	9	9
30	1	96
30	2	97
30	3	3
30	4	4
30	5	5
30	6	98
30	7	7
30	8	8
30	9	9
31	1	99
31	2	100
31	3	3
31	4	4
31	5	5
31	6	101
31	7	7
31	8	8
31	9	9
32	1	102
32	2	103
32	3	3
32	4	4
32	5	5
32	6	104
32	7	7
32	8	8
32	9	9
33	1	105
33	2	106
33	3	3
33	4	4
33	5	5
33	6	107
33	7	7
33	8	8
33	9	9
34	1	108
34	2	109
34	3	3
34	4	4
34	5	5
34	6	110
34	7	7
34	8	8
34	9	9
35	1	111
35	2	112
35	3	3
35	4	4
35	5	5
35	6	113
35	7	7
35	8	8
35	9	9
36	1	114
36	2	115
36	3	3
36	4	4
36	5	5
36	6	116
36	7	7
36	8	8
36	9	9
37	1	117
37	2	118
37	3	3
37	4	4
37	5	5
37	6	119
37	7	7
37	8	8
37	9	9
38	1	120
38	2	121
38	3	15
38	4	4
38	5	5
38	6	122
38	7	7
38	8	8
38	9	9
39	1	123
39	2	124
39	3	15
39	4	4
39	5	5
39	6	125
39	7	7
39	8	8
39	9	9
40	1	126
40	2	127
40	3	128
40	4	4
40	5	5
40	6	129
40	7	7
40	8	8
40	9	9
41	1	130
41	2	131
41	3	128
41	4	4
41	5	5
41	6	132
41	7	7
41	8	8
41	9	9
42	1	133
42	2	134
42	3	15
42	4	4
42	5	5
42	6	135
42	7	7
42	8	8
42	9	9
43	1	136
43	2	137
43	3	3
43	4	4
43	5	5
43	6	138
43	7	7
43	8	8
43	9	9
44	1	139
44	2	140
44	3	15
44	4	4
44	5	5
44	6	141
44	7	7
44	8	8
44	9	9
45	1	142
45	2	143
45	3	128
45	4	4
45	5	5
45	6	144
45	7	7
45	8	8
45	9	9
46	1	145
46	2	146
46	3	3
46	4	4
46	5	5
46	6	147
46	7	7
46	8	8
46	9	9
47	1	148
47	2	149
47	3	128
47	4	4
47	5	5
47	6	150
47	7	7
47	8	8
47	9	9
48	1	151
48	2	152
48	3	128
48	4	4
48	5	5
48	6	153
48	7	7
48	8	8
48	9	9
49	1	154
49	2	155
49	3	128
49	4	4
49	5	5
49	6	156
49	7	7
49	8	8
49	9	9
50	1	157
50	2	158
50	3	128
50	4	4
50	5	5
50	6	159
50	7	7
50	8	8
50	9	9
51	1	160
51	2	161
51	3	15
51	4	4
51	5	5
51	6	162
51	7	7
51	8	8
51	9	9
52	1	163
52	2	164
52	3	3
52	4	4
52	5	5
52	6	165
52	7	7
52	8	8
52	9	9
53	1	166
53	2	167
53	3	128
53	4	4
53	5	5
53	6	168
53	7	7
53	8	8
53	9	9
54	1	169
54	2	170
54	3	128
54	4	4
54	5	5
54	6	171
54	7	172
54	8	173
54	9	9
55	1	174
55	2	175
55	3	128
55	4	4
55	5	5
55	6	176
55	7	172
55	8	173
55	9	9
56	1	177
56	2	178
56	3	128
56	10	179
56	4	4
56	5	5
56	6	180
56	7	172
56	8	173
56	9	9
57	1	181
57	2	182
57	3	128
57	10	179
57	4	4
57	5	5
57	6	183
57	7	172
57	8	173
57	9	9
58	1	184
58	2	185
58	3	128
58	10	179
58	4	4
58	5	5
58	6	186
58	7	172
58	8	173
58	9	9
59	1	187
59	2	188
59	3	128
59	10	179
59	4	4
59	5	5
59	6	189
59	7	172
59	8	173
59	9	9
60	1	190
60	2	191
60	3	128
60	10	179
60	4	4
60	5	5
60	6	192
60	7	172
60	8	173
60	9	9
61	1	193
61	2	194
61	3	128
61	10	179
61	4	4
61	5	5
61	6	195
61	7	172
61	8	173
61	9	9
62	1	196
62	2	197
62	3	128
62	10	198
62	4	4
62	5	5
62	6	199
62	7	172
62	8	173
62	9	9
63	1	200
63	2	201
63	3	128
63	10	202
63	4	4
63	5	5
63	6	203
63	7	172
63	8	173
63	9	9
64	1	204
64	2	205
64	3	128
64	4	4
64	5	5
64	6	206
64	7	172
64	8	173
64	9	9
65	1	207
65	2	208
65	3	128
65	10	209
65	4	4
65	5	5
65	6	210
65	7	172
65	8	173
65	9	9
66	1	211
66	2	212
66	3	128
66	10	202
66	4	4
66	5	5
66	6	213
66	7	172
66	8	173
66	9	9
67	1	214
67	2	215
67	3	128
67	10	216
67	4	4
67	5	5
67	6	217
67	7	172
67	8	173
67	9	9
68	1	218
68	2	219
68	3	128
68	10	216
68	4	4
68	5	5
68	6	220
68	7	172
68	8	173
68	9	9
69	1	221
69	2	222
69	3	128
69	10	223
69	4	4
69	5	5
69	6	224
69	7	172
69	8	173
69	9	9
70	1	225
70	2	226
70	3	128
70	4	4
70	5	5
70	6	227
70	7	172
70	8	173
70	9	9
71	1	228
71	2	229
71	3	128
71	10	230
71	4	4
71	5	5
71	6	231
71	7	172
71	8	173
71	9	9
72	1	232
72	2	233
72	3	128
72	4	4
72	5	5
72	6	234
72	7	172
72	8	173
72	9	9
73	1	235
73	2	236
73	3	128
73	10	237
73	4	4
73	5	5
73	6	238
73	7	172
73	8	173
73	9	9
74	1	239
74	2	240
74	3	128
74	4	4
74	5	5
74	6	241
74	7	172
74	8	173
74	9	9
75	1	242
75	2	243
75	3	244
75	4	4
75	5	5
75	6	245
75	7	172
75	8	173
75	9	9
\.


--
-- Data for Name: dbmail_headername; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_headername (id, headername) FROM stdin;
1	received
2	date
3	to
4	user-agent
5	mime-version
6	message-id
7	from
8	return-path
9	content-type
10	subject
\.


--
-- Name: dbmail_headername_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_headername_id_seq', 10, true);


--
-- Data for Name: dbmail_headervalue; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_headervalue (id, hash, headervalue, sortfield, datefield) FROM stdin;
1	4919be7fc480f4875c5d5e7603872741fabf48cf	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D9F12E85CB; Fri,  7 Mar 2014 10:43:22 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D9F12E85CB; Fri,  7 Mar 2014 10:43:22 +0100 (CET)	\N
2	bcc5857a305510b91f7dd05dfc7352efefc67e6a	Fri, 07 Mar 2014 10:43:22 +0100	2014-03-07 09:43:22	2014-03-07 00:00:00
3	1b754a144ef671e8835aa621980ab4d7ede3fde2	paperino@pippopluto.com	paperino	\N
4	6463de7d2267d87e2a5a4e06b86ec8c423c9be71	Heirloom mailx 12.5 7/5/10	Heirloom mailx 12.5 7/5/10	\N
5	e8dc057d3346e56aed7cf252185dbe1fa6454411	1.0	1.0	\N
6	2d8576aa541ff5a2b96d1d337fc7ba4f9e846fb0	<20140307094322.D9F12E85CB@inode-pc-03.localdomain>	<20140307094322.D9F12E85CB@inode-pc-03.localdomain>	\N
7	3a1d4e068e90a5ed85df473c0bdc80cb4a93e5f0	root <root@inode-pc-03.localdomain>	root	\N
8	ec8bbeadfa7ebcec454cf6ee836c4e740fe74485	root@inode-pc-03.localdomain	root	\N
9	f919d9f152904f6c40db36d416df4901ff69eaa0	text/plain	text/plain	\N
10	f60e143d501645238fd8f8357b3f8c5bbff8ff5e	by inode-pc-03.localdomain (Postfix, from userid 0)\tid A436BE85D0; Fri,  7 Mar 2014 11:34:11 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid A436BE85D0; Fri,  7 Mar 2014 11:34:11 +0100 (CET)	\N
11	7f0edab79877f5830edc53b1c5379e6a136318a5	Fri, 07 Mar 2014 11:34:11 +0100	2014-03-07 10:34:11	2014-03-07 00:00:00
12	ae6c61a8b9acddf1ae21ae97556ac1c31a639ba5	<20140307103411.A436BE85D0@inode-pc-03.localdomain>	<20140307103411.A436BE85D0@inode-pc-03.localdomain>	\N
13	0cd8cd8044640b773b44568856b5f70f4ad0120a	by inode-pc-03.localdomain (Postfix, from userid 0)\tid B20D9E85E1; Fri,  7 Mar 2014 12:43:20 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid B20D9E85E1; Fri,  7 Mar 2014 12:43:20 +0100 (CET)	\N
14	255c80af33ecf0ba99d26f0e5addd74074a521af	Fri, 07 Mar 2014 12:43:20 +0100	2014-03-07 11:43:20	2014-03-07 00:00:00
15	ce6e258546fd9c10a7e6fc5858f5d36cbf5c0f36	topolino@pippopluto.com	topolino	\N
16	2e1a35818fa7a25f760c23fafa55a7d65c967b8b	<20140307114320.B20D9E85E1@inode-pc-03.localdomain>	<20140307114320.B20D9E85E1@inode-pc-03.localdomain>	\N
17	369c5e34c2980a36421eb9e856e4858028b2c11f	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 29870E85E5; Fri, 14 Mar 2014 11:03:23 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 29870E85E5; Fri, 14 Mar 2014 11:03:23 +0100 (CET)	\N
18	ae611fd46f54c41e70dd7f180a3b999255ddaf80	Fri, 14 Mar 2014 11:03:23 +0100	2014-03-14 10:03:23	2014-03-14 00:00:00
19	fe77bb3ce968201527f766bf0065d0684aca57b4	TJybX2ek@pippopluto.com	TJybX2ek	\N
20	0d185a95f57ca63927c9c01925058c107191ecd1	<20140314100323.29870E85E5@inode-pc-03.localdomain>	<20140314100323.29870E85E5@inode-pc-03.localdomain>	\N
21	bb0f05d47b6496b29541c2b6b3817a5b65f827dc	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D0FF3E85E7; Tue, 18 Mar 2014 09:42:53 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D0FF3E85E7; Tue, 18 Mar 2014 09:42:53 +0100 (CET)	\N
22	19da74006d9a37892048479212d5af82b048aa71	Tue, 18 Mar 2014 09:42:53 +0100	2014-03-18 08:42:53	2014-03-18 00:00:00
23	363182ae89f5b18466b1510f312b02e7d135e39e	<20140318084253.D0FF3E85E7@inode-pc-03.localdomain>	<20140318084253.D0FF3E85E7@inode-pc-03.localdomain>	\N
24	88b16a46030fb9bc23e50da747128b16ce9718d0	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7D7C4E85E6; Tue, 18 Mar 2014 09:49:18 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7D7C4E85E6; Tue, 18 Mar 2014 09:49:18 +0100 (CET)	\N
25	60bb34daae332e0f70382da7a333b7f6a1de5aef	Tue, 18 Mar 2014 09:49:18 +0100	2014-03-18 08:49:18	2014-03-18 00:00:00
26	c320007957f6cbafeb74aa0017cfa911115364bb	<20140318084918.7D7C4E85E6@inode-pc-03.localdomain>	<20140318084918.7D7C4E85E6@inode-pc-03.localdomain>	\N
27	6538109f6561fd8c45205a7d40a85d8d1c42b26d	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 89C6DE85E8; Tue, 18 Mar 2014 10:03:54 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 89C6DE85E8; Tue, 18 Mar 2014 10:03:54 +0100 (CET)	\N
28	259e3888f677ca2a621751fef9fc7a6833b29f9b	Tue, 18 Mar 2014 10:03:54 +0100	2014-03-18 09:03:54	2014-03-18 00:00:00
29	c6756063be1236db47176dfa57226d30ea29a980	<20140318090354.89C6DE85E8@inode-pc-03.localdomain>	<20140318090354.89C6DE85E8@inode-pc-03.localdomain>	\N
30	656d97ca7103e2582ce095bd9e6573b74aefbb78	by inode-pc-03.localdomain (Postfix, from userid 0)\tid AAF37E85E7; Tue, 18 Mar 2014 12:53:57 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid AAF37E85E7; Tue, 18 Mar 2014 12:53:57 +0100 (CET)	\N
31	71eabe8fb37ed628b657b0ee1d2bbdbf86e5c83c	Tue, 18 Mar 2014 12:53:57 +0100	2014-03-18 11:53:57	2014-03-18 00:00:00
32	1e9cfb7c9381ce7e32858a02bcd5b0a0c236be94	<20140318115357.AAF37E85E7@inode-pc-03.localdomain>	<20140318115357.AAF37E85E7@inode-pc-03.localdomain>	\N
33	ed435751bc85b07d69e5fc67e893da283bef97cb	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7916CE85EA; Tue, 18 Mar 2014 16:20:06 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7916CE85EA; Tue, 18 Mar 2014 16:20:06 +0100 (CET)	\N
34	a82a78e4616f36ed9d32e74465c1f6166c695798	Tue, 18 Mar 2014 16:20:06 +0100	2014-03-18 15:20:06	2014-03-18 00:00:00
35	2bc498f2583190c3be7211af05857e37bdf8d4d1	<20140318152006.7916CE85EA@inode-pc-03.localdomain>	<20140318152006.7916CE85EA@inode-pc-03.localdomain>	\N
36	b399ced379ff1d497749d6bfe773a0a8a39261ec	by inode-pc-03.localdomain (Postfix, from userid 0)\tid DCB54E85EB; Tue, 18 Mar 2014 16:23:32 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid DCB54E85EB; Tue, 18 Mar 2014 16:23:32 +0100 (CET)	\N
37	d14964ed8dd360750a41b4fee8954481676c52cb	Tue, 18 Mar 2014 16:23:32 +0100	2014-03-18 15:23:32	2014-03-18 00:00:00
38	435cb9843a25c527c0f615740d997920862bbb3e	<20140318152332.DCB54E85EB@inode-pc-03.localdomain>	<20140318152332.DCB54E85EB@inode-pc-03.localdomain>	\N
39	d3f78e3cd612247063fd6d9d39b0aa6ba5192f94	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7A068E85EA; Tue, 18 Mar 2014 16:34:11 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7A068E85EA; Tue, 18 Mar 2014 16:34:11 +0100 (CET)	\N
40	b6a77fbcab60c81add61df527146851a20585fd3	Tue, 18 Mar 2014 16:34:11 +0100	2014-03-18 15:34:11	2014-03-18 00:00:00
41	3bafc12e52fbdc14dd347cc004f09b9241bce369	<20140318153411.7A068E85EA@inode-pc-03.localdomain>	<20140318153411.7A068E85EA@inode-pc-03.localdomain>	\N
42	aa2841c060a12b78fc2dcde0b1b7ec5f3a448192	by inode-pc-03.localdomain (Postfix, from userid 0)\tid CD492E85EB; Tue, 18 Mar 2014 16:53:23 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid CD492E85EB; Tue, 18 Mar 2014 16:53:23 +0100 (CET)	\N
43	3f365cc5c16ff5dbb22e611ba0fe0ee04a49733c	Tue, 18 Mar 2014 16:53:23 +0100	2014-03-18 15:53:23	2014-03-18 00:00:00
44	472d41e8858a7cb2c95ddd540a3b8864b8b9dcab	<20140318155323.CD492E85EB@inode-pc-03.localdomain>	<20140318155323.CD492E85EB@inode-pc-03.localdomain>	\N
45	1c633d6418e98219c3002b2ead4311ba45c40d73	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D0B06E85ED; Tue, 18 Mar 2014 16:57:48 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D0B06E85ED; Tue, 18 Mar 2014 16:57:48 +0100 (CET)	\N
46	50f0c4aca39b1043e497075e44fa423b86a72750	Tue, 18 Mar 2014 16:57:48 +0100	2014-03-18 15:57:48	2014-03-18 00:00:00
47	8420df193e298758c07fd36c0b60a94a0ca96aca	<20140318155748.D0B06E85ED@inode-pc-03.localdomain>	<20140318155748.D0B06E85ED@inode-pc-03.localdomain>	\N
48	d6df374235690fd9efdc077d03826eb04b2b85ff	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 30AB4E85ED; Tue, 18 Mar 2014 17:03:49 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 30AB4E85ED; Tue, 18 Mar 2014 17:03:49 +0100 (CET)	\N
49	6606976018bc17754586196a4d2c213c88bc4baf	Tue, 18 Mar 2014 17:03:49 +0100	2014-03-18 16:03:49	2014-03-18 00:00:00
50	9d9efe4d908f1835e838686d8d171f07ace593ac	<20140318160349.30AB4E85ED@inode-pc-03.localdomain>	<20140318160349.30AB4E85ED@inode-pc-03.localdomain>	\N
51	911d8f0515c97db36ff7e73ad5adfebb3853d8ef	by inode-pc-03.localdomain (Postfix, from userid 0)\tid E76B8E85EA; Tue, 18 Mar 2014 17:22:43 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid E76B8E85EA; Tue, 18 Mar 2014 17:22:43 +0100 (CET)	\N
52	0b3b7b1fb0bbbc7724a6d8ce417f33b5c62d9460	Tue, 18 Mar 2014 17:22:43 +0100	2014-03-18 16:22:43	2014-03-18 00:00:00
53	cd0767db6bdb4be28790f3f2ae580c1ce5b42034	<20140318162243.E76B8E85EA@inode-pc-03.localdomain>	<20140318162243.E76B8E85EA@inode-pc-03.localdomain>	\N
54	2213f748e65a8aec394fb6f8c1f79434a6edf59f	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D1F41E85EB; Tue, 18 Mar 2014 17:24:09 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D1F41E85EB; Tue, 18 Mar 2014 17:24:09 +0100 (CET)	\N
55	c7875f8eb33d9beca702b601e1a0cb91c215d45d	Tue, 18 Mar 2014 17:24:09 +0100	2014-03-18 16:24:09	2014-03-18 00:00:00
56	eb6df28a7f70374973823eccde38b32f7ad430bb	<20140318162409.D1F41E85EB@inode-pc-03.localdomain>	<20140318162409.D1F41E85EB@inode-pc-03.localdomain>	\N
57	023d75034cece97078765cf5f428248f65fd2bb9	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 01ADAE85EA; Tue, 18 Mar 2014 17:40:51 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 01ADAE85EA; Tue, 18 Mar 2014 17:40:51 +0100 (CET)	\N
58	84108a1af6f3136eb161539a854fe92dbf9d39f0	Tue, 18 Mar 2014 17:40:51 +0100	2014-03-18 16:40:51	2014-03-18 00:00:00
59	d8ed712eea8c0556506370261da90487bc0fc12a	<20140318164052.01ADAE85EA@inode-pc-03.localdomain>	<20140318164052.01ADAE85EA@inode-pc-03.localdomain>	\N
60	08603d53a5e103e6afa91629c6bf1da330f72d05	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 934CFE85EA; Tue, 18 Mar 2014 17:50:28 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 934CFE85EA; Tue, 18 Mar 2014 17:50:28 +0100 (CET)	\N
61	8469c80368e6ed1efe774c60487e512aca70b700	Tue, 18 Mar 2014 17:50:28 +0100	2014-03-18 16:50:28	2014-03-18 00:00:00
62	be0b6c1ec4018f8b476b3323e9278c4a47170f4b	<20140318165028.934CFE85EA@inode-pc-03.localdomain>	<20140318165028.934CFE85EA@inode-pc-03.localdomain>	\N
63	5654d4440deeda188fd9e81e0c8eff67368efd60	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 5D03AE85ED; Tue, 18 Mar 2014 18:07:43 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 5D03AE85ED; Tue, 18 Mar 2014 18:07:43 +0100 (CET)	\N
64	556abf0123a8f23e0208b83553d16cbe8e845f6d	Tue, 18 Mar 2014 18:07:43 +0100	2014-03-18 17:07:43	2014-03-18 00:00:00
65	c8e5df1ea32fbe03df0bd151f573bc200a9f5008	<20140318170743.5D03AE85ED@inode-pc-03.localdomain>	<20140318170743.5D03AE85ED@inode-pc-03.localdomain>	\N
66	551d26705f06f4b7aca3e868e13652181f768e35	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D788BE85EE; Wed, 19 Mar 2014 09:51:11 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D788BE85EE; Wed, 19 Mar 2014 09:51:11 +0100 (CET)	\N
67	dc30db0bc02acd5d6c00008a8a8d305fd460f5fb	Wed, 19 Mar 2014 09:51:11 +0100	2014-03-19 08:51:11	2014-03-19 00:00:00
68	f9495b465580f1aa54c423d78d5784241d360e5f	<20140319085111.D788BE85EE@inode-pc-03.localdomain>	<20140319085111.D788BE85EE@inode-pc-03.localdomain>	\N
69	ceb418c5537cd7a439bc190d642b5024395de18f	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D14B1E85EB; Wed, 19 Mar 2014 09:53:54 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D14B1E85EB; Wed, 19 Mar 2014 09:53:54 +0100 (CET)	\N
70	77662b8143b3c181367a4ee7eeba42729b9f0227	Wed, 19 Mar 2014 09:53:54 +0100	2014-03-19 08:53:54	2014-03-19 00:00:00
71	ae9e718d95cd2dc989d93ce85a5698490b26d2c3	<20140319085354.D14B1E85EB@inode-pc-03.localdomain>	<20140319085354.D14B1E85EB@inode-pc-03.localdomain>	\N
72	c68cba4f681c0cacdebba80bdd22a375f868ed93	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8DB21E85EE; Wed, 19 Mar 2014 09:59:11 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8DB21E85EE; Wed, 19 Mar 2014 09:59:11 +0100 (CET)	\N
73	335756df355180c78dc019df70838cb0cf4da258	Wed, 19 Mar 2014 09:59:11 +0100	2014-03-19 08:59:11	2014-03-19 00:00:00
74	c1f250133a34d872c5bb1540284305c017182f5a	<20140319085911.8DB21E85EE@inode-pc-03.localdomain>	<20140319085911.8DB21E85EE@inode-pc-03.localdomain>	\N
75	8a8e1d8cd0419befc02ae754ec61eac1c22f335d	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 929CFE85ED; Wed, 19 Mar 2014 10:01:52 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 929CFE85ED; Wed, 19 Mar 2014 10:01:52 +0100 (CET)	\N
76	83b67fca43f1d9ab2851d70b3dcfcf188de767f1	Wed, 19 Mar 2014 10:01:52 +0100	2014-03-19 09:01:52	2014-03-19 00:00:00
77	34863041708b6ac82338d73ed69d967ff058d2a0	<20140319090152.929CFE85ED@inode-pc-03.localdomain>	<20140319090152.929CFE85ED@inode-pc-03.localdomain>	\N
78	cd7096a78c970a650dfc89434a33cae5dca365f5	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 9961AE85EB; Wed, 19 Mar 2014 10:04:17 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 9961AE85EB; Wed, 19 Mar 2014 10:04:17 +0100 (CET)	\N
79	4a636be96a0d98cd17c0d0f9e82bb1f1801d557f	Wed, 19 Mar 2014 10:04:17 +0100	2014-03-19 09:04:17	2014-03-19 00:00:00
80	bcc2286c78b8ef1562fa63fb54369953269e2a0b	<20140319090417.9961AE85EB@inode-pc-03.localdomain>	<20140319090417.9961AE85EB@inode-pc-03.localdomain>	\N
81	516348d87d7555772da316ef970a54bbc8c46e9a	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 5E483E85EB; Wed, 19 Mar 2014 10:06:12 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 5E483E85EB; Wed, 19 Mar 2014 10:06:12 +0100 (CET)	\N
82	26f023081c7ac6c5db65c593b15ce1922a98fd0d	Wed, 19 Mar 2014 10:06:12 +0100	2014-03-19 09:06:12	2014-03-19 00:00:00
83	edf77ad59d9d7e3ced448f67385f9d7076a58ba7	<20140319090612.5E483E85EB@inode-pc-03.localdomain>	<20140319090612.5E483E85EB@inode-pc-03.localdomain>	\N
84	8d9162de9490ec1dae44387768652879084d085d	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8E288E85F0; Wed, 19 Mar 2014 10:11:13 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8E288E85F0; Wed, 19 Mar 2014 10:11:13 +0100 (CET)	\N
85	f10fb7bfb2fe86cfcb93628d4b3673341cc0798e	Wed, 19 Mar 2014 10:11:13 +0100	2014-03-19 09:11:13	2014-03-19 00:00:00
86	becd10a68167901418d0e0e30cb7877f4695a291	<20140319091113.8E288E85F0@inode-pc-03.localdomain>	<20140319091113.8E288E85F0@inode-pc-03.localdomain>	\N
87	1dfa4297d3afa2aa3b2303ecca8d1f6c149fa604	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8D313E85F2; Wed, 19 Mar 2014 10:13:58 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8D313E85F2; Wed, 19 Mar 2014 10:13:58 +0100 (CET)	\N
88	245e0b3378199a1f2b1962ddb70d385a0289c84c	Wed, 19 Mar 2014 10:13:58 +0100	2014-03-19 09:13:58	2014-03-19 00:00:00
89	90521ca19f5e03da7303641a45921914f3d4e25e	<20140319091358.8D313E85F2@inode-pc-03.localdomain>	<20140319091358.8D313E85F2@inode-pc-03.localdomain>	\N
90	9d167cf7f9c47f1402db0e5178ec9e9ad1dbf3db	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 0990EE85EF; Wed, 19 Mar 2014 10:14:34 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 0990EE85EF; Wed, 19 Mar 2014 10:14:34 +0100 (CET)	\N
91	95eea8eebc8a4fc47e5ac1dedd0fe7beb8370dba	Wed, 19 Mar 2014 10:14:34 +0100	2014-03-19 09:14:34	2014-03-19 00:00:00
92	cf49bcf1726ed91078466baf7b975afb9e8a48a1	<20140319091434.0990EE85EF@inode-pc-03.localdomain>	<20140319091434.0990EE85EF@inode-pc-03.localdomain>	\N
93	d15ca0e283c902d05220855ee0889c9ddd5d4208	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 6E88EE85F1; Wed, 19 Mar 2014 10:19:37 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 6E88EE85F1; Wed, 19 Mar 2014 10:19:37 +0100 (CET)	\N
94	b2d95cd42c14d2d188ff7c83dfc2282f8a960953	Wed, 19 Mar 2014 10:19:37 +0100	2014-03-19 09:19:37	2014-03-19 00:00:00
95	047f6d3d2ffd4f8f20a12ad0836351514d19018c	<20140319091937.6E88EE85F1@inode-pc-03.localdomain>	<20140319091937.6E88EE85F1@inode-pc-03.localdomain>	\N
96	766d0795feca36aa50cd6cc03f7cd50a81dfed38	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8523DE85F1; Wed, 19 Mar 2014 10:22:37 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 8523DE85F1; Wed, 19 Mar 2014 10:22:37 +0100 (CET)	\N
97	ec072a459e6756661c94c7c9ca6f78e0c5c64821	Wed, 19 Mar 2014 10:22:37 +0100	2014-03-19 09:22:37	2014-03-19 00:00:00
98	61d9a73b96cb7928e54bda1613eb257783b192b8	<20140319092237.8523DE85F1@inode-pc-03.localdomain>	<20140319092237.8523DE85F1@inode-pc-03.localdomain>	\N
99	b6a6af54eea9a74a2ca56abf1f6879d188a7a036	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 56CD0E85EF; Wed, 19 Mar 2014 10:31:49 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 56CD0E85EF; Wed, 19 Mar 2014 10:31:49 +0100 (CET)	\N
100	9bd09caa2db1791cac296ce99b95c62cd21b0a32	Wed, 19 Mar 2014 10:31:49 +0100	2014-03-19 09:31:49	2014-03-19 00:00:00
101	ca670ad49cbc79926ac7d7ed6f7a351b11f76929	<20140319093149.56CD0E85EF@inode-pc-03.localdomain>	<20140319093149.56CD0E85EF@inode-pc-03.localdomain>	\N
102	61c7478cb4e0389f4b41647bd6f7b9685ffe7c73	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 2BC06E85F1; Wed, 19 Mar 2014 10:36:43 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 2BC06E85F1; Wed, 19 Mar 2014 10:36:43 +0100 (CET)	\N
103	f37263cb723b0497762612f10ce14b714a677711	Wed, 19 Mar 2014 10:36:43 +0100	2014-03-19 09:36:43	2014-03-19 00:00:00
104	bdbf0797dc13b6133752a16cb7b3943cb07fcb5d	<20140319093643.2BC06E85F1@inode-pc-03.localdomain>	<20140319093643.2BC06E85F1@inode-pc-03.localdomain>	\N
105	622e173288e894285b1d2ddbaa1e1fa5ab1003a1	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 284B5E85F1; Wed, 19 Mar 2014 10:37:45 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 284B5E85F1; Wed, 19 Mar 2014 10:37:45 +0100 (CET)	\N
106	e5e1f21b170ba2e31861243d1845c699aec172f7	Wed, 19 Mar 2014 10:37:45 +0100	2014-03-19 09:37:45	2014-03-19 00:00:00
107	5e5b5fc393e75e3316060a7bc73e1075d90d75fa	<20140319093745.284B5E85F1@inode-pc-03.localdomain>	<20140319093745.284B5E85F1@inode-pc-03.localdomain>	\N
108	55bea15680f4d48d229c3322eb82f6e9488bb537	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 4448DE85F1; Wed, 19 Mar 2014 10:39:27 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 4448DE85F1; Wed, 19 Mar 2014 10:39:27 +0100 (CET)	\N
109	efed9cc39375be04d9d20860e57f007dac4d7ec5	Wed, 19 Mar 2014 10:39:27 +0100	2014-03-19 09:39:27	2014-03-19 00:00:00
110	c97d468b9720a92a5c4613eacdc23e6e9b808d0a	<20140319093927.4448DE85F1@inode-pc-03.localdomain>	<20140319093927.4448DE85F1@inode-pc-03.localdomain>	\N
111	ee4a5702c0fa4ca072d3a2b55dbc401a5fd76c6c	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 3B66CE85F2; Wed, 19 Mar 2014 10:44:08 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 3B66CE85F2; Wed, 19 Mar 2014 10:44:08 +0100 (CET)	\N
112	66f2291c40549cb4d64eb58b968f2d683486f5f9	Wed, 19 Mar 2014 10:44:08 +0100	2014-03-19 09:44:08	2014-03-19 00:00:00
113	9e1be2853ef760b4aaf1680db4c114dac429f861	<20140319094408.3B66CE85F2@inode-pc-03.localdomain>	<20140319094408.3B66CE85F2@inode-pc-03.localdomain>	\N
114	1ca87574a0c7dc9c451cd3d7cd5f33177dddc6f2	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D8DCAE85F2; Wed, 19 Mar 2014 10:59:54 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid D8DCAE85F2; Wed, 19 Mar 2014 10:59:54 +0100 (CET)	\N
115	a393f123b191da73312df4828988dbca94595a99	Wed, 19 Mar 2014 10:59:54 +0100	2014-03-19 09:59:54	2014-03-19 00:00:00
116	4dc044ddf4158a2e5e002e92ced67a05a5a20c44	<20140319095954.D8DCAE85F2@inode-pc-03.localdomain>	<20140319095954.D8DCAE85F2@inode-pc-03.localdomain>	\N
117	22b957d66186f06f22b303830f47fe0aae650d30	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 3E572E85EF; Wed, 19 Mar 2014 14:41:31 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 3E572E85EF; Wed, 19 Mar 2014 14:41:31 +0100 (CET)	\N
118	f3bba90308ff081b0f048b33c13e2e1c1f754219	Wed, 19 Mar 2014 14:41:31 +0100	2014-03-19 13:41:31	2014-03-19 00:00:00
119	25b58f722d366a4e98bf4dffae8c19155a8f2043	<20140319134131.3E572E85EF@inode-pc-03.localdomain>	<20140319134131.3E572E85EF@inode-pc-03.localdomain>	\N
120	f181d3f826dbd629f9953b62425b18bc8eb91e8c	by inode-pc-03.localdomain (Postfix, from userid 0)\tid DC032E85EF; Wed, 19 Mar 2014 14:49:33 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid DC032E85EF; Wed, 19 Mar 2014 14:49:33 +0100 (CET)	\N
121	7f598d54d19fec66b2f9dd5b0c94eddc122744d9	Wed, 19 Mar 2014 14:49:33 +0100	2014-03-19 13:49:33	2014-03-19 00:00:00
122	ba1a6815c23a9830f886afe6bf44aad265305e3d	<20140319134933.DC032E85EF@inode-pc-03.localdomain>	<20140319134933.DC032E85EF@inode-pc-03.localdomain>	\N
123	667cc315ca317e063e4822472ac8590bcff1b6de	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 541F7E85F2; Wed, 19 Mar 2014 14:50:17 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 541F7E85F2; Wed, 19 Mar 2014 14:50:17 +0100 (CET)	\N
124	b718166055344c11732d389071685d2bee78411c	Wed, 19 Mar 2014 14:50:17 +0100	2014-03-19 13:50:17	2014-03-19 00:00:00
125	c8e144d8f6b94f947055a8aac369dc289de106a8	<20140319135017.541F7E85F2@inode-pc-03.localdomain>	<20140319135017.541F7E85F2@inode-pc-03.localdomain>	\N
126	2a9c460a04b1da5e009ba8eb08b2057d992c2912	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7F61EE85EF; Wed, 19 Mar 2014 14:52:59 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 7F61EE85EF; Wed, 19 Mar 2014 14:52:59 +0100 (CET)	\N
127	2497f16f137305052e530d217089390e343fe15c	Wed, 19 Mar 2014 14:52:59 +0100	2014-03-19 13:52:59	2014-03-19 00:00:00
128	fb6e21fa4326365b1d4c670825dfd086e6ac56d1	pippo@pippopluto.com	pippo	\N
129	f2f0a34c81960174a7409847480c3c607550ebfa	<20140319135259.7F61EE85EF@inode-pc-03.localdomain>	<20140319135259.7F61EE85EF@inode-pc-03.localdomain>	\N
130	30e6c5f784b507e7d631f6eb7978a22311e9244e	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 58716E85F1; Wed, 19 Mar 2014 14:57:30 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 58716E85F1; Wed, 19 Mar 2014 14:57:30 +0100 (CET)	\N
131	4a2b050742ac15c5bd012fa665dd8bc1f9d374fb	Wed, 19 Mar 2014 14:57:30 +0100	2014-03-19 13:57:30	2014-03-19 00:00:00
132	d81c3f934905a38dc14bebdcb445c640696fcd5b	<20140319135730.58716E85F1@inode-pc-03.localdomain>	<20140319135730.58716E85F1@inode-pc-03.localdomain>	\N
133	192e87886863f93cc39a6a6b1ae93460ba568c3b	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 57757E85F0; Wed, 19 Mar 2014 15:01:35 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 57757E85F0; Wed, 19 Mar 2014 15:01:35 +0100 (CET)	\N
134	5c4b5df9b4f107ed1440ee15e9f7eba23482f6b7	Wed, 19 Mar 2014 15:01:35 +0100	2014-03-19 14:01:35	2014-03-19 00:00:00
135	c4968b27d8b97119ee2a811416920dab143a8f96	<20140319140135.57757E85F0@inode-pc-03.localdomain>	<20140319140135.57757E85F0@inode-pc-03.localdomain>	\N
136	67165dc2f78c066fbabc1609596a597a1d3644ee	by inode-pc-03.localdomain (Postfix, from userid 0)\tid E5C45E85F0; Wed, 19 Mar 2014 15:05:42 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid E5C45E85F0; Wed, 19 Mar 2014 15:05:42 +0100 (CET)	\N
137	ec0a88bf14bffbdc5d1f9a0b3c6c13c7ffd91979	Wed, 19 Mar 2014 15:05:42 +0100	2014-03-19 14:05:42	2014-03-19 00:00:00
138	178e71f7d453104437362d0ed379a5fb7f1d1bf9	<20140319140542.E5C45E85F0@inode-pc-03.localdomain>	<20140319140542.E5C45E85F0@inode-pc-03.localdomain>	\N
139	37fe64fe5ecfee5643ace29ebbe2eb8e2370c5c8	by inode-pc-03.localdomain (Postfix, from userid 0)\tid E3213E85F1; Wed, 19 Mar 2014 15:21:41 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid E3213E85F1; Wed, 19 Mar 2014 15:21:41 +0100 (CET)	\N
140	021725fa9b94cfa3da0c351c81a69434b447c975	Wed, 19 Mar 2014 15:21:41 +0100	2014-03-19 14:21:41	2014-03-19 00:00:00
141	c0686be7ae76873431c28de75affc81e02bd1415	<20140319142141.E3213E85F1@inode-pc-03.localdomain>	<20140319142141.E3213E85F1@inode-pc-03.localdomain>	\N
142	1be511d410b1f063df0f98a23e5089533ad1da24	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 67906E85F1; Wed, 19 Mar 2014 15:25:39 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 67906E85F1; Wed, 19 Mar 2014 15:25:39 +0100 (CET)	\N
143	3fc512518a873a346c5fbc26c4ecb414d26e3b30	Wed, 19 Mar 2014 15:25:39 +0100	2014-03-19 14:25:39	2014-03-19 00:00:00
144	d08639092abd761fc260c2c83bf03f025985474e	<20140319142539.67906E85F1@inode-pc-03.localdomain>	<20140319142539.67906E85F1@inode-pc-03.localdomain>	\N
145	721ddfa8d093c7048f570de15a90b988a2360fbc	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 61643E85F0; Thu, 20 Mar 2014 11:37:18 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 61643E85F0; Thu, 20 Mar 2014 11:37:18 +0100 (CET)	\N
146	10c6c28ca3c44ebf90d16269c7a1d7a525d89fae	Thu, 20 Mar 2014 11:37:18 +0100	2014-03-20 10:37:18	2014-03-20 00:00:00
147	8fa7a7c390193c02178d879d6b931a0960d62ac8	<20140320103718.61643E85F0@inode-pc-03.localdomain>	<20140320103718.61643E85F0@inode-pc-03.localdomain>	\N
148	502ef02252490e2720ec0b180ef501035fcc7dd4	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 518D8E85F1; Thu, 20 Mar 2014 11:46:46 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 518D8E85F1; Thu, 20 Mar 2014 11:46:46 +0100 (CET)	\N
149	c01c4f6a9cea5a52e8565004ccd9f244cbe84543	Thu, 20 Mar 2014 11:46:46 +0100	2014-03-20 10:46:46	2014-03-20 00:00:00
150	f5233352cb0e1c023184ac4d713a6556295cb608	<20140320104646.518D8E85F1@inode-pc-03.localdomain>	<20140320104646.518D8E85F1@inode-pc-03.localdomain>	\N
151	14149d2661ab5b8d4bcedd734f5405cab46e6c0f	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 4C71EE85F5; Thu, 20 Mar 2014 11:47:17 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 4C71EE85F5; Thu, 20 Mar 2014 11:47:17 +0100 (CET)	\N
152	54a9332ad9aeffb1c0ae18578a8f6f03d8adc635	Thu, 20 Mar 2014 11:47:17 +0100	2014-03-20 10:47:17	2014-03-20 00:00:00
153	92249a1ccafdfde63278514bde458066978a9efe	<20140320104717.4C71EE85F5@inode-pc-03.localdomain>	<20140320104717.4C71EE85F5@inode-pc-03.localdomain>	\N
154	874658aed79f8f3dce05a7cca12c3c8b142dda93	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 914CCE85F2; Thu, 20 Mar 2014 11:30:24 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 914CCE85F2; Thu, 20 Mar 2014 11:30:24 +0100 (CET)	\N
155	c79814d1a8cfa393b966fdb954019e3e9557b540	Thu, 20 Mar 2014 11:30:24 +0100	2014-03-20 10:30:24	2014-03-20 00:00:00
156	806db4ce7c06525205658485d3e18fad1c279103	<20140320103024.914CCE85F2@inode-pc-03.localdomain>	<20140320103024.914CCE85F2@inode-pc-03.localdomain>	\N
157	783021c4ea1adb8897bc6a4ed65134c143cb6da8	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 2381CE85F2; Thu, 20 Mar 2014 11:49:27 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 2381CE85F2; Thu, 20 Mar 2014 11:49:27 +0100 (CET)	\N
158	6d14677d090670eddc21ab4cfbee0fec661d57d4	Thu, 20 Mar 2014 11:49:27 +0100	2014-03-20 10:49:27	2014-03-20 00:00:00
159	9b4046a9b9f80e5f9af1ab0b3eb608290843a910	<20140320104927.2381CE85F2@inode-pc-03.localdomain>	<20140320104927.2381CE85F2@inode-pc-03.localdomain>	\N
160	2b64019252f151119680d97290206e328a1a2b5b	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 127B4E85F0; Thu, 20 Mar 2014 11:50:58 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 127B4E85F0; Thu, 20 Mar 2014 11:50:58 +0100 (CET)	\N
161	349da587d6fbf8f7ef9fa1287e260c2c93f5f6a1	Thu, 20 Mar 2014 11:50:58 +0100	2014-03-20 10:50:58	2014-03-20 00:00:00
162	f03d08917ce925f3554a49b733ba5f7b6a9dfa88	<20140320105058.127B4E85F0@inode-pc-03.localdomain>	<20140320105058.127B4E85F0@inode-pc-03.localdomain>	\N
163	ee29fc3ba731c185f97d397998f3c602a2c025eb	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 54AC3E85F1; Thu, 20 Mar 2014 11:52:05 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid 54AC3E85F1; Thu, 20 Mar 2014 11:52:05 +0100 (CET)	\N
164	3e56a9bf1f840008118da7cfb10dc1de1f02b203	Thu, 20 Mar 2014 11:52:05 +0100	2014-03-20 10:52:05	2014-03-20 00:00:00
165	79fa022ae1fa725ade660df737218b23797d1e65	<20140320105205.54AC3E85F1@inode-pc-03.localdomain>	<20140320105205.54AC3E85F1@inode-pc-03.localdomain>	\N
166	b2c535acfaabb135ab9928a3bf91916c7198bb49	by inode-pc-03.localdomain (Postfix, from userid 0)\tid EB52CE85F2; Thu, 20 Mar 2014 14:13:16 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 0)\tid EB52CE85F2; Thu, 20 Mar 2014 14:13:16 +0100 (CET)	\N
167	3031b6b9465f327291ea24ea3d096bdfb3a19172	Thu, 20 Mar 2014 14:13:16 +0100	2014-03-20 13:13:16	2014-03-20 00:00:00
168	07f4e5e202e86cdb96e4e724c1186951fe529dce	<20140320131316.EB52CE85F2@inode-pc-03.localdomain>	<20140320131316.EB52CE85F2@inode-pc-03.localdomain>	\N
169	dc7f9d1c78da7a7c20d086986fe2a6e56e69e6ee	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 610F7E85F1; Wed, 26 Mar 2014 10:19:14 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 610F7E85F1; Wed, 26 Mar 2014 10:19:14 +0100 (CET)	\N
170	c141e68746e202aefa4d809b36a1a1137fa52e1a	Wed, 26 Mar 2014 10:19:14 +0100	2014-03-26 09:19:14	2014-03-26 00:00:00
171	3feb39b63fa0ab88dbbf8dabd9cd40e453e178f7	<20140326091914.610F7E85F1@inode-pc-03.localdomain>	<20140326091914.610F7E85F1@inode-pc-03.localdomain>	\N
172	30ca3b1111db5e69ed1598f0f95656c29e627d51	Emanuele Chiossi <echiossi@inode-pc-03.localdomain>	echiossi	\N
173	f5b7d0d8b4875f27faa44de579dcb8d612b170c9	echiossi@inode-pc-03.localdomain	echiossi	\N
174	ffc2a505d65fa142e450de1d53157dec3e86e8d0	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 51C4BE85F0; Wed, 26 Mar 2014 10:41:29 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 51C4BE85F0; Wed, 26 Mar 2014 10:41:29 +0100 (CET)	\N
175	14d444b6095747823710931545af2d8ff1791d5c	Wed, 26 Mar 2014 10:41:29 +0100	2014-03-26 09:41:29	2014-03-26 00:00:00
176	8351bc89789d75ff4a39ec58e49613fff8b2d648	<20140326094129.51C4BE85F0@inode-pc-03.localdomain>	<20140326094129.51C4BE85F0@inode-pc-03.localdomain>	\N
177	9e621f2b7d67d10f1f04375d8ed0466bcd204287	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 82B03E85F0; Wed, 26 Mar 2014 11:27:35 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 82B03E85F0; Wed, 26 Mar 2014 11:27:35 +0100 (CET)	\N
178	c001740e5d80debe32813c0b67fc36fc60cf00ae	Wed, 26 Mar 2014 11:27:35 +0100	2014-03-26 10:27:35	2014-03-26 00:00:00
179	b0a4ee7fa2f1e19132522fa44e234a10b542487a	prova mail	prova mail	\N
180	00c7f3d9fb1f9fe3c479f2f4419995cc0520d4e7	<20140326102735.82B03E85F0@inode-pc-03.localdomain>	<20140326102735.82B03E85F0@inode-pc-03.localdomain>	\N
181	8026b96ea9ff8388e55cec94569d1aacc468f4c6	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 06DF6E85F0; Wed, 26 Mar 2014 16:27:28 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 06DF6E85F0; Wed, 26 Mar 2014 16:27:28 +0100 (CET)	\N
182	8aeda2a1a1eea0b9f7074b16dbcf897b132681d9	Wed, 26 Mar 2014 16:27:28 +0100	2014-03-26 15:27:28	2014-03-26 00:00:00
183	d0acf6d6e8ec8d98294991eea0c91edba25b7dbe	<20140326152728.06DF6E85F0@inode-pc-03.localdomain>	<20140326152728.06DF6E85F0@inode-pc-03.localdomain>	\N
184	e1adf659ca192b04a7804b3d896dd9e891606029	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid EC1BDE85F0; Wed, 26 Mar 2014 16:41:35 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid EC1BDE85F0; Wed, 26 Mar 2014 16:41:35 +0100 (CET)	\N
185	b73d55353b53013a0010779aa905175fd0691e05	Wed, 26 Mar 2014 16:41:35 +0100	2014-03-26 15:41:35	2014-03-26 00:00:00
186	6c7f4cf60c145d3482146fabd52a4c4ee42b86ba	<20140326154135.EC1BDE85F0@inode-pc-03.localdomain>	<20140326154135.EC1BDE85F0@inode-pc-03.localdomain>	\N
187	e4b4d1a135d8e3f65bf761c7aac12e5febe8d980	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid B1F7AE85F2; Wed, 26 Mar 2014 17:10:17 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid B1F7AE85F2; Wed, 26 Mar 2014 17:10:17 +0100 (CET)	\N
188	a7db0044af64eaafbdb6f906d06fa98413a62271	Wed, 26 Mar 2014 17:10:17 +0100	2014-03-26 16:10:17	2014-03-26 00:00:00
189	142fc5471fd1086b3d792bf4a6a75b55fbdeb407	<20140326161017.B1F7AE85F2@inode-pc-03.localdomain>	<20140326161017.B1F7AE85F2@inode-pc-03.localdomain>	\N
190	64e40c05adba74195065193430abe460a455b3a0	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 51AF4E85F3; Wed, 26 Mar 2014 17:11:17 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 51AF4E85F3; Wed, 26 Mar 2014 17:11:17 +0100 (CET)	\N
191	bfacb04ae05afeaf3f8ce5107f3904bde440dd21	Wed, 26 Mar 2014 17:11:17 +0100	2014-03-26 16:11:17	2014-03-26 00:00:00
192	c5877e084b69f35361b46db322392427615d3cfb	<20140326161117.51AF4E85F3@inode-pc-03.localdomain>	<20140326161117.51AF4E85F3@inode-pc-03.localdomain>	\N
193	30a965de5079194e672cb009f026cb87b76bcaaa	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 5C9CEE85F3; Wed, 26 Mar 2014 17:11:59 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 5C9CEE85F3; Wed, 26 Mar 2014 17:11:59 +0100 (CET)	\N
194	024b7bc01afcaa276352a9ba551ff3dc7fb331b2	Wed, 26 Mar 2014 17:11:59 +0100	2014-03-26 16:11:59	2014-03-26 00:00:00
195	7cf00ca7e945de24f0c5425e7ed1df656d607c70	<20140326161159.5C9CEE85F3@inode-pc-03.localdomain>	<20140326161159.5C9CEE85F3@inode-pc-03.localdomain>	\N
196	c5955f74c10690b918f726d56b3199d9e39e2b9b	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid C4F18E85F4; Thu, 27 Mar 2014 10:08:34 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid C4F18E85F4; Thu, 27 Mar 2014 10:08:34 +0100 (CET)	\N
197	96505ff4deadc37729df5a529f601199aede3346	Thu, 27 Mar 2014 10:08:34 +0100	2014-03-27 09:08:34	2014-03-27 00:00:00
198	78d14ddd597ef0097c2c61977bcaf87478f20ca8	ciao pippo	ciao pippo	\N
199	f6ea7e93a36e63810d0ab8781ec53254f5f912c2	<20140327090834.C4F18E85F4@inode-pc-03.localdomain>	<20140327090834.C4F18E85F4@inode-pc-03.localdomain>	\N
200	2a81028401f1105a22058105227b917a45e39523	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 1CD15E85F5; Thu, 27 Mar 2014 10:18:53 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 1CD15E85F5; Thu, 27 Mar 2014 10:18:53 +0100 (CET)	\N
201	a00aa038997a32884a39d5624f3aea47176b8dee	Thu, 27 Mar 2014 10:18:53 +0100	2014-03-27 09:18:53	2014-03-27 00:00:00
202	17b962f6574196d34ba91acf6d9a4ba9f4c010c8	ciao pippo2	ciao pippo2	\N
203	734993b4ef0efa55dcb978dbc5d0923c83e735bf	<20140327091853.1CD15E85F5@inode-pc-03.localdomain>	<20140327091853.1CD15E85F5@inode-pc-03.localdomain>	\N
204	1882bdabf98e5457c11a1e29f0320d03181b49b6	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 7B439E85F5; Fri, 28 Mar 2014 10:59:20 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 7B439E85F5; Fri, 28 Mar 2014 10:59:20 +0100 (CET)	\N
205	0832216c6bdbec5f4c3df3dbec81483f8f8bab58	Fri, 28 Mar 2014 10:59:20 +0100	2014-03-28 09:59:20	2014-03-28 00:00:00
206	590db9c8ba0008d2b4b320b988433c28307fba2e	<20140328095920.7B439E85F5@inode-pc-03.localdomain>	<20140328095920.7B439E85F5@inode-pc-03.localdomain>	\N
207	22fde941aabaa7fed3f1bad64aa58b1ecce9920f	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid EEB95E85F2; Fri, 28 Mar 2014 17:08:31 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid EEB95E85F2; Fri, 28 Mar 2014 17:08:31 +0100 (CET)	\N
208	4a9b04d3d57a16dd5337522e990675401946b73c	Fri, 28 Mar 2014 17:08:31 +0100	2014-03-28 16:08:31	2014-03-28 00:00:00
209	89c88541352ce233173624ee1341fac33ff71947	hello pippo	hello pippo	\N
210	46e6980d0f964329ce5b21672b7fe62dd29b4514	<20140328160831.EEB95E85F2@inode-pc-03.localdomain>	<20140328160831.EEB95E85F2@inode-pc-03.localdomain>	\N
211	a378bd983b4e40fd67e13a05c30247b323690805	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 4B228E85F5; Fri, 28 Mar 2014 17:09:38 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 4B228E85F5; Fri, 28 Mar 2014 17:09:38 +0100 (CET)	\N
212	e4a5b9e8a7ee0c660b44c282e349f850a9c877b5	Fri, 28 Mar 2014 17:09:38 +0100	2014-03-28 16:09:38	2014-03-28 00:00:00
213	208bf4a480de669cb8795d1716c36ca548aa5202	<20140328160938.4B228E85F5@inode-pc-03.localdomain>	<20140328160938.4B228E85F5@inode-pc-03.localdomain>	\N
214	dbcc45eede78495aa007dadeaca99dd4940e89f7	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 29DC3E85F5; Fri, 28 Mar 2014 17:11:48 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 29DC3E85F5; Fri, 28 Mar 2014 17:11:48 +0100 (CET)	\N
215	df61691241e93ca3c7824460a79e71a4a0c62893	Fri, 28 Mar 2014 17:11:48 +0100	2014-03-28 16:11:48	2014-03-28 00:00:00
216	8544278097a87464d90f54550c697133c06e35ff	ciao pippo3	ciao pippo3	\N
217	9e7025180e161fd878061d7c343273f539dba650	<20140328161148.29DC3E85F5@inode-pc-03.localdomain>	<20140328161148.29DC3E85F5@inode-pc-03.localdomain>	\N
218	66efa507664a580703fa3b3240091221c795eb95	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 649C6E85F2; Fri, 28 Mar 2014 17:14:51 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 649C6E85F2; Fri, 28 Mar 2014 17:14:51 +0100 (CET)	\N
219	357397f3be828c49884698bb92230ba1c545e8e5	Fri, 28 Mar 2014 17:14:51 +0100	2014-03-28 16:14:51	2014-03-28 00:00:00
220	5e1e6f5fa9e5464a12f0248b41aaed0a70a50c53	<20140328161451.649C6E85F2@inode-pc-03.localdomain>	<20140328161451.649C6E85F2@inode-pc-03.localdomain>	\N
221	6fa61ebd575f8058ca2414a3f109a6ab63cf493c	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid F22E7E85F4; Fri, 28 Mar 2014 17:17:21 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid F22E7E85F4; Fri, 28 Mar 2014 17:17:21 +0100 (CET)	\N
222	30c0126128eacb4d7cb221440604f6105c701ab5	Fri, 28 Mar 2014 17:17:21 +0100	2014-03-28 16:17:21	2014-03-28 00:00:00
223	7d6519aa4e2cb2ad372aca5eedc1346918585128	funzioni si o no?	funzioni si o no?	\N
224	37e3cb96487373c01b503e3fbd005fc5f47fae5a	<20140328161721.F22E7E85F4@inode-pc-03.localdomain>	<20140328161721.F22E7E85F4@inode-pc-03.localdomain>	\N
225	ebb1c20c03ba227a246dc6f3d86ba0acafebb295	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 4AD43E85F5; Fri, 28 Mar 2014 17:17:45 +0100 (CET)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 4AD43E85F5; Fri, 28 Mar 2014 17:17:45 +0100 (CET)	\N
226	2e45b46bf9ac8db666dbee73a062956823b5d49e	Fri, 28 Mar 2014 17:17:45 +0100	2014-03-28 16:17:45	2014-03-28 00:00:00
227	bcbe0f69cf1d4fc95cf7a98a586899233932fd07	<20140328161745.4AD43E85F5@inode-pc-03.localdomain>	<20140328161745.4AD43E85F5@inode-pc-03.localdomain>	\N
228	a4cbd9ae6dd9373719ae1550f6dc57dd669a8224	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 517FFE85F4; Wed,  2 Apr 2014 15:14:45 +0200 (CEST)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 517FFE85F4; Wed,  2 Apr 2014 15:14:45 +0200 (CEST)	\N
229	d6d1e2b359365370a9d4162c273325fe032dd6e8	Wed, 02 Apr 2014 15:14:45 +0200	2014-04-02 13:14:45	2014-04-02 00:00:00
230	21b26bfa05fca08148a9484b4160e1eac3850e00	funzioni?	funzioni?	\N
231	626f71600dd55d4a44c20799754c137ca0bb5191	<20140402131445.517FFE85F4@inode-pc-03.localdomain>	<20140402131445.517FFE85F4@inode-pc-03.localdomain>	\N
232	9ad1e9244ccc33e11b5074d71e0ab3b4db6dfb8f	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 0EDDBE85F6; Wed,  2 Apr 2014 15:15:06 +0200 (CEST)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 0EDDBE85F6; Wed,  2 Apr 2014 15:15:06 +0200 (CEST)	\N
233	92270d465a17eaf753c2ac2926bd445c45cfb332	Wed, 02 Apr 2014 15:15:06 +0200	2014-04-02 13:15:06	2014-04-02 00:00:00
234	7aa9d3e2671ac97e2f96c8126a3047dcd6bf6ea5	<20140402131506.0EDDBE85F6@inode-pc-03.localdomain>	<20140402131506.0EDDBE85F6@inode-pc-03.localdomain>	\N
235	cb3debf5b1c9ab28090cb98563017fe39968d682	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid E5AD7E85F3; Thu,  3 Apr 2014 14:24:29 +0200 (CEST)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid E5AD7E85F3; Thu,  3 Apr 2014 14:24:29 +0200 (CEST)	\N
236	0c7196a30e1f3b446a1b5208d891b7db745c97bd	Thu, 03 Apr 2014 14:24:29 +0200	2014-04-03 12:24:29	2014-04-03 00:00:00
237	7c2a4bb5ae3d5e3c1899794e92ab0a248b4e9d6a	ultima prova ole	ultima prova ole	\N
238	b83f680ca948155e981d78415aa512f0325c0574	<20140403122429.E5AD7E85F3@inode-pc-03.localdomain>	<20140403122429.E5AD7E85F3@inode-pc-03.localdomain>	\N
239	dc844127a71328c1b9aab20b46da2fe22c35c73d	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid E390EE85F6; Thu,  3 Apr 2014 17:17:30 +0200 (CEST)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid E390EE85F6; Thu,  3 Apr 2014 17:17:30 +0200 (CEST)	\N
240	7e4d548e994d8480ac7f5e48f7f9e77a67287a0c	Thu, 03 Apr 2014 17:17:30 +0200	2014-04-03 15:17:30	2014-04-03 00:00:00
241	9eb46431ca64f0427db9fbf69207f969b02384d5	<20140403151730.E390EE85F6@inode-pc-03.localdomain>	<20140403151730.E390EE85F6@inode-pc-03.localdomain>	\N
242	c89c5e63f00758f58d637e553274ca8cba63b9e8	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 4D848E85F6; Fri,  4 Apr 2014 16:48:12 +0200 (CEST)	by inode-pc-03.localdomain (Postfix, from userid 16777261)\tid 4D848E85F6; Fri,  4 Apr 2014 16:48:12 +0200 (CEST)	\N
243	338ad8915d6d387bdf7aab2afbdd2ecbd9130f84	Fri, 04 Apr 2014 16:48:12 +0200	2014-04-04 14:48:12	2014-04-04 00:00:00
244	98596d1d34880f8b969b05dad1037b905b8db82a	marco@pippopluto.com	marco	\N
245	7eea6cfa3b6b0c668b7f1b2eaefc2ec006c92eb4	<20140404144812.4D848E85F6@inode-pc-03.localdomain>	<20140404144812.4D848E85F6@inode-pc-03.localdomain>	\N
\.


--
-- Name: dbmail_headervalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_headervalue_id_seq', 245, true);


--
-- Data for Name: dbmail_keywords; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_keywords (message_idnr, keyword) FROM stdin;
\.


--
-- Name: dbmail_mailbox_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_mailbox_idnr_seq', 80, true);


--
-- Data for Name: dbmail_mailboxes; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_mailboxes (mailbox_idnr, owner_idnr, name, seen_flag, answered_flag, deleted_flag, flagged_flag, recent_flag, draft_flag, no_inferiors, no_select, permission, seq, mailboxtype) FROM stdin;
2	5	INBOX	0	0	0	0	0	0	0	0	2	1	T
3	5	projects	1	1	1	1	1	1	0	0	2	0	T
8	1	INBOX	0	0	0	0	0	0	0	0	2	1	T
7	9	INBOX	0	0	0	0	0	0	0	0	2	19	T
39	42	INBOX	0	0	0	0	0	0	0	0	2	0	T
80	83	INBOX	0	0	0	0	0	0	0	0	2	0	T
38	41	INBOX	0	0	0	0	0	0	0	0	2	27	T
\.


--
-- Name: dbmail_message_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_message_idnr_seq', 150, true);


--
-- Name: dbmail_messageblk_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_messageblk_idnr_seq', 1, false);


--
-- Data for Name: dbmail_messageblks; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_messageblks (messageblk_idnr, physmessage_id, messageblk, blocksize, is_header) FROM stdin;
\.


--
-- Data for Name: dbmail_messages; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_messages (message_idnr, mailbox_idnr, physmessage_id, seen_flag, answered_flag, deleted_flag, flagged_flag, recent_flag, draft_flag, unique_id, status) FROM stdin;
52	7	26	0	0	0	0	1	0	b6a1c153b15b6620ae80c1879e02a8cf	0
2	7	1	0	0	0	0	1	0	228b53e11bfabe31d1ab86c6128a460a	1
108	38	54	0	0	0	0	1	0	1e7813b5364d384b27b1fe34605c0fa7	0
146	38	73	0	0	0	0	1	0	6a608d7b26424e78dcd734bad3fc1694	0
54	7	27	0	0	0	0	1	0	f149b3c0baaa9e73f39ba35847ea8642	0
4	7	2	0	0	0	0	1	0	6b932e613bbb52bb16d3e64f3ed9af85	1
56	7	28	0	0	0	0	1	0	f4ea7251f0beb98f8a304f8c10a1255d	0
148	38	74	0	0	0	0	1	0	9885c0d2bdef9232de3e0d8bee814ddc	0
110	38	55	0	0	0	0	1	0	f9279e64a431348b13c8cde6f5667677	1
58	7	29	0	0	0	0	1	0	20f6e01781c28f468734b79448ee0bc7	0
112	38	56	0	0	0	0	1	0	eec9e578d0d5e6cc48e2f874722a23d7	0
60	7	30	0	0	0	0	1	0	8acf5b061fb4cbd3134373863845b085	0
62	7	31	0	0	0	0	1	0	c7c0dfa30dcc47611446a9dd7c085ce5	0
114	38	57	0	0	0	0	1	0	fe8707ec1ab70e23a030cd5118b5dd10	0
64	7	32	0	0	0	0	1	0	124e4b1fffd0dba4031c7de121073729	0
116	38	58	0	0	0	0	1	0	241083a51da87185f1daca56e2e36baa	0
66	7	33	0	0	0	0	1	0	c7294c30066f939395cbd725d1bc4c92	0
68	7	34	0	0	0	0	1	0	5dbd934c54a905081e239b900185e75e	0
118	38	59	0	0	0	0	1	0	6918cb0bd9fbdf5d5f4dd87f9a05eba2	0
70	7	35	0	0	0	0	1	0	f8aa4e74eedaa1fc32fc3076a45ce22c	0
120	38	60	0	0	0	0	1	0	479392ffeed505d74c3f9e46d693231c	0
72	7	36	0	0	0	0	1	0	5f2611249cdd29fd60b12b57a746c650	0
74	7	37	0	0	0	0	1	0	5783af4ee9ee93c68909a1cd6ed015f5	0
122	38	61	0	0	0	0	1	0	1ad5600a3a30ee5836bec2df25874f5b	0
124	38	62	0	0	0	0	1	0	3260df0cb2633dc21df6dba6113b6383	0
126	38	63	0	0	0	0	1	0	8842fbf79aa7163d3279244028002f24	0
128	38	64	0	0	0	0	1	0	60ac22e838fd6a20e87306f53b908593	0
130	38	65	0	0	0	0	1	0	931d90b89d024548398b46867a517eae	0
86	7	43	0	0	0	0	1	0	294468298470128541101db1998982ec	0
50	7	25	0	0	0	0	1	0	531ab44b234aa9c4234c3f95a1b7ea9d	0
132	38	66	0	0	0	0	1	0	cff5edab72bdcb7b3a4fda73695d0bf0	0
90	38	45	0	0	0	0	1	0	d46adc1c9cc4f776805a601ab6f46d79	0
134	38	67	0	0	0	0	1	0	8462debc3a212634cc429258c28f4b55	0
92	7	46	0	0	0	0	1	0	ec429addf5ab447a1d72f7cd2c23b5f6	0
136	38	68	0	0	0	0	1	0	2c59afb3ba498ad1c318ed59da784000	0
94	38	47	0	0	0	0	1	0	71b7a4f87a0c612365779dda919dd2eb	0
96	38	48	0	0	0	0	1	0	6743da8ee4b56558c2b0e80ee78c090f	0
138	38	69	0	0	0	0	1	0	ae23a3f22b5a77af18a4a6ac1ea71ef8	0
98	38	49	0	0	0	0	1	0	e8d1ded035bc00cf5e62d2acc7127530	0
140	38	70	0	0	0	0	1	0	dbfe5e419798034db7278f08a66d7248	0
100	38	50	0	0	0	0	1	0	3b44a8e129688edd3daaad5b524382a4	0
142	38	71	0	0	0	0	1	0	b1d8c1b4e8279fdb2ec4012d7d878697	0
104	7	52	0	0	0	0	1	0	aafc61c015f520baee7358097378e004	0
144	38	72	0	0	0	0	1	0	6c38771baf29ea7c8b05ec1ae1f62c3b	0
106	38	53	0	0	0	0	1	0	6b121cd4ab8a1408d8d256a47eb04ba2	0
\.


--
-- Data for Name: dbmail_mimeparts; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_mimeparts (id, hash, data, size) FROM stdin;
1	8749d42c52d80a05c73a14c7ecdbf81483457e6e                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420443946313245383543423b0a094672692c202037204d617220323031342031303a34333a3232202b303130302028434554290a446174653a204672692c203037204d617220323031342031303a34333a3232202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303330373039343332322e4439463132453835434240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
2	8e789babb9d020d0dace39a52a3d3145654f0860                                                                                                                                                                                                                        	\\x70726f76610d0a	7
3	59f6c947686d90e03a4a15c96ae3f0c5ec8d4b28                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420413433364245383544303b0a094672692c202037204d617220323031342031313a33343a3131202b303130302028434554290a446174653a204672692c203037204d617220323031342031313a33343a3131202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303330373130333431312e4134333642453835443040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
4	6f9988960ee90ecb12b4fb23e0b2357e98144320                                                                                                                                                                                                                        	\\x70726f7661320d0a	8
5	9e2e4f45054c9f2553a9525a3245dfe050f23714                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420423230443945383545313b0a094672692c202037204d617220323031342031323a34333a3230202b303130302028434554290a446174653a204672692c203037204d617220323031342031323a34333a3230202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303330373131343332302e4232304439453835453140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
6	3f8490881807b4d9c2b7b9a9c985da65dfb9481e                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420323938373045383545353b0a094672692c203134204d617220323031342031313a30333a3233202b303130302028434554290a446174653a204672692c203134204d617220323031342031313a30333a3233202b303130300a546f3a20544a79625832656b40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331343130303332332e3239383730453835453540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
7	ba8111fadd0596d6aed11280bece60743c47b47c                                                                                                                                                                                                                        	\\x70726f76616d61696c0d0a	11
8	5e124acf6671742785143a2eb7482fd22f217b0d                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420443046463345383545373b0a095475652c203138204d617220323031342030393a34323a3533202b303130302028434554290a446174653a205475652c203138204d617220323031342030393a34323a3533202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383038343235332e4430464633453835453740696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
9	375bbcabcb8530d84b22391d8dede6fee2d75af7                                                                                                                                                                                                                        	\\x616161616161616161610d0a	12
10	f30d7d40b1bad48edd52fd96a0fa366f6463c652                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420374437433445383545363b0a095475652c203138204d617220323031342030393a34393a3138202b303130302028434554290a446174653a205475652c203138204d617220323031342030393a34393a3138202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383038343931382e3744374334453835453640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
11	8db5bdd357122f374c96cbfb755a8df1f54cb9dc                                                                                                                                                                                                                        	\\x626262626262626262620d0a	12
12	49ce2d54075f5dc3950c73c5e00f88fca8447906                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420383943364445383545383b0a095475652c203138204d617220323031342031303a30333a3534202b303130302028434554290a446174653a205475652c203138204d617220323031342031303a30333a3534202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383039303335342e3839433644453835453840696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
13	281d161e9f697e251484ad6f1963f4859ece134f                                                                                                                                                                                                                        	\\x636363636363636363630d0a	12
14	65f72e48d6a1ef1c650546e7a7b0a1cce20e27ba                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420414146333745383545373b0a095475652c203138204d617220323031342031323a35333a3537202b303130302028434554290a446174653a205475652c203138204d617220323031342031323a35333a3537202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383131353335372e4141463337453835453740696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
15	e928264b1f6163102ee21466990b234c1edbd284                                                                                                                                                                                                                        	\\x646464646464646464640d0a	12
16	d5891de272606243967693d50f7ea3df15b954a7                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420373931364345383545413b0a095475652c203138204d617220323031342031363a32303a3036202b303130302028434554290a446174653a205475652c203138204d617220323031342031363a32303a3036202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383135323030362e3739313643453835454140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
17	ce66f9ae76de2bbfca9df0863b9db1ca0e7077a4                                                                                                                                                                                                                        	\\x6369616f0d0a	6
18	1d44eb00f38980b6eb75011b9f5d612edc1fb879                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420444342353445383545423b0a095475652c203138204d617220323031342031363a32333a3332202b303130302028434554290a446174653a205475652c203138204d617220323031342031363a32333a3332202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383135323333322e4443423534453835454240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
19	da1d0bf7a3102cea5a79d4061db214766533e63a                                                                                                                                                                                                                        	\\x656565656565656565650d0a	12
20	f5672aa84c41323fd7e63df3c824780014aac75e                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420374130363845383545413b0a095475652c203138204d617220323031342031363a33343a3131202b303130302028434554290a446174653a205475652c203138204d617220323031342031363a33343a3131202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383135333431312e3741303638453835454140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
21	119b60d9c95f7c8e8b9403f88f51ad24d05ef280                                                                                                                                                                                                                        	\\x666666666666666666660d0a	12
22	d3f9644cb944979c8fdc79daaffe6ead522e6ba9                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420434434393245383545423b0a095475652c203138204d617220323031342031363a35333a3233202b303130302028434554290a446174653a205475652c203138204d617220323031342031363a35333a3233202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383135353332332e4344343932453835454240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
23	7ad6f57621371523e8037824cd25139bf9b34ed7                                                                                                                                                                                                                        	\\x676767676767676767670d0a	12
24	7e565422b8cde8cf0f600ccb6ee3b82c90e5c4b4                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420443042303645383545443b0a095475652c203138204d617220323031342031363a35373a3438202b303130302028434554290a446174653a205475652c203138204d617220323031342031363a35373a3438202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383135353734382e4430423036453835454440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
25	bb232809581e218bb763e9c172bc26bcf03c433e                                                                                                                                                                                                                        	\\x686868686868686868680d0a	12
26	23870eeab48423b1c73425446bea7d5e887ddab0                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420333041423445383545443b0a095475652c203138204d617220323031342031373a30333a3439202b303130302028434554290a446174653a205475652c203138204d617220323031342031373a30333a3439202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383136303334392e3330414234453835454440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
27	10449ab79f7b9e3bb40649f9442b3ad373da3fa3                                                                                                                                                                                                                        	\\x696969696969696969690d0a	12
28	884747715876df0c4c13b2778a5a23b612819041                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420453736423845383545413b0a095475652c203138204d617220323031342031373a32323a3433202b303130302028434554290a446174653a205475652c203138204d617220323031342031373a32323a3433202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383136323234332e4537364238453835454140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
29	5d851297bc2a8b4cc6f451ce431722e98fcba519                                                                                                                                                                                                                        	\\x6c6c6c6c6c6c6c6c6c6c0d0a	12
30	a65843badd55fcbc62a55017d71d0e0cae90d73f                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420443146343145383545423b0a095475652c203138204d617220323031342031373a32343a3039202b303130302028434554290a446174653a205475652c203138204d617220323031342031373a32343a3039202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383136323430392e4431463431453835454240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
31	5af257d34f49fc70d1420bd18878fa9df50b01c9                                                                                                                                                                                                                        	\\x6d6d6d6d6d6d6d6d6d6d0d0a	12
32	6f6c6a7be9296d69345b973f3d9b38e0c8b027db                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420303141444145383545413b0a095475652c203138204d617220323031342031373a34303a3531202b303130302028434554290a446174653a205475652c203138204d617220323031342031373a34303a3531202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383136343035322e3031414441453835454140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
33	9c09309a596a123c186fc8453b56cac3827d491a                                                                                                                                                                                                                        	\\x6e6e6e6e6e6e6e6e6e6e0d0a	12
34	f20488e6fe3b1fb6bc473ce8ecc030ce3aca1bc2                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420393334434645383545413b0a095475652c203138204d617220323031342031373a35303a3238202b303130302028434554290a446174653a205475652c203138204d617220323031342031373a35303a3238202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383136353032382e3933344346453835454140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
35	d4bf6383744380b2f6434e0bdf4d056af1f71567                                                                                                                                                                                                                        	\\x6f6f6f6f6f6f6f6f6f6f0d0a	12
36	5d3947fa06bf8bb17629846cc442ec06aaaf9519                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420354430334145383545443b0a095475652c203138204d617220323031342031383a30373a3433202b303130302028434554290a446174653a205475652c203138204d617220323031342031383a30373a3433202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331383137303734332e3544303341453835454440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
37	d9b0f03bf7f830cf995f3fe3f76bd81bde7f6b56                                                                                                                                                                                                                        	\\x707070707070707070700d0a	12
38	eb35ce453da906d9affee8f5253159e9e14bb2da                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420443738384245383545453b0a095765642c203139204d617220323031342030393a35313a3131202b303130302028434554290a446174653a205765642c203139204d617220323031342030393a35313a3131202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393038353131312e4437383842453835454540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
39	25f310559aad6994450000702846aaf99042d070                                                                                                                                                                                                                        	\\x717171717171717171710d0a	12
40	1335292c21c327541968d7e0417d784ae11a3963                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420443134423145383545423b0a095765642c203139204d617220323031342030393a35333a3534202b303130302028434554290a446174653a205765642c203139204d617220323031342030393a35333a3534202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393038353335342e4431344231453835454240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
41	e2cec7a92bc8f34ae6e3199e1d7df1476463b3cb                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420384442323145383545453b0a095765642c203139204d617220323031342030393a35393a3131202b303130302028434554290a446174653a205765642c203139204d617220323031342030393a35393a3131202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393038353931312e3844423231453835454540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
42	7d65219918bf2e7ab538f57e43b66b8544baac83                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420393239434645383545443b0a095765642c203139204d617220323031342031303a30313a3532202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a30313a3532202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039303135322e3932394346453835454440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
86	cdde1932555dbdaf4725a946e5eff4702e0dba9a                                                                                                                                                                                                                        	\\x6369616f20706970706f20736f6e6f20656d616e75656c650d0a	26
43	79f6439e9a7a6958f718cc1926241312f30391d5                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420393936314145383545423b0a095765642c203139204d617220323031342031303a30343a3137202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a30343a3137202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039303431372e3939363141453835454240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
44	5cea3cf6e726d7ce8350df3525757f9fe6121dbf                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420354534383345383545423b0a095765642c203139204d617220323031342031303a30363a3132202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a30363a3132202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039303631322e3545343833453835454240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
45	9f7c3841d86797248b1599b956ee901e722d0b49                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420384532383845383546303b0a095765642c203139204d617220323031342031303a31313a3133202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a31313a3133202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039313131332e3845323838453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
46	50d80ca83a1dfef343ba117af3b973b1800ae723                                                                                                                                                                                                                        	\\x70726f7661330d0a	8
47	1917adf03e4c402c0828b337326c83d97ca320ad                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420384433313345383546323b0a095765642c203139204d617220323031342031303a31333a3538202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a31333a3538202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039313335382e3844333133453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
48	17b759a168b12a4540af3d4b39d892d62d4de40e                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420303939304545383545463b0a095765642c203139204d617220323031342031303a31343a3334202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a31343a3334202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039313433342e3039393045453835454640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
49	2aa3f8e10613b326dc9ad61f82bb2396aa0c990d                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420364538384545383546313b0a095765642c203139204d617220323031342031303a31393a3337202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a31393a3337202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039313933372e3645383845453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
50	53bd7b9b0649dccb69bd161888e156dd1740c431                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420383532334445383546313b0a095765642c203139204d617220323031342031303a32323a3337202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a32323a3337202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039323233372e3835323344453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
51	0f362938ec0d0d40b71d54fb09bb7d4e36b263f6                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420353643443045383545463b0a095765642c203139204d617220323031342031303a33313a3439202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a33313a3439202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039333134392e3536434430453835454640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
52	8570b792f3ca660b1e60b2f71ca17b70baa0673a                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420324243303645383546313b0a095765642c203139204d617220323031342031303a33363a3433202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a33363a3433202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039333634332e3242433036453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
53	e34122cdecf4e4332d5af00305fd23c42ab9f82c                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420323834423545383546313b0a095765642c203139204d617220323031342031303a33373a3435202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a33373a3435202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039333734352e3238344235453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
54	94effb7fc035efb0daa9ba2c5ee8daf7900c20ec                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420343434384445383546313b0a095765642c203139204d617220323031342031303a33393a3237202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a33393a3237202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039333932372e3434343844453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
55	5e4a462bba635fd7111ef192209319215b129cab                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420334236364345383546323b0a095765642c203139204d617220323031342031303a34343a3038202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a34343a3038202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039343430382e3342363643453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
56	af87048d22a426ff07ca16e4ddcc6202885295e7                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420443844434145383546323b0a095765642c203139204d617220323031342031303a35393a3534202b303130302028434554290a446174653a205765642c203139204d617220323031342031303a35393a3534202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393039353935342e4438444341453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
57	250d321aecfd8f7f5c7c557166f8597d9f036705                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420334535373245383545463b0a095765642c203139204d617220323031342031343a34313a3331202b303130302028434554290a446174653a205765642c203139204d617220323031342031343a34313a3331202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393133343133312e3345353732453835454640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
58	04909cfdeb410fc69566aade69b141902718fdd3                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420444330333245383545463b0a095765642c203139204d617220323031342031343a34393a3333202b303130302028434554290a446174653a205765642c203139204d617220323031342031343a34393a3333202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393133343933332e4443303332453835454640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
59	bc4f67540558b77025f0c4617b3ffe4680704b3f                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420353431463745383546323b0a095765642c203139204d617220323031342031343a35303a3137202b303130302028434554290a446174653a205765642c203139204d617220323031342031343a35303a3137202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393133353031372e3534314637453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
60	76957ec4f82624bd342b8461992ab5e050ef0384                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420374636314545383545463b0a095765642c203139204d617220323031342031343a35323a3539202b303130302028434554290a446174653a205765642c203139204d617220323031342031343a35323a3539202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393133353235392e3746363145453835454640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
61	913fa5cbff89765a0b7d4727f66b2d3000a13d2b                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420353837313645383546313b0a095765642c203139204d617220323031342031343a35373a3330202b303130302028434554290a446174653a205765642c203139204d617220323031342031343a35373a3330202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393133353733302e3538373136453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
62	cb8ade7d02e0b461e1d3a47e4882fd36e3dfe125                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420353737353745383546303b0a095765642c203139204d617220323031342031353a30313a3335202b303130302028434554290a446174653a205765642c203139204d617220323031342031353a30313a3335202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393134303133352e3537373537453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
63	0b705f68e2ff2e6c4883c50ad098c571b635950b                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420453543343545383546303b0a095765642c203139204d617220323031342031353a30353a3432202b303130302028434554290a446174653a205765642c203139204d617220323031342031353a30353a3432202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393134303534322e4535433435453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
64	fef1684a759388bf81ef6c439765862f4efd5299                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420453332313345383546313b0a095765642c203139204d617220323031342031353a32313a3431202b303130302028434554290a446174653a205765642c203139204d617220323031342031353a32313a3431202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393134323134312e4533323133453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
65	f8785823563c49dc59d2b195d11baaa76aaf3b2f                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420363739303645383546313b0a095765642c203139204d617220323031342031353a32353a3339202b303130302028434554290a446174653a205765642c203139204d617220323031342031353a32353a3339202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303331393134323533392e3637393036453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
66	77a56cb4a7ff031163054bb0478ca38a231b9dcf                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420363136343345383546303b0a095468752c203230204d617220323031342031313a33373a3138202b303130302028434554290a446174653a205468752c203230204d617220323031342031313a33373a3138202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303130333731382e3631363433453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
67	47b716d9b25f4ba9b45dfdeb3b4c3a21ac8e51de                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420353138443845383546313b0a095468752c203230204d617220323031342031313a34363a3436202b303130302028434554290a446174653a205468752c203230204d617220323031342031313a34363a3436202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303130343634362e3531384438453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
68	22623a67df22ea2670a862c3aea310baae3f117e                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420344337314545383546353b0a095468752c203230204d617220323031342031313a34373a3137202b303130302028434554290a446174653a205468752c203230204d617220323031342031313a34373a3137202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303130343731372e3443373145453835463540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
69	33335690120dda92de890ba3273459ff49618f48                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420393134434345383546323b0a095468752c203230204d617220323031342031313a33303a3234202b303130302028434554290a446174653a205468752c203230204d617220323031342031313a33303a3234202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303130333032342e3931344343453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
70	9659fa839e019f2c1413470d99c7870c85eb5fec                                                                                                                                                                                                                        	\\x6d61696c70726f76610d0a	11
71	eb3957a2a4cdc06a2d8510768f0ca7daa92393d9                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420323338314345383546323b0a095468752c203230204d617220323031342031313a34393a3237202b303130302028434554290a446174653a205468752c203230204d617220323031342031313a34393a3237202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303130343932372e3233383143453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
72	f2533a4f033e73907e11cd532f9e350ecfacbced                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420313237423445383546303b0a095468752c203230204d617220323031342031313a35303a3538202b303130302028434554290a446174653a205468752c203230204d617220323031342031313a35303a3538202b303130300a546f3a20746f706f6c696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303130353035382e3132374234453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
73	b5412cfe944d6571771829c9bd9862857980b422                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420353441433345383546313b0a095468752c203230204d617220323031342031313a35323a3035202b303130302028434554290a446174653a205468752c203230204d617220323031342031313a35323a3035202b303130300a546f3a207061706572696e6f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303130353230352e3534414333453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	462
74	7e1c4ca58ffde6a1a550efa0cae3b9af31dd919d                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d2075736572696420302909696420454235324345383546323b0a095468752c203230204d617220323031342031343a31333a3136202b303130302028434554290a446174653a205468752c203230204d617220323031342031343a31333a3136202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332303133313331362e4542353243453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20726f6f74203c726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20726f6f7440696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	459
75	6f1bc99a4296b9cfa074a1165ed372a1dbf89e33                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420363130463745383546313b205765642c203236204d617220323031342031303a31393a3134202b303130302028434554290a446174653a205765642c203236204d617220323031342031303a31393a3134202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363039313931342e3631304637453835463140696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	486
76	f8ee1d8445ace125011756f5d9cba4c2dada9146                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420353143344245383546303b205765642c203236204d617220323031342031303a34313a3239202b303130302028434554290a446174653a205765642c203236204d617220323031342031303a34313a3239202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363039343132392e3531433442453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	486
77	b8955bbd1c633cb7610662186d0b2c0f6279205c                                                                                                                                                                                                                        	\\x70726f7661310d0a	8
78	221c3880b087f8a8fc9a87376aebcc64cee22818                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420383242303345383546303b205765642c203236204d617220323031342031313a32373a3335202b303130302028434554290a446174653a205765642c203236204d617220323031342031313a32373a3335202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2070726f7661206d61696c0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363130323733352e3832423033453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
79	c1cb84bafd3cd71a7853a15d20bd8b83550c6e86                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420303644463645383546303b205765642c203236204d617220323031342031363a32373a3238202b303130302028434554290a446174653a205765642c203236204d617220323031342031363a32373a3238202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2070726f7661206d61696c0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363135323732382e3036444636453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
80	8b259fd1d57c179cc087223b028c6883076e4840                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420454331424445383546303b205765642c203236204d617220323031342031363a34313a3335202b303130302028434554290a446174653a205765642c203236204d617220323031342031363a34313a3335202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2070726f7661206d61696c0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363135343133352e4543314244453835463040696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
81	0a2a2fc234b8cdc97a909a57bd2f123147e49ee5                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420423146374145383546323b205765642c203236204d617220323031342031373a31303a3137202b303130302028434554290a446174653a205765642c203236204d617220323031342031373a31303a3137202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2070726f7661206d61696c0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363136313031372e4231463741453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
82	7c8d36a4424ae38620db23fabe37921604d93934                                                                                                                                                                                                                        	\\x76657269666963610d0a	10
83	8d0776867a6e88dcb2d6ddab81e6e0a1dda9d6cd                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420353141463445383546333b205765642c203236204d617220323031342031373a31313a3137202b303130302028434554290a446174653a205765642c203236204d617220323031342031373a31313a3137202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2070726f7661206d61696c0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363136313131372e3531414634453835463340696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
84	afdfcf26aaad87cf07fc8f1feac97fc8b46b84ae                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420354339434545383546333b205765642c203236204d617220323031342031373a31313a3539202b303130302028434554290a446174653a205765642c203236204d617220323031342031373a31313a3539202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2070726f7661206d61696c0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332363136313135392e3543394345453835463340696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
85	8ce2356d0fd4c3b720a8a70bceff0a51331cb0b4                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420433446313845383546343b205468752c203237204d617220323031342031303a30383a3334202b303130302028434554290a446174653a205468752c203237204d617220323031342031303a30383a3334202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a206369616f20706970706f0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332373039303833342e4334463138453835463440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
87	e630ec86888be0d9b08e98e73dac0f5c29b8a7ff                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420314344313545383546353b205468752c203237204d617220323031342031303a31383a3533202b303130302028434554290a446174653a205468752c203237204d617220323031342031303a31383a3533202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a206369616f20706970706f320a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332373039313835332e3143443135453835463540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	507
88	cfd4ebd23b93f85acf144737fd9fc7387d827806                                                                                                                                                                                                                        	\\x6369616f20706970706f20736f6e6f206361726c6f0d0a	23
89	14639a4ec2f48ffa88dc4983bfeec9b2d44744af                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420374234333945383546353b204672692c203238204d617220323031342031303a35393a3230202b303130302028434554290a446174653a204672692c203238204d617220323031342031303a35393a3230202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332383039353932302e3742343339453835463540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	486
90	8e36f069cf844d7bb561d7e13e01a21715a715d9                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420454542393545383546323b204672692c203238204d617220323031342031373a30383a3331202b303130302028434554290a446174653a204672692c203238204d617220323031342031373a30383a3331202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2068656c6c6f20706970706f0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332383136303833312e4545423935453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	507
91	742a125be10fe73d788e0e1a4e005116ccbcaf63                                                                                                                                                                                                                        	\\x6369616f20706970706f20736f6e6f20656d616e75656c65206f6d6520737461690d0a	35
92	54ef626156af1c9700e6a9cbfe77fc985ffb9b4c                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420344232323845383546353b204672692c203238204d617220323031342031373a30393a3338202b303130302028434554290a446174653a204672692c203238204d617220323031342031373a30393a3338202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a206369616f20706970706f320a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332383136303933382e3442323238453835463540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	507
93	bef92befb69266e0cc7cebfbe7dda0860e3a46ff                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420323944433345383546353b204672692c203238204d617220323031342031373a31313a3438202b303130302028434554290a446174653a204672692c203238204d617220323031342031373a31313a3438202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a206369616f20706970706f330a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332383136313134382e3239444333453835463540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	507
94	925552c4347cce3d9bead3e2301301280dfe4a24                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420363439433645383546323b204672692c203238204d617220323031342031373a31343a3531202b303130302028434554290a446174653a204672692c203238204d617220323031342031373a31343a3531202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a206369616f20706970706f330a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332383136313435312e3634394336453835463240696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	507
95	ba14dd4b1d634d0ddd2c513768b520d99e3f190c                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420463232453745383546343b204672692c203238204d617220323031342031373a31373a3231202b303130302028434554290a446174653a204672692c203238204d617220323031342031373a31373a3231202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2066756e7a696f6e69207369206f206e6f3f0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332383136313732312e4632324537453835463440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	513
96	4c3b9cbbf6762c414001c51bcfcb612991fc1682                                                                                                                                                                                                                        	\\x70726f76612066756e7a696f6e616d656e746f2065666665747469766f0d0a	31
97	aefea3b026b9939a24a46d3583466cc9ffb6af36                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420344144343345383546353b204672692c203238204d617220323031342031373a31373a3435202b303130302028434554290a446174653a204672692c203238204d617220323031342031373a31373a3435202b303130300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303332383136313734352e3441443433453835463540696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	486
98	39f9bc696123dd131b08ba19377203c87911050f                                                                                                                                                                                                                        	\\x70726f76612066756e7a696f6e616d656e746f2065666665747469766f320d0a	32
99	9fcf950fc4dea1b3ed490d26ed2299fd1c7e3679                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420353137464645383546343b205765642c2020322041707220323031342031353a31343a3435202b30323030202843455354290a446174653a205765642c2030322041707220323031342031353a31343a3435202b303230300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a2066756e7a696f6e693f0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303430323133313434352e3531374646453835463440696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	506
100	9be11aac13a1a737dda1b29c7e15e1ae2f0feab7                                                                                                                                                                                                                        	\\x70726f76612066756e7a696f6e616d656e746f0d0a	21
101	1685ad63fe86fd8120b02260eea14d9b57962a20                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420304544444245383546363b205765642c2020322041707220323031342031353a31353a3036202b30323030202843455354290a446174653a205765642c2030322041707220323031342031353a31353a3036202b303230300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303430323133313530362e3045444442453835463640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	487
102	1b51fdff5ad160f65e644de11962712b6364bdb0                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420453541443745383546333b205468752c2020332041707220323031342031343a32343a3239202b30323030202843455354290a446174653a205468752c2030332041707220323031342031343a32343a3239202b303230300a546f3a20706970706f40706970706f706c75746f2e636f6d0a5375626a6563743a20756c74696d612070726f7661206f6c650a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303430333132323432392e4535414437453835463340696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	513
103	a62d64495eb82e1c019c091102bff23066673172                                                                                                                                                                                                                        	\\x756c74696d612070726f7661206369616f2062656c6c6f0d0a	25
104	7e70ff237c62f9e0bc38b42da72eb2d0d1e1b3c0                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420453339304545383546363b205468752c2020332041707220323031342031373a31373a3330202b30323030202843455354290a446174653a205468752c2030332041707220323031342031373a31373a3330202b303230300a546f3a20706970706f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303430333135313733302e4533393045453835463640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	487
105	67bf017356fe58dbebb1171e7e33a40ecd2ec23c                                                                                                                                                                                                                        	\\x756c74696d612070726f7661206e657373756e207375626a6563740d0a	29
106	e3e16301135483ae6d94e90482f387bdce878139                                                                                                                                                                                                                        	\\x52656365697665643a20627920696e6f64652d70632d30332e6c6f63616c646f6d61696e2028506f73746669782c2066726f6d20757365726964203136373737323631290a09696420344438343845383546363b204672692c2020342041707220323031342031363a34383a3132202b30323030202843455354290a446174653a204672692c2030342041707220323031342031363a34383a3132202b303230300a546f3a206d6172636f40706970706f706c75746f2e636f6d0a557365722d4167656e743a20486569726c6f6f6d206d61696c782031322e3520372f352f31300a4d494d452d56657273696f6e3a20312e300a4d6573736167652d49643a203c32303134303430343134343831322e3444383438453835463640696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a46726f6d3a20456d616e75656c65204368696f737369203c656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e3e0a52657475726e2d506174683a20656368696f73736940696e6f64652d70632d30332e6c6f63616c646f6d61696e0a436f6e74656e742d547970653a20746578742f706c61696e3b20636861727365743d75732d61736369690a436f6e74656e742d5472616e736665722d456e636f64696e673a20376269740a	487
\.


--
-- Name: dbmail_mimeparts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_mimeparts_id_seq', 106, true);


--
-- Data for Name: dbmail_partlists; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_partlists (physmessage_id, is_header, part_key, part_depth, part_order, part_id) FROM stdin;
1	1	1	0	0	1
1	0	1	0	1	2
2	1	1	0	0	3
2	0	1	0	1	4
3	1	1	0	0	5
3	0	1	0	1	4
4	1	1	0	0	6
4	0	1	0	1	7
5	1	1	0	0	8
5	0	1	0	1	9
6	1	1	0	0	10
6	0	1	0	1	11
7	1	1	0	0	12
7	0	1	0	1	13
8	1	1	0	0	14
8	0	1	0	1	15
9	1	1	0	0	16
9	0	1	0	1	17
10	1	1	0	0	18
10	0	1	0	1	19
11	1	1	0	0	20
11	0	1	0	1	21
12	1	1	0	0	22
12	0	1	0	1	23
13	1	1	0	0	24
13	0	1	0	1	25
14	1	1	0	0	26
14	0	1	0	1	27
15	1	1	0	0	28
15	0	1	0	1	29
16	1	1	0	0	30
16	0	1	0	1	31
17	1	1	0	0	32
17	0	1	0	1	33
18	1	1	0	0	34
18	0	1	0	1	35
19	1	1	0	0	36
19	0	1	0	1	37
20	1	1	0	0	38
20	0	1	0	1	39
21	1	1	0	0	40
21	0	1	0	1	39
22	1	1	0	0	41
22	0	1	0	1	2
23	1	1	0	0	42
23	0	1	0	1	4
24	1	1	0	0	43
24	0	1	0	1	4
25	1	1	0	0	44
25	0	1	0	1	4
26	1	1	0	0	45
26	0	1	0	1	46
27	1	1	0	0	47
27	0	1	0	1	46
28	1	1	0	0	48
28	0	1	0	1	46
29	1	1	0	0	49
29	0	1	0	1	46
30	1	1	0	0	50
30	0	1	0	1	46
31	1	1	0	0	51
31	0	1	0	1	4
32	1	1	0	0	52
32	0	1	0	1	4
33	1	1	0	0	53
33	0	1	0	1	4
34	1	1	0	0	54
34	0	1	0	1	4
35	1	1	0	0	55
35	0	1	0	1	4
36	1	1	0	0	56
36	0	1	0	1	4
37	1	1	0	0	57
37	0	1	0	1	4
38	1	1	0	0	58
38	0	1	0	1	17
39	1	1	0	0	59
39	0	1	0	1	17
40	1	1	0	0	60
40	0	1	0	1	17
41	1	1	0	0	61
41	0	1	0	1	17
42	1	1	0	0	62
42	0	1	0	1	17
43	1	1	0	0	63
43	0	1	0	1	17
44	1	1	0	0	64
44	0	1	0	1	17
45	1	1	0	0	65
45	0	1	0	1	17
46	1	1	0	0	66
46	0	1	0	1	17
47	1	1	0	0	67
47	0	1	0	1	17
48	1	1	0	0	68
48	0	1	0	1	17
49	1	1	0	0	69
49	0	1	0	1	70
50	1	1	0	0	71
50	0	1	0	1	17
51	1	1	0	0	72
51	0	1	0	1	17
52	1	1	0	0	73
52	0	1	0	1	17
53	1	1	0	0	74
53	0	1	0	1	17
54	1	1	0	0	75
54	0	1	0	1	2
55	1	1	0	0	76
55	0	1	0	1	77
56	1	1	0	0	78
56	0	1	0	1	77
57	1	1	0	0	79
57	0	1	0	1	77
58	1	1	0	0	80
58	0	1	0	1	77
59	1	1	0	0	81
59	0	1	0	1	82
60	1	1	0	0	83
60	0	1	0	1	82
61	1	1	0	0	84
61	0	1	0	1	82
62	1	1	0	0	85
62	0	1	0	1	86
63	1	1	0	0	87
63	0	1	0	1	88
64	1	1	0	0	89
64	0	1	0	1	88
65	1	1	0	0	90
65	0	1	0	1	91
66	1	1	0	0	92
66	0	1	0	1	88
67	1	1	0	0	93
67	0	1	0	1	88
68	1	1	0	0	94
68	0	1	0	1	88
69	1	1	0	0	95
69	0	1	0	1	96
70	1	1	0	0	97
70	0	1	0	1	98
71	1	1	0	0	99
71	0	1	0	1	100
72	1	1	0	0	101
72	0	1	0	1	100
73	1	1	0	0	102
73	0	1	0	1	103
74	1	1	0	0	104
74	0	1	0	1	105
75	1	1	0	0	106
75	0	1	0	1	105
\.


--
-- Data for Name: dbmail_pbsp; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_pbsp (idnr, since, ipnumber) FROM stdin;
\.


--
-- Data for Name: dbmail_physmessage; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_physmessage (id, messagesize, rfcsize, internal_date) FROM stdin;
1	439	439	2014-03-07 09:44:14
2	440	440	2014-03-07 10:34:11
3	440	440	2014-03-07 11:43:20
4	443	443	2014-03-14 10:03:23
5	444	444	2014-03-18 08:42:53
6	444	444	2014-03-18 08:49:18
7	444	444	2014-03-18 09:03:54
8	444	444	2014-03-18 11:53:57
9	438	438	2014-03-18 15:20:06
10	444	444	2014-03-18 15:23:32
11	444	444	2014-03-18 15:34:11
12	444	444	2014-03-18 15:53:23
13	444	444	2014-03-18 15:57:48
14	444	444	2014-03-18 16:03:49
15	444	444	2014-03-18 16:22:43
16	444	444	2014-03-18 16:24:09
17	444	444	2014-03-18 16:40:52
18	444	444	2014-03-18 16:50:28
19	444	444	2014-03-18 17:07:43
20	444	444	2014-03-19 08:51:11
21	444	444	2014-03-19 08:53:54
22	439	439	2014-03-19 08:59:11
23	440	440	2014-03-19 09:01:52
24	440	440	2014-03-19 09:04:17
25	440	440	2014-03-19 09:06:12
26	440	440	2014-03-19 09:11:13
27	440	440	2014-03-19 09:13:58
28	440	440	2014-03-19 09:14:34
29	440	440	2014-03-19 09:19:37
30	440	440	2014-03-19 09:22:37
31	440	440	2014-03-19 09:31:49
32	440	440	2014-03-19 09:36:43
33	440	440	2014-03-19 09:37:45
34	440	440	2014-03-19 09:39:27
35	440	440	2014-03-19 09:44:08
36	440	440	2014-03-19 09:59:54
37	440	440	2014-03-19 13:41:31
38	438	438	2014-03-19 13:49:33
39	438	438	2014-03-19 13:50:17
40	435	435	2014-03-19 13:52:59
41	435	435	2014-03-19 13:57:30
42	438	438	2014-03-19 14:01:35
43	438	438	2014-03-19 14:05:42
44	438	438	2014-03-19 14:21:41
45	435	435	2014-03-19 14:25:39
46	438	438	2014-03-20 10:43:04
47	435	435	2014-03-20 10:46:46
48	435	435	2014-03-20 10:47:17
49	440	440	2014-03-20 10:48:04
50	435	435	2014-03-20 10:49:27
51	438	438	2014-03-20 10:50:58
52	438	438	2014-03-20 10:52:05
53	435	435	2014-03-20 13:13:17
54	459	459	2014-03-26 09:19:14
55	460	460	2014-03-26 09:41:29
56	481	481	2014-03-26 10:27:35
57	481	481	2014-03-26 15:27:28
58	481	481	2014-03-26 15:41:36
59	483	483	2014-03-26 16:10:17
60	483	483	2014-03-26 16:11:17
61	483	483	2014-03-26 16:11:59
62	499	499	2014-03-27 09:08:34
63	497	497	2014-03-27 09:18:53
64	475	475	2014-03-28 09:59:20
65	509	509	2014-03-28 16:08:32
66	497	497	2014-03-28 16:09:38
67	497	497	2014-03-28 16:11:48
68	497	497	2014-03-28 16:14:51
69	511	511	2014-03-28 16:17:22
70	484	484	2014-03-28 16:17:45
71	494	494	2014-04-02 13:14:45
72	474	474	2014-04-02 13:15:06
73	505	505	2014-04-03 12:24:29
74	482	482	2014-04-03 15:17:30
75	482	482	2014-04-04 14:48:12
\.


--
-- Name: dbmail_physmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_physmessage_id_seq', 75, true);


--
-- Data for Name: dbmail_referencesfield; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_referencesfield (physmessage_id, id, referencesfield) FROM stdin;
\.


--
-- Name: dbmail_referencesfield_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_referencesfield_idnr_seq', 1, false);


--
-- Data for Name: dbmail_replycache; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_replycache (to_addr, from_addr, handle, lastseen) FROM stdin;
\.


--
-- Name: dbmail_seq_pbsp_id; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_seq_pbsp_id', 1, false);


--
-- Data for Name: dbmail_sievescripts; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_sievescripts (id, owner_idnr, active, name, script) FROM stdin;
\.


--
-- Name: dbmail_sievescripts_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_sievescripts_idnr_seq', 1, false);


--
-- Data for Name: dbmail_subscription; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_subscription (user_id, mailbox_id) FROM stdin;
1	8
\.


--
-- Name: dbmail_user_idnr_seq; Type: SEQUENCE SET; Schema: public; Owner: dbmail
--

SELECT pg_catalog.setval('dbmail_user_idnr_seq', 83, true);


--
-- Data for Name: dbmail_usermap; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_usermap (login, sock_allow, sock_deny, userid) FROM stdin;
\.


--
-- Data for Name: dbmail_users; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY dbmail_users (user_idnr, userid, passwd, client_idnr, maxmail_size, curmail_size, maxsieve_size, cursieve_size, encryption_type, last_login) FROM stdin;
1	__@!internal_delivery_user!@__		0	0	0	0	0	md5	1979-11-03 22:05:58
2	anyone		0	0	0	0	0	md5	1979-11-03 22:05:58
3	__public__		0	0	0	0	0	md5	1979-11-03 22:05:58
5	maxper@dbmailtest.it		0	0	0	0	0		1979-11-03 22:05:58
83	marco@pippopluto.com	gVTn5CPq	0	0	0	0	0		2014-04-04 17:11:19.824
41	pippo@pippopluto.com	SwGORIKS	0	0	12847	0	0		2014-03-26 11:23:41
9	paperino@pippopluto.com	p4ssw0rd	0	0	7913	0	0		2014-03-07 11:35:11
42	pluto@pippopluto.com	7knrIUA7	0	0	0	0	0		2014-03-20 12:10:02.696
\.


--
-- Data for Name: tempmailbox; Type: TABLE DATA; Schema: public; Owner: dbmail
--

COPY tempmailbox (creationdate, refreshdate, mailbox_idnr) FROM stdin;
2014-04-08 12:34:00	2014-04-08 12:34:00	2
2014-04-08 12:34:00	2014-04-08 12:34:00	3
2014-04-08 12:34:00	2014-04-08 12:34:00	8
2014-04-08 12:34:00	2014-04-08 12:34:00	7
2014-04-08 12:34:00	2014-04-09 13:36:27	39
2014-04-08 12:34:00	2014-04-09 13:36:27	80
2014-04-08 12:34:00	2014-04-09 13:36:27	38
\.


--
-- Name: dbmail_acl_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_acl
    ADD CONSTRAINT dbmail_acl_pkey PRIMARY KEY (user_id, mailbox_id);


--
-- Name: dbmail_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_aliases
    ADD CONSTRAINT dbmail_aliases_pkey PRIMARY KEY (alias_idnr);


--
-- Name: dbmail_auto_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_auto_notifications
    ADD CONSTRAINT dbmail_auto_notifications_pkey PRIMARY KEY (user_idnr);


--
-- Name: dbmail_auto_replies_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_auto_replies
    ADD CONSTRAINT dbmail_auto_replies_pkey PRIMARY KEY (user_idnr);


--
-- Name: dbmail_envelope_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_envelope
    ADD CONSTRAINT dbmail_envelope_pkey PRIMARY KEY (id);


--
-- Name: dbmail_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_filters
    ADD CONSTRAINT dbmail_filters_pkey PRIMARY KEY (user_id, id);


--
-- Name: dbmail_header_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_header
    ADD CONSTRAINT dbmail_header_pkey PRIMARY KEY (physmessage_id, headername_id, headervalue_id);


--
-- Name: dbmail_headername_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_headername
    ADD CONSTRAINT dbmail_headername_pkey PRIMARY KEY (id);


--
-- Name: dbmail_headervalue_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_headervalue
    ADD CONSTRAINT dbmail_headervalue_pkey PRIMARY KEY (id);


--
-- Name: dbmail_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_keywords
    ADD CONSTRAINT dbmail_keywords_pkey PRIMARY KEY (message_idnr, keyword);


--
-- Name: dbmail_mailboxes_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_mailboxes
    ADD CONSTRAINT dbmail_mailboxes_pkey PRIMARY KEY (mailbox_idnr);


--
-- Name: dbmail_messageblks_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_messageblks
    ADD CONSTRAINT dbmail_messageblks_pkey PRIMARY KEY (messageblk_idnr);


--
-- Name: dbmail_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_messages
    ADD CONSTRAINT dbmail_messages_pkey PRIMARY KEY (message_idnr);


--
-- Name: dbmail_mimeparts_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_mimeparts
    ADD CONSTRAINT dbmail_mimeparts_pkey PRIMARY KEY (id);


--
-- Name: dbmail_pbsp_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_pbsp
    ADD CONSTRAINT dbmail_pbsp_pkey PRIMARY KEY (idnr);


--
-- Name: dbmail_physmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_physmessage
    ADD CONSTRAINT dbmail_physmessage_pkey PRIMARY KEY (id);


--
-- Name: dbmail_referencesfield_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_referencesfield
    ADD CONSTRAINT dbmail_referencesfield_pkey PRIMARY KEY (id);


--
-- Name: dbmail_sievescripts_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_sievescripts
    ADD CONSTRAINT dbmail_sievescripts_pkey PRIMARY KEY (id);


--
-- Name: dbmail_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_subscription
    ADD CONSTRAINT dbmail_subscription_pkey PRIMARY KEY (user_id, mailbox_id);


--
-- Name: dbmail_users_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY dbmail_users
    ADD CONSTRAINT dbmail_users_pkey PRIMARY KEY (user_idnr);


--
-- Name: tempmailbox_pkey; Type: CONSTRAINT; Schema: public; Owner: dbmail; Tablespace: 
--

ALTER TABLE ONLY tempmailbox
    ADD CONSTRAINT tempmailbox_pkey PRIMARY KEY (mailbox_idnr);


--
-- Name: dbmail_aliases_alias_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_aliases_alias_idx ON dbmail_aliases USING btree (alias);


--
-- Name: dbmail_aliases_alias_low_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_aliases_alias_low_idx ON dbmail_aliases USING btree (lower((alias)::text));


--
-- Name: dbmail_envelope_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_envelope_1 ON dbmail_envelope USING btree (physmessage_id);


--
-- Name: dbmail_envelope_2; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_envelope_2 ON dbmail_envelope USING btree (physmessage_id, id);


--
-- Name: dbmail_header_headername_id_key; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_header_headername_id_key ON dbmail_header USING btree (headername_id);


--
-- Name: dbmail_header_headervalue_id_key; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_header_headervalue_id_key ON dbmail_header USING btree (headervalue_id);


--
-- Name: dbmail_header_physmessage_id_key; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_header_physmessage_id_key ON dbmail_header USING btree (physmessage_id);


--
-- Name: dbmail_headername_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_headername_1 ON dbmail_headername USING btree (lower((headername)::text));


--
-- Name: dbmail_headervalue_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_headervalue_1 ON dbmail_headervalue USING btree (hash);


--
-- Name: dbmail_headervalue_2; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_headervalue_2 ON dbmail_headervalue USING btree (sortfield);


--
-- Name: dbmail_headervalue_3; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_headervalue_3 ON dbmail_headervalue USING btree (datefield);


--
-- Name: dbmail_idx_ipnumber; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_idx_ipnumber ON dbmail_pbsp USING btree (ipnumber);


--
-- Name: dbmail_idx_since; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_idx_since ON dbmail_pbsp USING btree (since);


--
-- Name: dbmail_mailboxes_name_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_mailboxes_name_idx ON dbmail_mailboxes USING btree (name);


--
-- Name: dbmail_mailboxes_owner_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_mailboxes_owner_idx ON dbmail_mailboxes USING btree (owner_idnr);


--
-- Name: dbmail_mailboxes_owner_name_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_mailboxes_owner_name_idx ON dbmail_mailboxes USING btree (owner_idnr, name);


--
-- Name: dbmail_mailboxes_seq; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_mailboxes_seq ON dbmail_mailboxes USING btree (seq);


--
-- Name: dbmail_messageblks_physmessage_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messageblks_physmessage_idx ON dbmail_messageblks USING btree (physmessage_id);


--
-- Name: dbmail_messageblks_physmessage_is_header_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messageblks_physmessage_is_header_idx ON dbmail_messageblks USING btree (physmessage_id, is_header);


--
-- Name: dbmail_messages_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_1 ON dbmail_messages USING btree (mailbox_idnr);


--
-- Name: dbmail_messages_2; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_2 ON dbmail_messages USING btree (physmessage_id);


--
-- Name: dbmail_messages_3; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_3 ON dbmail_messages USING btree (seen_flag);


--
-- Name: dbmail_messages_4; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_4 ON dbmail_messages USING btree (unique_id);


--
-- Name: dbmail_messages_5; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_5 ON dbmail_messages USING btree (status);


--
-- Name: dbmail_messages_6; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_6 ON dbmail_messages USING btree (status) WHERE (status < (2)::smallint);


--
-- Name: dbmail_messages_7; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_7 ON dbmail_messages USING btree (mailbox_idnr, status, seen_flag);


--
-- Name: dbmail_messages_8; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_messages_8 ON dbmail_messages USING btree (mailbox_idnr, status, recent_flag);


--
-- Name: dbmail_mimeparts_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_mimeparts_1 ON dbmail_mimeparts USING btree (hash);


--
-- Name: dbmail_partlists_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_partlists_1 ON dbmail_partlists USING btree (physmessage_id);


--
-- Name: dbmail_partlists_2; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_partlists_2 ON dbmail_partlists USING btree (part_id);


--
-- Name: dbmail_referencesfield_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_referencesfield_1 ON dbmail_referencesfield USING btree (physmessage_id, referencesfield);


--
-- Name: dbmail_sievescripts_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_sievescripts_1 ON dbmail_sievescripts USING btree (owner_idnr, name);


--
-- Name: dbmail_sievescripts_2; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_sievescripts_2 ON dbmail_sievescripts USING btree (owner_idnr, active);


--
-- Name: dbmail_users_2; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE INDEX dbmail_users_2 ON dbmail_users USING btree (lower((userid)::text));


--
-- Name: dbmail_users_name_idx; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX dbmail_users_name_idx ON dbmail_users USING btree (userid);


--
-- Name: message_parts; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX message_parts ON dbmail_partlists USING btree (physmessage_id, part_key, part_depth, part_order);


--
-- Name: replycache_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX replycache_1 ON dbmail_replycache USING btree (to_addr, from_addr, handle);


--
-- Name: usermap_idx_1; Type: INDEX; Schema: public; Owner: dbmail; Tablespace: 
--

CREATE UNIQUE INDEX usermap_idx_1 ON dbmail_usermap USING btree (login, sock_allow, userid);


--
-- Name: dbmail_acl_mailbox_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_acl
    ADD CONSTRAINT dbmail_acl_mailbox_id_fkey FOREIGN KEY (mailbox_id) REFERENCES dbmail_mailboxes(mailbox_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_acl_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_acl
    ADD CONSTRAINT dbmail_acl_user_id_fkey FOREIGN KEY (user_id) REFERENCES dbmail_users(user_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_auto_notifications_user_idnr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_auto_notifications
    ADD CONSTRAINT dbmail_auto_notifications_user_idnr_fkey FOREIGN KEY (user_idnr) REFERENCES dbmail_users(user_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_auto_replies_user_idnr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_auto_replies
    ADD CONSTRAINT dbmail_auto_replies_user_idnr_fkey FOREIGN KEY (user_idnr) REFERENCES dbmail_users(user_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_envelope_physmessage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_envelope
    ADD CONSTRAINT dbmail_envelope_physmessage_id_fkey FOREIGN KEY (physmessage_id) REFERENCES dbmail_physmessage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_filters_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_filters
    ADD CONSTRAINT dbmail_filters_user_id_fkey FOREIGN KEY (user_id) REFERENCES dbmail_users(user_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_header_headername_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_header
    ADD CONSTRAINT dbmail_header_headername_id_fkey FOREIGN KEY (headername_id) REFERENCES dbmail_headername(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_header_headervalue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_header
    ADD CONSTRAINT dbmail_header_headervalue_id_fkey FOREIGN KEY (headervalue_id) REFERENCES dbmail_headervalue(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_header_physmessage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_header
    ADD CONSTRAINT dbmail_header_physmessage_id_fkey FOREIGN KEY (physmessage_id) REFERENCES dbmail_physmessage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_keywords_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_keywords
    ADD CONSTRAINT dbmail_keywords_fkey FOREIGN KEY (message_idnr) REFERENCES dbmail_messages(message_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_mailboxes_owner_idnr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_mailboxes
    ADD CONSTRAINT dbmail_mailboxes_owner_idnr_fkey FOREIGN KEY (owner_idnr) REFERENCES dbmail_users(user_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_messageblks_physmessage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_messageblks
    ADD CONSTRAINT dbmail_messageblks_physmessage_id_fkey FOREIGN KEY (physmessage_id) REFERENCES dbmail_physmessage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_messages_mailbox_idnr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_messages
    ADD CONSTRAINT dbmail_messages_mailbox_idnr_fkey FOREIGN KEY (mailbox_idnr) REFERENCES dbmail_mailboxes(mailbox_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_messages_physmessage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_messages
    ADD CONSTRAINT dbmail_messages_physmessage_id_fkey FOREIGN KEY (physmessage_id) REFERENCES dbmail_physmessage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_partlists_part_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_partlists
    ADD CONSTRAINT dbmail_partlists_part_id_fkey FOREIGN KEY (part_id) REFERENCES dbmail_mimeparts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_partlists_physmessage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_partlists
    ADD CONSTRAINT dbmail_partlists_physmessage_id_fkey FOREIGN KEY (physmessage_id) REFERENCES dbmail_physmessage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_referencesfield_physmessage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_referencesfield
    ADD CONSTRAINT dbmail_referencesfield_physmessage_id_fkey FOREIGN KEY (physmessage_id) REFERENCES dbmail_physmessage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_sievescripts_owner_idnr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_sievescripts
    ADD CONSTRAINT dbmail_sievescripts_owner_idnr_fkey FOREIGN KEY (owner_idnr) REFERENCES dbmail_users(user_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_subscription_mailbox_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_subscription
    ADD CONSTRAINT dbmail_subscription_mailbox_id_fkey FOREIGN KEY (mailbox_id) REFERENCES dbmail_mailboxes(mailbox_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dbmail_subscription_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY dbmail_subscription
    ADD CONSTRAINT dbmail_subscription_user_id_fkey FOREIGN KEY (user_id) REFERENCES dbmail_users(user_idnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk646b4e209280dfb9; Type: FK CONSTRAINT; Schema: public; Owner: dbmail
--

ALTER TABLE ONLY tempmailbox
    ADD CONSTRAINT fk646b4e209280dfb9 FOREIGN KEY (mailbox_idnr) REFERENCES dbmail_mailboxes(mailbox_idnr);


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

