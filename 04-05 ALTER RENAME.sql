alter table managers  add column end_date date

select* from managers
  
|manager_id|first_name|last_name|manager_email              |start_date|end_date|
|----------|----------|---------|---------------------------|----------|--------|
|1         |James     |Smith    |James.Smith@supersales.com |          |        |
|2         |Jane      |Doe      |Jane.Doe@supersales.com    |          |        |
|3         |Robert    |Adams    |Robert.Adams@supersales.com|          |        |


alter table managers modify column end_date varchar(50)

alter table managers drop column end_date

|manager_id|first_name|last_name|manager_email              |start_date|
|----------|----------|---------|---------------------------|----------|
|1         |James     |Smith    |James.Smith@supersales.com |          |
|2         |Jane      |Doe      |Jane.Doe@supersales.com    |          |
|3         |Robert    |Adams    |Robert.Adams@supersales.com|          |


rename table managers to group_managers

rename table group_managers to managers

