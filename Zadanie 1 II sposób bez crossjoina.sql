with
orders_per_customer as 
	(
	select 
		customer_id  
		,count(order_id) as orders
	from orders
	group by 1
	),
all_customers as
	(
	select count(distinct customer_id) as total_customers
	from orders
	),
customers_histogram as
	(
	select 
		orders
		,count(customer_id) as customers
	from orders_per_customer
	group by 1
	)
select  
	ch.orders
	,round((ch.customers / (select total_customers  from all_customers))*100, 2) as prc_distribution_of_customers
from customers_histogram ch
order by 1;