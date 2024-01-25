SELECT
	order_id 
	,customer_id AS customer
FROM orders
WHERE 
(
	customer_id <50
AND 	delivery_city ='Los Angeles'
)
OR 	order_date < date('2020-01-01')

