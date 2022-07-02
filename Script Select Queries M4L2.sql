----------------------������� �1-----------------------------
--������� ��� ���������� �� ������� Sales.Customer 
-------------------------------------------------------------
use [AdventureWorks2019]
SELECT * FROM Sales.Customer 
GO

----------------------������� �2-----------------------------
--������� ��� ���������� �� ������� Sales.Store ��������������� 
--�� Name � ���������� �������
-------------------------------------------------------------
SELECT * FROM Sales.Store ORDER BY Name
GO

----------------------������� �3-----------------------------
--������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28
-------------------------------------------------------------
SELECT TOP 10 * FROM HumanResources.Employee WHERE BirthDate > '1989-09-28'
GO

----------------------������� �4-----------------------------
--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������
-------------------------------------------------------------
SELECT NationalIDNumber, LoginID, JobTitle FROM HumanResources.Employee WHERE LoginID LIKE '%0'
GO

----------------------������� �5-----------------------------
--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� �������� 
-------------------------------------------------------------
SELECT * FROM Person.Person WHERE YEAR(ModifiedDate) = 2008 AND MiddleName IS NOT NULL AND Title IS NULL
GO

----------------------������� �6-----------------------------
--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT HumanResources.Department.Name FROM HumanResources.EmployeeDepartmentHistory INNER JOIN HumanResources.Department 
ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GO

----------------------������� �7-----------------------------
--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
-------------------------------------------------------------
SELECT TerritoryID, SUM(CommissionPct) FROM Sales.SalesPerson GROUP BY TerritoryID HAVING SUM(CommissionPct) > 0
GO

----------------------������� �8-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee WHERE HumanResources.Employee.VacationHours IN 
	(SELECT MAX(HumanResources.Employee.VacationHours) FROM HumanResources.Employee)
GO

----------------------������� �9-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
-------------------------------------------------------------
--1
SELECT * FROM HumanResources.Employee WHERE JobTitle IN ('Sales Representative','Network Administrator','Network Manager');
--2
SELECT * FROM HumanResources.Employee WHERE JobTitle = 'Sales Representative' OR JobTitle = 'Network Administrator'OR JobTitle = 'Network Manager';

GO

----------------------������� �10-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee LEFT JOIN Purchasing.PurchaseOrderHeader ON HumanResources.Employee.BusinessEntityID = PurchaseOrderHeader.EmployeeID

GO
