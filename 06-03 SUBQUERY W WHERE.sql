/* Only states with number of customers >100 */

select 
	o.delivery_state 
	,o.shipping_mode 
	,(select count(order_id) as total_orders from orders)	as total_orders
	,ds.nr_of_orders_ds					as nr_of_orders_ds
	,count(o.order_id) 					as nr_of_orders
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

|delivery_state|shipping_mode |total_orders|nr_of_orders_ds|nr_of_orders|ds_ratio_percent|
|--------------|--------------|------------|---------------|------------|----------------|
|California    |First Class   |5,009       |1,021          |164         |16.1            |
|California    |Same Day      |5,009       |1,021          |55          |5.4             |
|California    |Second Class  |5,009       |1,021          |201         |19.7            |
|California    |Standard Class|5,009       |1,021          |601         |58.9            |
|Florida       |First Class   |5,009       |200            |28          |14              |
|Florida       |Same Day      |5,009       |200            |11          |5.5             |
|Florida       |Second Class  |5,009       |200            |36          |18              |
|Florida       |Standard Class|5,009       |200            |125         |62.5            |
|Illinois      |First Class   |5,009       |276            |42          |15.2            |
|Illinois      |Same Day      |5,009       |276            |9           |3.3             |


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
