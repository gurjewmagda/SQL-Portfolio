---- ===================================================================================================================
---- Jak kształtuje się cena w różnych grupach ?
---- ===================================================================================================================

select
	group_id 
	,round(sum(product_price),2) as total_price
	,round(avg(product_price),2) as avg_price
	,round(min(product_price),2) as min_price
	,round(max(product_price),2) as max_price
from products
group by 1

|group_id|total_price|avg_price|min_price|max_price|
|--------|-----------|---------|---------|---------|
|17      |23,740.19  |125.61   |1.98     |649.83   |
|5       |7,406.83   |74.82    |0.81     |363.25   |
|10      |532.53     |7.61     |2.3      |98.31    |
|11      |4,671.79   |16.45    |2.18     |104.85   |
|2       |14,150.89  |160.81   |25.98    |700.98   |
|3       |6,005.41   |31.94    |1.74     |209.84   |
|16      |29,815.75  |465.87   |5.99     |3,773.08 |
|8       |1,187.62   |21.99    |2.04     |162.93   |
|13      |3,209.45   |84.46    |2.08     |1,637.53 |
|4       |12,202.68  |214.08   |12.18    |550.98   |
|7       |12,228.24  |57.41    |1.34     |1,889.99 |
|12      |9,716.72   |73.06    |2.98     |647.89   |
|6       |1,602.3    |9.77     |1.34     |139.13   |
|1       |7,819.15   |156.38   |30.29    |880.98   |
|14      |8,662.69   |58.93    |-16      |421.95   |
|9       |146.7      |3.41     |1.14     |11.48    |
|15      |9,399.87   |723.07   |199.99   |3,499.99 |
