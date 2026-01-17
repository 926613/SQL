select 
*
from customers;

select *
from orders

select 
c.id,
c.first_name,
o.order_date,
o.sales
from customers as c 
inner join orders as o
on c.id = o.customer_id;

select 
c.id,
c.first_name,
o.order_date,
o.sales
from orders as o 
left join customers as c 
on c.id = o.customer_id;

select 
c.id,
c.first_name,
o.order_date,
o.sales
from customers as c 
full join orders as o 
on c.id = o.customer_id

select 
c.id,
c.first_name,
o.order_date,
o.sales
from customers as c 
left join orders as o
on c.id = o.customer_id
where o.customer_id is null;

select 
c.id,
c.first_name,
o.order_date,
o.sales
from customers as c 
full join orders as o
on c.id = o.customer_id
where o.customer_id is null
		or c.id is null;

select 
c.id,
c.first_name,
o.order_id,
o.sales
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null;

select 
*
from customers
cross join orders


select 
o.OrderID,
c.FirstName [customer first_name],
c.LastName [customer last_name],
p.Product,
o.Sales,
p.Price,
e.FirstName [employee first_name],
e.LastName [employee last_name]
from sales.Orders as o
left join sales.Customers as c
on o.CustomerID = c.CustomerID
left join sales.Products as p
on p.ProductID = o.ProductID
left join sales.Employees as e
on e.EmployeeID = o.SalesPersonID