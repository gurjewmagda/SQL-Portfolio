
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

Result:
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





	
