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

CREATE TABLE IF NOT EXISTS country (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
);

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
	, link
);

--
--
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
--
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
--
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
--
--
CREATE TABLE IF NOT EXISTS netif (
	  id INTEGER PRIMARY KEY
	, controler TEXT
	, capability TEXT
	, drivers ID
);

--
--
--
CREATE TABLE IF NOT EXISTS power (
	  id INTEGER PRIMARY KEY
);

--
--
--
CREATE TABLE IF NOT EXISTS driver (
	  id INTEGER PRIMARY KEY
);
