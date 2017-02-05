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

--
-- Manufacturers table. Will contain
-- all manufacturers informations.
--
CREATE TABLE IF NOT EXISTS manufacturer (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
	, link TEXT
);

INSERT INTO manufacturer (name, link)
	VALUES ("asus", "");
INSERT INTO manufacturer (name, link)
	VALUES ("bpi", "");
INSERT INTO manufacturer (name, link)
	VALUES ("commell", "");
INSERT INTO manufacturer (name, link)
	VALUES ("cstpic", "");
INSERT INTO manufacturer (name, link)
	VALUES ("cz.nic", "");
INSERT INTO manufacturer (name, link)
	VALUES ("gigabyte", "");
INSERT INTO manufacturer (name, link)
	VALUES ("inctel", "");
INSERT INTO manufacturer (name, link)
	VALUES ("jetway", "");
INSERT INTO manufacturer (name, link)
	VALUES ("msi", "");
INSERT INTO manufacturer (name, link)
	VALUES ("norco", "");
INSERT INTO manufacturer (name, link)
	VALUES ("pcengine", "");
INSERT INTO manufacturer (name, link)
	VALUES ("soekris", "");
INSERT INTO manufacturer (name, link)
	VALUES ("supermicro", "");

--
-- Resellers table. Will contain
-- all resellers informations.
--
CREATE TABLE IF NOT EXISTS reseller (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
	, link TEXT
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

INSERT INTO os (name, link) VALUES ("linux", "");
INSERT INTO os (name, link) VALUES ("alpine", "");
INSERT INTO os (name, link) VALUES ("dd-wrt", "");
INSERT INTO os (name, link) VALUES ("clearos", "");
INSERT INTO os (name, link) VALUES ("ipfire", "");
INSERT INTO os (name, link) VALUES ("ipcop", "");
INSERT INTO os (name, link) VALUES ("smoothwall", "");
INSERT INTO os (name, link) VALUES ("freebsd", "");
INSERT INTO os (name, link) VALUES ("pfsense", "");
INSERT INTO os (name, link) VALUES ("opnsense", "");
INSERT INTO os (name, link) VALUEs ("m0n0wall", "");
INSERT INTO os (name, link) VALUEs ("bsdrouter", "");
INSERT INTO os (name, link) VALUES ("openbsd", "");
INSERT INTO os (name, link) VALUES ("netbsd", "");
INSERT INTO os (name, link) VALUES ("securityrouter", "");

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
