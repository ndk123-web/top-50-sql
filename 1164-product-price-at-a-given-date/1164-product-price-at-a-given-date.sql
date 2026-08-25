WITH BeforeDate AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY product_id 
            ORDER BY change_date DESC
        ) as rnk 
    FROM 
        Products
    WHERE change_date <= '2019-08-16'
),
    UniqueProducts AS (
    SELECT
        DISTINCT product_id 
    FROM 
        Products 
)

SELECT 
    UniqueProducts.product_id,
    (
        CASE 
            WHEN BeforeDate.product_id IS NULL THEN 10
            ELSE BeforeDate.new_price 
        END 
    ) as price 
FROM 
    BeforeDate
RIGHT JOIN 
    UniqueProducts 
ON
    BeforeDate.product_id = UniqueProducts.product_id 
WHERE 
    BeforeDate.rnk = 1 OR BeforeDate.rnk IS NULL;