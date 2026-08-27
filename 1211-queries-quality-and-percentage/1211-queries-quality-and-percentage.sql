SELECT q.query_name, ROUND(
        SUM(q.rating / q.position) / COUNT(*)
    ,2) as quality, 
    
    ROUND(
        ((SELECT COUNT(*) FROM Queries WHERE q.query_name = Queries.query_name AND Queries.rating < 3) / COUNT(*)) * 100
    ,2) as poor_query_percentage

FROM Queries as q
GROUP BY q.query_name;