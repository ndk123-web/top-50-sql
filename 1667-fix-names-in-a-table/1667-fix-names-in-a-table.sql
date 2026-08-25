SELECT 
    Users.user_id, 
    CONCAT(
        UPPER(SUBSTRING(Users.name, 1, 1)),
        LOWER(SUBSTRING(Users.name, 2, LENGTH(Users.name)))
    ) as name
FROM Users
ORDER BY Users.user_id
