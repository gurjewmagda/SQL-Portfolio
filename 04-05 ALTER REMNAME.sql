alter table managers  add column end_date date

select* from managers


alter table managers modify column end_date varchar(50)

alter table managers drop column end_date

rename table managers to group_managers

rename table group_managers to managers

