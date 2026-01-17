-- USER DATA STORAGE: STORES THE MAIN DATA 
SELECT * FROM Sales.Customers

-- SYSTEM CATALOG: IT STORS METADATA (DATA ABOUT DATA)
SELECT 
DISTINCT 
TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS


--------SUBQUERY

-- RESULT TYPE SUBQUERY

--1. SCALAR SUBQUERY
SELECT SUM(SALES) FROM Sales.Orders
--2. ROW SUBQUERY
SELECT PRODUCTID FROM Sales.Orders
--3. TABLE SUBQUERY
SELECT * FROM Sales.Customers



-- LOCATION / CLAUSE SUBQUEY
SELECT
PRODUCTID, PRICE 
FROM(
	SELECT 
	ProductID,
	Price,
	AVG(Price) OVER() [AVG_PRICE]
	FROM Sales.Products
) T WHERE Price > AVG_PRICE


SELECT 
*,
ROW_NUMBER() OVER(ORDER BY TOTAL_SALES DESC) RN
FROM(
	SELECT 
	CustomerID,
	SUM(Sales) [TOTAL_SALES]
	FROM Sales.Orders
	GROUP BY CustomerID
) T


SELECT
ProductID,
Product,
Price,
(SELECT COUNT(1) FROM Sales.Orders ) [TOATL_ORDERS]
FROM Sales.Products


SELECT 
C.*,
O.TOTAL_ORDERS
FROM Sales.Customers AS C
LEFT JOIN(
	SELECT 
	CustomerID,
	COUNT(1) [TOTAL_ORDERS]
	FROM Sales.Orders
	GROUP BY CustomerID) O
ON C.CustomerID = O.CustomerID





SELECT 
C.*,
ISNULL(O.AVG_SALES, 0) AVG_SALES,
ROW_NUMBER() OVER(ORDER BY ISNULL(O.AVG_SALES, 0) DESC) RN
FROM Sales.Customers C
LEFT JOIN (
	SELECT
	CustomerID,
	AVG(Sales) AVG_SALES
	FROM Sales.Orders
	GROUP BY CustomerID) O
ON C.CustomerID = O.CustomerID



SELECT
ProductID,
Price
FROM Sales.Products
WHERE Price > (SELECT AVG(PRICE) FROM Sales.Products)


SELECT 
*
FROM Sales.Orders
WHERE CustomerID IN (SELECT 
					CustomerID
					FROM Sales.Customers
					WHERE COUNTRY = 'GERMANY')


SELECT	 
*
FROM Sales.Employees
WHERE Gender = 'F' AND Salary > ANY
(SELECT Salary FROM Sales.Employees WHERE Gender = 'M')


SELECT	 
*
FROM Sales.Employees
WHERE Gender = 'F' AND Salary <= ALL
(SELECT Salary FROM Sales.Employees WHERE Gender = 'M')
 

----------CORRELATED SUBQUERY

--MAIN QUERY
SELECT 
*,

--SUBQUERY
(SELECT COUNT(1) FROM Sales.Orders O WHERE O.CustomerID = C.CustomerID)
FROM Sales.Customers C 

-- EXIST OPERATOR
SELECT 
* 
FROM Sales.Orders O
WHERE EXISTS (SELECT 1
			  FROM Sales.Customers C
			  WHERE Country = 'GERMANY'
			  AND C.CustomerID = O.CustomerID)

SELECT 
* 
FROM Sales.Orders O
WHERE NOT EXISTS (SELECT 1
			  FROM Sales.Customers C
			  WHERE Country = 'GERMANY'
			  AND C.CustomerID = O.CustomerID)

