select * from product_groups

select 
	pg.group_id
	,p.product_id 
	,p.group_id as original_group
from products p
cross join product_groups pg