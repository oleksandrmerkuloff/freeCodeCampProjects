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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    description text,
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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    description text,
    star_id integer,
    amount_moon integer
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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    description text,
    galaxy_id integer,
    discovered_year integer
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
-- Name: student; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    name character varying NOT NULL,
    age integer
);


ALTER TABLE public.student OWNER TO freecodecamp;

--
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.student_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_student_id_seq OWNER TO freecodecamp;

--
-- Name: student_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.student_student_id_seq OWNED BY public.student.student_id;


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
-- Name: student student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.student ALTER COLUMN student_id SET DEFAULT nextval('public.student_student_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 26670, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Butterfly Galaxy', false, 60000000, 'Galaxy code: NGC4568');
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', false, 2537000, 'Galaxy code: NGC224');
INSERT INTO public.galaxy VALUES (4, 'Gondor Galaxy', false, 212000000, 'Galaxy code: NGC6872');
INSERT INTO public.galaxy VALUES (5, 'Comet Galaxy', false, 3200000000, 'Galaxy code: Albell 2667');
INSERT INTO public.galaxy VALUES (6, 'Eye of Sauron', false, 52000000, 'Galaxy code: NGC4151');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 20, 'Our moon', 3);
INSERT INTO public.moon VALUES (2, 'Deimos', false, 30, 'first mars moon', 4);
INSERT INTO public.moon VALUES (3, 'Phobos', false, 30, 'deimos brother', 4);
INSERT INTO public.moon VALUES (4, 'Styx', false, 100, 'first pluto moon', 9);
INSERT INTO public.moon VALUES (5, 'Nix', false, 100, 'styx brother', 9);
INSERT INTO public.moon VALUES (6, 'Hydra', false, 100, 'like snake', 9);
INSERT INTO public.moon VALUES (7, 'Rhea', false, 100, 'second moon', 6);
INSERT INTO public.moon VALUES (8, 'Trojan', false, 80, 'history moon', 6);
INSERT INTO public.moon VALUES (9, 'Norse', false, 80, 'irregular moon', 6);
INSERT INTO public.moon VALUES (10, 'Lapetus', false, 105, 'third moon', 6);
INSERT INTO public.moon VALUES (11, 'Hyperion', false, 85, 'titan bro', 6);
INSERT INTO public.moon VALUES (12, 'Titan', false, 70, 'just titan', 6);
INSERT INTO public.moon VALUES (13, 'Europe', false, 50, 'Most promising place', 5);
INSERT INTO public.moon VALUES (14, 'lo', false, 55, 'a little hot', 5);
INSERT INTO public.moon VALUES (15, 'Ganymede', false, 50, 'largest moon', 5);
INSERT INTO public.moon VALUES (16, 'Calisto', false, 58, 'Second largest moon', 5);
INSERT INTO public.moon VALUES (17, 'Kale', false, 54, 'HAwaii', 5);
INSERT INTO public.moon VALUES (18, 'Core', false, 58, 'cpu core?', 5);
INSERT INTO public.moon VALUES (19, 'Herse', false, 55, 'Carme group', 5);
INSERT INTO public.moon VALUES (20, 'Dia', false, 68, 'beautiful name', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 77, 'fire planet', 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', false, 80, 'second planet', 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', true, 0, 'our planet', 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 60, 'war planet', 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 89, 'storm planet', 1, 80);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 100, 'dark planet', 1, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 130, 'Bode planet', 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 140, 'Blue planet', 1, 14);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 145, 'dwarf planet', 1, 5);
INSERT INTO public.planet VALUES (12, 'Pegasi b', false, 500, 'giant and dwarf planet', 3, 0);
INSERT INTO public.planet VALUES (11, 'Glias 876 b', false, 300, 'gas giant planet', 4, 0);
INSERT INTO public.planet VALUES (10, 'Epsilon Eridani', false, 250, 'closest planet', 2, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 150, 'Our star', 1, 1590);
INSERT INTO public.star VALUES (2, 'Unukalhai', false, 740000000, 'Snake star', 2, 1889);
INSERT INTO public.star VALUES (3, 'Mira', false, 74000000, 'Binary eclipcing', 2, 1779);
INSERT INTO public.star VALUES (4, 'Rana', false, 7400000, 'Like bullfrog', 3, 1923);
INSERT INTO public.star VALUES (5, 'Ain', false, 74000000, 'Just ain', 4, 1889);
INSERT INTO public.star VALUES (6, 'Arneb', false, 74000000, 'Double star', 5, 1889);


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.student VALUES (1, 'Oleksandr', 20);
INSERT INTO public.student VALUES (2, 'Jenya', 20);
INSERT INTO public.student VALUES (3, 'Ilya', 20);


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
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.student_student_id_seq', 3, true);


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
-- Name: student student_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_name_key UNIQUE (name);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


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

