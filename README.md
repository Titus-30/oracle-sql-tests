This is an Employee Management System for managing employee records, projects, and departments.
1. Data Definition Language (DDL) Commands
DDL commands are used to define the structure of the database (i.e., create, alter, or drop tables).

CREATE TABLE Departments: Creates a table Departments with two columns: DepartmentID as the primary key and DepartmentName.
![image](https://github.com/user-attachments/assets/d1540a2e-b8d7-4ec5-843a-7f112d00679d)

CREATE TABLE Employees: Creates the Employees table with a foreign key DepartmentID referencing the Departments table. It defines the columns EmployeeID, FirstName, LastName, DepartmentID, and Salary.
![image](https://github.com/user-attachments/assets/c8f03904-872c-40e4-9577-19dd3cbd65c9)

CREATE TABLE Projects: Defines the Projects table with ProjectID, ProjectName, DepartmentID (foreign key), and StartDate.
![image](https://github.com/user-attachments/assets/e76507ab-8538-45bf-8130-06e4dfaf79dc)

CREATE TABLE EmployeeProjects: Establishes a many-to-many relationship between Employees and Projects. Each employee can work on multiple projects, and each project can involve multiple employees.
![image](https://github.com/user-attachments/assets/1a7d5f51-6886-4b67-b185-68d51c490c91)

2. Data Manipulation Language (DML) Commands
DML commands are used to insert, update, delete, and retrieve data from the database.

INSERT INTO Departments: Adds records into the Departments table.
![image](https://github.com/user-attachments/assets/e48c5251-9c64-44b5-9ce1-64eac020c264)

INSERT INTO Employees: Inserts employee records into the Employees table.
![image](https://github.com/user-attachments/assets/84e4ffa4-d220-4389-b55b-008e2e2093ee)

INSERT INTO Projects: Adds project records into the Projects table.
![image](https://github.com/user-attachments/assets/4ee166d9-ff54-4595-8c0e-c658c44af1a6)

INSERT INTO EmployeeProjects: Links employees with the projects they work on, along with the number of hours worked.
![image](https://github.com/user-attachments/assets/231a857f-5a18-4c28-b74c-2332a449b68b)

3. Updating and Deleting Data (DML)
These queries modify or remove data in the database.

UPDATE Employees: Updates the salary of an employee.
![image](https://github.com/user-attachments/assets/dd37816e-5aa5-4a6c-b548-455c2092e80e)

DELETE FROM Employees: Deletes an employee from the Employees table.
![image](https://github.com/user-attachments/assets/18b6a1cb-6840-4ade-8529-6050aed9ee05)

4. Performing Joins and Subqueries
These commands allow you to retrieve related data across multiple tables and make more advanced queries.
Join Query: Retrieves employee names and the projects they are working on by joining Employees, EmployeeProjects, and Projects.
Subquery: Finds employees whose salary is above the department average.
![image](https://github.com/user-attachments/assets/0c914c78-4add-45ad-923f-cc4d3904a228)
![image](https://github.com/user-attachments/assets/830cfd38-2cd1-4114-aa11-d6ec577d5bc8)
![image](https://github.com/user-attachments/assets/db7c3315-a1a8-4682-a15e-c1bcd817dc11)

6. Transaction Control Language (TCL)
TCL is used to control transactions, allowing you to commit or roll back changes.

BEGIN and COMMIT: Starts a transaction and commits the changes to the database.
![image](https://github.com/user-attachments/assets/5299b6b2-cbfc-44b3-b0d4-29faa4e50030)

ROLLBACK: Reverts changes made in a transaction.
![image](https://github.com/user-attachments/assets/731da9e6-8f76-4f55-af9b-6e31aa65a541)

6. Data Control Language (DCL)
DCL commands manage access permissions to the data.

GRANT: Grants permissions to a user.
![image](https://github.com/user-attachments/assets/6252fe7b-c5ec-4141-a6e2-242929db0b5a)

REVOKE: Revokes permissions from a user.
![image](https://github.com/user-attachments/assets/c258283e-1b79-4bca-90ae-7b1d54bcb6f6)

7. Additional Queries
These are more advanced queries that demonstrate subqueries and aggregation functions.

Find the employee with the highest salary:
![image](https://github.com/user-attachments/assets/3a82b837-9ba7-49bb-bc17-cc39ba692652)

Find employees who work more than 30 hours on any project:
![image](https://github.com/user-attachments/assets/ee225e77-91d8-48ec-937f-e99a42a51650)

Get the total hours worked by each employee:
![image](https://github.com/user-attachments/assets/f604f04c-2608-4b18-8820-8dcc118e0dbb)

Get the average salary by department:
![image](https://github.com/user-attachments/assets/58fb366c-7ee0-4cc4-a74f-5b7d25ce5396)

1. Conceptual Diagram
 I created the conceptual diagram using draw.io which contains the following entities:
Employees: Stores employee details.
Departments: Stores department details.
Projects: Stores project details.
EmployeeProjects: Stores the relationship between employees and the projects they work on.

Relationships:
Each Department can have many Employees.
Each Employee can work on multiple Projects (many-to-many relationship).
Each Project can involve multiple Employees (many-to-many relationship).
Bellow there is the screenshort od that canceptual diagram:
![image](https://github.com/user-attachments/assets/68adf211-69bf-4ac1-956d-c353ad276d9e)


