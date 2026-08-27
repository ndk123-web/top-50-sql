SELECT x.product_id, x.year as first_year, x.quantity, x.price 
FROM (
    SELECT *,
    RANK() OVER (
        PARTITION BY Sales.product_id
        ORDER BY Sales.year 
    ) as rnk 
    FROM Sales
) as x 
WHERE rnk = 1;