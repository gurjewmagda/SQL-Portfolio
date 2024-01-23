with
needed_states as
	(
	select delivery_state
	from orders
	group by 1
	having count(distinct customer_id) > 100	-- states where number of customers >100
	),
all_orders as
	(
	select count(order_id) as total_orders 
	from orders
	),						-- the number of all orders (5009)
ds_orders as
	(
	select   
		delivery_state 
		,count(order_id) as orders_ds
	from orders
	group by 1
	),						-- the number of orders in individual states
ds_sm_orders as
	(
	select 
		delivery_state 
		,shipping_mode 
		,count(o.order_id)	as orders_ds_sm
	from orders o
	group by 1, 2
	)						-- combination of state, shipping_mode and number of orders
select 
	dss.delivery_state
	,dss.shipping_mode
	,ao.total_orders
	,dso.orders_ds
	,dss.orders_ds_sm
	,round((dss.orders_ds_sm / dso.orders_ds) * 100, 1) as ds_ratio_percent
from ds_sm_orders 		dss
join ds_orders 			dso	on	dss.delivery_state = dso.delivery_state
join needed_states		ns 	on 	ns.delivery_state = dss.delivery_state
cross join all_orders 	ao
order by 1, 2

|delivery_state|shipping_mode |total_orders|orders_ds|orders_ds_sm|ds_ratio_percent|
|--------------|--------------|------------|---------|------------|----------------|
|California    |First Class   |5,009       |1,021    |164         |16.1            |
|California    |Same Day      |5,009       |1,021    |55          |5.4             |
|California    |Second Class  |5,009       |1,021    |201         |19.7            |
|California    |Standard Class|5,009       |1,021    |601         |58.9            |
|Florida       |First Class   |5,009       |200      |28          |14              |
|Florida       |Same Day      |5,009       |200      |11          |5.5             |
|Florida       |Second Class  |5,009       |200      |36          |18              |
|Florida       |Standard Class|5,009       |200      |125         |62.5            |
|Illinois      |First Class   |5,009       |276      |42          |15.2            |
|Illinois      |Same Day      |5,009       |276      |9           |3.3             |
|Illinois      |Second Class  |5,009       |276      |52          |18.8            |
|Illinois      |Standard Class|5,009       |276      |173         |62.7            |
|Michigan      |First Class   |5,009       |117      |13          |11.1            |
|Michigan      |Same Day      |5,009       |117      |7           |6               |
|Michigan      |Second Class  |5,009       |117      |25          |21.4            |
|Michigan      |Standard Class|5,009       |117      |72          |61.5            |
|New York      |First Class   |5,009       |562      |80          |14.2            |
|New York      |Same Day      |5,009       |562      |28          |5               |
|New York      |Second Class  |5,009       |562      |110         |19.6            |
|New York      |Standard Class|5,009       |562      |344         |61.2            |
|North Carolina|First Class   |5,009       |136      |22          |16.2            |
|North Carolina|Same Day      |5,009       |136      |11          |8.1             |
|North Carolina|Second Class  |5,009       |136      |23          |16.9            |
|North Carolina|Standard Class|5,009       |136      |80          |58.8            |
|Ohio          |First Class   |5,009       |236      |47          |19.9            |
|Ohio          |Same Day      |5,009       |236      |19          |8.1             |
|Ohio          |Second Class  |5,009       |236      |51          |21.6            |
|Ohio          |Standard Class|5,009       |236      |119         |50.4            |
|Pennsylvania  |First Class   |5,009       |288      |52          |18.1            |
|Pennsylvania  |Same Day      |5,009       |288      |13          |4.5             |
|Pennsylvania  |Second Class  |5,009       |288      |48          |16.7            |
|Pennsylvania  |Standard Class|5,009       |288      |175         |60.8            |
|Texas         |First Class   |5,009       |487      |76          |15.6            |
|Texas         |Same Day      |5,009       |487      |28          |5.7             |
|Texas         |Second Class  |5,009       |487      |97          |19.9            |
|Texas         |Standard Class|5,009       |487      |286         |58.7            |
|Virginia      |First Class   |5,009       |115      |28          |24.3            |
|Virginia      |Same Day      |5,009       |115      |3           |2.6             |
|Virginia      |Second Class  |5,009       |115      |20          |17.4            |
|Virginia      |Standard Class|5,009       |115      |64          |55.7            |
|Washington    |First Class   |5,009       |256      |31          |12.1            |
|Washington    |Same Day      |5,009       |256      |16          |6.3             |
|Washington    |Second Class  |5,009       |256      |54          |21.1            |
|Washington    |Standard Class|5,009       |256      |155         |60.5            |




