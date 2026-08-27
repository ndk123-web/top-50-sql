# Write your MySQL query statement below
SELECT t.teacher_id, COUNT(DISTINCT t.subject_id) as cnt
FROM Teacher as t
GROUP BY t.teacher_id;