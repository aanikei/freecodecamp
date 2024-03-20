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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (120, 2018, 'Final', 232, 233, 4, 2);
INSERT INTO public.games VALUES (121, 2018, 'Third Place', 234, 235, 2, 0);
INSERT INTO public.games VALUES (122, 2018, 'Semi-Final', 233, 235, 2, 1);
INSERT INTO public.games VALUES (123, 2018, 'Semi-Final', 232, 234, 1, 0);
INSERT INTO public.games VALUES (124, 2018, 'Quarter-Final', 233, 236, 3, 2);
INSERT INTO public.games VALUES (125, 2018, 'Quarter-Final', 235, 237, 2, 0);
INSERT INTO public.games VALUES (126, 2018, 'Quarter-Final', 234, 238, 2, 1);
INSERT INTO public.games VALUES (127, 2018, 'Quarter-Final', 232, 239, 2, 0);
INSERT INTO public.games VALUES (128, 2018, 'Eighth-Final', 235, 240, 2, 1);
INSERT INTO public.games VALUES (129, 2018, 'Eighth-Final', 237, 241, 1, 0);
INSERT INTO public.games VALUES (130, 2018, 'Eighth-Final', 234, 242, 3, 2);
INSERT INTO public.games VALUES (131, 2018, 'Eighth-Final', 238, 243, 2, 0);
INSERT INTO public.games VALUES (132, 2018, 'Eighth-Final', 233, 244, 2, 1);
INSERT INTO public.games VALUES (133, 2018, 'Eighth-Final', 236, 245, 2, 1);
INSERT INTO public.games VALUES (134, 2018, 'Eighth-Final', 239, 246, 2, 1);
INSERT INTO public.games VALUES (135, 2018, 'Eighth-Final', 232, 247, 4, 3);
INSERT INTO public.games VALUES (136, 2014, 'Final', 248, 247, 1, 0);
INSERT INTO public.games VALUES (137, 2014, 'Third Place', 249, 238, 3, 0);
INSERT INTO public.games VALUES (138, 2014, 'Semi-Final', 247, 249, 1, 0);
INSERT INTO public.games VALUES (139, 2014, 'Semi-Final', 248, 238, 7, 1);
INSERT INTO public.games VALUES (140, 2014, 'Quarter-Final', 249, 250, 1, 0);
INSERT INTO public.games VALUES (141, 2014, 'Quarter-Final', 247, 234, 1, 0);
INSERT INTO public.games VALUES (142, 2014, 'Quarter-Final', 238, 240, 2, 1);
INSERT INTO public.games VALUES (143, 2014, 'Quarter-Final', 248, 232, 1, 0);
INSERT INTO public.games VALUES (144, 2014, 'Eighth-Final', 238, 251, 2, 1);
INSERT INTO public.games VALUES (145, 2014, 'Eighth-Final', 240, 239, 2, 0);
INSERT INTO public.games VALUES (146, 2014, 'Eighth-Final', 232, 252, 2, 0);
INSERT INTO public.games VALUES (147, 2014, 'Eighth-Final', 248, 253, 2, 1);
INSERT INTO public.games VALUES (148, 2014, 'Eighth-Final', 249, 243, 2, 1);
INSERT INTO public.games VALUES (149, 2014, 'Eighth-Final', 250, 254, 2, 1);
INSERT INTO public.games VALUES (150, 2014, 'Eighth-Final', 247, 241, 1, 0);
INSERT INTO public.games VALUES (151, 2014, 'Eighth-Final', 234, 255, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (232, 'France');
INSERT INTO public.teams VALUES (233, 'Croatia');
INSERT INTO public.teams VALUES (234, 'Belgium');
INSERT INTO public.teams VALUES (235, 'England');
INSERT INTO public.teams VALUES (236, 'Russia');
INSERT INTO public.teams VALUES (237, 'Sweden');
INSERT INTO public.teams VALUES (238, 'Brazil');
INSERT INTO public.teams VALUES (239, 'Uruguay');
INSERT INTO public.teams VALUES (240, 'Colombia');
INSERT INTO public.teams VALUES (241, 'Switzerland');
INSERT INTO public.teams VALUES (242, 'Japan');
INSERT INTO public.teams VALUES (243, 'Mexico');
INSERT INTO public.teams VALUES (244, 'Denmark');
INSERT INTO public.teams VALUES (245, 'Spain');
INSERT INTO public.teams VALUES (246, 'Portugal');
INSERT INTO public.teams VALUES (247, 'Argentina');
INSERT INTO public.teams VALUES (248, 'Germany');
INSERT INTO public.teams VALUES (249, 'Netherlands');
INSERT INTO public.teams VALUES (250, 'Costa Rica');
INSERT INTO public.teams VALUES (251, 'Chile');
INSERT INTO public.teams VALUES (252, 'Nigeria');
INSERT INTO public.teams VALUES (253, 'Algeria');
INSERT INTO public.teams VALUES (254, 'Greece');
INSERT INTO public.teams VALUES (255, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 151, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 255, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games opponent_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_fk FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_fk FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

