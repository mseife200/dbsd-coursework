CREATE TABLE property_status 
(
property_status_name varchar(20) NOT NULL, 
CONSTRAINT property_status_pk PRIMARY KEY (property_status_name)
);

CREATE TABLE viewings
(
viewing_id number(10) NOT NULL,
timestamp_start date NOT NULL,
duration number(10) NOT NULL,
CONSTRAINT viewing_id_pk PRIMARY KEY (viewing_id)
);

CREATE SEQUENCE incr_viewing_id 
START WITH 1
INCREMENT BY 1;

CREATE TABLE offer_state
(
offer_state_name varchar(20) NOT NULL,
CONSTRAINT offer_state_name_pk PRIMARY KEY (offer_state_name)
);

CREATE TABLE country
(
country_code varchar2(2) NOT NULL,
country_name varchar(30) NOT NULL,
CONSTRAINT country_code_pk PRIMARY KEY (country_code)
);

CREATE TABLE address
(
street varchar2(40) NOT NULL,
post_code varchar2(10) NOT NULL,
city varchar2(40) NOT NULL,
country_code varchar2(2) NOT NULL,

CONSTRAINT address_pk PRIMARY KEY (street, post_code, city, country_code),
CONSTRAINT address_fk FOREIGN KEY (country_code) REFERENCES country (country_code)
);


CREATE TABLE investor
(
investor_id number(10) NOT NULL,
investor_name varchar2(40) NOT NULL,
street varchar2(40) NOT NULL,
post_code varchar2(10) NOT NULL,
city varchar2(40) NOT NULL,
country_code varchar2(2) NOT NULL,

CONSTRAINT investor_id_pk PRIMARY KEY (investor_id),
CONSTRAINT investor_address_fk FOREIGN KEY (street, post_code, city, country_code) REFERENCES address(street, post_code, city, country_code)
);


CREATE SEQUENCE incr_investor_id 
START WITH 1
INCREMENT BY 1;

CREATE TABLE offer
(
offer_id number(10) NOT NULL,
amount number(10) NOT NULL,
offer_state varchar(20), 
investor_id number(10) NOT NULL,
CONSTRAINT offer_id_pk PRIMARY KEY (offer_id),
CONSTRAINT offer_state_fk FOREIGN KEY (offer_state) REFERENCES offer_state (offer_state_name),
CONSTRAINT offer_investor_id_fk FOREIGN KEY (investor_id) REFERENCES investor (investor_id)
);

CREATE TABLE property
(
property_id number(10) NOT NULL,
property_name varchar2(40) NOT NULL,
viewing_id number(10),
last_offer_id number(20),
property_status varchar2(40) NOT NULL,
street varchar2(40) NOT NULL,
post_code varchar2(10) NOT NULL,
city varchar2(40) NOT NULL,
country_code varchar2(2) NOT NULL,

CONSTRAINT property_id_pk PRIMARY KEY (property_id),

CONSTRAINT property_viewing_fk 
  FOREIGN KEY (viewing_id) 
  REFERENCES viewings (viewing_id),
  
CONSTRAINT property_offer_fk 
  FOREIGN KEY (last_offer_id) 
  REFERENCES offer (offer_id),

CONSTRAINT property_status_fk 
  FOREIGN KEY (property_status) 
  REFERENCES property_status(property_status_name),

CONSTRAINT property_address_fk 
  FOREIGN KEY (street, post_code, city, country_code) 
  REFERENCES address (street, post_code, city, country_code)
);


CREATE SEQUENCE incr_offer_id 
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER incr_offer_id_trig
  BEFORE INSERT ON offer
  FOR EACH ROW
BEGIN
  SELECT incr_offer_id.nextval
    INTO :new.offer_id 
    FROM dual;
END;
/

CREATE SEQUENCE incr_property_id 
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER incr_property_id_trig
  BEFORE INSERT ON property
  FOR EACH ROW
BEGIN
  SELECT incr_property_id.nextval
    INTO :new.property_id 
    FROM dual;
END;
/
CREATE OR REPLACE TRIGGER viewing_id_autoincr_trig
  BEFORE INSERT ON viewings
  FOR EACH ROW
BEGIN
  SELECT incr_viewing_id.nextval
    INTO :new.viewing_id 
    FROM dual;
END;
/

CREATE OR REPLACE TRIGGER incr_investor_id_trig
  BEFORE INSERT ON investor
  FOR EACH ROW
BEGIN
  SELECT incr_investor_id.nextval
    INTO :new.investor_id 
    FROM dual;
END;