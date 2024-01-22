select 
	count(distinct order_id) 	as nr_of_unique_orders
	,count(order_id)				as nr_of_orders
	,count(distinct customer_id)	as nr_of_unique_customers
	,count(customer_id)			as nr_of_customers
from orders;

select 
	shipping_mode
from orders;

select 
	shipping_mode 
	,count(distinct order_id) 		as nr_of_unique_orders
	,count(order_id)				as nr_of_orders
	,count(distinct customer_id)	as nr_of_unique_customers
	,count(customer_id)				as nr_of_customers
from orders
group by 1;



	