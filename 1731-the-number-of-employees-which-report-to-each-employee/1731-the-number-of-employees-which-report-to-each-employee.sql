SELECT 
    e1.employee_id, e1.name, 
    COUNT(*) as reports_count, 
    ROUND(AVG(e2.age)) as average_age
FROM 
    Employees as e1
INNER JOIN 
    Employees as e2 
ON
    e1.employee_id = e2.reports_to
GROUP BY 
    e1.employee_id 
ORDER BY 
    e1.employee_id;