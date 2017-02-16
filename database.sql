b----------------------------------------------------------------------
-- friendly open-source router database
----------------------------------------------------------------------

-- activate foreign key
-- see https://www.sqlite.org/foreignkeys.html
PRAGMA foreign_keys = ON;

-- clean table before add new content
DROP TABLE IF EXISTS manufacturer_location;
DROP TABLE IF EXISTS manufacturer;
DROP TABLE IF EXISTS reseller_location;
DROP TABLE IF EXISTS reseller;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS arch;
DROP TABLE IF EXISTS processor;
DROP TABLE IF EXISTS memory;
DROP TABLE IF EXISTS netif;
DROP TABLE IF EXISTS power;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS city;

----------------------------------------------------------------------
-- table country, will contain all
-- country name.
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS country (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
);

INSERT INTO country(name)
       VALUES("usa");
INSERT INTO country(name)
       VALUES("canada");
INSERT INTO country(name)
       VALUES("uk");
INSERT INTO country(name)
       VALUES("france");
INSERT INTO country(name)
       VALUES("ireland");
INSERT INTO country(name)
       VALUES("china");
INSERT INTO country(name)
       VALUES("taiwan");
INSERT INTO country(name)
       VALUES("japan");
INSERT INTO country(name)
       VALUES("switzerland");

----------------------------------------------------------------------
-- table city, will contain all city name
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS city (
          id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
	, state TEXT 
	, postal INTEGER
);

INSERT INTO city(name)
       VALUES("paris");
INSERT INTO city(name)
       VALUES("london");
INSERT INTO city(name)
       VALUES("tokyo");
INSERT INTO city(name)
       VALUES("glattbrugg")

----------------------------------------------------------------------
-- Manufacturers table. Will contain
-- all manufacturers informations.
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS manufacturer (
	  id INTEGER PRIMARY KEY
	, name TEXT UNIQUE
	, website TEXT
	, twitter TEXT
	, facebook TEXT
	, google TEXT
);

INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "asus"
	       , "https://www.asus.com"
	       , "https://twitter.com/asus"
	       , "https://www.facebook.com/ASUS/"
	       , "https://plus.google.com/+ASUS"
	       );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "bpi"
	       , "http://www.banana-pi.org"
	       , "https://twitter.com/bananapiteam"
	       , "https://www.facebook.com/sinovoipbpi"
	       , ""
	       );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "commell"
	       , "http://www.commell.com.tw"
	       , "https://twitter.com/Taiwan_Commate"
	       , "https://www.facebook.com/pages/Taiwan-Commate-Computer-Inc/547993955271899"
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "cstipc"
	       , "http://www.cstipc.com"
	       , ""
	       , ""
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "cz.nic"
	       , "https://project.turris.cz"
	       , "https://twitter.com/cz_nic"
	       , "https://www.facebook.com/CZ.NIC"
	       , "" );
INSERT INTO manufacturer (name, website, twitter, facebook, google)
	VALUES ( "gigabyte"
	       , "http://b2b.gigabyte.com"
	       , "https://twitter.com/gigabyteusa"
	       , "https://www.facebook.com/GIGABYTE/"
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
	       , "https://twitter.com/supermicrouk"
	       , ""
	       , "" );

----------------------------------------------------------------------
-- Manufacturer location table, will contain
-- all location informations.
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS manufacturer_location (
          manufacturer_id INTEGER
	, country_id INTEGER
	, city_id INTEGER
	, address TEXT
	, FOREIGN KEY(manufacturer_id) REFERENCES manufacturer(id)
	, FOREIGN KEY(country_id) REFERENCES country(id)
	, FOREIGN KEY(city_id) REFERENCES city(id)
);

INSERT INTO manufacturer_location (manufacturer_id, country_id, city_id, address)
       VALUES (
         ((SELECT id FROM manufacturer WHERE name="pcengine"))
       , ((SELECT id FROM country WHERE name="switzerland"))
       , ((SELECT id FROM city WHERE name="glattbrugg"))
       , "Flughofstrasse 58"
       );

INSERT INTO manufacturer_location (manufacturer_id, country_id, city_id, address)
       VALUES (
         ((SELECT id FROM manufacturer WHERE name="soekris"))
       , ((SELECT id FROM country WHERE name="usa"))
       , ((SELECT id FROM city WHERE name="scotts valley" AND postalcode="95066"))
       , "5 Erba Lane, Suite B"
       );


----------------------------------------------------------------------
-- Resellers table. Will contain
-- all resellers informations.
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS reseller (
	  id INTEGER PRIMARY KEY
	, name TEXT
	, website TEXT
	, twitter TEXT
	, facebook TEXT
	, linkedin TEXT
	, google TEXT
);

----------------------------------------------------------------------
-- Reseller location table. Will contain
-- address and other info.
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS reseller_location (
          reseller_id INTEGER
	, country_id INTEGER
	, city_id INTEGER
	, address TEXT
	, FOREIGN KEY(reseller_id) REFERENCES reseller(id)
	, FOREIGN KEY(country_id) REFERENCES country(id)
	, FOREIGN KEY(city_id) REFERENCES city(id)
);

----------------------------------------------------------------------
-- OS table. Will contain only
-- open-source operating systems
----------------------------------------------------------------------
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

----------------------------------------------------------------------
-- Products table. Will contain
-- all products with information.
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS product (
	  id INTEGER PRIMARY KEY
	, ref TEXT
	, link TEXT
	, manufacturer INTEGER
	, FOREIGN KEY (manufacturer) REFERENCES manufacturer(id)
);

INSERT INTO product (ref, link, manufacturer)
       VALUES ( "alix1e"
       	      , "https://pcengines.ch/alix1e.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "alix2d2"
       	      , "https://pcengines.ch/alix2d2.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );	      
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "alix2d3"
       	      , "https://pcengines.ch/alix2d3.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "alix2d13"
       	      , "https://pcengines.ch/alix2d13.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "alix3d2"
       	      , "https://pcengines.ch/alix3d2.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "alix3d3"
       	      , "https://pcengines.ch/alix3d3.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "alix6f2"
       	      , "https://pcengines.ch/alix6f2.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "apu"
       	      , "https://pcengines.ch/apu.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "apu2c0"
       	      , "https://pcengines.ch/apu2c0.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "apu2c2"
       	      , "https://pcengines.ch/apu2c2.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "apu2c4"
       	      , "https://pcengines.ch/apu2c4.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "apu3a2"
       	      , "https://pcengines.ch/apu3a2.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link, manufacturer)
       VALUES ( "apu3a4"
       	      , "https://pcengines.ch/apu3a4.htm"
	      , ((SELECT id FROM manufacturer WHERE name="pcengine"))
	      );
INSERT INTO product (ref, link)
       VALUES ( "net5501-60"
       	      , "https://soekris.com/products/eol-products/net5501.html");
INSERT INTO product (ref, link)
       VALUES ( "net5501-70"
       	      , "https://soekris.com/products/eol-products/net5501.html");
INSERT INTO product (ref, link)
       VALUES ( "net6501-30"
       	      , "https://soekris.com/products/net6501-1.html");
INSERT INTO product (ref, link)
       VALUES ( "net6501-50"
       	      , "https://soekris.com/products/net6501-1.html");
INSERT INTO product (ref, link)
       VALUES ( "net6501-70"
       	      , "https://soekris.com/products/net6501-1.html");
INSERT INTO product (ref, link)
       VALUES ( "turris-omnia"
       	      , "https://project.turris.cz/en/");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-MHN4"
       	      , "https://www.supermicro.nl/products/system/1U/5018/SYS-5018A-MHN4.cfm");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-MLHN4"
       	      , "https://www.supermicro.nl/products/system/1U/5018/SYS-5018A-MLHN4.cfm");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-MHN4"
       	      , "https://www.supermicro.nl/products/system/1U/5018/SYS-5018A-MLTN4.cfm");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-LTN4"
       	      , "https://www.supermicro.nl/products/system/1U/5018/SYS-5018A-LTN4.cfm");
INSERT INTO product (ref, link)
       VALUES ( "SYS-5018A-TN4"
       	      , "https://www.supermicro.nl/products/system/1U/5018/SYS-5018A-TN4.cfm");
INSERT INTO product (ref, link)
       VALUES ( "NF592-Q170"
       	      , "http://www.jetwaycomputer.com/NF592.html");
INSERT INTO product (ref, link)
       VALUES ( "JBC153F592"
       	      , "http://www.jetwaycomputer.com/JBC153F592.html");
INSERT INTO product (ref, link)
       VALUES ( "JBC153F9HB"
       	      , "http://www.jetwaycomputer.com/JBC153F9HB.html");
INSERT INTO product (ref, link)
       VALUES ( "JBC153F9HG"
       	      , "http://www.jetwaycomputer.com/JBC153F9HG.html");
INSERT INTO product (ref, link)
       VALUES ( "JBC150F592"
       	      , "http://www.jetwaycomputer.com/JBC150F592.html");
INSERT INTO product (ref, link)
       VALUES ( "JBC150F59H"
       	      , "http://www.jetwaycomputer.com/JBC150F9H.html");
INSERT INTO product (ref, link)
       VALUES ( "JBC152F533"
       	      , "http://www.jetwaycomputer.com/JBC152F533.html");
INSERT INTO product (ref, link)
       VALUES ( "LE-575"
       	      , "http://www.commell.com.tw/Product/SBC/LE-575.HTM");
INSERT INTO product (ref, link)
       VALUES ( "LS-574"
       	      , "http://www.commell.com.tw/Product/SBC/LS-574.HTM");
INSERT INTO product (ref, link)
       VALUES ( "LS-573"
       	      , "http://www.commell.com.tw/Product/SBC/LS-573.HTM");
INSERT INTO product (ref, link)
       VALUES ( "LE-564"
       	      , "http://www.commell.com.tw/Product/SBC/LE-564.HTM");
INSERT INTO product (ref, link)
       VALUES ( "GA-9SISL"
       	      , "http://b2b.gigabyte.com/products/product-page.aspx?pid=4988");
INSERT INTO product (ref, link)
       VALUES ( "EL-30"
       	      , "http://b2b.gigabyte.com/products/product-page.aspx?pid=6192");
INSERT INTO product (ref, link)
       VALUES ( "MS-99A1"
       	      , "http://ipc.msi.com/product/pages/ipc/MS-99A1.html");
INSERT INTO product (ref, link)
       VALUES ( "MS-98H1"
       	      , "http://ipc.msi.com/product/pages/ipc/MS-98H1.html");
INSERT INTO product (ref, link)
       VALUES ( "K-Q77NS"
       	      , "http://www.cstipc.com/en/products/product_detial_26.html");
INSERT INTO product (ref, link)
       VALUES ( "K-D56NS"
       	      , "http://www.cstipc.com/en/products/product_detial_15.html");
INSERT INTO product (ref, link)
       VALUES ( "K-945GSN"
       	      , "http://www.cstipc.com/en/products/product_detial_16.html");
INSERT INTO product (ref, link)
       VALUES ( "BIS-6370"
       	      , "http://www.norco-group.com/product/39.html");
INSERT INTO product (ref, link)
       VALUES ( "banana-pi-r1"
       	      , "http://www.banana-pi.org/r1.html");
INSERT INTO product (ref, link)
       VALUES ( "RTN16"
       	      , "https://www.asus.com/Networking/RTN16");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M5F"
       	      , "http://www.inctel.com.cn/product/detail/114");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M5V"
       	      , "http://www.inctel.com.cn/product/detail/ITXM5V");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M5V_B"
       	      , "http://www.inctel.com.cn/product/detail/104");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M2F"
       	      , "http://www.inctel.com.cn/product/detail/115");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M8F"
       	      , "http://www.inctel.com.cn/product/detail/118");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M9F"
       	      , "http://www.inctel.com.cn/product/detail/ITXM9F");
INSERT INTO product (ref, link)
       VALUES ( "ITX-M9F_B"
       	      , "http://www.inctel.com.cn/product/detail/119");
INSERT INTO product (ref, link)
       VALUES ( "ITX-D25SL"
       	      , "http://www.inctel.com.cn/product/detail/116");
INSERT INTO product (ref, link)
       VALUES ( "ITX-G41XE"
       	      , "http://www.inctel.com.cn/product/detail/122");
INSERT INTO product (ref, link)
       VALUES ( "ITX-H67SL"
       	      , "http://www.inctel.com.cn/product/detail/H67SL");
INSERT INTO product (ref, link)
       VALUES ( "ITX-B75SL"
       	      , "http://www.inctel.com.cn/product/detail/MotherboardB75SL");
INSERT INTO product (ref, link)
       VALUES ( "ITX-H87SL_B"
       	      , "http://www.inctel.com.cn/product/detail/MotherboardH87SL");
INSERT INTO product (ref, link)
       VALUES ( "ITX-N70SL"
       	      , "http://www.inctel.com.cn/product/detail/N70SL");
INSERT INTO product (ref, link)
       VALUES ( "ITX-N70SL_B"
       	      , "http://www.inctel.com.cn/product/detail/N70SLB");
INSERT INTO product (ref, link)
       VALUES ( "A1SRM-LN5F-2358"
       	      , "https://www.supermicro.nl/products/motherboard/Atom/X10/A1SRM-LN5F-2358.cfm");
INSERT INTO product (ref, link)
       VALUES ( "A1SRM-LN7F-2358"
       	      , "https://www.supermicro.nl/products/motherboard/Atom/X10/A1SRM-LN7F-2358.cfm");
INSERT INTO product (ref, link)
       VALUES ( "A1SRM-LN7F-2758"
       	      , "https://www.supermicro.nl/products/motherboard/Atom/X10/A1SRM-LN7F-2758.cfm");
INSERT INTO product (ref, link)
       VALUES ( "X11SSH-LN4F"
       	      , "https://www.supermicro.nl/products/motherboard/Xeon/C236_C232/X11SSH-LN4F.cfm");
INSERT INTO product (ref, link)
       VALUES ( "X11SBA-LN4F"
       	      , "https://www.supermicro.nl/products/motherboard/X11/X11SBA-LN4F.cfm");

----------------------------------------------------------------------
-- arch table will contain specific
-- archiecture and micro-architecture
-- processors
----------------------------------------------------------------------
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

----------------------------------------------------------------------
-- processor table will contain all
-- processos extra informations.
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS processor (
	  id INTEGER PRIMARY KEY
	, name TEXT
	, arch INTEGER
	, ref TEXT
	, link TEXT
	, freq TEXT
	, core INTEGER
);

----------------------------------------------------------------------
-- memory table
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS memory (
	  id INTEGER PRIMARY KEY
	, version TEXT
	, freq TEXT
	, min TEXT
	, max TEXT
	, builtin TEXT
);

----------------------------------------------------------------------
-- netif table
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS netif (
	  id INTEGER PRIMARY KEY
	, controler TEXT
	, capability TEXT
	, drivers ID
);

----------------------------------------------------------------------
-- power table
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS power (
	  id INTEGER PRIMARY KEY
);

----------------------------------------------------------------------
-- driver table
----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS driver (
	  id INTEGER PRIMARY KEY
);
