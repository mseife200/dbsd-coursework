select OFFER_ID, AMOUNT, OFFER_STATE, INVESTOR_ID, PROPERTY_ID, PROPERTY_NAME, PROPERTY_STATUS, STREET, POST_CODE, CITY, COUNTRY_CODE, VIEWING_ID from 
offer o
FULL JOIN
property p
ON (o.offer_id=p.last_offer_id)
WHERE p.property_status='Offer submitted'