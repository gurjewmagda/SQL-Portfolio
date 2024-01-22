select 
	o.delivery_state 
	,o.shipping_mode 
	,ds.nr_of_orders_ds
	,count(o.order_id) as nr_of_orders
	,round((count(o.order_id)/ds.nr_of_orders_ds) * 100, 1) as ds_ratio_percent
from orders o
inner join
	(
	select  
		delivery_state 
		,count(order_id) as nr_of_orders_ds
	from orders
	group by 1
	) ds on ds.delivery_state = o.delivery_state 
group by 1, 2, 3
order by 1, 2