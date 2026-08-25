WITH y AS (
        SELECT  
            *,
            SUM(weight) OVER (
                ORDER BY turn
            ) as prefix_sum
        FROM 
            Queue as x
    )

SELECT y.person_name 
FROM y 
WHERE y.prefix_sum <= 1000
ORDER BY y.turn DESC
LIMIT 1;