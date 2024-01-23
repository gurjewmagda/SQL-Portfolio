select * from orders 
where order_date>= date('2022-01-01');

-- create a View

create view vw_orders_after_2022 as
select * from orders 
where order_date >= date('2022-01-01')

select * from vw_orders_after_2022
	
|order_id|order_date|
|--------|----------|
|362     |2022-01-04|
|382     |2022-01-20|
|396     |2022-01-17|
|427     |2022-01-12|
|429     |2022-01-04|
|453     |2022-01-04|
|454     |2022-01-23|
|504     |2022-01-06|
|513     |2022-01-19|
|514     |2022-01-03|


create or replace view vw_orders_after_2022 as
select 
	order_id
	,order_date  
from orders 
where order_date >= date('2022-01-01')

drop view if exists vw_orders_after_2022
