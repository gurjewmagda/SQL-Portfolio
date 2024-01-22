select 
	or2.order_id 			as returned_order
	,or2.next_order_free 
	,o.order_id			as original_order
	,o.customer_id 			as customer
from orders o 
left join order_returns or2 on o.order_id = or2.order_id  

|returned_order|next_order_free|original_order|customer|
|--------------|---------------|--------------|--------|
|              |               |328           |166     |
|329           |0              |329           |262     |
|              |               |330           |728     |
|              |               |331           |111     |
|              |               |332           |25      |
|              |               |333           |361     |
|              |               |334           |353     |
|              |               |335           |620     |
|              |               |336           |41      |
|              |               |337           |815     |
