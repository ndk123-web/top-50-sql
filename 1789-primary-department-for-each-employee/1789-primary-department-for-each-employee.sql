WITH x AS (
    SELECT 
        *,
        COUNT(*) OVER (
            PARTITION BY Employee.employee_id 
        ) as cnt 
    FROM 
        Employee
)

SELECT x.employee_id, x.department_id
FROM x
WHERE (x.cnt = 1) OR (x.cnt > 1 AND x.primary_flag = 'Y');