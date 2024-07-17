--Fetch students who have scored more than average marks of all students

WITH all_students AS(
    SELECT * FROM students
),
--Below CTE calculate the average marks
average_marks AS(
    SELECT AVG(marks) AS avg_marks
    FROM all_students
)

SELECT * 
FROM all_students, average_marks
WHERE marks > avg_marks