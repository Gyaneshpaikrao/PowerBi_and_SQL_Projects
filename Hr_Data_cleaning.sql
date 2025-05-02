create database projects;

select * from hr;
alter table hr
change column ï»¿id emp_id varchar(20);

describe hr;

set sql_safe_updates = 0;

select termdate from hr;
update hr 
set hire_date =case
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d') 
else null end;

alter table hr
modify column termdate date null;

update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != '';

select termdate from hr;

update hr
set termdate = '1900-01-01'
where termdate is null ;

alter table hr 
add column age int;

update hr
set age = timestampdiff(YEAR, birthdate, curdate());
select birthdate, age from hr;

select min(age) as yungest, 
max(age) as oldest
from hr;



