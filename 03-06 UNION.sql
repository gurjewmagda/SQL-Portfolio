select * from product_groups
where group_id between 1 and 7
union
select * from product_groups
where group_id between 3 and 10

|group_id|product_group|category       |
|--------|-------------|---------------|
|1       |Bookcases    |Furniture      |
|2       |Chairs       |Furniture      |
|3       |Furnishings  |Furniture      |
|4       |Tables       |Furniture      |
|5       |Appliances   |Office Supplies|
|6       |Art          |Office Supplies|
|7       |Binders      |Office Supplies|
|8       |Envelopes    |Office Supplies|
|9       |Fasteners    |Office Supplies|
|10      |Labels       |Office Supplies|
