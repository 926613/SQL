select 
EmployeeID,
FirstName,
LastName
from sales.Employees
--union
--union all
--except
intersect
select 
CustomerID,
FirstName,
LastName
from sales.Customers


select 
'Orders' as Source_tble,
OrderID,
OrderDate,
Quantity,
Sales
from Sales.Orders
union 
select 
'OrdersArchieve' as Source_tble,
OrderID,
OrderDate,
Quantity,
Sales
from Sales.OrdersArchive
