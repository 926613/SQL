-- VIEW(IT IS AN OBJECT) : it is virtual table that shows data without storing it physically IN DATABASE
 

--- USE CASE
---1 CENTRAL QUERY LOGIC

--CREATING VIEW
/*
CREATE VIEW Sales.V_MONTHLY_SUMMARY AS 
(
SELECT 
DATETRUNC(MONTH, OrderDate) ORDER_MONTH,
SUM(Sales) TOTAL_SALES,
COUNT(1) [TOTAL_ORDERS],
SUM(Quantity) [TOTAL_QUANTITY]
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH, OrderDate)
)

SELECT 
ORDER_MONTH,
TOTAL_SALES,
SUM(TOTAL_SALES) OVER(ORDER BY TOTAL_SALES DESC ) [RUNNING_TOTAL]
FROM Sales.V_MONTHLY_SUMMARY

--DELETING VIEW
--DROP VIEW V_MONTHLY_SUMMARY


--ALTERING VIEW
IF OBJECT_ID('Sales.V_MONTHLY_SUMMARY', 'V') IS NOT NULL
	DROP VIEW Sales.V_MONTHLY_SUMMARY;

GO
CREATE VIEW Sales.V_MONTHLY_SUMMARY AS 
(
SELECT 
DATETRUNC(MONTH, OrderDate) ORDER_MONTH,
SUM(Sales) TOTAL_SALES,
COUNT(1) [TOTAL_ORDERS]
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH, OrderDate)
)


--3. HIDE THE COMPLEXITY

--TASK: PROVIDE VIEW THAT CONTAIN DETAILS FROM ORDES, EMPLOYEES, PRODUCTS AND CUSTOMERS
CREATE VIEW Sales.V_ORDER_DETAILS AS 
(
SELECT 
O.OrderID,
O.OrderDate,
CONCAT(C.FirstName, C.LastName) CUST_NAME,
C.COUNTRY CUSTOMER_COUNTRY,
P.Product,
P.Category,
CONCAT(E.FirstName, E.LastName) EMP_NAME,
E.Department,
O.Sales,
O.Quantity
FROM Sales.Orders AS O
LEFT JOIN Sales.Customers AS C
ON C.CustomerID = O.CustomerID
LEFT JOIN Sales.Products AS P
ON O.ProductID = P.ProductID
LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID
)
*/


--3. DATA SECURITY
CREATE VIEW Sales.V_ORDER_DETAIL_EU AS
(
SELECT 
O.OrderID,
O.OrderDate,
CONCAT(C.FirstName, C.LastName) CUST_NAME,
C.COUNTRY CUSTOMER_COUNTRY,
P.Product,
P.Category,
CONCAT(E.FirstName, E.LastName) EMP_NAME,
E.Department,
O.Sales,
O.Quantity
FROM Sales.Orders AS O
LEFT JOIN Sales.Customers AS C
ON C.CustomerID = O.CustomerID
LEFT JOIN Sales.Products AS P 
ON O.ProductID = P.ProductID
LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID 
WHERE NOT C.Country = 'USA' 
) 



