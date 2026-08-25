WITH x AS (
    SELECT 
        *,
        (
            CASE
                WHEN a.income < 20000 THEN "Low Salary"
                WHEN a.income > 50000 THEN "High Salary"
                ELSE "Average Salary" 
            END
        ) as category 
    FROM 
        Accounts as a 
),
    u AS (
        SELECT 'Low Salary' AS category
        UNION ALL
        SELECT 'Average Salary' AS category
        UNION ALL
        SELECT 'High Salary' AS category
    )

SELECT 
    u.category,
    (
        CASE
            WHEN x.category IS NULL THEN 0
            ELSE COUNT(*)
        END
    ) as accounts_count 
FROM u
LEFT JOIN x
ON x.category = u.category
GROUP BY u.category;