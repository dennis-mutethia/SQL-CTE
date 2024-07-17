# Mastering SQL Common Table Expressions (CTE)
## What is a CTE?
- A CTE (Common Table Expression) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
## Benefits of Using CTEs:
- Simplifies complex queries
- Improves readability and maintainability
- Facilitates recursive queries
- Minimized I/O operations
## CTE Syntax
General Syntax
```
WITH cte_name (column1, column2, ...) AS (
    -- CTE Query
    SELECT ...
)
-- Main Query
SELECT ...
FROM cte_name
```
Example CTE
```
WITH EmployeeCTE AS (
    SELECT EmployeeID, FirstName, LastName, ManagerID
    FROM Employees
)
SELECT *
FROM EmployeeCTE;
```
### Practice/Demo
1. Fetch students who have scored more than average marks of all students
2. Update students status to either "below average" or "above average"
3. Before departments, the school had falculties; Update departments table with respective names from falculties table. Insert new department if department_id does not exist.
4. Fetch all departments whose average marks is more than average marks of all departments


