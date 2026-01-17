--NULL_FUNCTION
SELECT
ShipAddress,
ISNULL(ShipAddress, 'UNKNOWN')
FROM Sales.Orders

SELECT 
ShipAddress,
BillAddress,
COALESCE(ShipAddress, BILLADDRESS, 'UNKNOWN') -- MULTIPLE VALUES CAN BE USED.
FROM Sales.Orders



SELECT 
Score,
AVG(COALESCE(SCORE, 0)) OVER()
FROM Sales.Customers


SELECT
CustomerID,
FirstName, 
LastName, 
Score,
FirstName + ' ' + COALESCE(LastName, ' '),
COALESCE(SCORE, 0) + 10
FROM Sales.Customers

SELECT
CustomerID,
SCORE
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, SCORE 

SELECT 
SALES,
Quantity,
Sales / NULLIF(Quantity, 0)
FROM Sales.Orders

SELECT
*
FROM Sales.Orders
WHERE ShipAddress IS NULL AND BillAddress IS NULL


SELECT 
*
FROM Sales.Customers AS C
LEFT JOIN Sales.Orders AS O
ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL

-- CASE_STATEMENT
SELECT
CATEGORY,
SUM(Sales) AS TOTAL_SALES
FROM(
	SELECT 
	OrderID, 
	OrderDate, 
	Sales,
	CASE
		WHEN Sales > 50 THEN 'HIGH'
		WHEN Sales > 20 THEN 'MEDIUM'
		ELSE 'LOW'
	END CATEGORY
	FROM Sales.Orders 
)T
GROUP BY CATEGORY
ORDER BY SUM(Sales) desc


SELECT 
EmployeeID,
FirstName+ ' '+ COALESCE(LastName, '') [FULL_NAME],
CASE GENDER
	WHEN 'M' THEN 'Male'
	WHEN  'F' THEN 'Female'
	ELSE 'OTHERS'
END GENDER
FROM Sales.Employees

SELECT
CustomerID,
FirstName,
Country,
CASE COUNTRY
	WHEN 'GERMANY' THEN 'DE'
	WHEN 'USA' THEN 'US'
	ELSE 'N/A'
END COUNTRY_ABB
FROM Sales.Customers

SELECT 
CustomerID,
Score,
COALESCE(LastName, 'N/A'),
AVG(Score) OVER() AVG_SCORE,
AVG(CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END) OVER()
FROM Sales.Customers


SELECT
CustomerID,
SUM(CASE
	WHEN Sales > 30 THEN 1
	ELSE 0 
END) NO_OF_ORDERS,
COUNT(1)
FROM Sales.Orders
GROUP BY CustomerID
