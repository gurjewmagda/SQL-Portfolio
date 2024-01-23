create table orders_2020 as
select * from orders
where year(order_date)=2020

-- create table as select

create table products_copy as
select* from products
