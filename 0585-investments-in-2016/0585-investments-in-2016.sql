WITH x AS (
    SELECT 
        *,
        COUNT(*) OVER (
            PARTITION BY tiv_2015
        ) as cnt,
        COUNT(*) OVER (
            PARTITION BY lon, lat
        ) as loc_cnt
    FROM
        Insurance 
)

SELECT ROUND(SUM(x.tiv_2016), 2) as tiv_2016
FROM x
WHERE x.cnt > 1 AND x.loc_cnt = 1;