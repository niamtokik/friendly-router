-- 
-- friendly open-source router database
--

PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS manufacturer;
DROP TABLE IF EXISTS reseller;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS arch;
DROP TABLE IF EXISTS processor;
DROP TABLE IF EXISTS memory;
DROP TABLE IF EXISTS netif;
DROP TABLE IF EXISTS power;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS city;

--
-- table country, will contain all
-- country name.
--
CREATE TABLE IF NOT EXISTS country (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
);

--
-- table city, will contain all city name
--
CREATE TABLE IF NOT EXISTS city (
          id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
);

--
-- Manufacturers table. Will contain
-- all manufacturers informations.
--
CREATE TABLE IF NOT EXISTS manufacturer (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
	, website TEXT
	, twitter TEXT
	, facebook TEXT
	, google TEXT
);

--
-- Manufacturer location table, will contain
-- all location informations.
--
CREATE TABLE IF NOT EXISTS manufacturer_location (
          manufacturer_id INTEGER
	, country_id INTEGER
	, city_id INTEGER
	, address TEXT
	, FOREIGN KEY(manufacturer_id) REFERENCES manufacturer(id)
	, FOREIGN KEY(country_id) REFERENCES country(id)
	, FOREIGN KEY(city_id) REFERENCES city(id)
);

INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "asus"
	       , "https://www.asus.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "bpi"
	       , "http://www.banana-pi.org"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "commell"
	       , "http://www.commell.com.tw"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "cstpic"
	       , "http://www.cstipc.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "cz.nic"
	       , "https://project.turris.cz"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "gigabyte"
	       , "http://b2b.gigabyte.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "inctel"
	       , "https://www.asus.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "jetway"
	       , "http://www.jetwaycomputer.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "msi"
	       , "http://ipc.msi.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "norco"
	       , "http://www.norco-group.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "pcengine"
	       , "https://pcengines.ch"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "soekris"
	       , "https://soekris.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "supermicro"
	       , "https://www.supermicro.nl"
	       , ""
	       , ""
	       , "" );

--
-- Resellers table. Will contain
-- all resellers informations.
--
CREATE TABLE IF NOT EXISTS reseller (
	  id INTEGER PRIMARY KEY
	, name TEXT
	, website TEXT
	, twitter TEXT
	, facebook TEXT
	, linkedin TEXT
	, google TEXT
);

--
-- Reseller location table. Will contain
-- address and other info.
--
CREATE TABLE IF NOT EXISTS reseller_location (
          reseller_id INTEGER
	, country_id INTEGER
	, city_id INTEGER
	, address TEXT
	, FOREIGN KEY(reseller_id) REFERENCES reseller(id)
	, FOREIGN KEY(country_id) REFERENCES country(id)
	, FOREIGN KEY(city_id) REFERENCES city(id)
);

--
-- OS table. Will contain only
-- open-source operating systems
--
CREATE TABLE IF NOT EXISTS os (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
	, link TEXT
);

INSERT INTO os (name, link)
       VALUES ("linux", "https://www.kernel.org");
INSERT INTO os (name, link)
       VALUES ("alpine", "https://www.alpinelinux.org");
INSERT INTO os (name, link)
       VALUES ("dd-wrt", "https://www.dd-wrt.com");
INSERT INTO os (name, link)
       VALUES ("clearos", "https://www.clearos.com");
INSERT INTO os (name, link)
       VALUES ("ipfire", "http://www.ipfire.org");
INSERT INTO os (name, link)
       VALUES ("ipcop", "http://www.ipcop.org");
INSERT INTO os (name, link)
       VALUES ("smoothwall", "http://www.smoothwall.org");
INSERT INTO os (name, link)
       VALUES ("freebsd", "https://www.freebsd.org");
INSERT INTO os (name, link)
       VALUES ("pfsense", "https://pfsense.org");
INSERT INTO os (name, link)
       VALUES ("opnsense", "https://opnsense.org");
INSERT INTO os (name, link)
       VALUEs ("m0n0wall", "http://m0n0.ch/wall");
INSERT INTO os (name, link)
       VALUEs ("bsdrouter", "http://bsdrp.net");
INSERT INTO os (name, link)
       VALUES ("openbsd", "https://www.openbsd.org");
INSERT INTO os (name, link)
       VALUES ("netbsd", "https://www.netbsd.org");
INSERT INTO os (name, link)
       VALUES ("securityrouter", "http://securityrouter.org");

--
-- Products table. Will contain
-- all products with information.
--
CREATE TABLE IF NOT EXISTS product (
	  id INTEGER PRIMARY KEY
	, ref TEXT
	, link TEXT
);

INSERT INTO product (ref, link)
       VALUES ( "alix1e"
       	      , "https://pcengines.ch/alix1e.htm");
INSERT INTO product (ref, link)
       VALUES ( "alix2d2"
       	      , "https://pcengines.ch/alix2d2.htm");
INSERT INTO product (ref, link)
       VALUES ( "alix2d3"
       	      , "https://pcengines.ch/alix2d3.htm");
INSERT INTO product (ref, link)
       VALUES ( "alix2d13"
       	      , "https://pcengines.ch/alix2d13.htm");
INSERT INTO product (ref, link)
       VALUES ( "alix3d2"
       	      , "https://pcengines.ch/alix3d2.htm");
INSERT INTO product (ref, link)
       VALUES ( "alix3d3"
       	      , "https://pcengines.ch/alix3d3.htm");
INSERT INTO product (ref, link)
       VALUES ( "alix6f2"
       	      , "https://pcengines.ch/alix6f2.htm");
INSERT INTO product (ref, link)
       VALUES ( "apu"
       	      , "https://pcengines.ch/apu.htm");
INSERT INTO product (ref, link)
       VALUES ( "apu2c0"
       	      , "https://pcengines.ch/apu2c0.htm");
INSERT INTO product (ref, link)
       VALUES ( "apu2c2"
       	      , "https://pcengines.ch/apu2c2.htm");
INSERT INTO product (ref, link)
       VALUES ( "apu2c4"
       	      , "https://pcengines.ch/apu2c4.htm");
INSERT INTO product (ref, link)
       VALUES ( "apu3a2"
       	      , "https://pcengines.ch/apu3a2.htm");
INSERT INTO product (ref, link)
       VALUES ( "apu3a4"
       	      , "https://pcengines.ch/apu3a4.htm");
INSERT INTO product (ref, link)
       VALUES ( "net5501-60"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "net5501-70"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "net6501-30"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "net6501-50"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "net6501-70"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "turris-omnia"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-MHN4"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-MLHN4"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-MHN4"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-LTN4"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-TN4"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "NF592-Q170"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "JBC153F592"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "JBC153F9HB"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "JBC153F9HG"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "JBC150F592"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "JBC150F59H"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "JBC152F533"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "LE-575"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "LS-574"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "LS-573"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "LE-564"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "GA-9SISL"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "EL-30"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "MS-99A1"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "MS-98H1"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "K-Q77NS"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "K-D56NS"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "K-945GSN"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "BIS-6370"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "banana-pi-r1"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "RTN16"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M5F"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M5V"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M5V_B"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M2F"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M8F"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M9F"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M9F_B"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-D25SL"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-G41XE"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-H67SL"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-B75SL"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-H87SL_B"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-N70SL"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "ITX-N70SL_B"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "A1SRM-LN5F-2358"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "A1SRM-LN7F-2358"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "A1SRM-LN7F-2758"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "X11SSH-LN4F"
       	      , "");
INSERT INTO product (ref, link)
       VALUES ( "X11SBA-LN4F"
       	      , "");

--
-- arch table will contain specific
-- archiecture and micro-architecture
-- processors
--
CREATE TABLE IF NOT EXISTS arch (
	  id INTEGER PRIMARY KEY
	, name TEXT 
	, value INTEGER
);

INSERT INTO arch (name, value) VALUES ("x86", 32);
INSERT INTO arch (name, value) VALUES ("x86_64", 64);
INSERT INTO arch (name, value) VALUES ("ARM", 32);
INSERT INTO arch (name, value) VALUES ("ARM", 64);
INSERT INTO arch (name, value) VALUES ("MIPS", 32);
INSERT INTO arch (name, value) VALUES ("MIPS", 64);

--
-- processor table will contain all
-- processos extra informations.
--
CREATE TABLE IF NOT EXISTS processor (
	  id INTEGER PRIMARY KEY
	, name TEXT
	, arch INTEGER
	, ref TEXT
	, link TEXT
	, freq TEXT
	, core INTEGER
);

--
-- memory table
--
CREATE TABLE IF NOT EXISTS memory (
	  id INTEGER PRIMARY KEY
	, version TEXT
	, freq TEXT
	, min TEXT
	, max TEXT
	, builtin TEXT
);

--
-- netif table
--
CREATE TABLE IF NOT EXISTS netif (
	  id INTEGER PRIMARY KEY
	, controler TEXT
	, capability TEXT
	, drivers ID
);

--
-- power table
--
CREATE TABLE IF NOT EXISTS power (
	  id INTEGER PRIMARY KEY
);

--
-- driver table
--
CREATE TABLE IF NOT EXISTS driver (
	  id INTEGER PRIMARY KEY
);
