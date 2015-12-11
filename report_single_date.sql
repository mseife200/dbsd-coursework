select to_char(timestamp_start, 'MM/DD/YYYY HH24:MI') "start time", property_name, street, post_code, city 
from 
viewings v JOIN property p 
ON 
(p.viewing_id=v.viewing_id)
where 
timestamp_start 
between 
to_date('24/12/2015 00:00', 'dd/mm/yyyy HH24:MI') 
AND 
to_date('24/12/2015 23:59', 'dd/mm/yyyy HH24:MI')
