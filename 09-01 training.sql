/* test of CTE */

with
test_1 as
	(
	select 
		group_id
		,product_id
		,round(sum(product_price),2) 	as 	total_price
		,round(avg(product_price),2) 	as 	avg_price
		,round(min(product_price),2)	as  min_price
		,round(max(product_price),2)	as  max_price
from products
where group_id <>10
group by 1,2
having max_price >6
order by group_id asc
	)
select distinct
	product_id
	,min_price
	from test_1 t1
	where min_price < 7
	order by 1,2 asc;


/* which products were returned from LA ?, what was the customer_id ? */

select* from orders;

with
LA_orders_returned as -- orders returned from LA with customer name
		(
		select
		o.order_id
		,o.customer_id
		,o.delivery_city
		from orders o
		inner join order_returns or2 on o.order_id = or2.order_id
		where delivery_city = 'Los Angeles'
		),
LA_product_returned as -- here I have product_id
		(
		select 
		op.order_id
		,op.product_id
		from order_positions op 
		inner join orders o on o.order_id=op.order_id
		)
select 
	laor.order_id
	,laor.customer_id
	,lapr.product_id
	,laor.delivery_city
from LA_orders_returned laor
inner join LA_product_returned lapr on laor.order_id=lapr.order_id
order by 1
	
	
	
	
	
	



	
