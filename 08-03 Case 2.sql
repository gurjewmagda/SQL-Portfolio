/* which product resulted in most non-first orders */

with
order_ranking as
	(
	select
		order_id
		,customer_id
		,row_number() over (partition by customer_id order by order_id) as ranked_order
	from orders
	),
orders_made as
	(
	select
		o.order_id
		,ora.ranked_order
		,o.customer_id 
		,op.order_position_id 
		,p.product_id
		,max(ora.ranked_order) over (partition by o.customer_id) - 1 as non_first_orders_made
	from orders o 
	join order_positions 	op 	on o.order_id = op.order_position_id 
	join products 			p	on p.product_id = op.product_id 
	join order_ranking		ora	on ora.order_id = o.order_id 
	),
prep_aggregations as
	(
	select distinct
		order_id
		,product_id
		,non_first_orders_made
	from orders_made 
	where ranked_order = 1
	)
select
	product_id
	,sum(non_first_orders_made) as all_non_first_orders_made
from prep_aggregations
group by 1
order by 2 desc
limit 1

|product_id|all_non_first_orders_made|
|----------|-------------------------|
|1,393     |26                       |
