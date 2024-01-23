/*Which combination of delivery_sate and shipping_mode yields the highest number of orders ? Additionally, how  many orders were there for each state in total and the ratio in the next columns

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
order by 1, 2;

|delivery_state|shipping_mode |nr_of_orders_ds|nr_of_orders|ds_ratio_percent|
|--------------|--------------|---------------|------------|----------------|
|Alabama       |First Class   |34             |4           |11.8            |
|Alabama       |Same Day      |34             |1           |2.9             |
|Alabama       |Second Class  |34             |8           |23.5            |
|Alabama       |Standard Class|34             |21          |61.8            |
|Arizona       |First Class   |108            |16          |14.8            |
|Arizona       |Same Day      |108            |10          |9.3             |
|Arizona       |Second Class  |108            |15          |13.9            |
|Arizona       |Standard Class|108            |67          |62              |
|Arkansas      |First Class   |27             |3           |11.1            |
|Arkansas      |Same Day      |27             |1           |3.7             |
|Arkansas      |Second Class  |27             |3           |11.1            |
|Arkansas      |Standard Class|27             |20          |74.1            |
|California    |First Class   |1,021          |164         |16.1            |
|California    |Same Day      |1,021          |55          |5.4             |
|California    |Second Class  |1,021          |201         |19.7            |
|California    |Standard Class|1,021          |601         |58.9            |
|Colorado      |First Class   |79             |22          |27.8            |
|Colorado      |Same Day      |79             |4           |5.1             |
|Colorado      |Second Class  |79             |12          |15.2            |
|Colorado      |Standard Class|79             |41          |51.9            |
