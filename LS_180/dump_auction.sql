-- ran pg_dump auction -t bids --inserts > dump_auction.sql in CLI

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bids; Type: TABLE; Schema: public; Owner: ec2-user; Tablespace: 
--

CREATE TABLE bids (
    id integer NOT NULL,
    bidder_id integer NOT NULL,
    item_id integer NOT NULL,
    amount numeric(6,2),
    CONSTRAINT bids_amount_check CHECK ((amount <= (1000)::numeric))
);


ALTER TABLE public.bids OWNER TO "ec2-user";

--
-- Name: bids_id_seq; Type: SEQUENCE; Schema: public; Owner: ec2-user
--

CREATE SEQUENCE bids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bids_id_seq OWNER TO "ec2-user";

--
-- Name: bids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ec2-user
--

ALTER SEQUENCE bids_id_seq OWNED BY bids.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY bids ALTER COLUMN id SET DEFAULT nextval('bids_id_seq'::regclass);


--
-- Data for Name: bids; Type: TABLE DATA; Schema: public; Owner: ec2-user
--

INSERT INTO bids VALUES (1, 1, 1, 40.00);
INSERT INTO bids VALUES (2, 3, 1, 52.00);
INSERT INTO bids VALUES (3, 1, 1, 53.00);
INSERT INTO bids VALUES (4, 3, 1, 70.87);
INSERT INTO bids VALUES (5, 5, 2, 83.25);
INSERT INTO bids VALUES (6, 2, 3, 110.00);
INSERT INTO bids VALUES (7, 4, 3, 140.00);
INSERT INTO bids VALUES (8, 2, 3, 150.00);
INSERT INTO bids VALUES (9, 6, 3, 175.00);
INSERT INTO bids VALUES (10, 4, 3, 185.00);
INSERT INTO bids VALUES (11, 2, 3, 200.00);
INSERT INTO bids VALUES (12, 6, 3, 225.00);
INSERT INTO bids VALUES (13, 4, 3, 250.00);
INSERT INTO bids VALUES (14, 1, 4, 222.00);
INSERT INTO bids VALUES (15, 2, 4, 262.00);
INSERT INTO bids VALUES (16, 1, 4, 290.00);
INSERT INTO bids VALUES (17, 1, 4, 300.00);
INSERT INTO bids VALUES (18, 2, 5, 21.72);
INSERT INTO bids VALUES (19, 6, 5, 23.00);
INSERT INTO bids VALUES (20, 2, 5, 25.00);
INSERT INTO bids VALUES (21, 6, 5, 30.00);
INSERT INTO bids VALUES (22, 2, 5, 32.00);
INSERT INTO bids VALUES (23, 6, 5, 33.00);
INSERT INTO bids VALUES (24, 2, 5, 38.00);
INSERT INTO bids VALUES (25, 6, 5, 40.00);
INSERT INTO bids VALUES (26, 2, 5, 42.00);


--
-- Name: bids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ec2-user
--

SELECT pg_catalog.setval('bids_id_seq', 1, false);


--
-- Name: bids_pkey; Type: CONSTRAINT; Schema: public; Owner: ec2-user; Tablespace: 
--

ALTER TABLE ONLY bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (id);


--
-- Name: bidder_item_index; Type: INDEX; Schema: public; Owner: ec2-user; Tablespace: 
--

CREATE INDEX bidder_item_index ON bids USING btree (bidder_id, item_id);


--
-- Name: bids_bidder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY bids
    ADD CONSTRAINT bids_bidder_id_fkey FOREIGN KEY (bidder_id) REFERENCES bidders(id) ON DELETE CASCADE;


--
-- Name: bids_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ec2-user
--

ALTER TABLE ONLY bids
    ADD CONSTRAINT bids_item_id_fkey FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

