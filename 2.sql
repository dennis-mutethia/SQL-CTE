WITH all_students AS(
    SELECT * FROM students
),
--Below CTE calculate the average marks
average_marks AS(
    SELECT AVG(marks) AS avg_marks
    FROM all_students
),
source AS(
    SELECT * 
    FROM all_students, average_marks
)

MERGE INTO students AS target 
USING source ON target.student_id = source.student_id
WHEN MATCHED AND target.marks < source.avg_marks
    THEN UPDATE SET status = 'Below Average'
WHEN MATCHED AND target.marks > source.avg_marks
    THEN UPDATE SET status = 'Above Average'
WHEN MATCHED AND target.marks = source.avg_marks
    THEN UPDATE SET status = 'Average'