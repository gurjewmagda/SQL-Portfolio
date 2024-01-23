select
	customer_id 
	,count(order_id) as orders
from orders
group by 1; -- first step

|customer_id|orders|
|-----------|------|
|166        |3     |
|262        |5     |
|728        |6     |
|111        |8     |
|25         |4     |
|361        |7     |
|353        |7     |
|620        |12    |
|41         |5     |
|815        |5     |


/* add subquery to clasify customers as for example loyal, new on the basis of number of orders*/

select
	o.*
	,case 
		when o.orders=1 then 'New'
		when o.orders>1 then 'Regular'
		when o.orders>5 then 'Loyal'
		else 'Very Loyal'
	end as customer_type
from
(
select
	customer_id 
	,count(order_id) as orders
from orders
group by 1
) o ;					-- uwaga !! dał new i regular tylko. jak drugi warunek spelniony to nie przechodzi do nastepnego

|customer_id|orders|customer_type|
|-----------|------|-------------|
|166        |3     |Regular      |
|262        |5     |Regular      |
|728        |6     |Regular      |
|111        |8     |Regular      |
|25         |4     |Regular      |
|361        |7     |Regular      |
|353        |7     |Regular      |
|620        |12    |Regular      |
|41         |5     |Regular      |
|815        |5     |Regular      |
|440        |12    |Regular      |
|707        |7     |Regular      |
|272        |10    |Regular      |
|281        |8     |Regular      |
|761        |9     |Regular      |
|505        |11    |Regular      |
|323        |2     |Regular      |
|727        |7     |Regular      |
|475        |8     |Regular      |
|640        |7     |Regular      |


select
	o.*
	,case 
		when o.orders=1 then 'New'
		when o.orders>1 and o.orders<5 then 'Regular'
		when o.orders>=5 and o.orders <10 then 'Loyal'
		else 'Very Loyal'
	end as customer_type
from
(
select
	customer_id 
	,count(order_id) as orders
from orders
group by 1
) o

|customer_id|orders|customer_type|
|-----------|------|-------------|
|166        |3     |Regular      |
|262        |5     |Loyal        |
|728        |6     |Loyal        |
|111        |8     |Loyal        |
|25         |4     |Regular      |
|361        |7     |Loyal        |
|353        |7     |Loyal        |
|620        |12    |Very Loyal   |
|41         |5     |Loyal        |
|815        |5     |Loyal        |
|440        |12    |Very Loyal   |
|707        |7     |Loyal        |
|272        |10    |Very Loyal   |
|281        |8     |Loyal        |
|761        |9     |Loyal        |
|505        |11    |Very Loyal   |
|323        |2     |Regular      |
|727        |7     |Loyal        |
|475        |8     |Loyal        |
|640        |7     |Loyal        |
