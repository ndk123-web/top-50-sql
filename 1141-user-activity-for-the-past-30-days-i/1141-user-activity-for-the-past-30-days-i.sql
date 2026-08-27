SELECT 
    Activity.activity_date as day, 
    COUNT(DISTINCT Activity.user_id) as active_users
FROM
     Activity 
WHERE 
    activity_date BETWEEN
    DATE_SUB('2019-07-27', INTERVAL 29 DAY)
    AND '2019-07-27'
GROUP BY 
    Activity.activity_date;