select * 
from orders
order by customer_id asc, order_date desc
limit 10;

---- ===================================================================================================================
---- Return Top 5 group_id by avg
---- ===================================================================================================================
select
	group_id 
	,round(sum(product_price),2) as total_price
	,round(avg(product_price),2) as avg_price
	,round(min(product_price),2) as min_price
	,round(max(product_price),2) as max_price
from products
group by 1
order by 3 desc
limit 5;

|group_id|total_price|avg_price|min_price|max_price|
|--------|-----------|---------|---------|---------|
|15      |9,399.87   |723.07   |199.99   |3,499.99 |
|16      |29,815.75  |465.87   |5.99     |3,773.08 |
|4       |12,202.68  |214.08   |12.18    |550.98   |
|2       |14,150.89  |160.81   |25.98    |700.98   |
|1       |7,819.15   |156.38   |30.29    |880.98   |


select  
	delivery_city
	,count(distinct customer_id) 	as nr_of_customers
	,count(order_id)		as nr_of_orders
from orders
where shipping_mode = 'First Class'
group by 1
having count(order_id) between 50 and 200
order by 2 desc
limit 1;

|delivery_city|nr_of_customers|nr_of_orders|
|-------------|---------------|------------|
|New York City|65             |67          |
