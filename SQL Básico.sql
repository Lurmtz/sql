--1
SELECT *
FROM Person.Person ;

--2
SELECT *
FROM Person.Address ;

--3
SELECT 
FROM HumanResources.Employee ;

-- 4
SELECT 
	FirstName,
	MiddleName,
	LastName
FROM Person.Person ;

--5
SELECT DISTINCT 
	City
FROM Person.Address; 

--6
SELECT TOP 10 *
FROM Person.Address;

--7
SELECT TOP 100 *
FROM Production.Product
WHERE ListPrice  != '0';

--8
SELECT 
	FirstName AS PrimerNombre,
	MiddleName AS SegundoNombre,
	LastName AS Apellido
FROM Person.Person ;

--9
SELECT *
FROM Production.Product 
WHERE Color = 'Black'
AND ProductNumber LIKE 'BK%'

--10
SELECT *
FROM Production.Product 
WHERE Color = 'Black'
AND ProductNumber LIKE 'BK%'
AND ListPrice > 500
AND [Size] between 40 AND 58

--11
SELECT 
 CASE 
		when PersonType = 'EM' Then 'SI'
		when PersonType = 'SP' Then 'NO'
	END AS 'IsEmployee'
FROM Person.Person ;

--12
SELECT *,
 CASE 
	WHEN MiddleName IS NULL Then FirstName + LastName
	END AS FullNameWithoutMiddle
FROM Person.Person ;  

--1.1
SELECT *
FROM HumanResources.Employee
WHERE (OrganizationLevel = 1 OR OrganizationLevel = 2) AND HireDate > '2009-01-01'

--1.2
SELECT *
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Marketing%'

--1.3
SELECT StateProvinceID, Name
FROM Person.StateProvince
WHERE LEN(StateProvinceCode) = 3

--1.4
SELECT CardNumber, ExpMonth 
FROM Sales.CreditCard 
WHERE ExpMonth < 7

--1.5
SELECT Name 
FROM HumanResources.Department

--1.6
SELECT *,
CASE
	WHEN AddressLine2 IS NOT NULL AND (City = 'Portland' OR City = 'Seattle') THEN LEFT(AddressLine1, CHARINDEX(' ', AddressLine1 + ' ') - 1)
END AS 'NumberAddress'
FROM Person.Address 



