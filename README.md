# Mastering SQL Common Table Expressions (CTE)
### What is a CTE?
- A CTE (Common Table Expression) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
### Benefits of Using CTEs:
- Simplifies complex queries - Improves readability and maintainability
- Facilitates recursive queries - Performing the same calculation multiple times over across multiple query components
- Minimized I/O operations - Needing to reference a derived table multiple times in a single query
- Less database footprint - An alternative to creating views or temporary tables in the database
#### Applications - Relational Databases
- PostGres
- Redshift
- Oracle
- MySQL
- SQL Server
- Databricks SQL Warehouse/DataLake
### CTE Syntax
```
WITH cte_name (column1, column2, ...) AS (
    -- CTE Query
    SELECT ...
)
-- Main Query
SELECT ...
FROM cte_name
```
#### Example Basic CTE
```
WITH EmployeeCTE AS (
    SELECT EmployeeID, FirstName, LastName, ManagerID, DepartmentID
    FROM Employees
)
SELECT *
FROM EmployeeCTE;
```
#### Example Advanced CTE
```
WITH EmployeeCTE AS (
    SELECT EmployeeID, FirstName, LastName, ManagerID
    FROM Employees
),
DepartmentCTE AS(
    SELECT DepartmentID, DepartmentName
    FROM Departments
    WHERE DepartmentName IS NOT NULL OR DepartmentName <> ''
),
EmployeeAndManagersCTE AS(
    SELECT e.*, m.FirstName AS ManagerFirstName, m.LastName AS ManagerLastName
    FROM EmployeeCTE e
    INNER JOIN EmployeeCTE m ON m.EmployeeID = e.ManagerID
)

SELECT *
FROM EmployeeAndManagersCTE em
JOIN DepartmentCTE d ON d.DepartmentID = em.DepartmentID;
```
### Using CTE with MERGE 
- The MERGE statement allows you to perform INSERT, UPDATE, and DELETE operations in a single statement.
- Commonly used for synchronizing two tables.
### MERGE Syntax 
All your CTEs should be defined before the MERGE operation
```
/* Define all your CTEs here; Before the MERGE operation */

MERGE INTO target_table AS target
USING source_table AS source
ON target.id = source.id
WHEN MATCHED THEN
    UPDATE SET target.col1 = source.col1
WHEN NOT MATCHED THEN
    INSERT (col1, col2) VALUES (source.col1, source.col2)
    -- You can also use DELETE or DO NOTHING
```

### Practice/Demo
1. Fetch students who have scored more than average marks of all students
2. Update students status to either "below average" or "above average"
3. Update departments table with respective names from falculties table. Insert new department if department_id does not exist.
4. Update CTE in 2 above to ALSO Delete any student whose associated department_id does not exist
5. Fetch all departments whose average marks is more than average marks of all departments
