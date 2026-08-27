SELECT
    intermediate_table.student_id,
    intermediate_table.student_name,
    intermediate_table.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM (
    SELECT
        s.student_id,
        s.student_name,
        sub.subject_name
    FROM Students s
    CROSS JOIN Subjects sub
) AS intermediate_table
LEFT JOIN Examinations e
    ON intermediate_table.student_id = e.student_id
   AND intermediate_table.subject_name = e.subject_name
GROUP BY
    intermediate_table.student_id,
    intermediate_table.student_name,
    intermediate_table.subject_name
ORDER BY 
    intermediate_table.student_id, intermediate_table.subject_name;