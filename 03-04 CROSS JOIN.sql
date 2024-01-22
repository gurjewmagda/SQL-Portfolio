
select 
	pg.group_id
	,p.product_id 
	,p.group_id as original_group
from products p
cross join product_groups pg

|group_id|product_id|original_group|
|--------|----------|--------------|
|17      |1,847     |17            |
|16      |1,847     |17            |
|15      |1,847     |17            |
|14      |1,847     |17            |
|13      |1,847     |17            |
|12      |1,847     |17            |
|11      |1,847     |17            |
|10      |1,847     |17            |
|9       |1,847     |17            |
|8       |1,847     |17            |
