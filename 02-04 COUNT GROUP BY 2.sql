SELECT 
	shipping_mode 
	,delivery_city 
	,COUNT(*) AS number_of_orders
FROM orders
WHERE 
	delivery_city ='Los Angeles'
GROUP BY
	1,2
