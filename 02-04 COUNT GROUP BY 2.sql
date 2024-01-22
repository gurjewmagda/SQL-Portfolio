select 
	shipping_mode 
	,delivery_city 
	,count(*) as number_of_orders
from orders
where 
	delivery_city ='Los Angeles'
group by
	1,2