--1
SELECT COUNT(*) AS TotalPersonas
FROM Person.Person ;

--2

SELECT 
COUNT (*) AS Empleado
FROM Person.Person
WHERE PersonType = 'EM' AND LastName < 'D';

-- 3
SELECT 
AVG(StandardCost) AS Promedio
FROM Production.Product
WHERE StandardCost > 0;

--4
SELECT 
PersonType ,
COUNT(*) AS Empleados
FROM Person.Person 
GROUP BY PersonType 

--5
SELECT 
Color,
COUNT(*) AS ProductoColor
FROM Production.Product
Where color in ('Red','Black')
GROUP BY Color 

--6
SELECT TerritoryID ,
SUM(TotalDue) AS TotalVentas
FROM Sales.SalesOrderHeader 
GROUP BY  TerritoryID 
HAVING SUM(TotalDue) > 10000000

--7
SELECT st.Name AS Territorio,
SUM(soh.TotalDue) AS TotalVentas
FROM Sales.SalesOrderHeader soh 
JOIN Sales.SalesTerritory st 
ON soh.TerritoryID = st.TerritoryID
GROUP BY  st.Name
HAVING SUM(soh.TotalDue) > 10000000

--8
SELECT COUNT(*) AS ConSegundoNombre
FROM Person.Person
WHERE MiddleName IS NOT NULL;

--9
SELECT 
Color,
COUNT(*) AS ProductoColor
FROM Production.Product  
WHERE Color IS NOT NULL
GROUP BY Color 
HAVING COUNT(*) >= 20

--10
SELECT 
  SUM(pi.Quantity * p.ListPrice) AS TotalFacturado
FROM Production.Product p
INNER JOIN Production.ProductInventory pi
  ON p.ProductID = pi.ProductID
WHERE p.ListPrice > 0;

--11
SELECT 
  pr.FirstName,
  pr.LastName,
  CASE
    WHEN EmailPromotion = 1 THEN 'Promo1'
    WHEN EmailPromotion = 0 THEN 'Promo2'
    WHEN EmailPromotion = 2 THEN 'Promo3'
    ELSE 'Otros'
  END AS TipoPromocion
FROM Person.Person pr

--12
SELECT soh.SalesYTD  AS Ventas,
soh.BusinessEntityID AS Identidad,
soh.TerritoryID
FROM Sales.SalesPerson soh 
LEFT JOIN Sales.SalesTerritory st 
ON soh.TerritoryID = st.TerritoryID

--13
SELECT 
  soh.SalesYTD AS Ventas,
  soh.BusinessEntityID AS Identidad,
  soh.TerritoryID,
  p.FirstName,
  p.LastName,
  st.Name AS NombreTerritorio
FROM Sales.SalesPerson soh
LEFT JOIN Sales.SalesTerritory st 
  ON soh.TerritoryID = st.TerritoryID
LEFT JOIN Person.Person p 
  ON soh.BusinessEntityID = p.BusinessEntityID
WHERE st.Name IN ('Northeast', 'Central');

--14
SELECT p.FirstName,
p.LastName,
pp.PasswordHash
From person.person p
JOIN person.password pp
ON p.BusinessEntityID = pp.BusinessEntityID

--15
select	
CASE 
	WHEN p.Title IS NOT NULL THEN p.title
	ELSE 'No hay título'
END AS 'Titulo'
From person.Person p 

--16
select	
CASE 
	WHEN p.middlename IS NULL THEN p.FirstName + ' ' + p.LastName 
	ELSE p.FirstName + ' ' + p.MiddleName + ' ' + p.LastName 
END AS 'NombreCompleto'
From person.Person p 

--17
select	
CASE 
	WHEN p.MakeFlag = p.FinishedGoodsFlag THEN NULL 
	ELSE CONCAT(p.MakeFlag, p.FinishedGoodsFlag)
END AS 'Flag'
From production.Product p 

--18
SELECT 
  ProductID,
  Name,
  COALESCE(Color, 'Sin color') AS ColorFinal
FROM Production.Product;
SELECT 
  ProductID,
  Name,
  ISNULL(Color, 'Sin color') AS ColorFinal
FROM Production.Product pp;

--19 Como yo pensé

SELECT p.FirstName,
p.LastName
FROM HumanResources.Employee e
JOIN person.Person p 
ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.MaritalStatus = 'S'

--19 Tabla
SELECT p.FirstName, p.LastName
FROM (
    SELECT BusinessEntityID
    FROM HumanResources.Employee
    WHERE MaritalStatus = 'S'
) AS solteros
JOIN Person.Person p 
  ON p.BusinessEntityID = solteros.BusinessEntityID;

--19 Lista
SELECT p.FirstName, p.LastName
FROM Person.Person p
WHERE p.BusinessEntityID IN (
    SELECT BusinessEntityID
    FROM HumanResources.Employee
    WHERE MaritalStatus = 'S');

--19 CTE
WITH EmpleadosSolteros AS (
    SELECT BusinessEntityID
    FROM HumanResources.Employee
    WHERE MaritalStatus = 'S'
)
SELECT p.FirstName, p.LastName
FROM EmpleadosSolteros es
JOIN Person.Person p 
  ON p.BusinessEntityID = es.BusinessEntityID;

--20
--persontype = EM
--humanresources.employee birthdate < 1995-06-04

SELECT p.FirstName, p.LastName, p.PersonType
FROM Person.Person p
WHERE p.BusinessEntityID IN (
    SELECT BusinessEntityID
    FROM HumanResources.Employee e
    WHERE BirthDate < '1995-06-04');
