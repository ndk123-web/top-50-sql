WITH x AS (
    SELECT 
        *,
        DENSE_RANK() OVER (
            PARTITION BY Employee.departmentId 
            ORDER BY Employee.salary DESC 
        ) as rnk 
    FROM
        Employee 
)

SELECT 
    d.name as Department,
    x.name as Employee,
    x.salary as Salary 
FROM x
JOIN Department as d 
ON x.departmentId = d.id 
WHERE x.rnk = 1 OR x.rnk = 2 OR x.rnk = 3;