# Mastering SQL Common Table Expressions (CTE)
### What is a CTE?
- A CTE (Common Table Expression) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
### Benefits of Using CTEs:
- Simplifies complex queries
- Improves readability and maintainability
- Facilitates recursive queries
- Minimized I/O operations
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
Example Basic CTE
```
WITH EmployeeCTE AS (
    SELECT EmployeeID, FirstName, LastName, ManagerID
    FROM Employees
)
SELECT *
FROM EmployeeCTE;
```
### Using CTE with MERGE 
- The MERGE statement allows you to perform INSERT, UPDATE, and DELETE operations in a single statement.
- Commonly used for synchronizing two tables.
### MERGE Syntax 
```
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
3. Before departments, the school had falculties; Update departments table with respective names from falculties table. Insert new department if department_id does not exist.
4. Fetch all departments whose average marks is more than average marks of all departments
5. Update CTE in 2 above to Delete any student whose associated department_id does not exist
