--Supported types for distribution column types - INT8, INT2, OID, INT4, BOOL, INT2VECTOR, OIDVECTOR, CHAR, NAME, TEXT, BPCHAR, BYTEA, VARCHAR, NUMERIC, MONEY, ABSTIME, RELTIME, DATE, TIME, TIMESTAMP, TIMESTAMPTZ, INTERVAL, and TIMETZ

--INT8, 

CREATE TABLE xl_dc (
    product_no integer,
    product_id INT8 PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_id);

--INT2, 


CREATE TABLE xl_dc1 (
    product_no integer,
    product_id INT2 PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_id);

--OID, 
CREATE TABLE xl_dc2 (
    product_no integer,
    product_id OID PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_id);

--INT4, 
CREATE TABLE xl_dc3 (
    product_no integer,
    product_id INT4 PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_id);

--BOOL, 

CREATE TABLE xl_dc4 (
    product_no integer,
    is_available BOOL PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (is_available);

--INT2VECTOR, 
CREATE TABLE xl_dc5 (
    product_no integer,
    product_id integer,
    sub_product_ids INT2VECTOR PRIMARY KEY, 
    name text,
    price numeric
) DISTRIBUTE BY HASH (sub_product_ids);

--OIDVECTOR, 
CREATE TABLE xl_dc6 (
    product_no integer,
    product_id integer,
    sub_product_ids OIDVECTOR PRIMARY KEY, 
    name text,
    price numeric
) DISTRIBUTE BY HASH (sub_product_ids);

--CHAR, 
CREATE TABLE xl_dc7 (
    product_no integer,
    product_group CHAR PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_group);

--NAME, 
CREATE TABLE xl_dc8 (
    product_no integer,
    product_name NAME PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_name);

--TEXT, 
CREATE TABLE xl_dc9 (
    product_no integer,
    product_name TEXT PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_name);


--BPCHAR - blank padded char, 
CREATE TABLE xl_dc10 (
    product_no integer,
    product_group BPCHAR PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_group);

--BYTEA - variable length binary string, 
CREATE TABLE xl_dc11 (
    product_no integer,
    product_group BYTEA PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_group);

--VARCHAR, 
CREATE TABLE xl_dc12 (
    product_no integer,
    product_group VARCHAR PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_group);

--NUMERIC, 
CREATE TABLE xl_dc15 (
    product_no integer,
    product_id NUMERIC PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY HASH (product_id);

--MONEY - String datatype, 
CREATE TABLE xl_dc16 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (name);

--ABSTIME, 
CREATE TABLE xl_dc17 (
    product_no integer,
    product_id NUMERIC ,
    purchase_date ABSTIME PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date);

--RELTIME, 
CREATE TABLE xl_dc18 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date RELTIME PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date);


--DATE, 
CREATE TABLE xl_dc19 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date DATE PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date);

--TIME, 
CREATE TABLE xl_dc20 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIME PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date);

--TIMESTAMP,

CREATE TABLE xl_dc21 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMESTAMP PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date); 

--TIMESTAMPTZ, 

CREATE TABLE xl_dc22 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMESTAMPTZ PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date); 

--INTERVAL, 
CREATE TABLE xl_dc23 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date INTERVAL PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date); 

--and TIMETZ - time along with time zone
CREATE TABLE xl_dc24 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMETZ PRIMARY KEY,
    price numeric
) DISTRIBUTE BY HASH (purchase_date); 

--Distribution strategy can specify on a single column
CREATE TABLE xl_dc25 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMETZ,
    price numeric,
    primary key(product_no, product_id)
) DISTRIBUTE BY HASH (product_no, product_id); --fail

-- Distribution column value cannot be updated
-- default distributed on HASH by primary key column, i.e. city
CREATE TABLE xl_dc_weather (
    city            varchar(80) PRIMARY KEY,
    temp_lo         int,           -- low temperature
    temp_hi         int,           -- high temperature
    prcp            real,          -- precipitation
    date            date
);

INSERT INTO xl_dc_weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

UPDATE xl_dc_weather SET city = 'SFO' where temp_lo=46 and temp_hi=50; -- fail


DROP TABLE xl_dc;
DROP TABLE xl_dc1;
DROP TABLE xl_dc2;
DROP TABLE xl_dc3;
DROP TABLE xl_dc4;
DROP TABLE xl_dc5;
DROP TABLE xl_dc6;
DROP TABLE xl_dc7;
DROP TABLE xl_dc8;
DROP TABLE xl_dc9;
DROP TABLE xl_dc10;
DROP TABLE xl_dc11;
DROP TABLE xl_dc12;
DROP TABLE xl_dc15;
DROP TABLE xl_dc16;
DROP TABLE xl_dc17;
DROP TABLE xl_dc18;
DROP TABLE xl_dc19;
DROP TABLE xl_dc20;
DROP TABLE xl_dc21;
DROP TABLE xl_dc22;
DROP TABLE xl_dc23;
DROP TABLE xl_dc24;
DROP TABLE xl_dc25;
DROP TABLE xl_dc_weather;




