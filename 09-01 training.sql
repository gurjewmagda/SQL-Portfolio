
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


	
