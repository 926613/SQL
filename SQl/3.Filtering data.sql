select 
*
from customers
--where country != 'Germany'
--where score < 500
--where country = 'USA' or score > 500
--where not score < 500
--where score between 100 and 500 
--where country not in ('Germany','UK')
--where first_name like '%r%'
where first_name like '__r%'