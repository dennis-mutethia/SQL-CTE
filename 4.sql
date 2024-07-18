-- Update students status to either "below average" or "above average"

WITH all_students AS(
    SELECT * FROM students
),
all_departments AS(
    SELECT * FROM departments
)
-- Filter out only students with associated department
filtered_students(
    SELECT all_students.*
    FROM all_students
    INNER JOIN all_departments ON all_departments.department_id = students.department_id
)
-- Below CTE calculate the average marks
average_marks AS(
    SELECT AVG(marks) AS avg_marks
    FROM filtered_students
),
source AS(
    SELECT * 
    FROM filtered_students, average_marks
)
-- Use MERGE operation to update students table
MERGE INTO students AS target 
USING source ON target.student_id = source.student_id
WHEN MATCHED AND target.marks < source.avg_marks
    THEN UPDATE SET status = 'Below Average'
WHEN MATCHED AND target.marks > source.avg_marks
    THEN UPDATE SET status = 'Above Average'
WHEN MATCHED AND target.marks = source.avg_marks
    THEN UPDATE SET status = 'Average'
WHEN NOT MATCHED 
    THEN DELETE;