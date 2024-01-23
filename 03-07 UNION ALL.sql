/* when columns we need are different in different tables*/

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
from products
limit 30;

|category       |product_id|product_price|
|---------------|----------|-------------|
|Furniture      |          |             |
|Furniture      |          |             |
|Furniture      |          |             |
|Furniture      |          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Office Supplies|          |             |
|Technology     |          |             |
|Technology     |          |             |
|Technology     |          |             |
|Technology     |          |             |
|               |1,847     |164.99       |
|               |1,759     |11.96        |
|               |1,829     |149.99       |
|               |1,745     |20.95        |
|               |413       |19.9         |
|               |1,857     |10.9         |
|               |968       |4.13         |
|               |1,058     |55.48        |
|               |1,853     |9.72         |
|               |477       |11.32        |
|               |1,151     |5.88         |
|               |1,189     |48.94        |
|               |79        |350.98       |


	
select
	category
	,1 as product_id
	,0 as product_price
from product_groups 
union all
select
	'aaa' as category
	,product_id
	,round(product_price,2)
from products
limit 20; 

|category       |product_id|product_price|
|---------------|----------|-------------|
|Furniture      |1         |0            |
|Furniture      |1         |0            |
|Furniture      |1         |0            |
|Furniture      |1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Office Supplies|1         |0            |
|Technology     |1         |0            |
|Technology     |1         |0            |
|Technology     |1         |0            |
|Technology     |1         |0            |
|aaa            |1,847     |164.99       |
|aaa            |1,759     |11.96        |
|aaa            |1,829     |149.99       |
