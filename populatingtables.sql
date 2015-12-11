INSERT INTO property_status (property_status_name) VALUES ('To be viewed');
INSERT INTO property_status (property_status_name) VALUES ('Viewed');
INSERT INTO property_status (property_status_name) VALUES ('Offer submitted');
INSERT INTO property_status (property_status_name) VALUES ('Offer accepted');
INSERT INTO property_status (property_status_name) VALUES ('Offer rejected');

INSERT INTO VIEWINGS (VIEWING_ID, TIMESTAMP_START, DURATION) VALUES (0, TO_DATE('24/12/2015 18:00', 'dd/mm/yyyy HH24:MI'), 60);
INSERT INTO VIEWINGS (VIEWING_ID, TIMESTAMP_START, DURATION) VALUES (0, TO_DATE('30/12/2015 07:23', 'dd/mm/yyyy HH24:MI'), 45);
INSERT INTO VIEWINGS (VIEWING_ID, TIMESTAMP_START, DURATION) VALUES (0, TO_DATE('02/01/2016 13:59', 'dd/mm/yyyy HH24:MI'), 120);

INSERT INTO offer_state (offer_state_name) VALUES ('accepted');
INSERT INTO offer_state (offer_state_name) VALUES ('rejected');

INSERT INTO country (country_code, country_name) VALUES ('DE', 'Germany');
INSERT INTO country (country_code, country_name) VALUES ('AT', 'Austria');
INSERT INTO country (country_code, country_name) VALUES ('FR', 'France');
INSERT INTO country (country_code, country_name) VALUES ('UK', 'United Kingdom');

INSERT INTO address (street, post_code, city, country_code) VALUES ('5 Avenue Anatole', '75007', 'Paris', 'FR');
INSERT INTO address (street, post_code, city, country_code) VALUES ('22 Avenue de Wagram', '75008', 'Paris', 'FR');
INSERT INTO address (street, post_code, city, country_code) VALUES ('Flandernstrasse 101', '73728', 'Esslingen', 'DE');
INSERT INTO address (street, post_code, city, country_code) VALUES ('202 Dobbies Loan', 'G40JF', 'Glasgow', 'UK');

INSERT INTO investor (investor_id, investor_name, street, post_code, city, country_code) VALUES (0, 'French Name', '22 Avenue de Wagram', '75008', 'Paris', 'FR')
INSERT INTO investor (investor_id, investor_name, street, post_code, city, country_code) VALUES (0, 'HS Esslingen', 'Flandernstrasse 101', '73728', 'Esslingen', 'DE');

INSERT INTO property (property_id, property_name, viewing_id,  last_offer_id, property_status, street, post_code, city, country_code) VALUES (0, 'Funny pile of scrap metal', NULL,  NULL, 'To be viewed', '5 Avenue Anatole', '75007', 'Paris', 'FR');
INSERT INTO property (property_id, property_name, viewing_id,  last_offer_id, property_status, street, post_code, city, country_code) VALUES (0, 'Flandernstrasse 101', 1,  NULL, 'To be viewed', 'Flandernstrasse 101', '73728', 'Esslingen', 'DE');

INSERT INTO offer (offer_id, amount, offer_state, investor_id) VALUES (0, 1000000, null, 2)
INSERT INTO offer (offer_id, amount, offer_state, investor_id) VALUES (0, 30000, null, 1)

UPDATE offer set offer_state='accepted' WHERE offer_id=2

UPDATE property set property_status='Offer accepted' where property_id=1
UPDATE property set last_offer_id=2 where property_id=1