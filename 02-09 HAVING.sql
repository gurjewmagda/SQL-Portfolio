select
	group_id 
	,round(sum(product_price),2) as total_price
	,round(avg(product_price),2) as avg_price
	,round(min(product_price),2) as min_price
	,round(max(product_price),2) as max_price
from products
where group_id <>15
group by 1 
having min(product_price)>10;

|group_id|total_price|avg_price|min_price|max_price|
|--------|-----------|---------|---------|---------|
|2       |14,150.89  |160.81   |25.98    |700.98   |
|4       |12,202.68  |214.08   |12.18    |550.98   |
|1       |7,819.15   |156.38   |30.29    |880.98   |


select
	delivery_state
	,max(order_date) as last_order
	,min(order_date) as first_order
from orders
-- where shipping_mode ='First Class'
group by 1
-- having last_order <date('2021-01-01');

	|delivery_state      |last_order|first_order|
|--------------------|----------|-----------|
|Kentucky            |2022-01-24|2018-02-01 |
|California          |2022-01-25|2018-02-01 |
|Florida             |2022-01-20|2018-02-16 |
|North Carolina      |2022-01-13|2018-03-29 |
|Washington          |2022-01-24|2018-03-01 |
|Texas               |2022-01-23|2018-01-29 |
|Wisconsin           |2022-01-13|2018-02-27 |
|Utah                |2021-11-28|2018-04-09 |
|Nebraska            |2022-01-21|2018-08-16 |
|Pennsylvania        |2022-01-13|2018-01-31 |
|Illinois            |2022-01-23|2018-01-30 |
|Minnesota           |2022-01-17|2018-04-12 |
|Michigan            |2022-01-24|2018-02-15 |
|Delaware            |2021-12-26|2018-02-06 |
|Indiana             |2022-01-25|2018-02-18 |
|New York            |2022-01-25|2018-02-23 |
|Arizona             |2022-01-19|2018-02-14 |
|Virginia            |2022-01-12|2018-02-05 |
|Tennessee           |2022-01-23|2018-02-15 |
|Alabama             |2022-01-20|2018-05-03 |
|South Carolina      |2022-01-16|2018-02-08 |
|Oregon              |2021-12-13|2018-02-13 |
|Colorado            |2022-01-25|2018-04-05 |
|Iowa                |2022-01-21|2018-04-23 |
|Ohio                |2022-01-22|2018-02-08 |
|Missouri            |2022-01-17|2018-03-09 |
|Oklahoma            |2022-01-11|2018-07-16 |
|New Mexico          |2022-01-23|2018-04-23 |
|Louisiana           |2022-01-19|2018-02-08 |
|Connecticut         |2022-01-18|2018-05-30 |
|New Jersey          |2022-01-20|2018-03-05 |
|Massachusetts       |2022-01-19|2018-04-27 |
|Georgia             |2021-12-22|2018-02-01 |
|Nevada              |2022-01-05|2018-02-18 |
|Rhode Island        |2022-01-17|2018-11-26 |
|Mississippi         |2022-01-05|2018-04-12 |
|Arkansas            |2022-01-18|2018-02-15 |
|Montana             |2021-10-21|2018-05-07 |
|New Hampshire       |2021-10-18|2018-06-15 |
|Maryland            |2021-12-24|2018-05-09 |
|District of Columbia|2021-02-07|2019-05-23 |
|Kansas              |2021-12-20|2018-10-08 |
|Vermont             |2021-12-31|2019-12-03 |
|Maine               |2020-10-13|2018-08-30 |
|South Dakota        |2021-12-07|2018-02-21 |
|Idaho               |2022-01-19|2018-05-07 |
|North Dakota        |2022-01-23|2021-06-15 |
|Wyoming             |2020-12-03|2020-12-03 |
|West Virginia       |2021-11-07|2021-07-17 |


select
	delivery_state
	,max(order_date) as last_order
	,min(order_date) as first_order
from orders
group by 1
having max(order_date)< date('2021-01-01');

|delivery_state|last_order|first_order|
|--------------|----------|-----------|
|Maine         |2020-10-13|2018-08-30 |
|Wyoming       |2020-12-03|2020-12-03 |


select
	delivery_state
	,max(order_date) as last_order
	,min(order_date) as first_order
from orders
where shipping_mode ='First Class'
group by 1
having max(order_date)< date('2021-01-01');

|delivery_state|last_order|first_order|
|--------------|----------|-----------|
|Mississippi   |2018-07-31|2018-07-31 |
|Iowa          |2020-10-01|2020-10-01 |
|Kansas        |2020-12-23|2019-03-06 |
|South Dakota  |2018-02-21|2018-02-21 |
