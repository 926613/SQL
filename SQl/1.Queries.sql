-- use MyDatabase
--select * from orders;

/*select 
	customer_id,
	sales
from orders;
*/

/*
select 
first_name,
country
from customers
where country = 'Germany';
*/

/*
select 
*
from customers 
order by country,
score desc
*/

/*
select 
count(id) as Numberofcust,
country,
sum(score) [Total_Score]
from customers
group by country
*/

/*
select
country,
avg(score) [Avg_Score]
from customers
where score != 0
group by country
having avg(score) > 430;

select 
distinct
country
from customers
order by country desc;


select 
top 2 *
from customers
order by score desc;
*/

select top 2
*
from orders
order by order_date desc;

select top 2
country,
sum(score) [Total]
from customers
group by country
having sum(score) > 800
order by country desc;

select 
id,
first_name,
'New Customer' as Customer_type
from customers