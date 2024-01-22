select
	customer_id 
	,count(order_id) as orders
from orders
group by 1; -- najpierw mamy to

/* teraz dodamy subquery bo chcemy poklasyfikowac klientów jako np loyal, new itp na podstawie ilosci zamowien*/

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
) o ;-- uwaga !! dał new i regular tylko. jak drugi warunek spelniony to nie przechodzi do nastepnego


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