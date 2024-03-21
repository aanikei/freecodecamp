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
-- Name: gamers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gamers (
    name character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.gamers OWNER TO freecodecamp;

--
-- Data for Name: gamers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gamers VALUES ('A', 7, 1);
INSERT INTO public.gamers VALUES ('B', 1, 8);
INSERT INTO public.gamers VALUES ('C', 1, 20);
INSERT INTO public.gamers VALUES ('user_1711044649804', 2, 246);
INSERT INTO public.gamers VALUES ('user_1711044649805', 5, 70);
INSERT INTO public.gamers VALUES ('a', 1, 10);
INSERT INTO public.gamers VALUES ('user_1711045175043', 2, 359);
INSERT INTO public.gamers VALUES ('user_1711045175044', 5, 48);
INSERT INTO public.gamers VALUES ('user_1711045273439', 2, 664);
INSERT INTO public.gamers VALUES ('user_1711045273440', 5, 48);
INSERT INTO public.gamers VALUES ('user_1711045310556', 2, 319);
INSERT INTO public.gamers VALUES ('user_1711045310557', 5, 21);
INSERT INTO public.gamers VALUES ('user_1711045340285', 2, 750);
INSERT INTO public.gamers VALUES ('user_1711045340286', 5, 68);


--
-- Name: gamers gamers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamers
    ADD CONSTRAINT gamers_pkey PRIMARY KEY (name);


--
-- PostgreSQL database dump complete
--

