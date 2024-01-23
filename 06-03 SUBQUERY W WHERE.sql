/* Only states with number of customers >100 */

select 
	o.delivery_state 
	,o.shipping_mode 
	,(select count(order_id) as total_orders from orders)	as total_orders
	,ds.nr_of_orders_ds										as nr_of_orders_ds
	,count(o.order_id) 										as nr_of_orders
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
where
	o.delivery_state in 
		(					
		select delivery_state
		from orders
		group by 1
		having count(distinct customer_id) > 100
		)
group by 1, 2, 3, 4
order by 1, 2

======================================================

select
	delivery_state
	,count(distinct customer_id) as customers
from orders
group by 1
having count(distinct customer_id)>100

|delivery_state|customers|
|--------------|---------|
|California    |577      |
|Florida       |181      |
|Illinois      |237      |
|Michigan      |106      |
|New York      |415      |
|North Carolina|122      |
|Ohio          |202      |
|Pennsylvania  |257      |
|Texas         |370      |
|Virginia      |107      |
|Washington    |224      |
