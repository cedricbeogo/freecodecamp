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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: distance; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance (
    distance_id integer NOT NULL,
    name character varying(30) NOT NULL,
    earth_id integer,
    planet_id integer,
    distance_from_earth numeric(4,1)
);


ALTER TABLE public.distance OWNER TO freecodecamp;

--
-- Name: distance_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_distance_id_seq OWNER TO freecodecamp;

--
-- Name: distance_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_distance_id_seq OWNED BY public.distance.distance_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(30),
    magnitude numeric(4,2),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric(4,1),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_types character varying(30),
    description text,
    star_id integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: distance distance_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance ALTER COLUMN distance_id SET DEFAULT nextval('public.distance_distance_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: distance; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distance VALUES (1, 'Mercure', 3, 1, 3.5);
INSERT INTO public.distance VALUES (2, 'Venus', 3, 2, 2.5);
INSERT INTO public.distance VALUES (3, 'Terre', 3, 3, 0.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Voie lactée', 'SBbc', -20.80, 'Galaxie à laquelle appartient la terre. Galaxie spirale barrée');
INSERT INTO public.galaxy VALUES (2, 'Galaxie Naine du Grand Chien', 'Irr(statut contesté)', -14.50, 'Satellite de la voie lactée(Acrétion par la voie lactée)');
INSERT INTO public.galaxy VALUES (3, 'Draco II', NULL, -0.80, 'Satellite de la Voie lactée');
INSERT INTO public.galaxy VALUES (4, 'Tucana III', NULL, -1.30, 'Satellite de la Voie lactée perturbée');
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 'dSph or Glob clus', -3.00, 'Satellite de la voie lactée');
INSERT INTO public.galaxy VALUES (6, 'SagDEG', 'dSph/E7', -12.67, 'Satellite de la Voie lactée(Accrétion partielle de la Voie lactée)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ophélie', 'C''est un satellite naturel de la planete Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (2, 'Bianca', 'C''est u satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (3, 'Cressida', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (4, 'Desdémone', 'C''est un satellite naturel de Uranuse', 2.3, 7);
INSERT INTO public.moon VALUES (5, 'Juliette', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (6, 'Portia', 'C''est un satellite naturel de Uranuse', 2.3, 7);
INSERT INTO public.moon VALUES (7, 'Rosalinde', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (8, 'Cupid', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (9, 'Belinda', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (10, 'Perdita', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (11, 'Puck', 'C''est un satellite naturel de la planete Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (12, 'Mab', 'C''est u satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (13, 'Miranda', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 'C''est un satellite naturel de Uranuse', 2.3, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'C''est un satellite naturel de Uranuse', 2.3, 7);
INSERT INTO public.moon VALUES (17, 'Obéron', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (18, 'Francisco', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (19, 'Caliban', 'C''est un satellite naturel de Uranus', 2.3, 7);
INSERT INTO public.moon VALUES (20, 'Stephano', 'C''est un satellite naturel de Uranus', 2.3, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercure', 'Tellurique', 'C''est la planete la plus proche du soleil et la plus petite du systeme solaire', 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Tellurique', 'C''est la  deuxième planete la plus proche du soleil. Elle est la plus chaude du systeme solaire.', 1, false);
INSERT INTO public.planet VALUES (3, 'Terre', 'Tellurique', 'C''est la troisième planete la plus proche du soleil. Elle est aussi appelée planete bleue.', 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Tellurique', 'Ellle est aussi appélée planete rouge.', 2, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gazeuse', 'C''est la plus grande planete du systeme solaire', 2, false);
INSERT INTO public.planet VALUES (6, 'Saturne', 'Gazeuse', 'C''est le deuxime plus grande planete du systeme solaire. Ses anneaux sont en glace et poussière.', 1, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Gazeuse', 'Elle est constitué presque totalement d''hydrogène et d''hélium et un peu de méthane', 3, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Gazeuse', 'Elle apparait bleue grace à la présence de méthane.', 2, false);
INSERT INTO public.planet VALUES (9, 'Amateru', 'Exoplanete', 'Elle est confirmée en orbite autour de l''etoile epsilon Tauri dans la constellation zodiacale', 3, false);
INSERT INTO public.planet VALUES (10, 'Quichotte', 'Exoplanete', 'Elle serait situé dans la zone habitable de son étoile.', 3, false);
INSERT INTO public.planet VALUES (11, 'Dulcinée', 'Exoplanete', 'La nature de cette planete est incertaine', 5, false);
INSERT INTO public.planet VALUES (12, 'Rossinante', 'Exoplanete', 'Elle boucle en 310 jours une orbite peu excenttrique', 5, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', true, 'Elle fait partie des étoiles blanches', 1);
INSERT INTO public.star VALUES (2, 'Canopus', false, 'Elle est l''étoile la plus brillante de la constéllation australe de la carene et 71 fois plus grande que le soleil', 1);
INSERT INTO public.star VALUES (3, 'Arcturus', true, 'Le diamètre d''Arcturus est de 20 fois celuis du soleil', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', true, 'C''est l''une des étoiles les plus proches de la terre', 1);
INSERT INTO public.star VALUES (5, 'Véga', false, 'Elle est l''étoile la plus brillante de la constelleation de Lyre', 1);
INSERT INTO public.star VALUES (6, 'Rigel', true, 'C''est une supergéante bleue 55000 fois plus lumineuse que le soleil', 1);


--
-- Name: distance_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_distance_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: distance distance_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_name_key UNIQUE (name);


--
-- Name: distance distance_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_pkey PRIMARY KEY (distance_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

