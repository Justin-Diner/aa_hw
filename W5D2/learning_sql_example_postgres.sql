--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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

--
-- Name: account_status; Type: TYPE; Schema: public; Owner: jcdiner
--

CREATE TYPE public.account_status AS ENUM (
    'ACTIVE',
    'CLOSED',
    'FROZEN'
);


ALTER TYPE public.account_status OWNER TO jcdiner;

--
-- Name: customer_type; Type: TYPE; Schema: public; Owner: jcdiner
--

CREATE TYPE public.customer_type AS ENUM (
    'I',
    'B'
);


ALTER TYPE public.customer_type OWNER TO jcdiner;

--
-- Name: transaction_type; Type: TYPE; Schema: public; Owner: jcdiner
--

CREATE TYPE public.transaction_type AS ENUM (
    'DBT',
    'CDT'
);


ALTER TYPE public.transaction_type OWNER TO jcdiner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.account (
    account_id integer NOT NULL,
    product_cd character varying(10) NOT NULL,
    cust_id integer NOT NULL,
    open_date date NOT NULL,
    close_date date,
    last_activity_date date,
    status public.account_status,
    open_branch_id integer,
    open_emp_id integer,
    avail_balance double precision,
    pending_balance double precision
);


ALTER TABLE public.account OWNER TO jcdiner;

--
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: jcdiner
--

CREATE SEQUENCE public.account_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_account_id_seq OWNER TO jcdiner;

--
-- Name: account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcdiner
--

ALTER SEQUENCE public.account_account_id_seq OWNED BY public.account.account_id;


--
-- Name: branch; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.branch (
    branch_id integer NOT NULL,
    name character varying(20) NOT NULL,
    address character varying(30),
    city character varying(20),
    state character varying(2),
    zip character varying(12)
);


ALTER TABLE public.branch OWNER TO jcdiner;

--
-- Name: branch_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: jcdiner
--

CREATE SEQUENCE public.branch_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branch_branch_id_seq OWNER TO jcdiner;

--
-- Name: branch_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcdiner
--

ALTER SEQUENCE public.branch_branch_id_seq OWNED BY public.branch.branch_id;


--
-- Name: business; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.business (
    cust_id integer NOT NULL,
    name character varying(40) NOT NULL,
    state_id character varying(10) NOT NULL,
    incorp_date date
);


ALTER TABLE public.business OWNER TO jcdiner;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.customer (
    cust_id integer NOT NULL,
    fed_id character varying(12) NOT NULL,
    cust_type_cd public.customer_type NOT NULL,
    address character varying(30),
    city character varying(20),
    state character varying(20),
    postal_code character varying(10)
);


ALTER TABLE public.customer OWNER TO jcdiner;

--
-- Name: customer_cust_id_seq; Type: SEQUENCE; Schema: public; Owner: jcdiner
--

CREATE SEQUENCE public.customer_cust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_cust_id_seq OWNER TO jcdiner;

--
-- Name: customer_cust_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcdiner
--

ALTER SEQUENCE public.customer_cust_id_seq OWNED BY public.customer.cust_id;


--
-- Name: department; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.department (
    dept_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.department OWNER TO jcdiner;

--
-- Name: department_dept_id_seq; Type: SEQUENCE; Schema: public; Owner: jcdiner
--

CREATE SEQUENCE public.department_dept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_dept_id_seq OWNER TO jcdiner;

--
-- Name: department_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcdiner
--

ALTER SEQUENCE public.department_dept_id_seq OWNED BY public.department.dept_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.employee (
    emp_id integer NOT NULL,
    fname character varying(20) NOT NULL,
    lname character varying(20) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    superior_emp_id integer,
    dept_id integer,
    title character varying(20),
    assigned_branch_id integer
);


ALTER TABLE public.employee OWNER TO jcdiner;

--
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: jcdiner
--

CREATE SEQUENCE public.employee_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_emp_id_seq OWNER TO jcdiner;

--
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcdiner
--

ALTER SEQUENCE public.employee_emp_id_seq OWNED BY public.employee.emp_id;


--
-- Name: individual; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.individual (
    cust_id integer NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    birth_date date
);


ALTER TABLE public.individual OWNER TO jcdiner;

--
-- Name: officer; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.officer (
    officer_id integer NOT NULL,
    cust_id integer NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    title character varying(20),
    start_date date NOT NULL,
    end_date date
);


ALTER TABLE public.officer OWNER TO jcdiner;

--
-- Name: officer_officer_id_seq; Type: SEQUENCE; Schema: public; Owner: jcdiner
--

CREATE SEQUENCE public.officer_officer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.officer_officer_id_seq OWNER TO jcdiner;

--
-- Name: officer_officer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcdiner
--

ALTER SEQUENCE public.officer_officer_id_seq OWNED BY public.officer.officer_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.product (
    product_cd character varying(10) NOT NULL,
    name character varying(50) NOT NULL,
    product_type_cd character varying(10) NOT NULL,
    date_offered date,
    date_retired date
);


ALTER TABLE public.product OWNER TO jcdiner;

--
-- Name: product_type; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.product_type (
    product_type_cd character varying(10) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.product_type OWNER TO jcdiner;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: jcdiner
--

CREATE TABLE public.transaction (
    txn_id integer NOT NULL,
    txn_date timestamp without time zone NOT NULL,
    account_id integer NOT NULL,
    txn_type_cd public.transaction_type,
    amount double precision NOT NULL,
    teller_emp_id integer,
    execution_branch_id integer,
    funds_avail_date timestamp without time zone
);


ALTER TABLE public.transaction OWNER TO jcdiner;

--
-- Name: transaction_txn_id_seq; Type: SEQUENCE; Schema: public; Owner: jcdiner
--

CREATE SEQUENCE public.transaction_txn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_txn_id_seq OWNER TO jcdiner;

--
-- Name: transaction_txn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jcdiner
--

ALTER SEQUENCE public.transaction_txn_id_seq OWNED BY public.transaction.txn_id;


--
-- Name: account account_id; Type: DEFAULT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.account ALTER COLUMN account_id SET DEFAULT nextval('public.account_account_id_seq'::regclass);


--
-- Name: branch branch_id; Type: DEFAULT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.branch ALTER COLUMN branch_id SET DEFAULT nextval('public.branch_branch_id_seq'::regclass);


--
-- Name: customer cust_id; Type: DEFAULT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.customer ALTER COLUMN cust_id SET DEFAULT nextval('public.customer_cust_id_seq'::regclass);


--
-- Name: department dept_id; Type: DEFAULT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.department ALTER COLUMN dept_id SET DEFAULT nextval('public.department_dept_id_seq'::regclass);


--
-- Name: employee emp_id; Type: DEFAULT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.employee ALTER COLUMN emp_id SET DEFAULT nextval('public.employee_emp_id_seq'::regclass);


--
-- Name: officer officer_id; Type: DEFAULT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.officer ALTER COLUMN officer_id SET DEFAULT nextval('public.officer_officer_id_seq'::regclass);


--
-- Name: transaction txn_id; Type: DEFAULT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.transaction ALTER COLUMN txn_id SET DEFAULT nextval('public.transaction_txn_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.account (account_id, product_cd, cust_id, open_date, close_date, last_activity_date, status, open_branch_id, open_emp_id, avail_balance, pending_balance) FROM stdin;
1	CHK	1	2004-01-15	\N	2009-01-04	ACTIVE	2	10	1057.75	1057.75
2	SAV	1	2004-01-15	\N	2008-12-19	ACTIVE	2	10	500	500
3	CD	1	2008-06-30	\N	2008-06-30	ACTIVE	2	10	3000	3000
4	CHK	2	2005-03-12	\N	2008-12-27	ACTIVE	2	10	2258.02	2258.02
5	SAV	2	2005-03-12	\N	2008-12-11	ACTIVE	2	10	200	200
6	CHK	3	2006-11-23	\N	2008-11-30	ACTIVE	3	13	1057.75	1057.75
7	MM	3	2006-12-15	\N	2008-12-05	ACTIVE	3	13	2212.5	2212.5
8	CHK	4	2007-09-12	\N	2009-01-03	ACTIVE	1	1	534.12	534.12
9	SAV	4	2004-01-15	\N	2008-10-24	ACTIVE	1	1	767.77	767.77
10	MM	4	2008-09-30	\N	2008-11-11	ACTIVE	1	1	5487.09	5487.09
11	CHK	5	2008-01-27	\N	2009-01-05	ACTIVE	4	16	2237.97	2897.97
12	CHK	6	2006-08-24	\N	2008-11-29	ACTIVE	1	1	122.37	122.37
13	CD	6	2008-12-28	\N	2008-12-28	ACTIVE	1	1	10000	10000
14	CD	7	2008-01-12	\N	2008-01-12	ACTIVE	2	10	5000	5000
15	CHK	8	2005-05-23	\N	2009-01-03	ACTIVE	4	16	3487.19	3487.19
16	SAV	8	2005-05-23	\N	2008-10-12	ACTIVE	4	16	387.99	387.99
17	CHK	9	2007-07-30	\N	2008-12-15	ACTIVE	1	1	125.67	125.67
18	MM	9	2008-10-28	\N	2008-10-28	ACTIVE	1	1	9345.55	9845.55
19	CD	9	2008-06-30	\N	2008-06-30	ACTIVE	1	1	1500	1500
20	CHK	10	2006-09-30	\N	2008-12-15	ACTIVE	4	16	23575.12	23575.12
21	BUS	10	2006-10-01	\N	2008-08-28	ACTIVE	4	16	0	0
22	BUS	11	2008-03-22	\N	2008-11-14	ACTIVE	2	10	9345.55	9345.55
23	CHK	12	2007-07-30	\N	2008-12-15	ACTIVE	4	16	38552.05	38552.05
24	SBL	13	2008-02-22	\N	2008-12-17	ACTIVE	3	13	50000	50000
25	CHK	1	2004-01-15	\N	2009-01-04	ACTIVE	2	10	1057.75	1057.75
26	SAV	1	2004-01-15	\N	2008-12-19	ACTIVE	2	10	500	500
27	CD	1	2008-06-30	\N	2008-06-30	ACTIVE	2	10	3000	3000
28	CHK	14	2004-01-15	\N	2009-01-04	ACTIVE	2	10	1057.75	1057.75
29	SAV	14	2004-01-15	\N	2008-12-19	ACTIVE	2	10	500	500
30	CD	14	2008-06-30	\N	2008-06-30	ACTIVE	2	10	3000	3000
31	CHK	2	2005-03-12	\N	2008-12-27	ACTIVE	2	10	2258.02	2258.02
32	SAV	2	2005-03-12	\N	2008-12-11	ACTIVE	2	10	200	200
33	CHK	15	2005-03-12	\N	2008-12-27	ACTIVE	2	10	2258.02	2258.02
34	SAV	15	2005-03-12	\N	2008-12-11	ACTIVE	2	10	200	200
35	CHK	3	2006-11-23	\N	2008-11-30	ACTIVE	3	13	1057.75	1057.75
36	MM	3	2006-12-15	\N	2008-12-05	ACTIVE	3	13	2212.5	2212.5
37	CHK	16	2006-11-23	\N	2008-11-30	ACTIVE	3	13	1057.75	1057.75
38	MM	16	2006-12-15	\N	2008-12-05	ACTIVE	3	13	2212.5	2212.5
39	CHK	4	2007-09-12	\N	2009-01-03	ACTIVE	1	1	534.12	534.12
40	SAV	4	2004-01-15	\N	2008-10-24	ACTIVE	1	1	767.77	767.77
41	MM	4	2008-09-30	\N	2008-11-11	ACTIVE	1	1	5487.09	5487.09
42	CHK	17	2007-09-12	\N	2009-01-03	ACTIVE	1	1	534.12	534.12
43	SAV	17	2004-01-15	\N	2008-10-24	ACTIVE	1	1	767.77	767.77
44	MM	17	2008-09-30	\N	2008-11-11	ACTIVE	1	1	5487.09	5487.09
45	CHK	5	2008-01-27	\N	2009-01-05	ACTIVE	4	16	2237.97	2897.97
46	CHK	18	2008-01-27	\N	2009-01-05	ACTIVE	4	16	2237.97	2897.97
47	CHK	6	2006-08-24	\N	2008-11-29	ACTIVE	1	1	122.37	122.37
48	CD	6	2008-12-28	\N	2008-12-28	ACTIVE	1	1	10000	10000
49	CHK	19	2006-08-24	\N	2008-11-29	ACTIVE	1	1	122.37	122.37
50	CD	19	2008-12-28	\N	2008-12-28	ACTIVE	1	1	10000	10000
51	CD	7	2008-01-12	\N	2008-01-12	ACTIVE	2	10	5000	5000
52	CD	20	2008-01-12	\N	2008-01-12	ACTIVE	2	10	5000	5000
53	CHK	8	2005-05-23	\N	2009-01-03	ACTIVE	4	16	3487.19	3487.19
54	SAV	8	2005-05-23	\N	2008-10-12	ACTIVE	4	16	387.99	387.99
55	CHK	21	2005-05-23	\N	2009-01-03	ACTIVE	4	16	3487.19	3487.19
56	SAV	21	2005-05-23	\N	2008-10-12	ACTIVE	4	16	387.99	387.99
57	CHK	9	2007-07-30	\N	2008-12-15	ACTIVE	1	1	125.67	125.67
58	MM	9	2008-10-28	\N	2008-10-28	ACTIVE	1	1	9345.55	9845.55
59	CD	9	2008-06-30	\N	2008-06-30	ACTIVE	1	1	1500	1500
60	CHK	22	2007-07-30	\N	2008-12-15	ACTIVE	1	1	125.67	125.67
61	MM	22	2008-10-28	\N	2008-10-28	ACTIVE	1	1	9345.55	9845.55
62	CD	22	2008-06-30	\N	2008-06-30	ACTIVE	1	1	1500	1500
63	CHK	10	2006-09-30	\N	2008-12-15	ACTIVE	4	16	23575.12	23575.12
64	BUS	10	2006-10-01	\N	2008-08-28	ACTIVE	4	16	0	0
65	CHK	23	2006-09-30	\N	2008-12-15	ACTIVE	4	16	23575.12	23575.12
66	BUS	23	2006-10-01	\N	2008-08-28	ACTIVE	4	16	0	0
67	BUS	11	2008-03-22	\N	2008-11-14	ACTIVE	2	10	9345.55	9345.55
68	BUS	24	2008-03-22	\N	2008-11-14	ACTIVE	2	10	9345.55	9345.55
69	CHK	12	2007-07-30	\N	2008-12-15	ACTIVE	4	16	38552.05	38552.05
70	CHK	25	2007-07-30	\N	2008-12-15	ACTIVE	4	16	38552.05	38552.05
71	SBL	13	2008-02-22	\N	2008-12-17	ACTIVE	3	13	50000	50000
72	SBL	26	2008-02-22	\N	2008-12-17	ACTIVE	3	13	50000	50000
73	CHK	1	2004-01-15	\N	2009-01-04	ACTIVE	2	10	1057.75	1057.75
74	SAV	1	2004-01-15	\N	2008-12-19	ACTIVE	2	10	500	500
75	CD	1	2008-06-30	\N	2008-06-30	ACTIVE	2	10	3000	3000
76	CHK	14	2004-01-15	\N	2009-01-04	ACTIVE	2	10	1057.75	1057.75
77	SAV	14	2004-01-15	\N	2008-12-19	ACTIVE	2	10	500	500
78	CD	14	2008-06-30	\N	2008-06-30	ACTIVE	2	10	3000	3000
79	CHK	27	2004-01-15	\N	2009-01-04	ACTIVE	2	10	1057.75	1057.75
80	SAV	27	2004-01-15	\N	2008-12-19	ACTIVE	2	10	500	500
81	CD	27	2008-06-30	\N	2008-06-30	ACTIVE	2	10	3000	3000
82	CHK	2	2005-03-12	\N	2008-12-27	ACTIVE	2	10	2258.02	2258.02
83	SAV	2	2005-03-12	\N	2008-12-11	ACTIVE	2	10	200	200
84	CHK	15	2005-03-12	\N	2008-12-27	ACTIVE	2	10	2258.02	2258.02
85	SAV	15	2005-03-12	\N	2008-12-11	ACTIVE	2	10	200	200
86	CHK	28	2005-03-12	\N	2008-12-27	ACTIVE	2	10	2258.02	2258.02
87	SAV	28	2005-03-12	\N	2008-12-11	ACTIVE	2	10	200	200
88	CHK	3	2006-11-23	\N	2008-11-30	ACTIVE	3	13	1057.75	1057.75
89	MM	3	2006-12-15	\N	2008-12-05	ACTIVE	3	13	2212.5	2212.5
90	CHK	16	2006-11-23	\N	2008-11-30	ACTIVE	3	13	1057.75	1057.75
91	MM	16	2006-12-15	\N	2008-12-05	ACTIVE	3	13	2212.5	2212.5
92	CHK	29	2006-11-23	\N	2008-11-30	ACTIVE	3	13	1057.75	1057.75
93	MM	29	2006-12-15	\N	2008-12-05	ACTIVE	3	13	2212.5	2212.5
94	CHK	4	2007-09-12	\N	2009-01-03	ACTIVE	1	1	534.12	534.12
95	SAV	4	2004-01-15	\N	2008-10-24	ACTIVE	1	1	767.77	767.77
96	MM	4	2008-09-30	\N	2008-11-11	ACTIVE	1	1	5487.09	5487.09
97	CHK	17	2007-09-12	\N	2009-01-03	ACTIVE	1	1	534.12	534.12
98	SAV	17	2004-01-15	\N	2008-10-24	ACTIVE	1	1	767.77	767.77
99	MM	17	2008-09-30	\N	2008-11-11	ACTIVE	1	1	5487.09	5487.09
100	CHK	30	2007-09-12	\N	2009-01-03	ACTIVE	1	1	534.12	534.12
101	SAV	30	2004-01-15	\N	2008-10-24	ACTIVE	1	1	767.77	767.77
102	MM	30	2008-09-30	\N	2008-11-11	ACTIVE	1	1	5487.09	5487.09
103	CHK	5	2008-01-27	\N	2009-01-05	ACTIVE	4	16	2237.97	2897.97
104	CHK	18	2008-01-27	\N	2009-01-05	ACTIVE	4	16	2237.97	2897.97
105	CHK	31	2008-01-27	\N	2009-01-05	ACTIVE	4	16	2237.97	2897.97
106	CHK	6	2006-08-24	\N	2008-11-29	ACTIVE	1	1	122.37	122.37
107	CD	6	2008-12-28	\N	2008-12-28	ACTIVE	1	1	10000	10000
108	CHK	19	2006-08-24	\N	2008-11-29	ACTIVE	1	1	122.37	122.37
109	CD	19	2008-12-28	\N	2008-12-28	ACTIVE	1	1	10000	10000
110	CHK	32	2006-08-24	\N	2008-11-29	ACTIVE	1	1	122.37	122.37
111	CD	32	2008-12-28	\N	2008-12-28	ACTIVE	1	1	10000	10000
112	CD	7	2008-01-12	\N	2008-01-12	ACTIVE	2	10	5000	5000
113	CD	20	2008-01-12	\N	2008-01-12	ACTIVE	2	10	5000	5000
114	CD	33	2008-01-12	\N	2008-01-12	ACTIVE	2	10	5000	5000
115	CHK	8	2005-05-23	\N	2009-01-03	ACTIVE	4	16	3487.19	3487.19
116	SAV	8	2005-05-23	\N	2008-10-12	ACTIVE	4	16	387.99	387.99
117	CHK	21	2005-05-23	\N	2009-01-03	ACTIVE	4	16	3487.19	3487.19
118	SAV	21	2005-05-23	\N	2008-10-12	ACTIVE	4	16	387.99	387.99
119	CHK	34	2005-05-23	\N	2009-01-03	ACTIVE	4	16	3487.19	3487.19
120	SAV	34	2005-05-23	\N	2008-10-12	ACTIVE	4	16	387.99	387.99
121	CHK	9	2007-07-30	\N	2008-12-15	ACTIVE	1	1	125.67	125.67
122	MM	9	2008-10-28	\N	2008-10-28	ACTIVE	1	1	9345.55	9845.55
123	CD	9	2008-06-30	\N	2008-06-30	ACTIVE	1	1	1500	1500
124	CHK	22	2007-07-30	\N	2008-12-15	ACTIVE	1	1	125.67	125.67
125	MM	22	2008-10-28	\N	2008-10-28	ACTIVE	1	1	9345.55	9845.55
126	CD	22	2008-06-30	\N	2008-06-30	ACTIVE	1	1	1500	1500
127	CHK	35	2007-07-30	\N	2008-12-15	ACTIVE	1	1	125.67	125.67
128	MM	35	2008-10-28	\N	2008-10-28	ACTIVE	1	1	9345.55	9845.55
129	CD	35	2008-06-30	\N	2008-06-30	ACTIVE	1	1	1500	1500
130	CHK	10	2006-09-30	\N	2008-12-15	ACTIVE	4	16	23575.12	23575.12
131	BUS	10	2006-10-01	\N	2008-08-28	ACTIVE	4	16	0	0
132	CHK	23	2006-09-30	\N	2008-12-15	ACTIVE	4	16	23575.12	23575.12
133	BUS	23	2006-10-01	\N	2008-08-28	ACTIVE	4	16	0	0
134	CHK	36	2006-09-30	\N	2008-12-15	ACTIVE	4	16	23575.12	23575.12
135	BUS	36	2006-10-01	\N	2008-08-28	ACTIVE	4	16	0	0
136	BUS	11	2008-03-22	\N	2008-11-14	ACTIVE	2	10	9345.55	9345.55
137	BUS	24	2008-03-22	\N	2008-11-14	ACTIVE	2	10	9345.55	9345.55
138	BUS	37	2008-03-22	\N	2008-11-14	ACTIVE	2	10	9345.55	9345.55
139	CHK	12	2007-07-30	\N	2008-12-15	ACTIVE	4	16	38552.05	38552.05
140	CHK	25	2007-07-30	\N	2008-12-15	ACTIVE	4	16	38552.05	38552.05
141	CHK	38	2007-07-30	\N	2008-12-15	ACTIVE	4	16	38552.05	38552.05
142	SBL	13	2008-02-22	\N	2008-12-17	ACTIVE	3	13	50000	50000
143	SBL	26	2008-02-22	\N	2008-12-17	ACTIVE	3	13	50000	50000
144	SBL	39	2008-02-22	\N	2008-12-17	ACTIVE	3	13	50000	50000
\.


--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.branch (branch_id, name, address, city, state, zip) FROM stdin;
1	Headquarters	3882 Main St.	Waltham	MA	02451
2	Woburn Branch	422 Maple St.	Woburn	MA	01801
3	Quincy Branch	125 Presidential Way	Quincy	MA	02169
4	So. NH Branch	378 Maynard Ln.	Salem	NH	03079
5	Headquarters	3882 Main St.	Waltham	MA	02451
6	Woburn Branch	422 Maple St.	Woburn	MA	01801
7	Quincy Branch	125 Presidential Way	Quincy	MA	02169
8	So. NH Branch	378 Maynard Ln.	Salem	NH	03079
9	Headquarters	3882 Main St.	Waltham	MA	02451
10	Woburn Branch	422 Maple St.	Woburn	MA	01801
11	Quincy Branch	125 Presidential Way	Quincy	MA	02169
12	So. NH Branch	378 Maynard Ln.	Salem	NH	03079
\.


--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.business (cust_id, name, state_id, incorp_date) FROM stdin;
10	Chilton Engineering	12-345-678	1999-05-01
11	Northeast Cooling Inc.	23-456-789	2005-01-01
12	Superior Auto Body	34-567-890	2006-06-30
13	AAA Insurance Inc.	45-678-901	2003-05-01
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.customer (cust_id, fed_id, cust_type_cd, address, city, state, postal_code) FROM stdin;
1	111-11-1111	I	47 Mockingbird Ln	Lynnfield	MA	01940
2	222-22-2222	I	372 Clearwater Blvd	Woburn	MA	01801
3	333-33-3333	I	18 Jessup Rd	Quincy	MA	02169
4	444-44-4444	I	12 Buchanan Ln	Waltham	MA	02451
5	555-55-5555	I	2341 Main St	Salem	NH	03079
6	666-66-6666	I	12 Blaylock Ln	Waltham	MA	02451
7	777-77-7777	I	29 Admiral Ln	Wilmington	MA	01887
8	888-88-8888	I	472 Freedom Rd	Salem	NH	03079
9	999-99-9999	I	29 Maple St	Newton	MA	02458
10	04-1111111	B	7 Industrial Way	Salem	NH	03079
11	04-2222222	B	287A Corporate Ave	Wilmington	MA	01887
12	04-3333333	B	789 Main St	Salem	NH	03079
13	04-4444444	B	4772 Presidential Way	Quincy	MA	02169
14	111-11-1111	I	47 Mockingbird Ln	Lynnfield	MA	01940
15	222-22-2222	I	372 Clearwater Blvd	Woburn	MA	01801
16	333-33-3333	I	18 Jessup Rd	Quincy	MA	02169
17	444-44-4444	I	12 Buchanan Ln	Waltham	MA	02451
18	555-55-5555	I	2341 Main St	Salem	NH	03079
19	666-66-6666	I	12 Blaylock Ln	Waltham	MA	02451
20	777-77-7777	I	29 Admiral Ln	Wilmington	MA	01887
21	888-88-8888	I	472 Freedom Rd	Salem	NH	03079
22	999-99-9999	I	29 Maple St	Newton	MA	02458
23	04-1111111	B	7 Industrial Way	Salem	NH	03079
24	04-2222222	B	287A Corporate Ave	Wilmington	MA	01887
25	04-3333333	B	789 Main St	Salem	NH	03079
26	04-4444444	B	4772 Presidential Way	Quincy	MA	02169
27	111-11-1111	I	47 Mockingbird Ln	Lynnfield	MA	01940
28	222-22-2222	I	372 Clearwater Blvd	Woburn	MA	01801
29	333-33-3333	I	18 Jessup Rd	Quincy	MA	02169
30	444-44-4444	I	12 Buchanan Ln	Waltham	MA	02451
31	555-55-5555	I	2341 Main St	Salem	NH	03079
32	666-66-6666	I	12 Blaylock Ln	Waltham	MA	02451
33	777-77-7777	I	29 Admiral Ln	Wilmington	MA	01887
34	888-88-8888	I	472 Freedom Rd	Salem	NH	03079
35	999-99-9999	I	29 Maple St	Newton	MA	02458
36	04-1111111	B	7 Industrial Way	Salem	NH	03079
37	04-2222222	B	287A Corporate Ave	Wilmington	MA	01887
38	04-3333333	B	789 Main St	Salem	NH	03079
39	04-4444444	B	4772 Presidential Way	Quincy	MA	02169
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.department (dept_id, name) FROM stdin;
1	Operations
2	Loans
3	Administration
4	Operations
5	Loans
6	Administration
7	Operations
8	Loans
9	Administration
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.employee (emp_id, fname, lname, start_date, end_date, superior_emp_id, dept_id, title, assigned_branch_id) FROM stdin;
1	Michael	Smith	2005-06-22	\N	\N	3	President	1
2	Susan	Barker	2006-09-12	\N	1	3	Vice President	1
3	Robert	Tyler	2005-02-09	\N	1	3	Treasurer	1
4	Susan	Hawthorne	2006-04-24	\N	3	1	Operations Manager	1
5	John	Gooding	2007-11-14	\N	4	2	Loan Manager	1
6	Helen	Fleming	2008-03-17	\N	4	1	Head Teller	1
10	Paula	Roberts	2006-07-27	\N	4	1	Head Teller	2
13	John	Blake	2004-05-11	\N	4	1	Head Teller	3
16	Theresa	Markham	2005-03-15	\N	4	1	Head Teller	4
7	Chris	Tucker	2008-09-15	\N	6	1	Teller	1
8	Sarah	Parker	2006-12-02	\N	6	1	Teller	1
9	Jane	Grossman	2006-05-03	\N	6	1	Teller	1
11	Thomas	Ziegler	2004-10-23	\N	10	1	Teller	2
12	Samantha	Jameson	2007-01-08	\N	10	1	Teller	2
14	Cindy	Mason	2006-08-09	\N	13	1	Teller	3
15	Frank	Portman	2007-04-01	\N	13	1	Teller	3
17	Beth	Fowler	2006-06-29	\N	16	1	Teller	4
18	Rick	Tulman	2006-12-12	\N	16	1	Teller	4
\.


--
-- Data for Name: individual; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.individual (cust_id, fname, lname, birth_date) FROM stdin;
1	James	Hadley	1972-04-22
2	Susan	Tingley	1968-08-15
3	Frank	Tucker	1958-02-06
4	John	Hayward	1966-12-22
5	Charles	Frasier	1971-08-25
6	John	Spencer	1962-09-14
7	Margaret	Young	1947-03-19
8	Louis	Blake	1977-07-01
9	Richard	Farley	1968-06-16
\.


--
-- Data for Name: officer; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.officer (officer_id, cust_id, fname, lname, title, start_date, end_date) FROM stdin;
1	10	John	Chilton	President	1999-05-01	\N
2	11	Paul	Hardy	President	2005-01-01	\N
3	12	Carl	Lutz	President	2006-06-30	\N
4	13	Stanley	Cheswick	President	2003-05-01	\N
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.product (product_cd, name, product_type_cd, date_offered, date_retired) FROM stdin;
CHK	checking account	ACCOUNT	2004-01-01	\N
SAV	savings account	ACCOUNT	2004-01-01	\N
MM	money market account	ACCOUNT	2004-01-01	\N
CD	certificate of deposit	ACCOUNT	2004-01-01	\N
MRT	home mortgage	LOAN	2004-01-01	\N
AUT	auto loan	LOAN	2004-01-01	\N
BUS	business line of credit	LOAN	2004-01-01	\N
SBL	small business loan	LOAN	2004-01-01	\N
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.product_type (product_type_cd, name) FROM stdin;
ACCOUNT	Customer Accounts
LOAN	Individual and Business Loans
INSURANCE	Insurance Offerings
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: jcdiner
--

COPY public.transaction (txn_id, txn_date, account_id, txn_type_cd, amount, teller_emp_id, execution_branch_id, funds_avail_date) FROM stdin;
1	2004-01-15 00:00:00	1	CDT	100	\N	\N	2004-01-15 00:00:00
2	2004-01-15 00:00:00	2	CDT	100	\N	\N	2004-01-15 00:00:00
3	2008-06-30 00:00:00	3	CDT	100	\N	\N	2008-06-30 00:00:00
4	2005-03-12 00:00:00	4	CDT	100	\N	\N	2005-03-12 00:00:00
5	2005-03-12 00:00:00	5	CDT	100	\N	\N	2005-03-12 00:00:00
6	2006-11-23 00:00:00	6	CDT	100	\N	\N	2006-11-23 00:00:00
7	2006-12-15 00:00:00	7	CDT	100	\N	\N	2006-12-15 00:00:00
8	2007-09-12 00:00:00	8	CDT	100	\N	\N	2007-09-12 00:00:00
9	2004-01-15 00:00:00	9	CDT	100	\N	\N	2004-01-15 00:00:00
10	2008-09-30 00:00:00	10	CDT	100	\N	\N	2008-09-30 00:00:00
11	2008-01-27 00:00:00	11	CDT	100	\N	\N	2008-01-27 00:00:00
12	2006-08-24 00:00:00	12	CDT	100	\N	\N	2006-08-24 00:00:00
13	2008-12-28 00:00:00	13	CDT	100	\N	\N	2008-12-28 00:00:00
14	2008-01-12 00:00:00	14	CDT	100	\N	\N	2008-01-12 00:00:00
15	2005-05-23 00:00:00	15	CDT	100	\N	\N	2005-05-23 00:00:00
16	2005-05-23 00:00:00	16	CDT	100	\N	\N	2005-05-23 00:00:00
17	2007-07-30 00:00:00	17	CDT	100	\N	\N	2007-07-30 00:00:00
18	2008-10-28 00:00:00	18	CDT	100	\N	\N	2008-10-28 00:00:00
19	2008-06-30 00:00:00	19	CDT	100	\N	\N	2008-06-30 00:00:00
20	2006-09-30 00:00:00	20	CDT	100	\N	\N	2006-09-30 00:00:00
21	2007-07-30 00:00:00	23	CDT	100	\N	\N	2007-07-30 00:00:00
22	2004-01-15 00:00:00	1	CDT	100	\N	\N	2004-01-15 00:00:00
23	2004-01-15 00:00:00	2	CDT	100	\N	\N	2004-01-15 00:00:00
24	2008-06-30 00:00:00	3	CDT	100	\N	\N	2008-06-30 00:00:00
25	2005-03-12 00:00:00	4	CDT	100	\N	\N	2005-03-12 00:00:00
26	2005-03-12 00:00:00	5	CDT	100	\N	\N	2005-03-12 00:00:00
27	2006-11-23 00:00:00	6	CDT	100	\N	\N	2006-11-23 00:00:00
28	2006-12-15 00:00:00	7	CDT	100	\N	\N	2006-12-15 00:00:00
29	2007-09-12 00:00:00	8	CDT	100	\N	\N	2007-09-12 00:00:00
30	2004-01-15 00:00:00	9	CDT	100	\N	\N	2004-01-15 00:00:00
31	2008-09-30 00:00:00	10	CDT	100	\N	\N	2008-09-30 00:00:00
32	2008-01-27 00:00:00	11	CDT	100	\N	\N	2008-01-27 00:00:00
33	2006-08-24 00:00:00	12	CDT	100	\N	\N	2006-08-24 00:00:00
34	2008-12-28 00:00:00	13	CDT	100	\N	\N	2008-12-28 00:00:00
35	2008-01-12 00:00:00	14	CDT	100	\N	\N	2008-01-12 00:00:00
36	2005-05-23 00:00:00	15	CDT	100	\N	\N	2005-05-23 00:00:00
37	2005-05-23 00:00:00	16	CDT	100	\N	\N	2005-05-23 00:00:00
38	2007-07-30 00:00:00	17	CDT	100	\N	\N	2007-07-30 00:00:00
39	2008-10-28 00:00:00	18	CDT	100	\N	\N	2008-10-28 00:00:00
40	2008-06-30 00:00:00	19	CDT	100	\N	\N	2008-06-30 00:00:00
41	2006-09-30 00:00:00	20	CDT	100	\N	\N	2006-09-30 00:00:00
42	2007-07-30 00:00:00	23	CDT	100	\N	\N	2007-07-30 00:00:00
43	2004-01-15 00:00:00	25	CDT	100	\N	\N	2004-01-15 00:00:00
44	2004-01-15 00:00:00	26	CDT	100	\N	\N	2004-01-15 00:00:00
45	2008-06-30 00:00:00	27	CDT	100	\N	\N	2008-06-30 00:00:00
46	2004-01-15 00:00:00	28	CDT	100	\N	\N	2004-01-15 00:00:00
47	2004-01-15 00:00:00	29	CDT	100	\N	\N	2004-01-15 00:00:00
48	2008-06-30 00:00:00	30	CDT	100	\N	\N	2008-06-30 00:00:00
49	2005-03-12 00:00:00	31	CDT	100	\N	\N	2005-03-12 00:00:00
50	2005-03-12 00:00:00	32	CDT	100	\N	\N	2005-03-12 00:00:00
51	2005-03-12 00:00:00	33	CDT	100	\N	\N	2005-03-12 00:00:00
52	2005-03-12 00:00:00	34	CDT	100	\N	\N	2005-03-12 00:00:00
53	2006-11-23 00:00:00	35	CDT	100	\N	\N	2006-11-23 00:00:00
54	2006-12-15 00:00:00	36	CDT	100	\N	\N	2006-12-15 00:00:00
55	2006-11-23 00:00:00	37	CDT	100	\N	\N	2006-11-23 00:00:00
56	2006-12-15 00:00:00	38	CDT	100	\N	\N	2006-12-15 00:00:00
57	2007-09-12 00:00:00	39	CDT	100	\N	\N	2007-09-12 00:00:00
58	2004-01-15 00:00:00	40	CDT	100	\N	\N	2004-01-15 00:00:00
59	2008-09-30 00:00:00	41	CDT	100	\N	\N	2008-09-30 00:00:00
60	2007-09-12 00:00:00	42	CDT	100	\N	\N	2007-09-12 00:00:00
61	2004-01-15 00:00:00	43	CDT	100	\N	\N	2004-01-15 00:00:00
62	2008-09-30 00:00:00	44	CDT	100	\N	\N	2008-09-30 00:00:00
63	2008-01-27 00:00:00	45	CDT	100	\N	\N	2008-01-27 00:00:00
64	2008-01-27 00:00:00	46	CDT	100	\N	\N	2008-01-27 00:00:00
65	2006-08-24 00:00:00	47	CDT	100	\N	\N	2006-08-24 00:00:00
66	2008-12-28 00:00:00	48	CDT	100	\N	\N	2008-12-28 00:00:00
67	2006-08-24 00:00:00	49	CDT	100	\N	\N	2006-08-24 00:00:00
68	2008-12-28 00:00:00	50	CDT	100	\N	\N	2008-12-28 00:00:00
69	2008-01-12 00:00:00	51	CDT	100	\N	\N	2008-01-12 00:00:00
70	2008-01-12 00:00:00	52	CDT	100	\N	\N	2008-01-12 00:00:00
71	2005-05-23 00:00:00	53	CDT	100	\N	\N	2005-05-23 00:00:00
72	2005-05-23 00:00:00	54	CDT	100	\N	\N	2005-05-23 00:00:00
73	2005-05-23 00:00:00	55	CDT	100	\N	\N	2005-05-23 00:00:00
74	2005-05-23 00:00:00	56	CDT	100	\N	\N	2005-05-23 00:00:00
75	2007-07-30 00:00:00	57	CDT	100	\N	\N	2007-07-30 00:00:00
76	2008-10-28 00:00:00	58	CDT	100	\N	\N	2008-10-28 00:00:00
77	2008-06-30 00:00:00	59	CDT	100	\N	\N	2008-06-30 00:00:00
78	2007-07-30 00:00:00	60	CDT	100	\N	\N	2007-07-30 00:00:00
79	2008-10-28 00:00:00	61	CDT	100	\N	\N	2008-10-28 00:00:00
80	2008-06-30 00:00:00	62	CDT	100	\N	\N	2008-06-30 00:00:00
81	2006-09-30 00:00:00	63	CDT	100	\N	\N	2006-09-30 00:00:00
82	2006-09-30 00:00:00	65	CDT	100	\N	\N	2006-09-30 00:00:00
83	2007-07-30 00:00:00	69	CDT	100	\N	\N	2007-07-30 00:00:00
84	2007-07-30 00:00:00	70	CDT	100	\N	\N	2007-07-30 00:00:00
85	2004-01-15 00:00:00	1	CDT	100	\N	\N	2004-01-15 00:00:00
86	2004-01-15 00:00:00	2	CDT	100	\N	\N	2004-01-15 00:00:00
87	2008-06-30 00:00:00	3	CDT	100	\N	\N	2008-06-30 00:00:00
88	2005-03-12 00:00:00	4	CDT	100	\N	\N	2005-03-12 00:00:00
89	2005-03-12 00:00:00	5	CDT	100	\N	\N	2005-03-12 00:00:00
90	2006-11-23 00:00:00	6	CDT	100	\N	\N	2006-11-23 00:00:00
91	2006-12-15 00:00:00	7	CDT	100	\N	\N	2006-12-15 00:00:00
92	2007-09-12 00:00:00	8	CDT	100	\N	\N	2007-09-12 00:00:00
93	2004-01-15 00:00:00	9	CDT	100	\N	\N	2004-01-15 00:00:00
94	2008-09-30 00:00:00	10	CDT	100	\N	\N	2008-09-30 00:00:00
95	2008-01-27 00:00:00	11	CDT	100	\N	\N	2008-01-27 00:00:00
96	2006-08-24 00:00:00	12	CDT	100	\N	\N	2006-08-24 00:00:00
97	2008-12-28 00:00:00	13	CDT	100	\N	\N	2008-12-28 00:00:00
98	2008-01-12 00:00:00	14	CDT	100	\N	\N	2008-01-12 00:00:00
99	2005-05-23 00:00:00	15	CDT	100	\N	\N	2005-05-23 00:00:00
100	2005-05-23 00:00:00	16	CDT	100	\N	\N	2005-05-23 00:00:00
101	2007-07-30 00:00:00	17	CDT	100	\N	\N	2007-07-30 00:00:00
102	2008-10-28 00:00:00	18	CDT	100	\N	\N	2008-10-28 00:00:00
103	2008-06-30 00:00:00	19	CDT	100	\N	\N	2008-06-30 00:00:00
104	2006-09-30 00:00:00	20	CDT	100	\N	\N	2006-09-30 00:00:00
105	2007-07-30 00:00:00	23	CDT	100	\N	\N	2007-07-30 00:00:00
106	2004-01-15 00:00:00	25	CDT	100	\N	\N	2004-01-15 00:00:00
107	2004-01-15 00:00:00	26	CDT	100	\N	\N	2004-01-15 00:00:00
108	2008-06-30 00:00:00	27	CDT	100	\N	\N	2008-06-30 00:00:00
109	2004-01-15 00:00:00	28	CDT	100	\N	\N	2004-01-15 00:00:00
110	2004-01-15 00:00:00	29	CDT	100	\N	\N	2004-01-15 00:00:00
111	2008-06-30 00:00:00	30	CDT	100	\N	\N	2008-06-30 00:00:00
112	2005-03-12 00:00:00	31	CDT	100	\N	\N	2005-03-12 00:00:00
113	2005-03-12 00:00:00	32	CDT	100	\N	\N	2005-03-12 00:00:00
114	2005-03-12 00:00:00	33	CDT	100	\N	\N	2005-03-12 00:00:00
115	2005-03-12 00:00:00	34	CDT	100	\N	\N	2005-03-12 00:00:00
116	2006-11-23 00:00:00	35	CDT	100	\N	\N	2006-11-23 00:00:00
117	2006-12-15 00:00:00	36	CDT	100	\N	\N	2006-12-15 00:00:00
118	2006-11-23 00:00:00	37	CDT	100	\N	\N	2006-11-23 00:00:00
119	2006-12-15 00:00:00	38	CDT	100	\N	\N	2006-12-15 00:00:00
120	2007-09-12 00:00:00	39	CDT	100	\N	\N	2007-09-12 00:00:00
121	2004-01-15 00:00:00	40	CDT	100	\N	\N	2004-01-15 00:00:00
122	2008-09-30 00:00:00	41	CDT	100	\N	\N	2008-09-30 00:00:00
123	2007-09-12 00:00:00	42	CDT	100	\N	\N	2007-09-12 00:00:00
124	2004-01-15 00:00:00	43	CDT	100	\N	\N	2004-01-15 00:00:00
125	2008-09-30 00:00:00	44	CDT	100	\N	\N	2008-09-30 00:00:00
126	2008-01-27 00:00:00	45	CDT	100	\N	\N	2008-01-27 00:00:00
127	2008-01-27 00:00:00	46	CDT	100	\N	\N	2008-01-27 00:00:00
128	2006-08-24 00:00:00	47	CDT	100	\N	\N	2006-08-24 00:00:00
129	2008-12-28 00:00:00	48	CDT	100	\N	\N	2008-12-28 00:00:00
130	2006-08-24 00:00:00	49	CDT	100	\N	\N	2006-08-24 00:00:00
131	2008-12-28 00:00:00	50	CDT	100	\N	\N	2008-12-28 00:00:00
132	2008-01-12 00:00:00	51	CDT	100	\N	\N	2008-01-12 00:00:00
133	2008-01-12 00:00:00	52	CDT	100	\N	\N	2008-01-12 00:00:00
134	2005-05-23 00:00:00	53	CDT	100	\N	\N	2005-05-23 00:00:00
135	2005-05-23 00:00:00	54	CDT	100	\N	\N	2005-05-23 00:00:00
136	2005-05-23 00:00:00	55	CDT	100	\N	\N	2005-05-23 00:00:00
137	2005-05-23 00:00:00	56	CDT	100	\N	\N	2005-05-23 00:00:00
138	2007-07-30 00:00:00	57	CDT	100	\N	\N	2007-07-30 00:00:00
139	2008-10-28 00:00:00	58	CDT	100	\N	\N	2008-10-28 00:00:00
140	2008-06-30 00:00:00	59	CDT	100	\N	\N	2008-06-30 00:00:00
141	2007-07-30 00:00:00	60	CDT	100	\N	\N	2007-07-30 00:00:00
142	2008-10-28 00:00:00	61	CDT	100	\N	\N	2008-10-28 00:00:00
143	2008-06-30 00:00:00	62	CDT	100	\N	\N	2008-06-30 00:00:00
144	2006-09-30 00:00:00	63	CDT	100	\N	\N	2006-09-30 00:00:00
145	2006-09-30 00:00:00	65	CDT	100	\N	\N	2006-09-30 00:00:00
146	2007-07-30 00:00:00	69	CDT	100	\N	\N	2007-07-30 00:00:00
147	2007-07-30 00:00:00	70	CDT	100	\N	\N	2007-07-30 00:00:00
148	2004-01-15 00:00:00	73	CDT	100	\N	\N	2004-01-15 00:00:00
149	2004-01-15 00:00:00	74	CDT	100	\N	\N	2004-01-15 00:00:00
150	2008-06-30 00:00:00	75	CDT	100	\N	\N	2008-06-30 00:00:00
151	2004-01-15 00:00:00	76	CDT	100	\N	\N	2004-01-15 00:00:00
152	2004-01-15 00:00:00	77	CDT	100	\N	\N	2004-01-15 00:00:00
153	2008-06-30 00:00:00	78	CDT	100	\N	\N	2008-06-30 00:00:00
154	2004-01-15 00:00:00	79	CDT	100	\N	\N	2004-01-15 00:00:00
155	2004-01-15 00:00:00	80	CDT	100	\N	\N	2004-01-15 00:00:00
156	2008-06-30 00:00:00	81	CDT	100	\N	\N	2008-06-30 00:00:00
157	2005-03-12 00:00:00	82	CDT	100	\N	\N	2005-03-12 00:00:00
158	2005-03-12 00:00:00	83	CDT	100	\N	\N	2005-03-12 00:00:00
159	2005-03-12 00:00:00	84	CDT	100	\N	\N	2005-03-12 00:00:00
160	2005-03-12 00:00:00	85	CDT	100	\N	\N	2005-03-12 00:00:00
161	2005-03-12 00:00:00	86	CDT	100	\N	\N	2005-03-12 00:00:00
162	2005-03-12 00:00:00	87	CDT	100	\N	\N	2005-03-12 00:00:00
163	2006-11-23 00:00:00	88	CDT	100	\N	\N	2006-11-23 00:00:00
164	2006-12-15 00:00:00	89	CDT	100	\N	\N	2006-12-15 00:00:00
165	2006-11-23 00:00:00	90	CDT	100	\N	\N	2006-11-23 00:00:00
166	2006-12-15 00:00:00	91	CDT	100	\N	\N	2006-12-15 00:00:00
167	2006-11-23 00:00:00	92	CDT	100	\N	\N	2006-11-23 00:00:00
168	2006-12-15 00:00:00	93	CDT	100	\N	\N	2006-12-15 00:00:00
169	2007-09-12 00:00:00	94	CDT	100	\N	\N	2007-09-12 00:00:00
170	2004-01-15 00:00:00	95	CDT	100	\N	\N	2004-01-15 00:00:00
171	2008-09-30 00:00:00	96	CDT	100	\N	\N	2008-09-30 00:00:00
172	2007-09-12 00:00:00	97	CDT	100	\N	\N	2007-09-12 00:00:00
173	2004-01-15 00:00:00	98	CDT	100	\N	\N	2004-01-15 00:00:00
174	2008-09-30 00:00:00	99	CDT	100	\N	\N	2008-09-30 00:00:00
175	2007-09-12 00:00:00	100	CDT	100	\N	\N	2007-09-12 00:00:00
176	2004-01-15 00:00:00	101	CDT	100	\N	\N	2004-01-15 00:00:00
177	2008-09-30 00:00:00	102	CDT	100	\N	\N	2008-09-30 00:00:00
178	2008-01-27 00:00:00	103	CDT	100	\N	\N	2008-01-27 00:00:00
179	2008-01-27 00:00:00	104	CDT	100	\N	\N	2008-01-27 00:00:00
180	2008-01-27 00:00:00	105	CDT	100	\N	\N	2008-01-27 00:00:00
181	2006-08-24 00:00:00	106	CDT	100	\N	\N	2006-08-24 00:00:00
182	2008-12-28 00:00:00	107	CDT	100	\N	\N	2008-12-28 00:00:00
183	2006-08-24 00:00:00	108	CDT	100	\N	\N	2006-08-24 00:00:00
184	2008-12-28 00:00:00	109	CDT	100	\N	\N	2008-12-28 00:00:00
185	2006-08-24 00:00:00	110	CDT	100	\N	\N	2006-08-24 00:00:00
186	2008-12-28 00:00:00	111	CDT	100	\N	\N	2008-12-28 00:00:00
187	2008-01-12 00:00:00	112	CDT	100	\N	\N	2008-01-12 00:00:00
188	2008-01-12 00:00:00	113	CDT	100	\N	\N	2008-01-12 00:00:00
189	2008-01-12 00:00:00	114	CDT	100	\N	\N	2008-01-12 00:00:00
190	2005-05-23 00:00:00	115	CDT	100	\N	\N	2005-05-23 00:00:00
191	2005-05-23 00:00:00	116	CDT	100	\N	\N	2005-05-23 00:00:00
192	2005-05-23 00:00:00	117	CDT	100	\N	\N	2005-05-23 00:00:00
193	2005-05-23 00:00:00	118	CDT	100	\N	\N	2005-05-23 00:00:00
194	2005-05-23 00:00:00	119	CDT	100	\N	\N	2005-05-23 00:00:00
195	2005-05-23 00:00:00	120	CDT	100	\N	\N	2005-05-23 00:00:00
196	2007-07-30 00:00:00	121	CDT	100	\N	\N	2007-07-30 00:00:00
197	2008-10-28 00:00:00	122	CDT	100	\N	\N	2008-10-28 00:00:00
198	2008-06-30 00:00:00	123	CDT	100	\N	\N	2008-06-30 00:00:00
199	2007-07-30 00:00:00	124	CDT	100	\N	\N	2007-07-30 00:00:00
200	2008-10-28 00:00:00	125	CDT	100	\N	\N	2008-10-28 00:00:00
201	2008-06-30 00:00:00	126	CDT	100	\N	\N	2008-06-30 00:00:00
202	2007-07-30 00:00:00	127	CDT	100	\N	\N	2007-07-30 00:00:00
203	2008-10-28 00:00:00	128	CDT	100	\N	\N	2008-10-28 00:00:00
204	2008-06-30 00:00:00	129	CDT	100	\N	\N	2008-06-30 00:00:00
205	2006-09-30 00:00:00	130	CDT	100	\N	\N	2006-09-30 00:00:00
206	2006-09-30 00:00:00	132	CDT	100	\N	\N	2006-09-30 00:00:00
207	2006-09-30 00:00:00	134	CDT	100	\N	\N	2006-09-30 00:00:00
208	2007-07-30 00:00:00	139	CDT	100	\N	\N	2007-07-30 00:00:00
209	2007-07-30 00:00:00	140	CDT	100	\N	\N	2007-07-30 00:00:00
210	2007-07-30 00:00:00	141	CDT	100	\N	\N	2007-07-30 00:00:00
\.


--
-- Name: account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcdiner
--

SELECT pg_catalog.setval('public.account_account_id_seq', 144, true);


--
-- Name: branch_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcdiner
--

SELECT pg_catalog.setval('public.branch_branch_id_seq', 12, true);


--
-- Name: customer_cust_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcdiner
--

SELECT pg_catalog.setval('public.customer_cust_id_seq', 39, true);


--
-- Name: department_dept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcdiner
--

SELECT pg_catalog.setval('public.department_dept_id_seq', 9, true);


--
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcdiner
--

SELECT pg_catalog.setval('public.employee_emp_id_seq', 54, true);


--
-- Name: officer_officer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcdiner
--

SELECT pg_catalog.setval('public.officer_officer_id_seq', 24, true);


--
-- Name: transaction_txn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jcdiner
--

SELECT pg_catalog.setval('public.transaction_txn_id_seq', 210, true);


--
-- Name: account pk_account; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT pk_account PRIMARY KEY (account_id);


--
-- Name: branch pk_branch; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT pk_branch PRIMARY KEY (branch_id);


--
-- Name: business pk_business; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT pk_business PRIMARY KEY (cust_id);


--
-- Name: customer pk_customer; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (cust_id);


--
-- Name: department pk_department; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT pk_department PRIMARY KEY (dept_id);


--
-- Name: employee pk_employee; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee PRIMARY KEY (emp_id);


--
-- Name: individual pk_individual; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT pk_individual PRIMARY KEY (cust_id);


--
-- Name: officer pk_officer; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.officer
    ADD CONSTRAINT pk_officer PRIMARY KEY (officer_id);


--
-- Name: product pk_product; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT pk_product PRIMARY KEY (product_cd);


--
-- Name: product_type pk_product_type; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT pk_product_type PRIMARY KEY (product_type_cd);


--
-- Name: transaction pk_transaction; Type: CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT pk_transaction PRIMARY KEY (txn_id);


--
-- Name: account fk_a_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_a_branch_id FOREIGN KEY (open_branch_id) REFERENCES public.branch(branch_id);


--
-- Name: account fk_a_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_a_cust_id FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id);


--
-- Name: account fk_a_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_a_emp_id FOREIGN KEY (open_emp_id) REFERENCES public.employee(emp_id);


--
-- Name: business fk_b_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT fk_b_cust_id FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id);


--
-- Name: employee fk_dept_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_dept_id FOREIGN KEY (dept_id) REFERENCES public.department(dept_id);


--
-- Name: employee fk_e_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_e_branch_id FOREIGN KEY (assigned_branch_id) REFERENCES public.branch(branch_id);


--
-- Name: employee fk_e_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_e_emp_id FOREIGN KEY (superior_emp_id) REFERENCES public.employee(emp_id);


--
-- Name: transaction fk_exec_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_exec_branch_id FOREIGN KEY (execution_branch_id) REFERENCES public.branch(branch_id);


--
-- Name: individual fk_i_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT fk_i_cust_id FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id);


--
-- Name: officer fk_o_cust_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.officer
    ADD CONSTRAINT fk_o_cust_id FOREIGN KEY (cust_id) REFERENCES public.business(cust_id);


--
-- Name: account fk_product_cd; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT fk_product_cd FOREIGN KEY (product_cd) REFERENCES public.product(product_cd);


--
-- Name: product fk_product_type_cd; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_type_cd FOREIGN KEY (product_type_cd) REFERENCES public.product_type(product_type_cd);


--
-- Name: transaction fk_t_account_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_t_account_id FOREIGN KEY (account_id) REFERENCES public.account(account_id);


--
-- Name: transaction fk_teller_emp_id; Type: FK CONSTRAINT; Schema: public; Owner: jcdiner
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_teller_emp_id FOREIGN KEY (teller_emp_id) REFERENCES public.employee(emp_id);


--
-- PostgreSQL database dump complete
--

