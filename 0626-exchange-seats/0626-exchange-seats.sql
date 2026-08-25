WITH x AS (
    SELECT 
        *,
        LAG(s.student, 1, NULL) OVER(
            ORDER BY s.id 
        ) as prev_student,
        LEAD(s.student, 1, NULL) OVER (
            ORDER BY s.id 
        ) as next_student 
    FROM
        Seat as s
), 
    e AS (
        SELECT id
        FROM Seat
        ORDER BY id DESC  
        LIMIT 1
    )

SELECT 
    x.id,
    (
        CASE
            WHEN (x.id IN (SELECT id FROM e)) AND (x.id % 2 = 1) THEN x.student 
            WHEN (x.id % 2 = 1) THEN x.next_student
            ELSE x.prev_student 
        END
    ) as student 
FROM x 