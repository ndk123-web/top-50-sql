SELECT *
FROM (
    SELECT *
    FROM Cinema as c
    WHERE (c.id % 2) = 1  
) as t
WHERE t.description != "boring"
ORDER BY t.rating DESC;