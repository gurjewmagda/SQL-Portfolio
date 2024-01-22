select 
	shipping_mode 
	,delivery_state 
	,count(order_id) as number_of_orders
from orders
group by
	shipping_mode
	,delivery_state  