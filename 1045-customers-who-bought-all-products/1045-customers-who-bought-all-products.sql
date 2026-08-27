SELECT c.customer_id 
FROM Customer as c
INNER JOIN Product as p
ON c.product_key = p.product_key 
GROUP BY c.customer_id 
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) from Product);