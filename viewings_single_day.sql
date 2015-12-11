select * from viewings where 
timestamp_start between to_date('24/12/2015 00:00', 'dd/mm/yyyy HH24:MI') AND to_date('24/12/2015 23:59', 'dd/mm/yyyy HH24:MI')
