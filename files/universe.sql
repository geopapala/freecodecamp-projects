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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(64) NOT NULL,
    number_of_stars integer DEFAULT 0,
    brightest_star_name character varying(128),
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(128) NOT NULL,
    other_names text,
    galaxy_type character varying(50),
    is_active_galaxy boolean DEFAULT false,
    has_supermassive_black_hole boolean DEFAULT false,
    is_starburst_galaxy boolean DEFAULT false,
    constellation character varying(64),
    distance_light_years bigint,
    apparent_magnitude numeric(5,2),
    number_of_known_satellites integer DEFAULT 0,
    number_of_globular_clusters integer DEFAULT 0,
    description text,
    image_url text,
    discovered_by character varying(128),
    discovery_date date
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
    name character varying(128) NOT NULL,
    other_names text,
    moon_type character varying(50),
    is_geologically_active boolean DEFAULT false,
    planet_name character varying(128),
    orbital_radius_km numeric(12,2),
    orbital_period_days numeric(10,2),
    radius_km numeric(10,2),
    mass_kg numeric(30,2),
    number_of_craters integer DEFAULT 0,
    number_of_volcanoes integer DEFAULT 0,
    description text,
    image_url text,
    discovered_by character varying(128),
    discovery_date date,
    planet_id integer NOT NULL
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
    name character varying(128) NOT NULL,
    other_names text,
    planet_type character varying(50),
    is_gas_giant boolean DEFAULT false,
    is_terrestrial boolean DEFAULT false,
    is_habitable boolean DEFAULT false,
    star_name character varying(128),
    orbital_radius_au numeric(7,3),
    orbital_period_days numeric(10,2),
    radius_km numeric(10,2),
    mass_kg numeric(30,2),
    number_of_moons integer DEFAULT 0,
    number_of_rings integer DEFAULT 0,
    description text,
    image_url text,
    discovered_by character varying(128),
    discovery_date date,
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
    name character varying(128) NOT NULL,
    other_names text,
    star_type character varying(50),
    spectral_class character varying(10),
    is_variable_star boolean DEFAULT false,
    is_binary_star boolean DEFAULT false,
    is_supernova_candidate boolean DEFAULT false,
    constellation character varying(64),
    distance_light_years bigint,
    apparent_magnitude numeric(5,2),
    absolute_magnitude numeric(5,2),
    number_of_planets integer DEFAULT 0,
    number_of_binary_companions integer DEFAULT 0,
    description text,
    image_url text,
    discovered_by character varying(128),
    discovery_date date,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 81, 'Rigel', 'The Hunter, visible in winter skies, contains Betelgeuse and Rigel');
INSERT INTO public.constellation VALUES (2, 'Cygnus', 84, 'Deneb', 'The Swan, along the Milky Way, contains Deneb');
INSERT INTO public.constellation VALUES (3, 'Lyra', 6, 'Vega', 'Small constellation, contains Vega');
INSERT INTO public.constellation VALUES (4, 'Pegasus', 9, 'Enif', 'The Flying Horse, contains the Great Square');
INSERT INTO public.constellation VALUES (5, 'Andromeda', 18, 'Alpheratz', 'Contains the Andromeda Galaxy (M31)');
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 93, 'Alioth', 'The Big Bear, contains the Big Dipper asterism');
INSERT INTO public.constellation VALUES (7, 'Ursa Minor', 44, 'Polaris', 'The Little Bear, contains Polaris (North Star)');
INSERT INTO public.constellation VALUES (8, 'Cassiopeia', 55, 'Schedar', 'W-shaped constellation, visible in northern hemisphere');
INSERT INTO public.constellation VALUES (9, 'Leo', 67, 'Regulus', 'The Lion, contains bright stars Regulus and Denebola');
INSERT INTO public.constellation VALUES (10, 'Taurus', 19, 'Aldebaran', 'The Bull, contains Aldebaran and the Pleiades cluster');
INSERT INTO public.constellation VALUES (11, 'Aquarius', 50, 'Sadalmelik', 'The Water Bearer, zodiac constellation');
INSERT INTO public.constellation VALUES (12, 'Scorpius', 62, 'Antares', 'The Scorpion, contains Antares');
INSERT INTO public.constellation VALUES (13, 'Gemini', 85, 'Castor', 'The Twins, contains Castor and Pollux');
INSERT INTO public.constellation VALUES (14, 'Sagittarius', 56, 'Kaus Australis', 'The Archer, points to the center of the Milky Way');
INSERT INTO public.constellation VALUES (15, 'Canis Major', 55, 'Sirius', 'The Great Dog, contains Sirius, the brightest star in the night sky');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our Galaxy', 'Spiral', true, true, false, 'Sagittarius', 0, -6.50, 50, 150, 'Our home galaxy', 'https://example.com/milkyway.jpg', 'Ancient Observers', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'M31', 'Spiral', true, true, false, 'Andromeda', 2537000, 3.44, 30, 450, 'Nearest large galaxy', 'https://example.com/andromeda.jpg', 'Abd al-Rahman al-Sufi', '0964-01-01');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'M33', 'Spiral', false, true, false, 'Triangulum', 3000000, 5.72, 14, 50, 'Small spiral galaxy', 'https://example.com/triangulum.jpg', 'Giovanni Battista Hodierna', '1654-01-01');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'M87', 'Elliptical', true, true, false, 'Virgo', 53000000, 9.59, 20, 2000, 'Massive elliptical galaxy', 'https://example.com/m87.jpg', 'Charles Messier', '1781-03-18');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'M51', 'Spiral', true, true, true, 'Canes Venatici', 23000000, 8.40, 15, 500, 'Famous spiral galaxy', 'https://example.com/whirlpool.jpg', 'Charles Messier', '1773-10-13');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'M104', 'Spiral', false, true, false, 'Virgo', 29000000, 9.00, 10, 190, 'Bright central bulge', 'https://example.com/sombrero.jpg', 'Pierre Méchain', '1781-05-11');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', NULL, 'Terrestrial', false, NULL, 384400.00, 27.30, 1737.10, 73500000000000000000000.00, 100000, 0, 'Earths only natural satellite', 'https://example.com/moon.jpg', 'Ancient Observers', NULL, 4);
INSERT INTO public.moon VALUES (22, 'Phobos', NULL, 'Irregular', false, NULL, 9376.00, 0.32, 11.30, 10700000000000000.00, 1000, 0, 'Mars inner moon', 'https://example.com/phobos.jpg', 'Asaph Hall', '1877-08-18', 5);
INSERT INTO public.moon VALUES (23, 'Deimos', NULL, 'Irregular', false, NULL, 23463.00, 1.26, 6.20, 1480000000000000.00, 500, 0, 'Mars outer moon', 'https://example.com/deimos.jpg', 'Asaph Hall', '1877-08-12', 5);
INSERT INTO public.moon VALUES (24, 'Io', NULL, 'Volcanic', true, NULL, 421700.00, 1.77, 1821.60, 89300000000000000000000.00, 450, 400, 'Geologically active moon of Jupiter', 'https://example.com/io.jpg', 'Galileo Galilei', '1610-01-08', 6);
INSERT INTO public.moon VALUES (25, 'Europa', NULL, 'Icy', true, NULL, 670900.00, 3.55, 1560.80, 48000000000000000000000.00, 200, 0, 'Jupiter moon with subsurface ocean', 'https://example.com/europa.jpg', 'Galileo Galilei', '1610-01-08', 6);
INSERT INTO public.moon VALUES (26, 'Ganymede', NULL, 'Icy', false, NULL, 1070400.00, 7.16, 2634.10, 148000000000000000000000.00, 2000, 0, 'Largest moon in the Solar System', 'https://example.com/ganymede.jpg', 'Galileo Galilei', '1610-01-07', 6);
INSERT INTO public.moon VALUES (27, 'Callisto', NULL, 'Icy', false, NULL, 1882700.00, 16.69, 2410.30, 108000000000000000000000.00, 3000, 0, 'Heavily cratered Jupiter moon', 'https://example.com/callisto.jpg', 'Galileo Galilei', '1610-01-07', 6);
INSERT INTO public.moon VALUES (28, 'Titan', NULL, 'Icy', false, NULL, 1221870.00, 15.95, 2575.50, 135000000000000000000000.00, 1000, 0, 'Largest moon of Saturn', 'https://example.com/titan.jpg', 'Christiaan Huygens', '1655-03-25', 7);
INSERT INTO public.moon VALUES (29, 'Rhea', NULL, 'Icy', false, NULL, 527040.00, 4.52, 763.80, 2310000000000000000000.00, 500, 0, 'Second largest Saturn moon', 'https://example.com/rhea.jpg', 'Giovanni Cassini', '1672-12-23', 7);
INSERT INTO public.moon VALUES (30, 'Iapetus', NULL, 'Icy', false, NULL, 3560800.00, 79.32, 734.50, 1880000000000000000000.00, 300, 0, 'Famous two-tone moon', 'https://example.com/iapetus.jpg', 'Giovanni Cassini', '1671-10-25', 7);
INSERT INTO public.moon VALUES (31, 'Miranda', NULL, 'Icy', false, NULL, 129900.00, 1.41, 235.80, 65900000000000000000.00, 100, 0, 'Uranus moon with varied terrain', 'https://example.com/miranda.jpg', 'Gerard Kuiper', '1948-02-16', 8);
INSERT INTO public.moon VALUES (32, 'Ariel', NULL, 'Icy', false, NULL, 191020.00, 2.52, 578.90, 1350000000000000000000.00, 200, 0, 'Uranus moon', 'https://example.com/ariel.jpg', 'William Lassell', '1851-10-24', 8);
INSERT INTO public.moon VALUES (33, 'Umbriel', NULL, 'Icy', false, NULL, 266000.00, 4.14, 584.70, 1170000000000000000000.00, 300, 0, 'Uranus moon', 'https://example.com/umbriel.jpg', 'William Lassell', '1851-10-24', 8);
INSERT INTO public.moon VALUES (34, 'Titania', NULL, 'Icy', false, NULL, 435910.00, 8.71, 788.90, 3530000000000000000000.00, 400, 0, 'Largest Uranus moon', 'https://example.com/titania.jpg', 'William Herschel', '1787-01-11', 8);
INSERT INTO public.moon VALUES (35, 'Oberon', NULL, 'Icy', false, NULL, 583520.00, 13.46, 761.40, 3010000000000000000000.00, 350, 0, 'Uranus moon', 'https://example.com/oberon.jpg', 'William Herschel', '1787-01-11', 8);
INSERT INTO public.moon VALUES (36, 'Triton', NULL, 'Icy', true, NULL, 354760.00, 5.88, 1353.40, 21400000000000000000000.00, 500, 0, 'Largest Neptune moon, retrograde orbit', 'https://example.com/triton.jpg', 'William Lassell', '1846-10-10', 9);
INSERT INTO public.moon VALUES (37, 'Nereid', NULL, 'Icy', false, NULL, 5513800.00, 360.14, 170.00, 31000000000000000000.00, 100, 0, 'Neptune moon with eccentric orbit', 'https://example.com/nereid.jpg', 'Gerard Kuiper', '1949-05-01', 9);
INSERT INTO public.moon VALUES (38, 'Deimos II', NULL, 'Irregular', false, NULL, 25000.00, 1.30, 5.00, 1000000000000000.00, 50, 0, 'Fictitious second Mars moon', 'https://example.com/deimos2.jpg', 'Modern Astronomer', '2020-01-01', 5);
INSERT INTO public.moon VALUES (39, 'Luna Nova', NULL, 'Icy', false, NULL, 400000.00, 27.50, 1800.00, 75000000000000000000000.00, 200, 0, 'Fictitious new moon of Earth', 'https://example.com/lunanova.jpg', 'Modern Astronomer', '2021-01-01', 4);
INSERT INTO public.moon VALUES (40, 'Enceladus', NULL, 'Icy', true, NULL, 237948.00, 1.37, 252.10, 108000000000000000000.00, 100, 20, 'Active geysers and ice surface, Saturn moon', 'https://example.com/enceladus.jpg', 'William Herschel', '1789-08-28', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', NULL, 'Terrestrial', false, true, false, 'Sun', 0.390, 88.00, 2439.70, 330000000000000000000000.00, 0, 0, 'Closest planet to the Sun', 'https://example.com/mercury.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, 'Terrestrial', false, true, false, 'Sun', 0.720, 225.00, 6051.80, 4870000000000000000000000.00, 0, 0, 'Second planet from the Sun', 'https://example.com/venus.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 'Terra', 'Terrestrial', false, true, true, 'Sun', 1.000, 365.25, 6371.00, 5970000000000000000000000.00, 1, 0, 'Our home planet', 'https://example.com/earth.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.planet VALUES (5, 'Mars', NULL, 'Terrestrial', false, true, false, 'Sun', 1.520, 687.00, 3389.50, 642000000000000000000000.00, 2, 0, 'The Red Planet', 'https://example.com/mars.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', NULL, 'Gas Giant', true, false, false, 'Sun', 5.200, 4333.00, 69911.00, 1900000000000000000000000000.00, 95, 4, 'Largest planet in the Solar System', 'https://example.com/jupiter.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', NULL, 'Gas Giant', true, false, false, 'Sun', 9.580, 10759.00, 58232.00, 568000000000000000000000000.00, 82, 7, 'Known for its rings', 'https://example.com/saturn.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, 'Ice Giant', true, false, false, 'Sun', 19.200, 30687.00, 25362.00, 86800000000000000000000000.00, 27, 13, 'Rotates on its side', 'https://example.com/uranus.jpg', 'William Herschel', '1781-03-13', 1);
INSERT INTO public.planet VALUES (9, 'Neptune', NULL, 'Ice Giant', true, false, false, 'Sun', 30.050, 60190.00, 24622.00, 102000000000000000000000000.00, 14, 6, 'Furthest major planet', 'https://example.com/neptune.jpg', 'Johann Galle', '1846-09-23', 1);
INSERT INTO public.planet VALUES (10, 'Proxima b', NULL, 'Terrestrial', false, true, true, 'Proxima Centauri', 0.050, 11.20, 11400.00, 12700000000000000000000000.00, 0, 0, 'Exoplanet around Proxima Centauri', 'https://example.com/proximab.jpg', 'Anglada-Escudé', '2016-08-24', 6);
INSERT INTO public.planet VALUES (11, 'Alpha Cen Bb', NULL, 'Terrestrial', false, true, false, 'Alpha Centauri B', 0.040, 3.20, 11700.00, 11000000000000000000000000.00, 0, 0, 'Exoplanet around Alpha Centauri B', 'https://example.com/alphacenbb.jpg', 'Dumusque et al.', '2012-10-17', 3);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', NULL, 'Super-Earth', false, true, true, 'Kepler-22', 0.850, 289.00, 24200.00, 24000000000000000000000000.00, 0, 0, 'Potentially habitable exoplanet', 'https://example.com/kepler22b.jpg', 'Borucki et al.', '2011-12-05', 7);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', NULL, 'Gas Giant', true, false, false, 'HD 209458', 0.047, 3.50, 89000.00, 1310000000000000000000000000.00, 0, 0, 'Famous hot Jupiter', 'https://example.com/hd209458b.jpg', 'Charbonneau et al.', '1999-11-05', 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Sol', 'Main Sequence', 'G2V', false, false, false, 'Sagittarius', 0, -26.74, 4.83, 8, 0, 'The star at the center of the Solar System', 'https://example.com/sun.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Rigil Kentaurus', 'Main Sequence', 'G2V', false, true, false, 'Centaurus', 4, -0.27, 4.38, 1, 1, 'Brightest component of Alpha Centauri', 'https://example.com/alphacentauriA.jpg', 'Toliman Observers', '1839-01-01', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'Toliman', 'Main Sequence', 'K1V', false, true, false, 'Centaurus', 4, 1.33, 5.71, 0, 1, 'Binary companion to Alpha Centauri A', 'https://example.com/alphacentauriB.jpg', 'Toliman Observers', '1839-01-01', 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'Dog Star', 'Main Sequence', 'A1V', false, true, false, 'Canis Major', 8, -1.46, 1.42, 0, 1, 'Brightest star in the night sky', 'https://example.com/sirius.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Alpha Orionis', 'Red Supergiant', 'M1-2Ia-ab', true, false, true, 'Orion', 642, 0.42, -5.85, 0, 0, 'Famous red supergiant in Orion', 'https://example.com/betelgeuse.jpg', 'Ancient Observers', NULL, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Alpha Centauri C', 'Red Dwarf', 'M5.5Ve', true, false, false, 'Centaurus', 4, 11.13, 15.50, 1, 0, 'Closest star to the Sun', 'https://example.com/proxima.jpg', 'Robert Innes', '1915-10-18', 1);
INSERT INTO public.star VALUES (7, 'Kepler-22', NULL, 'Main Sequence', 'G5V', false, false, false, 'Cygnus', 600, 11.50, 4.80, 1, 0, 'Host star of exoplanet Kepler-22b', 'https://example.com/kepler22.jpg', 'Kepler Mission', '2009-05-12', 1);
INSERT INTO public.star VALUES (8, 'HD 209458', NULL, 'Main Sequence', 'G0V', false, false, false, 'Pegasus', 159, 7.65, 4.38, 1, 0, 'Host star of exoplanet HD 209458 b', 'https://example.com/hd209458.jpg', 'G. W. Henry et al.', '1999-11-05', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 15, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

