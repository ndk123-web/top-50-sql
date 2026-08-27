SELECT DISTINCT x.num as ConsecutiveNums 
FROM  (
    SELECT 
        *,
        LAG(Logs.num, 1, 0) OVER (
            ORDER BY Logs.id
        ) as prev_num,
        LEAD(Logs.num, 1, 0) OVER (
            ORDER BY Logs.id
        ) as next_num
    FROM 
        Logs 
) as x
WHERE x.prev_num = x.num AND x.next_num = x.num;