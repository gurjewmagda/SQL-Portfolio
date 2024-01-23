select
	order_id
	,order_date
	,delivery_city
	,delivery_state
	,count(order_id) over (partition by delivery_city) 	as city_orders
	,min(order_date) over (partition by delivery_state)	as first_state_order
from orders
order by 1

|order_id|order_date|delivery_city  |delivery_state|city_orders|first_state_order|
|--------|----------|---------------|--------------|-----------|-----------------|
|328     |2020-12-04|Henderson      |Kentucky      |19         |2018-02-01       |
|329     |2020-07-08|Los Angeles    |California    |384        |2018-02-01       |
|330     |2019-11-06|Fort Lauderdale|Florida       |12         |2018-02-16       |
|331     |2018-07-05|Los Angeles    |California    |384        |2018-02-01       |
|332     |2021-05-11|Concord        |North Carolina|21         |2018-03-29       |
|333     |2020-12-31|Seattle        |Washington    |212        |2018-03-01       |
|334     |2019-12-18|Fort Worth     |Texas         |12         |2018-01-29       |
|335     |2018-12-07|Madison        |Wisconsin     |4          |2018-02-27       |
|336     |2018-06-08|West Jordan    |Utah          |2          |2018-04-09       |
|337     |2018-09-22|San Francisco  |California    |265        |2018-02-01       |
