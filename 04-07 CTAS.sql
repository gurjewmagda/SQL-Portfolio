create table orders_2020 as
select * from orders
where year(order_date)=2020

-- chce stworzyc kopie tabeli to prosta komenda:

create table products_copy as
select* from products
