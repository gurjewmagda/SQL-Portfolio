create table managers (
	manager_id int primary key auto_increment
	,first_name varchar(200) not null
	,last_name varchar(200) not null
	,manager_email varchar(200)
	,start_date date
)

-- Result after INSERT shown in the next file
	
|manager_id|first_name|last_name|manager_email              |start_date|
|----------|----------|---------|---------------------------|----------|
|1         |James     |Smith    |James.Smith@supersales.com |          |
|2         |Jane      |Doe      |Jane.Doe@supersales.com    |          |
|3         |Robert    |Adams    |Robert.Adams@supersales.com|          |


create table managers_product_groups (
	mpg_id int primary key auto_increment
	,manager_id int
	,group_id int
)

-- Result after INSERT shown in the next file
	
|mpg_id|manager_id|group_id|
|------|----------|--------|
|1     |1         |1       |
|2     |1         |2       |
|3     |1         |3       |
|7     |1         |7       |
|8     |1         |8       |
|9     |2         |9       |
|10    |2         |10      |
|11    |2         |11      |
|12    |2         |12      |
|13    |2         |13      |
|14    |2         |14      |
|15    |2         |15      |
|16    |2         |16      |
|17    |3         |1       |
|18    |3         |2       |
|19    |1         |1       |
|20    |1         |2       |
|21    |1         |3       |
|25    |1         |7       |
|26    |1         |8       |
|27    |2         |9       |
|28    |2         |10      |
|29    |2         |11      |
|30    |2         |12      |
|31    |2         |13      |
|32    |2         |14      |
|33    |2         |15      |
|34    |2         |16      |
|35    |3         |1       |
|36    |3         |2       |


