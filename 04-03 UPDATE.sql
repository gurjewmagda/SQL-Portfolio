select * from managers m 

update managers
set manager_email = concat(first_name, '.', last_name, '@supersales.com')
where manager_email is null

select * from managers m 