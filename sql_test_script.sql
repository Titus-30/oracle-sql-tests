Microsoft Windows [Version 10.0.22631.4169]
(c) Microsoft Corporation. All rights reserved.

C:\Users\PC>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on Mon Sep 30 14:22:48 2024

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - Production

SQL> -- Create Departments table
SQL> CREATE TABLE Departments (
  2      DepartmentID INT PRIMARY KEY,
  3      DepartmentName VARCHAR(100)
  4  );

Table created.

SQL> -- Create Employees table
SQL> CREATE TABLE Employees (
  2      EmployeeID INT PRIMARY KEY,
  3      FirstName VARCHAR(50),
  4      LastName VARCHAR(50),
  5      DepartmentID INT,
  6      Salary DECIMAL(10, 2),
  7      FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  8  );

Table created.

SQL> -- Create Projects table
SQL> CREATE TABLE Projects (
  2      ProjectID INT PRIMARY KEY,
  3      ProjectName VARCHAR(100),
  4      DepartmentID INT,
  5      StartDate DATE,
  6      FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  7  );

Table created.

SQL> -- Create EmployeeProjects table (many-to-many relationship)
SQL> CREATE TABLE EmployeeProjects (
  2      EmployeeID INT,
  3      ProjectID INT,
  4      HoursWorked DECIMAL(5, 2),
  5      PRIMARY KEY (EmployeeID, ProjectID),
  6      FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
  7      FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
  8  );

Table created.

SQL> Inserting data(DML)
SP2-0734: unknown command beginning "Inserting ..." - rest of line ignored.
SQL> --- Inserting data(DML)
SQL> INSERT INTO Departments (DepartmentID, DepartmentName)
  2  VALUES (101, 'Human Resources');

1 row created.

SQL> INSERT INTO Departments (DepartmentID, DepartmentName)
  2  VALUES (102, 'Development');

1 row created.

SQL> INSERT INTO Departments (DepartmentID, DepartmentName)
  2  VALUES (103, 'Finance');

1 row created.

SQL> INSERT INTO Departments (DepartmentID, DepartmentName)
  2
SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
  2  VALUES (1, 'John', 'Doe', 102, 50000.00);

1 row created.

SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
  2  VALUES (2, 'Jane', 'Smith', 101, 60000.00);

1 row created.

SQL> INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
  2  VALUES (3, 'Bob', 'Johnson', 103, 55000.00);

1 row created.

SQL> INSERT INTO Projects (ProjectID, ProjectName, DepartmentID, StartDate)
  2  VALUES (1001, 'Website Revamp', 102, '2023-01-01');
VALUES (1001, 'Website Revamp', 102, '2023-01-01')
                                     *
ERROR at line 2:
ORA-01861: literal does not match format string


SQL> INSERT INTO Projects (ProjectID, ProjectName, DepartmentID, StartDate)
  2  VALUES (1001, 'Website Revamp', 102, TO_DATE('2023-01-01', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO Projects (ProjectID, ProjectName, DepartmentID, StartDate)
  2  VALUES (1002, 'Employee Benefits Update', 101, TO_DATE('2023-02-01', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO Projects (ProjectID, ProjectName, DepartmentID, StartDate)
  2  VALUES (1003, 'Budget Review', 103, TO_DATE('2023-03-01', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
  2  VALUES (1, 1001, 35.5);

1 row created.

SQL> INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
  2  VALUES (2, 1002, 20.0);

1 row created.

SQL> INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
  2  VALUES (3, 1003, 15.5);

1 row created.

SQL> INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
  2  VALUES (1, 1003, 10.0);

1 row created.

SQL> ---Updating and deleting data(DML)
SQL> -- Update employee salary
SQL> UPDATE Employees
  2  SET Salary = 70000.00
  3  WHERE EmployeeID = 1;

1 row updated.

SQL> SELECT * FROM EmployeeProjects WHERE EmployeeID = 2;

EMPLOYEEID  PROJECTID HOURSWORKED
---------- ---------- -----------
         2       1002          20

SQL> DELETE FROM EmployeeProjects WHERE EmployeeID = 2;

1 row deleted.

SQL> DELETE FROM Employees WHERE EmployeeID = 2;

1 row deleted.

SQL> ---Performing joins and subqueries
SQL> -- Join query to get employee names and the projects they are working on
SQL> SELECT Employees.FirstName, Employees.LastName, Projects.ProjectName, EmployeeProjects.HoursWorked
  2  FROM Employees
  3  JOIN EmployeeProjects ON Employees.EmployeeID = EmployeeProjects.EmployeeID
  4  JOIN Projects ON EmployeeProjects.ProjectID = Projects.ProjectID;

FIRSTNAME
--------------------------------------------------
LASTNAME
--------------------------------------------------
PROJECTNAME
--------------------------------------------------------------------------------
HOURSWORKED
-----------
John
Doe
Website Revamp
       35.5


FIRSTNAME
--------------------------------------------------
LASTNAME
--------------------------------------------------
PROJECTNAME
--------------------------------------------------------------------------------
HOURSWORKED
-----------
Bob
Johnson
Budget Review
       15.5


FIRSTNAME
--------------------------------------------------
LASTNAME
--------------------------------------------------
PROJECTNAME
--------------------------------------------------------------------------------
HOURSWORKED
-----------
John
Doe
Budget Review
         10


SQL> -- Subquery to find employees with salaries above the department average
SQL> SELECT * FROM Employees
  2  WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = Employees.DepartmentID);

EMPLOYEEID FIRSTNAME
---------- --------------------------------------------------
LASTNAME                                           DEPARTMENTID     SALARY
-------------------------------------------------- ------------ ----------
         1 John
Doe                                                         102      70000


SQL> ---Additional queries
SQL> -- Find the employee with the highest salary
SQL> SELECT * FROM Employees
  2  WHERE Salary = (SELECT MAX(Salary) FROM Employees);

EMPLOYEEID FIRSTNAME
---------- --------------------------------------------------
LASTNAME                                           DEPARTMENTID     SALARY
-------------------------------------------------- ------------ ----------
         1 John
Doe                                                         102      70000


SQL> -- Find employees who work more than 30 hours on any project
SQL> SELECT Employees.FirstName, Employees.LastName
  2  FROM Employees
  3  WHERE EmployeeID IN (SELECT EmployeeID FROM EmployeeProjects WHERE HoursWorked > 30);

FIRSTNAME
--------------------------------------------------
LASTNAME
--------------------------------------------------
John
Doe


SQL> --Agregation and grouping
SQL> -- Get the total hours worked by each employee
SQL> SELECT EmployeeID, SUM(HoursWorked) AS TotalHoursWorked
  2  FROM EmployeeProjects
  3  GROUP BY EmployeeID;

EMPLOYEEID TOTALHOURSWORKED
---------- ----------------
         1             45.5
         3             15.5

SQL> -- Get the average salary by department
SQL> SELECT DepartmentID, AVG(Salary) AS AvgSalary
  2  FROM Employees
  3  GROUP BY DepartmentID;

DEPARTMENTID  AVGSALARY
------------ ----------
         102      70000
         103      55000
