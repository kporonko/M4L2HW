-- Own queries
use [AdventureWorks2019]
-- Shows full name of all persons
SELECT Concat(FirstName + ' ', LastName+ ' ', MiddleName) as Fullname FROM Person.Person

-- Shows how many people have the same last name (for every lastname)
SELECT LastName, COUNT(LastName) as LastNameCount FROM Person.Person GROUP BY LastName

-- Counts how many people have the same last name (for every lastname) and shows lastnames with frequency > 100
SELECT LastName, COUNT(LastName) as LastNameCount FROM Person.Person GROUP BY LastName HAVING COUNT(LastName) > 100

SELECT * FROM Person.Person INNER JOIN Person.PersonPhone ON Person.BusinessEntityID = PersonPhone.BusinessEntityID
SELECT * FROM Person.Person LEFT JOIN Person.PersonPhone ON Person.BusinessEntityID = PersonPhone.BusinessEntityID
SELECT * FROM Person.Person RIGHT JOIN Person.PersonPhone ON Person.BusinessEntityID = PersonPhone.BusinessEntityID
SELECT * FROM Person.Person FULL JOIN Person.PersonPhone ON Person.BusinessEntityID = PersonPhone.BusinessEntityID

SELECT * FROM Person.Person WHERE FirstName LIKE '%asa%'

SELECT * FROM Person.Person WHERE EmailPromotion BETWEEN 2 AND 3 ORDER BY FirstName DESC, LastName DESC

UPDATE Person.Person SET EmailPromotion = 0

UPDATE Person.Person SET EmailPromotion = 0  WHERE PersonType = 'IN' AND FirstName LIKE '%asa%' 

DELETE FROM Person.Person

DELETE FROM Person.Person WHERE PersonType = 'IN' AND FirstName LIKE '%asa%' 

BEGIN TRANSACTION
BEGIN TRY
	SELECT * FROM Person.EmailAddress WHERE EmailAddress.EmailAddress LIKE '%igail3%'
	DELETE TOP(3) FROM Person.EmailAddress WHERE EmailAddress LIKE '%igail3%'
END TRY
BEGIN CATCH
	BEGIN
		ROLLBACK TRANSACTION
	END
	SELECT * FROM Person.EmailAddress WHERE EmailAddress.EmailAddress LIKE '%igail3%'
END CATCH
COMMIT TRANSACTION 

BEGIN TRANSACTION
BEGIN TRY
	DECLARE @CNT INT 
	SELECT @CNT = COUNT(Person.EmailAddress.EmailAddressID) FROM Person.EmailAddress WHERE EmailAddress.EmailAddress LIKE '%igail4%'

	DELETE FROM Person.EmailAddress WHERE EmailAddress LIKE '%igail4%'
	SELECT * FROM Person.EmailAddress WHERE EmailAddress.EmailAddress LIKE '%igail4%'

	IF @CNT > 3
	BEGIN
		ROLLBACK TRANSACTION
	END
END TRY
BEGIN CATCH
	SELECT * FROM Person.EmailAddress WHERE EmailAddress.EmailAddress LIKE '%igail4%'
END CATCH
COMMIT TRANSACTION
