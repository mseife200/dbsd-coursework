select * from property 
where
property_status NOT IN ('Offer accepted', 'Offer rejected')
