SELECT r.contest_id, ROUND(
        CASE
            WHEN COUNT(r.user_id) = 0 THEN 0
            ELSE
                -- (current users / total users) * 100
                (COUNT(u.user_id) / (SELECT COUNT(*) FROM Users)) * 100 
        END
    ,2) as percentage

FROM Users as u
RIGHT JOIN Register as r
ON u.user_id = r.user_id

GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;