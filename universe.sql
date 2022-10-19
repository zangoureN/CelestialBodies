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
    name character varying(40),
    num_planets integer NOT NULL,
    num_stars integer NOT NULL,
    star_type character varying(30)
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
-- Name: has_life; Type: TABLE; Schema: public; Owner: freecodecamp

CREATE TABLE public.has_life (
    has_life_id integer NOT NULL,
    name character varying(40),
    has_life boolean,
    galaxy_name text NOT NULL
);


ALTER TABLE public.has_life OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.has_life_has_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.has_life_has_life_id_seq OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.has_life_has_life_id_seq OWNED BY public.has_life.has_life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    planet_id integer NOT NULL,
    moon_color character varying(40),
    moon_life boolean
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
    has_life boolean,
    has_moon boolean,
    size numeric(9,3) NOT NULL,
    population integer NOT NULL,
    name character varying(40),
    star_id integer NOT NULL
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
    name character varying(40),
    star_type character varying(30),
    surface_temp integer NOT NULL,
    star_color text,
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: has_life has_life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life ALTER COLUMN has_life_id SET DEFAULT nextval('public.has_life_has_life_id_seq'::regclass);

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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'ZangoureN', 29, 578452, 'SPICA');
INSERT INTO public.galaxy VALUES (2, 'ZantouteN', 257, 5784, 'VEGA');
INSERT INTO public.galaxy VALUES (3, '101', 1, 5845, 'ARCTURUS');
INSERT INTO public.galaxy VALUES (4, 'None', 0, 1, 'ANTARES');
INSERT INTO public.galaxy VALUES (5, 'EL19', 19, 45121, 'VEGASPICA');
INSERT INTO public.galaxy VALUES (6, 'TooMuch9', 257419, 84571, 'ANTARESUNCA');


--
-- Data for Name: has_life; Type: TABLE DATA; Schema: public; Owner: freecodecamp

INSERT INTO public.has_life VALUES (9, 'Eath13', false, 'ZangoureN');
INSERT INTO public.has_life VALUES (10, 'Eath02', true, 'ZantouteN');
INSERT INTO public.has_life VALUES (11, 'Eath06', false, 'ZantouteN');
INSERT INTO public.has_life VALUES (13, 'Eath06', true, 'EL19');
INSERT INTO public.has_life VALUES (14, 'Eath04', true, 'EL19');
INSERT INTO public.has_life VALUES (16, 'Eath12', true, 'EL19');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Albator', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Cobra', 1, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'BTX', 1, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'One Piece', 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Bleach', 3, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Berdouuuuussse', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Zasck', 4, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Kaneki', 2, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'LGHOST', 3, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Ryuz', 4, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'SOO', 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'ZangoureN', 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'One Piece', 2, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Bleach', 3, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Lycia', 3, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'GHANOU', 4, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Gronov', 2, NULL, NULL);
INSERT INTO public.moon VALUES (18, '7THRI', 3, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'DON', 4, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'TCHITCHO', 1, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'TITO', 2, NULL, NULL);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (11, true, true, 784.000, 17, 'Eath10', 10);
INSERT INTO public.planet VALUES (1, true, true, 18548.149, 18875, 'Eath02', 10);
INSERT INTO public.planet VALUES (2, false, true, 148.149, 175, 'Eath03', 10);
INSERT INTO public.planet VALUES (13, true, true, 784.000, 47, 'Eath11', 10);
INSERT INTO public.planet VALUES (4, false, true, 78454.000, 117, 'Eath05', 11);
INSERT INTO public.planet VALUES (14, true, true, 78584.000, 1447, 'Eath12', 11);
INSERT INTO public.planet VALUES (3, false, false, 14.147, 17, 'Eath04', 12);
INSERT INTO public.planet VALUES (15, true, true, 78584.000, 1447, 'Eath13', 12);
INSERT INTO public.planet VALUES (5, false, true, 78454.000, 117, 'Eath06', 13);
INSERT INTO public.planet VALUES (8, false, true, 78454.000, 1147, 'Eath07', 13);
INSERT INTO public.planet VALUES (9, true, true, 78454.000, 1147, 'Eath08', 13);
INSERT INTO public.planet VALUES (10, true, true, 78454.000, 1147, 'Eath09', 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (10, 'SPICA', 'SPICA', 28000, 'Blue', 1);
INSERT INTO public.star VALUES (11, 'VEGA', 'VEGA', 11000, 'Pink', 2);
INSERT INTO public.star VALUES (12, 'ARCTURUS', 'ARCTURUS', 6000, 'Yellow', 3);
INSERT INTO public.star VALUES (13, 'ANTARES', 'ANTARES', 5000, 'ORANGE', 4);
INSERT INTO public.star VALUES (14, 'Berdousse', 'Berdousse', 170, 'DOG', 3);
INSERT INTO public.star VALUES (15, 'THE SUN', 'The SUN', 6000, 'Yellow', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.has_life_has_life_id_seq', 16, true);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


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
-- Name: has_life has_life_has_life_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_has_life_id_key UNIQUE (has_life_id);


--
-- Name: has_life has_life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_pkey PRIMARY KEY (has_life_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star fk_galaxystar; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxystar FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moonplanet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moonplanet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: has_life fk_planethaslife; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT fk_planethaslife FOREIGN KEY (name) REFERENCES public.planet(name);


--
-- Name: planet fk_planetstar; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planetstar FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
