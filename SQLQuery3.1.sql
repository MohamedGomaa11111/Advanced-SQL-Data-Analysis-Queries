select * 
from Production.Product 
where Color in('Black','Red','Silver') 

---------------------------------------
select * from Production.Product
where Name like 'B%' 
---------------------------------------
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3; 
SELECT *
FROM Production.ProductDescription
WHERE Description LIKE '%\_%' ESCAPE '\'; 
------------------------------------------
SELECT OrderDate, SUM(TotalDue)	AS TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '7/1/2001' AND '7/31/2014'
GROUP BY OrderDate; 
-----------------------------------------

select  Color , count(*) 
from Production.Product 
GROUP BY Color 

--------------


select OrderDate , sum(TotalDue)
from Sales.SalesOrderHeader 
group by OrderDate
having sum (TotalDue) >1000


------------------------
SELECT OrderDate, SUM(TotalDue)
FROM Sales.SalesOrderHeader 
WHERE OrderDate BETWEEN '2001-07-01' AND '2001-07-31'
GROUP BY OrderDate 
HAVING SUM(TotalDue) > 10000;  
------------------------------

select Color , AVG(ListPrice)
from Production.Product 
where Color   IS NOT NULL 
group by Color 
having AVG(ListPrice) > 500 
---------------------------------
select ProductID , SUM(OrderQty) 
from Sales.SalesOrderDetail 
 group by ProductID 
 having SUM(OrderQty) > 1000 
 ----------------------------

 SELECT 
    Color,
    Name,
    ListPrice,
    ROW_NUMBER() OVER (PARTITION BY Color ORDER BY ListPrice DESC) AS RowNum,
    RANK()       OVER (PARTITION BY Color ORDER BY ListPrice DESC) AS RankNum,
    DENSE_RANK() OVER (PARTITION BY Color ORDER BY ListPrice DESC) AS DenseRankNum
FROM Production.Product
WHERE Color IS NOT NULL;  

--------------------------

SELECT Color, Name, ListPrice
FROM (
    SELECT Color, Name, ListPrice,
           ROW_NUMBER() OVER (PARTITION BY Color ORDER BY ListPrice DESC) AS Rank
    FROM Production.Product
    WHERE Color IS NOT NULL
) AS SubQuery
WHERE Rank <= 2;
 







