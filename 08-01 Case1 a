---- =========================================================================================================
--- Return the number of customers who ordered a specific amount of orders and their percentage of the total
---- =========================================================================================================

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

-- Result:

|orders|prc_distribution_of_customers|
|------|-----------------------------|
|1     |1.51                         |
|2     |4.29                         |
|3     |6.68                         |
|4     |12.11                        |
|5     |16.9                         |
|6     |13.49                        |
|7     |14.63                        |
|8     |10.34                        |
|9     |8.95                         |
|10    |4.92                         |
|11    |2.9                          |
|12    |2.27                         |
|13    |0.88                         |
|17    |0.13                         |
