select 
	or2.order_id 			as returned_order
	,or2.next_order_free 
	,o.order_id				as original_order
	,o.customer_id 			as customer
from orders o 
left join order_returns or2 on o.order_id = or2.order_id  