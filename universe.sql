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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    length integer,
    height integer,
    weight numeric(4,1),
    has_life boolean,
    is_spherical boolean,
    a_text text,
    galaxy_foreign character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_s_n_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_s_n_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_s_n_seq OWNER TO freecodecamp;

--
-- Name: galaxy_s_n_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_s_n_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    length integer,
    height integer,
    weight numeric(4,1),
    has_life boolean,
    is_spherical boolean,
    a_text text,
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
    name character varying(40) NOT NULL,
    radius integer,
    height integer,
    has_life boolean,
    is_spherical boolean,
    distance_from_sun integer,
    a_text text,
    planet_foreign character varying(20),
    star_id integer
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
-- Name: saba; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.saba (
    saba_id integer NOT NULL,
    name character varying(50),
    length integer NOT NULL,
    height integer NOT NULL,
    weight numeric(4,1),
    is_life boolean,
    is_spherical boolean,
    a_text text
);


ALTER TABLE public.saba OWNER TO freecodecamp;

--
-- Name: saba_saba_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.saba_saba_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saba_saba_id_seq OWNER TO freecodecamp;

--
-- Name: saba_saba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.saba_saba_id_seq OWNED BY public.saba.saba_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    length integer,
    height integer,
    weight numeric(4,1),
    has_life boolean,
    is_spherical boolean,
    a_text text,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_s_n_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: saba saba_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.saba ALTER COLUMN saba_id SET DEFAULT nextval('public.saba_saba_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 600, 500, 7.1, NULL, NULL, 'yeske', 'foreign');
INSERT INTO public.galaxy VALUES (2, 'milky way', 400, 600, 7.1, true, false, 'yeske', 'foreign');
INSERT INTO public.galaxy VALUES (3, 'milky way', 400, 600, 7.1, true, false, 'yeske', 'foreign');
INSERT INTO public.galaxy VALUES (4, 'milky way', 400, 600, 7.1, false, false, 'yeske', 'foreign');
INSERT INTO public.galaxy VALUES (5, 'milky way', 400, 600, 7.1, false, false, 'yeske', 'foreign');
INSERT INTO public.galaxy VALUES (6, 'milky way', 400, 600, 7.1, false, false, 'yeske', 'foreign');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (2, 'moon', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (3, 'moon_3', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (4, 'moon_4', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (5, 'moon_5', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (6, 'moon_6', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (7, 'moon_7', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (8, 'moon_8', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (9, 'moon_9', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (10, 'moon_10', 12000, 100, 13.2, false, false, 'yeske', NULL);
INSERT INTO public.moon VALUES (11, 'moon_11', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (12, 'moon_12', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (13, 'moon_13', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (14, 'moon_14', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (15, 'moon_15', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (16, 'moon_16', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (17, 'moon_17', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (18, 'moon_18', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (19, 'moon_19', 12000, 100, 13.2, true, true, 'yeske', NULL);
INSERT INTO public.moon VALUES (20, 'moon_20', 12000, 100, 13.2, true, true, 'yeske', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 400, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (2, 'mercury', 100, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (3, 'mercury', 200, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (4, 'mercury', 300, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (5, 'venus', 500, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (6, 'venus', 600, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (7, 'venus', 700, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (8, 'venus', 800, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (9, 'venus', 900, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (10, 'earth', 1000, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (11, 'earth', 11000, 600, false, false, 3000000, 'yeske', 'foreign', NULL);
INSERT INTO public.planet VALUES (12, 'earth', 12000, 600, false, false, 3000000, 'yeske', 'foreign', NULL);


--
-- Data for Name: saba; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.saba VALUES (1, 'klazik', 98, 489, 28.2, false, true, 'yeske');
INSERT INTO public.saba VALUES (2, 'klazik', 98, 489, 28.2, false, true, 'yeske');
INSERT INTO public.saba VALUES (3, 'klazik', 98, 489, 28.2, false, true, 'yeske');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'milky way', 400, 600, 7.1, false, false, 'yeske', NULL);
INSERT INTO public.star VALUES (2, 'milky way', 400, 600, 7.1, false, false, 'yeske', NULL);
INSERT INTO public.star VALUES (3, 'milky way', 400, 600, 7.1, false, false, 'yeske', NULL);
INSERT INTO public.star VALUES (4, 'milky way', 400, 600, 7.1, false, false, 'yeske', NULL);
INSERT INTO public.star VALUES (5, 'milky way', 400, 600, 7.1, false, false, 'yeske', NULL);
INSERT INTO public.star VALUES (6, 'milky way', 400, 600, 7.1, false, false, 'yeske', NULL);


--
-- Name: galaxy_s_n_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_s_n_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: saba_saba_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.saba_saba_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_radius_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_radius_key UNIQUE (radius);


--
-- Name: saba saba_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.saba
    ADD CONSTRAINT saba_pkey PRIMARY KEY (saba_id);


--
-- Name: saba saba_saba_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.saba
    ADD CONSTRAINT saba_saba_id_key UNIQUE (saba_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

