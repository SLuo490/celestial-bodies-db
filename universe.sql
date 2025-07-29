--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
    age_in_millions_of_years integer,
    distance_from_earth numeric,
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
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet_orbit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet_orbit (
    star_planet_orbit_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.star_planet_orbit OWNER TO freecodecamp;

--
-- Name: star_planet_orbit_orbit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_orbit_orbit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_orbit_orbit_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_orbit_orbit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_orbit_orbit_id_seq OWNED BY public.star_planet_orbit.star_planet_orbit_id;


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
-- Name: star_planet_orbit star_planet_orbit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_orbit ALTER COLUMN star_planet_orbit_id SET DEFAULT nextval('public.star_planet_orbit_orbit_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A classic example of a spiral galaxy with a companion.', 500, 23000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'An unbarred spiral galaxy with a prominent dust lane.', 13250, 29000000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest large spiral galaxy to the Milky Way.', 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'A spiral galaxy in the Local Group.', 6000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A supergiant elliptical galaxy in the constellation Virgo.', 13000, 53500000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (301, 'Moon', 'Earth''s only natural satellite.', 4530, 0.00000257, 201);
INSERT INTO public.moon VALUES (302, 'Phobos', 'One of Mars'' two small, irregularly shaped moons.', 4500, 0.0000288, 202);
INSERT INTO public.moon VALUES (303, 'Deimos', 'One of Mars'' two small, irregularly shaped moons.', 4500, 0.0000288, 202);
INSERT INTO public.moon VALUES (304, 'Europa', 'One of Jupiter''s largest moons, known for its icy surface.', 4500, 0.0005, 203);
INSERT INTO public.moon VALUES (305, 'Titan', 'Saturn''s largest moon and the second-largest moon in the Solar System.', 4500, 0.001, 206);
INSERT INTO public.moon VALUES (306, 'Io', 'One of Jupiter''s four large Galilean moons, volcanically active.', 4500, 0.0005, 203);
INSERT INTO public.moon VALUES (307, 'Ganymede', 'The largest moon in the Solar System, orbiting Jupiter.', 4500, 0.0005, 203);
INSERT INTO public.moon VALUES (308, 'Callisto', 'One of Jupiter''s Galilean moons, heavily cratered.', 4500, 0.0005, 203);
INSERT INTO public.moon VALUES (309, 'Enceladus', 'A moon of Saturn known for its geysers of water ice.', 4500, 0.001, 206);
INSERT INTO public.moon VALUES (310, 'Rhea', 'The second-largest moon of Saturn.', 4500, 0.001, 206);
INSERT INTO public.moon VALUES (311, 'Iapetus', 'A moon of Saturn with a striking two-tone coloration.', 4500, 0.001, 206);
INSERT INTO public.moon VALUES (312, 'Dione', 'A moon of Saturn, icy and heavily cratered.', 4500, 0.001, 206);
INSERT INTO public.moon VALUES (313, 'Tethys', 'A mid-sized moon of Saturn, largely composed of water ice.', 4500, 0.001, 206);
INSERT INTO public.moon VALUES (314, 'Miranda', 'One of Uranus''s most unusual moons, with varied terrains.', 4500, 0.0019, 208);
INSERT INTO public.moon VALUES (315, 'Titania', 'The largest of Uranus''s moons.', 4500, 0.0019, 208);
INSERT INTO public.moon VALUES (316, 'Oberon', 'The second-largest moon of Uranus.', 4500, 0.0019, 208);
INSERT INTO public.moon VALUES (317, 'Ariel', 'A bright, icy moon of Uranus.', 4500, 0.0019, 208);
INSERT INTO public.moon VALUES (318, 'Umbriel', 'A dark, cratered moon of Uranus.', 4500, 0.0019, 208);
INSERT INTO public.moon VALUES (319, 'Triton', 'The largest moon of Neptune, orbits in retrograde.', 4500, 0.0029, 207);
INSERT INTO public.moon VALUES (320, 'Nereid', 'A small, irregular moon of Neptune with an eccentric orbit.', 4500, 0.0029, 207);
INSERT INTO public.moon VALUES (321, 'Proteus', 'The second-largest moon of Neptune.', 4500, 0.0029, 207);
INSERT INTO public.moon VALUES (322, 'Charon', 'The largest moon of the dwarf planet Pluto.', 4500, 0.0075, 207);
INSERT INTO public.moon VALUES (323, 'Kerberos', 'One of Pluto''s small moons.', 4500, 0.0075, 207);
INSERT INTO public.moon VALUES (324, 'Styx', 'One of Pluto''s small moons.', 4500, 0.0075, 207);
INSERT INTO public.moon VALUES (325, 'Hydra', 'One of Pluto''s small moons.', 4500, 0.0075, 207);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (201, 'Earth', 'The third planet from the Sun and the only astronomical object known to harbor life.', 4543, 0, true, 101);
INSERT INTO public.planet VALUES (202, 'Mars', 'The fourth planet from the Sun, often called the Red Planet.', 4603, 0.0000288, false, 101);
INSERT INTO public.planet VALUES (203, 'Jupiter', 'The largest planet in our solar system, a gas giant.', 4603, 0.0005, false, 101);
INSERT INTO public.planet VALUES (204, 'Kepler-186f', 'The first Earth-size planet discovered in the habitable zone of another star.', 4000, 490, false, 105);
INSERT INTO public.planet VALUES (205, 'Venus', 'The second planet from the Sun, known for its thick, toxic atmosphere.', 4500, 0.000028, false, 101);
INSERT INTO public.planet VALUES (206, 'Saturn', 'The sixth planet from the Sun, famous for its prominent ring system.', 4500, 0.001, false, 101);
INSERT INTO public.planet VALUES (207, 'Neptune', 'The eighth and farthest known planet from the Sun.', 4500, 0.0029, false, 101);
INSERT INTO public.planet VALUES (208, 'Uranus', 'The seventh planet from the Sun, an ice giant.', 4500, 0.0019, false, 101);
INSERT INTO public.planet VALUES (209, 'Proxima Centauri b', 'An exoplanet orbiting within the habitable zone of Proxima Centauri.', 4850, 4.24, false, 105);
INSERT INTO public.planet VALUES (210, 'Gliese 581g', 'A controversial exoplanet candidate, possibly habitable.', 7000, 20.4, false, 102);
INSERT INTO public.planet VALUES (211, 'TRAPPIST-1e', 'One of several Earth-sized exoplanets in the TRAPPIST-1 system.', 7000, 39, false, 102);
INSERT INTO public.planet VALUES (212, 'TRAPPIST-1f', 'Another potentially habitable exoplanet in the TRAPPIST-1 system.', 7000, 39, false, 102);
INSERT INTO public.planet VALUES (213, 'Mercury', 'The smallest planet in our solar system and closest to the Sun.', 4500, 0.00000039, false, 101);
INSERT INTO public.planet VALUES (214, 'Kepler-452b', 'An exoplanet sometimes referred to as "Earth 2.0".', 6000, 1400, false, 108);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (108, 'Vega', 'A bright white star in the constellation Lyra.', 455, 25, false, 1);
INSERT INTO public.star VALUES (109, 'Rigel', 'A blue supergiant star in the constellation Orion.', 8, 860, false, 1);
INSERT INTO public.star VALUES (110, 'Canopus', 'The second brightest star in the night sky.', 25, 310, false, 1);
INSERT INTO public.star VALUES (111, 'Arcturus', 'A red giant star in the constellation Boötes.', 7100, 36.7, false, 1);
INSERT INTO public.star VALUES (101, 'Sun', 'The star at the center of our solar system.', 4600, 0.0000158, true, 1);
INSERT INTO public.star VALUES (102, 'Alpha Centauri A', 'Part of the closest star system to the Solar System.', 6000, 4.37, false, 1);
INSERT INTO public.star VALUES (103, 'Sirius', 'The brightest star in the night sky.', 242, 8.6, false, 1);
INSERT INTO public.star VALUES (104, 'Betelgeuse', 'A red supergiant in the constellation Orion.', 10, 642.5, false, 1);
INSERT INTO public.star VALUES (105, 'Proxima Centauri', 'A small, low-mass star, part of the Alpha Centauri system.', 4850, 4.24, false, 1);
INSERT INTO public.star VALUES (106, 'Polaris', 'The North Star, a yellow supergiant.', 70, 433, false, 1);
INSERT INTO public.star VALUES (107, 'Alpheratz', 'A blue-white subgiant star in the constellation Andromeda.', 60, 97, false, 2);


--
-- Data for Name: star_planet_orbit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet_orbit VALUES (1, 101, 201, NULL);
INSERT INTO public.star_planet_orbit VALUES (2, 101, 202, NULL);
INSERT INTO public.star_planet_orbit VALUES (3, 105, 209, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_planet_orbit_orbit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_orbit_orbit_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: star_planet_orbit star_planet_orbit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_orbit
    ADD CONSTRAINT star_planet_orbit_pkey PRIMARY KEY (star_planet_orbit_id);


--
-- Name: star_planet_orbit uq_star_planet_orbit; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_orbit
    ADD CONSTRAINT uq_star_planet_orbit UNIQUE (star_id, planet_id);


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
-- Name: star_planet_orbit star_planet_orbit_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_orbit
    ADD CONSTRAINT star_planet_orbit_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planet_orbit star_planet_orbit_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_orbit
    ADD CONSTRAINT star_planet_orbit_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

