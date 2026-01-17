create table persons(
	id int, --primary key,
	person_name varchar(20) not null,
	birth_date date,
	phone_num varchar(15) not null,
	constraint pk_person primary key(id) 
)

select * from persons;

alter table persons
--add email varchar(30) not null;
drop column email;

drop table persons;

insert into persons (id, person_name, birth_date, phone_num)
values (1, 'John', '2001-02-23', 123),
		(2, 'Rohan', '2009-03-13', 345)

insert into persons (id, person_name, birth_date, phone_num)
select 
id,
first_name,
null,
'Unknown'
from customers

update persons 
--set phone_num = 123
set birth_date = '2005'
where birth_date is null;

select * from persons;

delete from persons
where id >= 5;

truncate table persons

