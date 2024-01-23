/* Add to the previous table (06-01) - how many orders where there in total */

select 
	o.delivery_state 
	,o.shipping_mode 
	,(select count(order_id) as total_orders from orders)		as total_orders
	,ds.nr_of_orders_ds						as nr_of_orders_ds
	,count(o.order_id) 						as nr_of_orders
	,round((count(o.order_id)/ds.nr_of_orders_ds) * 100, 1)		as ds_ratio_percent
from orders o
inner join
	(
	select  
		delivery_state 
		,count(order_id) 	as nr_of_orders_ds
	from orders
	group by 1
	) ds on ds.delivery_state = o.delivery_state 
group by 1, 2, 3, 4
order by 1, 2

|delivery_state      |shipping_mode |total_orders|nr_of_orders_ds|nr_of_orders|ds_ratio_percent|
|--------------------|--------------|------------|---------------|------------|----------------|
|Alabama             |First Class   |5,009       |34             |4           |11.8            |
|Alabama             |Same Day      |5,009       |34             |1           |2.9             |
|Alabama             |Second Class  |5,009       |34             |8           |23.5            |
|Alabama             |Standard Class|5,009       |34             |21          |61.8            |
|Arizona             |First Class   |5,009       |108            |16          |14.8            |
|Arizona             |Same Day      |5,009       |108            |10          |9.3             |
|Arizona             |Second Class  |5,009       |108            |15          |13.9            |
|Arizona             |Standard Class|5,009       |108            |67          |62              |
|Arkansas            |First Class   |5,009       |27             |3           |11.1            |
|Arkansas            |Same Day      |5,009       |27             |1           |3.7             |
|Arkansas            |Second Class  |5,009       |27             |3           |11.1            |
|Arkansas            |Standard Class|5,009       |27             |20          |74.1            |
|California          |First Class   |5,009       |1,021          |164         |16.1            |
|California          |Same Day      |5,009       |1,021          |55          |5.4             |
|California          |Second Class  |5,009       |1,021          |201         |19.7            |
|California          |Standard Class|5,009       |1,021          |601         |58.9            |
|Colorado            |First Class   |5,009       |79             |22          |27.8            |
|Colorado            |Same Day      |5,009       |79             |4           |5.1             |
|Colorado            |Second Class  |5,009       |79             |12          |15.2            |
|Colorado            |Standard Class|5,009       |79             |41          |51.9            |
|Connecticut         |First Class   |5,009       |45             |11          |24.4            |
|Connecticut         |Same Day      |5,009       |45             |5           |11.1            |
|Connecticut         |Second Class  |5,009       |45             |5           |11.1            |
|Connecticut         |Standard Class|5,009       |45             |24          |53.3            |
|Delaware            |First Class   |5,009       |44             |7           |15.9            |
|Delaware            |Same Day      |5,009       |44             |1           |2.3             |
|Delaware            |Second Class  |5,009       |44             |7           |15.9            |
|Delaware            |Standard Class|5,009       |44             |29          |65.9            |
|District of Columbia|Second Class  |5,009       |4              |2           |50              |
|District of Columbia|Standard Class|5,009       |4              |2           |50              |
|Florida             |First Class   |5,009       |200            |28          |14              |
|Florida             |Same Day      |5,009       |200            |11          |5.5             |
|Florida             |Second Class  |5,009       |200            |36          |18              |
|Florida             |Standard Class|5,009       |200            |125         |62.5            |
|Georgia             |First Class   |5,009       |91             |12          |13.2            |
|Georgia             |Same Day      |5,009       |91             |4           |4.4             |
|Georgia             |Second Class  |5,009       |91             |19          |20.9            |
|Georgia             |Standard Class|5,009       |91             |56          |61.5            |
|Idaho               |First Class   |5,009       |11             |2           |18.2            |
|Idaho               |Second Class  |5,009       |11             |2           |18.2            |
|Idaho               |Standard Class|5,009       |11             |7           |63.6            |
|Illinois            |First Class   |5,009       |276            |42          |15.2            |
|Illinois            |Same Day      |5,009       |276            |9           |3.3             |
|Illinois            |Second Class  |5,009       |276            |52          |18.8            |
|Illinois            |Standard Class|5,009       |276            |173         |62.7            |
|Indiana             |First Class   |5,009       |73             |10          |13.7            |
|Indiana             |Same Day      |5,009       |73             |3           |4.1             |
|Indiana             |Second Class  |5,009       |73             |15          |20.5            |
|Indiana             |Standard Class|5,009       |73             |45          |61.6            |
|Iowa                |First Class   |5,009       |17             |1           |5.9             |
|Iowa                |Same Day      |5,009       |17             |1           |5.9             |
|Iowa                |Second Class  |5,009       |17             |5           |29.4            |
|Iowa                |Standard Class|5,009       |17             |10          |58.8            |
|Kansas              |First Class   |5,009       |14             |3           |21.4            |
|Kansas              |Same Day      |5,009       |14             |1           |7.1             |
|Kansas              |Second Class  |5,009       |14             |1           |7.1             |
|Kansas              |Standard Class|5,009       |14             |9           |64.3            |
|Kentucky            |First Class   |5,009       |61             |8           |13.1            |
|Kentucky            |Same Day      |5,009       |61             |2           |3.3             |
|Kentucky            |Second Class  |5,009       |61             |19          |31.1            |
|Kentucky            |Standard Class|5,009       |61             |32          |52.5            |
|Louisiana           |First Class   |5,009       |21             |6           |28.6            |
|Louisiana           |Same Day      |5,009       |21             |1           |4.8             |
|Louisiana           |Second Class  |5,009       |21             |7           |33.3            |
|Louisiana           |Standard Class|5,009       |21             |7           |33.3            |
|Maine               |Standard Class|5,009       |3              |3           |100             |
|Maryland            |First Class   |5,009       |46             |8           |17.4            |
|Maryland            |Same Day      |5,009       |46             |3           |6.5             |
|Maryland            |Second Class  |5,009       |46             |7           |15.2            |
|Maryland            |Standard Class|5,009       |46             |28          |60.9            |
|Massachusetts       |First Class   |5,009       |62             |10          |16.1            |
|Massachusetts       |Same Day      |5,009       |62             |3           |4.8             |
|Massachusetts       |Second Class  |5,009       |62             |10          |16.1            |
|Massachusetts       |Standard Class|5,009       |62             |39          |62.9            |
|Michigan            |First Class   |5,009       |117            |13          |11.1            |
|Michigan            |Same Day      |5,009       |117            |7           |6               |
|Michigan            |Second Class  |5,009       |117            |25          |21.4            |
|Michigan            |Standard Class|5,009       |117            |72          |61.5            |
|Minnesota           |First Class   |5,009       |44             |6           |13.6            |
|Minnesota           |Same Day      |5,009       |44             |1           |2.3             |
|Minnesota           |Second Class  |5,009       |44             |6           |13.6            |
|Minnesota           |Standard Class|5,009       |44             |31          |70.5            |
|Mississippi         |First Class   |5,009       |26             |1           |3.8             |
|Mississippi         |Same Day      |5,009       |26             |1           |3.8             |
|Mississippi         |Second Class  |5,009       |26             |5           |19.2            |
|Mississippi         |Standard Class|5,009       |26             |19          |73.1            |
|Missouri            |First Class   |5,009       |30             |5           |16.7            |
|Missouri            |Same Day      |5,009       |30             |1           |3.3             |


