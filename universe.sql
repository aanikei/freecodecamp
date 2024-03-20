--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(60) NOT NULL,
    constellation character varying(30),
    diameter_ly integer,
    link text NOT NULL
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
    name character varying(60) NOT NULL,
    semi_major_axis_km integer,
    equatorial_radius_km numeric(6,2),
    is_prograde boolean,
    link text NOT NULL,
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
    name character varying(60) NOT NULL,
    equatorial_diameter integer,
    gravity_m_s2 numeric(5,3),
    in_habitable_zone boolean,
    link text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_exploration; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_exploration (
    planet_exploration_id integer NOT NULL,
    name character varying(60) NOT NULL,
    launch date,
    type text,
    link text NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_exploration OWNER TO freecodecamp;

--
-- Name: planet_exploration_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_exploration_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_exploration_mission_id_seq OWNER TO freecodecamp;

--
-- Name: planet_exploration_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_exploration_mission_id_seq OWNED BY public.planet_exploration.planet_exploration_id;


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
    name character varying(60) NOT NULL,
    spectral_type character varying(6),
    distance_ly integer,
    link text NOT NULL,
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_exploration planet_exploration_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_exploration ALTER COLUMN planet_exploration_id SET DEFAULT nextval('public.planet_exploration_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 87400, 'https://en.wikipedia.org/wiki/Milky_Way');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Canis Major', NULL, 'https://en.wikipedia.org/wiki/Canis_Major_Overdensity');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Andromeda', 152000, 'https://en.wikipedia.org/wiki/Andromeda_Galaxy');
INSERT INTO public.galaxy VALUES (4, 'NGC 55', 'Sculptor', 70000, 'https://en.wikipedia.org/wiki/NGC_55');
INSERT INTO public.galaxy VALUES (5, 'NGC 2403', 'Camelopardalis', 50000, 'https://en.wikipedia.org/wiki/NGC_2403');
INSERT INTO public.galaxy VALUES (6, 'IC 342', 'Camelopardalis', 75000, 'https://en.wikipedia.org/wiki/IC_342');
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Dorado/Mensa', 32200, 'https://en.wikipedia.org/wiki/Large_Magellanic_Cloud');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384399, 1738.10, true, 'https://en.wikipedia.org/wiki/Moon', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376, 11.08, true, 'https://en.wikipedia.org/wiki/Phobos_(moon)', 4);
INSERT INTO public.moon VALUES (3, 'Io', NULL, 1821.60, true, 'https://en.wikipedia.org/wiki/Io_(moon)', 5);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, 1560.80, true, 'https://en.wikipedia.org/wiki/Europa_(moon)', 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1070400, 2634.10, true, 'https://en.wikipedia.org/wiki/Ganymede_(moon)', 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 1882700, 2410.30, true, 'https://en.wikipedia.org/wiki/Callisto_(moon)', 5);
INSERT INTO public.moon VALUES (7, 'Amalthea', NULL, 83.50, true, 'https://en.wikipedia.org/wiki/Amalthea_(moon)', 5);
INSERT INTO public.moon VALUES (8, 'S/2017 J 7', 20627000, NULL, true, 'https://en.wikipedia.org/wiki/Jupiter_LXVIII', 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 237948, 252.10, true, 'https://en.wikipedia.org/wiki/Enceladus', 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 294619, 531.10, true, 'https://en.wikipedia.org/wiki/Tethys_(moon)', 6);
INSERT INTO public.moon VALUES (11, 'Titan', 1221870, 2574.73, true, 'https://en.wikipedia.org/wiki/Titan_(moon)', 6);
INSERT INTO public.moon VALUES (12, 'Hyperion', 1481009, 135.00, true, 'https://en.wikipedia.org/wiki/Hyperion_(moon)', 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 3560820, 734.00, true, 'https://en.wikipedia.org/wiki/Iapetus_(moon)', 6);
INSERT INTO public.moon VALUES (14, 'S/2019 S 1', 11221100, 2.50, true, 'https://en.wikipedia.org/wiki/S/2019_S_1', 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 191020, 578.00, true, 'https://en.wikipedia.org/wiki/Ariel_(moon)', 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 266000, 584.00, true, 'https://en.wikipedia.org/wiki/Umbriel_(moon)', 7);
INSERT INTO public.moon VALUES (17, 'Miranda', 129390, 235.00, true, 'https://en.wikipedia.org/wiki/Miranda_(moon)', 7);
INSERT INTO public.moon VALUES (18, 'Triton', 354759, 1353.40, false, 'https://en.wikipedia.org/wiki/Triton_(moon)', 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 5504000, 178.50, true, 'https://en.wikipedia.org/wiki/Nereid_(moon)', 8);
INSERT INTO public.moon VALUES (20, 'Naiad', 48224, 33.00, true, 'https://en.wikipedia.org/wiki/Naiad_(moon)', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 3.700, false, 'https://en.wikipedia.org/wiki/Mercury_(planet)', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 8.870, true, 'https://en.wikipedia.org/wiki/Venus', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12756, 9.806, true, 'https://en.wikipedia.org/wiki/Earth', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6794, 3.720, true, 'https://en.wikipedia.org/wiki/Mars', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 24.790, false, 'https://en.wikipedia.org/wiki/Jupiter', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 120536, 10.440, false, 'https://en.wikipedia.org/wiki/Saturn', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 51118, 8.690, false, 'https://en.wikipedia.org/wiki/Uranus', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 11.150, false, 'https://en.wikipedia.org/wiki/Neptune', 1);
INSERT INTO public.planet VALUES (9, 'Draugr', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/PSR_B1257%2B12_A', 8);
INSERT INTO public.planet VALUES (10, 'Kepler-62f', 17986, NULL, true, 'https://en.wikipedia.org/wiki/Kepler-62f', 3);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 14925, NULL, true, 'https://en.wikipedia.org/wiki/Kepler-186f', 4);
INSERT INTO public.planet VALUES (12, 'Kepler-442b', 17093, NULL, true, 'https://en.wikipedia.org/wiki/Kepler-442b', 5);


--
-- Data for Name: planet_exploration; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_exploration VALUES (1, 'Pioneer 11', '1973-04-06', 'Flyby', 'https://science.nasa.gov/mission/pioneer-11/', 6);
INSERT INTO public.planet_exploration VALUES (2, 'Voyager 1', '1977-09-05', 'Flyby', 'https://science.nasa.gov/mission/voyager/voyager-1/', 6);
INSERT INTO public.planet_exploration VALUES (3, 'Voyager 2', '1977-08-20', 'Flyby', 'https://science.nasa.gov/mission/voyager/voyager-2/', 6);
INSERT INTO public.planet_exploration VALUES (4, 'Cassini-Huygens', '1997-10-15', 'Orbiter, Probe', 'https://science.nasa.gov/mission/cassini/', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 0, 'https://en.wikipedia.org/wiki/Sun', 1);
INSERT INTO public.star VALUES (2, 'Barnard''s Star', 'M4.0V', 6, 'https://en.wikipedia.org/wiki/Barnard%27s_Star', 1);
INSERT INTO public.star VALUES (3, 'Kepler-62', 'K2V', 982, 'https://en.wikipedia.org/wiki/Kepler-62', 1);
INSERT INTO public.star VALUES (4, 'Kepler-186', 'M1V', 579, 'https://en.wikipedia.org/wiki/Kepler-186', 1);
INSERT INTO public.star VALUES (5, 'Kepler-442', 'K5V', 1206, 'https://en.wikipedia.org/wiki/Kepler-442', 1);
INSERT INTO public.star VALUES (6, 'AE Andromedae', 'LBV', 2500000, 'https://en.wikipedia.org/wiki/AE_Andromedae', 3);
INSERT INTO public.star VALUES (7, 'Sanduleak -69 202', 'B3 Ia', 168000, 'https://en.wikipedia.org/wiki/Sanduleak_-69_202', 7);
INSERT INTO public.star VALUES (8, 'PSR B1257+12', 'Puls.', 2300, 'https://en.wikipedia.org/wiki/PSR_B1257%2B12', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_exploration_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_exploration_mission_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_link_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_link_key UNIQUE (link);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_link_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_link_key UNIQUE (link);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_exploration planet_exploration_link_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_exploration
    ADD CONSTRAINT planet_exploration_link_key UNIQUE (link);


--
-- Name: planet_exploration planet_exploration_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_exploration
    ADD CONSTRAINT planet_exploration_pkey PRIMARY KEY (planet_exploration_id);


--
-- Name: planet planet_link_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_link_key UNIQUE (link);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_link_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_link_key UNIQUE (link);


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
-- Name: planet_exploration planet_exploration_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_exploration
    ADD CONSTRAINT planet_exploration_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

