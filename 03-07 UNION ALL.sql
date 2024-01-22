select
	category
	,null as product_id
	,null as product_price
from product_groups 
union all
select
	null as category
	,product_id
	,product_price
from products;

select
	category
	,1 as product_id
	,0 as product_price
from product_groups 
union all
select
	'aaa' as category
	,product_id
	,product_price
from products; 