/*
  File: EC_IT143_W3.4_TM.sql
  Author: Thandile Mayekiso
  Course: IT 143
  Assignment: W3.4 Adventure Works—Create Answers
  Description: SQL script answering 8 AdventureWorks questions
  Estimated Runtime: < 5 minutes
  Notes: Each question is listed with author attribution and answered with SQL queries.
*/

------------------------------------------------------------
-- Q1 (Marginal Complexity)
-- Author: Wilfrid N’DAMBI MBOUILOU
-- Question: What is the list price of the cheapest product in the Product table?
------------------------------------------------------------
SELECT TOP 1 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice ASC;

------------------------------------------------------------
-- Q2 (Marginal Complexity)
-- Author: Peter Baffour Gyou
-- Question: Which three employees in the HumanResources.Employee table 
--           have the highest vacation hours?
------------------------------------------------------------
SELECT TOP 3 BusinessEntityID, JobTitle, VacationHours
FROM HumanResources.Employee
ORDER BY VacationHours DESC;

------------------------------------------------------------
-- Q3 (Moderate Complexity)
-- Author: Ygor Sardinha
-- Question: What is the average order quantity per product category in 2022?
------------------------------------------------------------
SELECT pc.Name AS CategoryName,
       AVG(sod.OrderQty) AS AvgOrderQty
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE YEAR(soh.OrderDate) = 2022
GROUP BY pc.Name
ORDER BY AvgOrderQty DESC;

------------------------------------------------------------
-- Q4 (Moderate Complexity)
-- Author: Peter Baffour Gyou
-- Question: Which sales territories have the highest average order total 
--           for the past two years? Combine data from Sales.SalesOrderHeader 
--           and Sales.SalesTerritory.
------------------------------------------------------------
SELECT st.Name AS TerritoryName,
       AVG(soh.TotalDue) AS AvgOrderTotal
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
WHERE YEAR(soh.OrderDate) >= YEAR(GETDATE()) - 2
GROUP BY st.Name
ORDER BY AvgOrderTotal DESC;

------------------------------------------------------------
-- Q5 (Increased Complexity)
-- Author: Gregory Rowe
-- Question: Create a quarterly sales performance analysis for each sales territory, 
--           comparing current year sales to the previous year, and identify products 
--           that contributed most to the change.
------------------------------------------------------------
WITH SalesByQuarter AS (
    SELECT st.Name AS TerritoryName,
           DATENAME(QUARTER, soh.OrderDate) AS QuarterNum,
           YEAR(soh.OrderDate) AS SalesYear,
           p.Name AS ProductName,
           SUM(sod.LineTotal) AS TotalSales
    FROM Sales.SalesOrderHeader soh
    JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
    JOIN Production.Product p ON sod.ProductID = p.ProductID
    JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
    GROUP BY st.Name, YEAR(soh.OrderDate), DATENAME(QUARTER, soh.OrderDate), p.Name
)
SELECT TerritoryName, QuarterNum, SalesYear, ProductName, TotalSales
FROM SalesByQuarter
ORDER BY TerritoryName, SalesYear DESC, QuarterNum;

------------------------------------------------------------
-- Q6 (Increased Complexity)
-- Author: Ygor Sardinha
-- Question: During last quarter, which products had the highest returns? 
--           Include total returned quantity and sales amount lost by product.
------------------------------------------------------------
SELECT p.Name AS ProductName,
       SUM(sod.OrderQty) AS ReturnedQty,
       SUM(sod.LineTotal) AS SalesLost
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE soh.OnlineOrderFlag = 0 -- Assuming returns are flagged separately
  AND soh.Status = 6          -- Status 6 = Cancelled/Returned
  AND soh.OrderDate BETWEEN DATEADD(QUARTER, -1, GETDATE()) AND GETDATE()
GROUP BY p.Name
ORDER BY ReturnedQty DESC;

------------------------------------------------------------
-- Q7 (Metadata)
-- Author: Abiodun Oloruntimilehin
-- Question: What is the data type of the ListPrice column in Production.Product?
------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product'
  AND COLUMN_NAME = 'ListPrice';

------------------------------------------------------------
-- Q8 (Metadata)
-- Author: Peter Baffour Gyou
-- Question: List all the columns in the Person.Person table 
--           along with their data types and whether they allow NULLs.
------------------------------------------------------------
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person';
