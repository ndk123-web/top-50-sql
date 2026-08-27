WITH x AS (
    SELECT
        visited_on,
        SUM(amount) as sum_amt,
        DENSE_RANK() OVER (
            ORDER BY visited_on
        ) as rnk
    FROM 
        Customer
    GROUP BY 
        visited_on
    ORDER BY 
        visited_on
) ,

    y AS (
        SELECT
            rnk,
            visited_on,
            SUM(sum_amt) OVER (
                ORDER BY visited_on 
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW  
            ) as amount,
            ROUND(SUM(sum_amt) OVER (
                ORDER BY visited_on
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW  
            ) / 7,2) as average_amount 
        FROM
            x
    )

SELECT 
    y.visited_on,
    y.amount,
    y.average_amount
FROM y
WHERE y.rnk >= 7