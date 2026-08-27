SELECT p.project_id, ROUND(
    
            SUM(e.experience_years) / COUNT(*)
    
,2) as average_years

FROM Project as p
LEFT JOIN Employee as e
ON p.employee_id = e.employee_id

GROUP BY p.project_id;