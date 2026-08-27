SELECT x.employee_id 
FROM (
    SELECT *
    FROM Employees AS e
    WHERE e.salary < 30000
) AS x
WHERE x.manager_id NOT IN (
    SELECT Employees.employee_id
    FROM Employees
)
ORDER BY x.employee_id;