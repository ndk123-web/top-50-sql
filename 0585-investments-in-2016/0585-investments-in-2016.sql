WITH x AS (
    SELECT 
        *,
        COUNT(*) OVER (
            PARTITION BY tiv_2015
        ) as cnt 
    FROM
        Insurance 
),

    y AS (
        SELECT 
            *,
            COUNT(*) OVER (
                PARTITION BY lon, lat
            ) as loc_cnt
        FROM
            Insurance
    ),

    z AS (
        SELECT *
        FROM y
        WHERE y.loc_cnt = 1 
    ),

    u AS (
        SELECT *
        FROM x
        WHERE x.cnt > 1
    )

SELECT ROUND(SUM(u.tiv_2016), 2) as tiv_2016
FROM z
JOIN u
ON z.pid = u.pid;