WITH CTE AS (
    SELECT 
        *,
        DENSE_RANK() OVER (
            ORDER BY Employee.salary
        ) as rnk 
    FROM 
        Employee
)

SELECT 
    (
        CASE
            WHEN COUNT(*) = 0 THEN NULL
            ELSE CTE.salary
        END
    ) as SecondHighestSalary
FROM CTE 
WHERE CTE.rnk = 2;