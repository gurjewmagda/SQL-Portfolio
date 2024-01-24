===========================================================================================================
/*exercises with CTE */
===========================================================================================================
with
test_1 as
	(
	select 
		group_id
		,product_id
		,round(sum(product_price),2) 	as 	total_price
		,round(avg(product_price),2) 	as 	avg_price
		,round(min(product_price),2)	as	min_price
		,round(max(product_price),2)	as 	max_price
	from products
	where group_id <>10
	group by 1,2
	having max_price >6
	order by group_id asc
	)
select distinct				-- distinct not needed because order_id is unique
	product_id
	,min_price
	from test_1 t1
	where min_price < 7
	order by 1,2 asc;

|product_id|min_price|
|----------|---------|
|166       |6.28     |
|168       |6.24     |
|170       |6.28     |
|189       |6.98     |
|219       |6.98     |
|246       |6.28     |
|307       |6.64     |
|504       |6.08     |
|526       |6.48     |
|541       |6.94     |
|560       |6.47     |
|567       |6.68     |
|597       |6.08     |
|643       |6.7      |
|660       |6.47     |
|689       |6.23     |
|698       |6.38     |
|699       |6.17     |
|701       |6.28     |
|724       |6.54     |

--simplified version:
SELECT
    DISTINCT product_id,
    ROUND(MIN(product_price), 2) AS min_price
FROM
    products
WHERE
    group_id <> 10
GROUP BY
    group_id, product_id
HAVING
    ROUND(MAX(product_price), 2) > 6
    AND ROUND(MIN(product_price), 2) < 7
ORDER BY
    product_id, min_price asc
   limit 20;

=============================================================================================================================================================================================================================
/* which products were returned from LA ?, what was the customer_id ? */
=============================================================================================================================================================================================================================
select* from orders;
|order_id|customer_id|order_date|shipping_date|shipping_mode|delivery_country|delivery_city|delivery_state|delivery_zip_code|order_return|
|--------|-----------|----------|-------------|-------------|----------------|-------------|--------------|-----------------|------------|
|328     |166        |2020-12-04|2020-12-07   |Second Class |United States   |Henderson    |Kentucky      |42,420           |37          |

select * from order_positions;
|order_id|order_position_id|product_id|item_quantity|position_discount|
|--------|-----------------|----------|-------------|-----------------|
|328     |108              |13        |2            |0                |

select * from order_returns;
|order_id|next_order_free|
|--------|---------------|
|329     |0              |


Query:
	
WITH
LA_orders_returned AS 				-- orders returned from LA with customer name
		(
		SELECT
		o.order_id
		,o.customer_id
		,o.delivery_city
		FROM orders o
		INNER JOIN order_returns or2 on o.order_id = or2.order_id
		WHERE delivery_city = 'Los Angeles'
		),
LA_product_returned AS 				-- here I have product_id
		(
		SELECT 
		op.order_id
		,op.product_id
		FROM order_positions op 
		INNER JOIN orders o ON o.order_id=op.order_id
		)
SELECT 
	laor.order_id
	,laor.customer_id
	,lapr.product_id
	,laor.delivery_city
FROM LA_orders_returned laor
INNER JOIN LA_product_returned lapr on laor.order_id=lapr.order_id
ORDER BY 1

Final result - orders returned from Los Angeles with a product_id and customer_id
	
|order_id|customer_id|product_id|delivery_city|
|--------|-----------|----------|-------------|
|329     |262        |960       |Los Angeles  |
|1,445   |69         |344       |Los Angeles  |
|1,445   |69         |98        |Los Angeles  |
|1,559   |571        |1,731     |Los Angeles  |
|1,559   |571        |1,497     |Los Angeles  |
|2,894   |134        |326       |Los Angeles  |
|2,894   |134        |1,848     |Los Angeles  |
|2,894   |134        |482       |Los Angeles  |
|3,901   |532        |595       |Los Angeles  |
|3,901   |532        |963       |Los Angeles  |
|4,094   |325        |1,784     |Los Angeles  |
|4,887   |399        |394       |Los Angeles  |
	
=============================================================================================================================================================================================================================	
	
	
	



	
