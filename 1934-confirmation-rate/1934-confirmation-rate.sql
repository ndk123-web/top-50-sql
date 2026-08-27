SELECT s.user_id, ROUND(
    CASE
        WHEN COUNT(c.user_id) = 0 THEN 0
        ELSE 
            SUM(
                CASE
                    WHEN c.action = "confirmed" THEN 1
                    ELSE 0 
                END
            ) / COUNT(c.user_id) 
    END
, 2) as confirmation_rate

FROM Signups as s
LEFT JOIN Confirmations as c
ON s.user_id = c.user_id
GROUP BY s.user_id;