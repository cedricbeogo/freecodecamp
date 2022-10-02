--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (9, 'user_1664736353543', 2, 211);
INSERT INTO public.users VALUES (17, 'user_1664737123345', 2, 179);
INSERT INTO public.users VALUES (1, 'BEOGO', 7, 12);
INSERT INTO public.users VALUES (8, 'user_1664736353544', 5, 408);
INSERT INTO public.users VALUES (3, 'user_1664735607590', 2, 416);
INSERT INTO public.users VALUES (16, 'user_1664737123346', 5, 220);
INSERT INTO public.users VALUES (2, 'user_1664735607591', 5, 212);
INSERT INTO public.users VALUES (11, 'user_1664736684619', 2, 344);
INSERT INTO public.users VALUES (10, 'user_1664736684620', 5, 500);
INSERT INTO public.users VALUES (5, 'user_1664735869561', 2, 603);
INSERT INTO public.users VALUES (19, 'user_1664737210885', 2, 112);
INSERT INTO public.users VALUES (4, 'user_1664735869562', 5, 445);
INSERT INTO public.users VALUES (13, 'user_1664736721056', 2, 320);
INSERT INTO public.users VALUES (18, 'user_1664737210886', 5, 355);
INSERT INTO public.users VALUES (7, 'user_1664736251629', 2, 676);
INSERT INTO public.users VALUES (12, 'user_1664736721057', 5, 132);
INSERT INTO public.users VALUES (6, 'user_1664736251630', 5, 224);
INSERT INTO public.users VALUES (15, 'user_1664736939055', 2, 656);
INSERT INTO public.users VALUES (14, 'user_1664736939056', 5, 218);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

