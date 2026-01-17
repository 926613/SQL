--STRING_FUNCTION
/*
select 
firstName, 
concat('     ', FirstName,' ', LastName) as FullName,
lower(concat(FirstName,' ', LastName)) as lowercase,
upper(FirstName) as upname,
trim(concat('     ', FirstName,' ', LastName)),
replace(trim(concat('     ', FirstName,' ', LastName)), ' ', '-'),
len(upper(FirstName)) as first_name_len ,
left(FirstName, 3) as char_ext,
right(FirstName, 3) as char_ext,
substring(FirstName, 2, 2) as char_ext,
substring(FirstName, 2, len(FirstName)) as char_ext
from sales.Custom ers
 
/*
select 
first_name
from customers
where first_name != trim(first_name)
*/

select 
'report.csv' old_file,
replace('report.csv', '.csv', '.txt') new_file

--NUMBER_FUNCTION
select 
3.517,
round(3.517, 3),
abs(-10)


--DATE&TIME_FUNCTION
 SELECT 
 OrderID,
 OrderDate,
 CreationTime,
 MONTH(OrderDate) MONTH_,
 YEAR(ORDERDATE) YEAR_ORDER,
 GETDATE() AS TODAY_TIME,
 DAY(OrderDate) DATE_ORDER,
 DATEPART(MINUTE, CreationTime) MINUTE,
 DATEPART(WEEK, CreationTime) WEEK,
 DATEPART(MONTH, CreationTime) MONTH_DP,
 DATENAME(MONTH, OrderDate) MONTH_NAME,
 DATENAME(WEEKDAY, OrderDate) DAY_NAME,
 DATENAME(DAY, OrderDate) DAY_DN,
 DATETRUNC(HOUR, CreationTime) h_CT,
 DATETRUNC(MONTH, OrderDate) M_OD
 FROM Sales.Orders

 SELECT 
 '2025-10-23',
 YEAR('2025-10-23')

 SELECT 
 DATETRUNC(MONTH, CreationTime),
 --COUNT(1)
 EOMONTH(OrderDate),
 CAST(DATETRUNC(MONTH, CreationTime) AS DATE) 
 FROM Sales.Orders
 --GROUP BY DATETRUNC(MONTH, CreationTime) 
 */

 SELECT 
 MONTH(OrderDate) ORDER_YEAR,
 COUNT(1) ORDERS_NUM
 FROM Sales.Orders
 GROUP BY MONTH(OrderDate)

SELECT 
OrderID,
ProductID, 
Sales
FROM SALES.Orders
WHERE --DATENAME(MONTH, OrderDate) = 'FEBRUARY'
	MONTH(OrderDate) = 2


SELECT 
OrderID,
CreationTime,
FORMAT(CreationTime, 'dd'),
FORMAT(CreationTime, 'ddd'),
FORMAT(CreationTime, 'dddd'),

FORMAT(CreationTime, 'MM'),
FORMAT(CreationTime, 'MMM'),
FORMAT(CreationTime, 'MMMM'),
FORMAT(CreationTime, 'yyyy/MM/dd')
FROM Sales.Orders

SELECT 
CreationTime, 
'DAY '+ FORMAT(CreationTime, 'ddd MMM')+ ' Q'+DATENAME(QUARTER, CreationTime)+ 
FORMAT(CreationTime, ' yyy HH:mm:ss tt')
FROM SALES.Orders


SELECT 
FORMAT(ORDERDATE, 'MMM yy'),
COUNT(*)
FROM SALES.Orders
GROUP BY FORMAT(ORDERDATE, 'MMM yy')


SELECT
CONVERT(INT, '123'),
CreationTime,
CONVERT(DATE, CreationTime),
CONVERT(VARCHAR, CreationTime)
FROM SALES.Orders;


SELECT 
--CAST(CreationTime AS INT) GIVE ERROR BECAUSE DATETIME CANNOT BE CONVERTED INTO INTEGER
CAST(OrderDate AS varchar),
CAST(CreationTime AS DATE),
CAST(OrderDate AS DATETIME)
FROM Sales.Orders

SELECT 
DATENAME(MONTH, OrderDate) MONTH,
DATENAME(MONTH, (DATEADD(MONTH, 3, OrderDate))),
DATEADD(MONTH, 3, OrderDate)
FROM Sales.Orders

SELECT 
DATENAME(MONTH, OrderDate) MONTH,
DATENAME(MONTH, (DATEADD(MONTH, -3, OrderDate))) 
FROM Sales.Orders

SELECT 
BirthDate,
DATEDIFF(YEAR, BirthDate, GETDATE()) [AGE_OF_EMPLOYEES]
FROM Sales.Employees

SELECT 
MONTH(OrderDate) AS ORDER_DATE,
AVG(DATEDIFF(DAY, OrderDate, ShipDate)) [AVG_DAYS]
FROM SALES.Orders
GROUP BY MONTH(OrderDate)

SELECT
OrderDate [CURRENT_ORDER], 
LAG(OrderDate) OVER(ORDER BY ORDERDATE) [PREVIOUS_ORDER],
DATEDIFF(DAY, LAG(OrderDate) OVER(ORDER BY ORDERDATE), OrderDate)
FROM Sales.Orders

SELECT 
ORDERDATE,
ISDATE(ORDERDATE)
FROM(
	SELECT '2024-10-23' AS ORDERDATE
	UNION
	SELECT '2025-01-12'
	UNION
	SELECT '2025-12'
)T