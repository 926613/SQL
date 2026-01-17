SELECT 
CustomerID,
COUNT(* ),
SUM(Sales),
AVG(Sales),
MAX(Sales),
MIN(Sales)
FROM Sales.Orders
GROUP BY CustomerID