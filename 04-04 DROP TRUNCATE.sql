create table fake_managers (
	manager_id int primary key auto_increment
	,first_name varchar(200) not null
	,last_name varchar(200) not null
	,manager_email varchar(200)
	,start_date date
)

insert into fake_managers 
	(
	first_name, last_name
	)
values
	('James', 'Smith')
	,('Jane', 'Doe')
	,('Robert', 'Adams');


truncate table fake_managers 

drop table fake_managers 


