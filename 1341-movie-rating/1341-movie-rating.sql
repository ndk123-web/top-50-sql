WITH x AS (
    SELECT 
        *,
        COUNT(*) as cnt
    FROM
        MovieRating as m 
    GROUP BY m.user_id 
) ,
-- y is the output who has rated many movies and according to the name lexicographically
    y AS (
        SELECT u.name
        FROM Users as u
        INNER JOIN x  
        ON u.user_id =  x.user_id 
        ORDER BY x.cnt DESC, u.name ASC 
        LIMIT 1 
    ),

    z AS (
        SELECT 
            *,
            AVG(m.rating) as rt
        FROM
            MovieRating as m
        WHERE m.created_at >= "2020-02-01" AND m.created_at <= "2020-02-29"
        GROUP BY m.movie_id
    ),

-- a is the final rated one output for highest average rating
    a AS (
        SELECT m.title
        FROM z
        INNER JOIN Movies as m
        ON z.movie_id = m.movie_id 
        ORDER BY z.rt DESC, m.title
        LIMIT 1 
    )

SELECT name as results from y 
UNION ALL
SELECT title as results from a  