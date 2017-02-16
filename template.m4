m4_divert(-1)
m4_dnl see: https://ftp.gnu.org/pub/old-gnu/Manuals/m4-1.4/
define(`forloop',
       `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')

m4_define(`_CREATE', CREATE TABLE IF NOT EXISTS $1)
m4_define(`_DROP', DROP TABLE IF EXISTS $1)

m4_dnl   -- insert
m4_define(`_INSERT', INSERT INTO $1 $2 VALUES $3)

m4_dnl   -- select id pattern
m4_define(`_SELECT_ID', SELECT id FROM $1 WHERE $2='$3')

m4_dnl   -- select id for each tables
m4_define(`_MANUFACTURER', _SELECT_ID(manufacturer, $1, $2))
m4_define(`_RESELLER', _SELECT_ID(reseller, $1, $2)) 
m4_define(`_PRODUCT', _SELECT_ID(product, $1, $2))
m4_define(`_COUNTRY', _SELECT_ID(country, $1, $2))
m4_define(`_CITY', _SELECT_ID(city, $1, $2))
m4_define(`_OS', _SELECT_ID(os, $1, $2))
m4_divert
