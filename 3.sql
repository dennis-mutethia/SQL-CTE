WITH source AS(
    SELECT * FROM falculties
)
--Merge Operation
MERGE INTO departments AS target 
USING source ON target.department_id = source.department_id
WHEN MATCHED AND target.name <> source.name
    THEN UPDATE SET name = source.name
WHEN NOT MATCHED
    THEN INSERT(department_id, name) 
    VALUES(source.department_id, source.name)