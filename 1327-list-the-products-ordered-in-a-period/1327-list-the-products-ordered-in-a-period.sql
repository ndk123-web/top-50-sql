WITH OrdersFeb AS (
    SELECT *
    FROM Orders
    WHERE Orders.order_date >= '2020-02-01' AND Orders.order_date <= '2020-02-29'
)

SELECT 
    p.product_name,
    SUM(o.unit) as unit 
FROM Products as p
JOIN OrdersFeb as o
ON p.product_id = o.product_id 
GROUP BY o.product_id 
HAVING unit >= 100;