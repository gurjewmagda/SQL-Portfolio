with
needed_states as
	(
	select delivery_state
	from orders
	group by 1
	having count(distinct customer_id) > 100
	), -- CTE oddzielamy przecinkami
all_orders as
	(
	select count(order_id) as total_orders
	from orders
	),-- niestawiamy przecinka po ostatnim CTE
ds_orders as
	(
	select  
		delivery_state 
		,count(order_id) as orders_ds
	from orders
	group by 1
	),
ds_sm_orders as -- delivery_state i shipping_mode orders
	(
	select 
		o.delivery_state 
		,o.shipping_mode 
		,count(o.order_id) as orders_ds_sm
	from orders o
	group by 1,2
	)
select 
	dss.delivery_state
	,dss.shipping_mode
	,ao.total_orders -- zeby przesunąć kolumne ctr+shift+strzałka w góre
	,dso.orders_ds
	,dss.orders_ds_sm
from ds_sm_orders 		dss
join ds_orders			dso on dss.delivery_state=dso.delivery_state
cross join all_orders 	ao -- przy cross joinie nie musimy definiować kolumny
join needed_states 		ns 	on ns.delivery_state=dss.delivery_state -- tu nie ma znaczenia z którą tabelą joinujemy


-- od Kajo
with
needed_states as
	(
	select delivery_state
	from orders
	group by 1
	having count(distinct customer_id) > 100
	),
all_orders as
	(
	select count(order_id) as total_orders 
	from orders
	),
ds_orders as
	(
	select   
		delivery_state 
		,count(order_id) as orders_ds
	from orders
	group by 1
	),
ds_sm_orders as
	(
	select 
		delivery_state 
		,shipping_mode 
		,count(o.order_id)	as orders_ds_sm
	from orders o
	group by 1, 2
	)
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



