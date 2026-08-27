SELECT  
    *,
    (
        CASE
            WHEN (t.x + t.y <= t.z) OR (t.x + t.z <= t.y) OR (t.z + t.y <= t.x) THEN "No"
            ELSE "Yes"
        END
    ) as triangle 
FROM    
    Triangle as t;