SELECT 
    DATE_FORMAT(t.trans_date, '%Y-%m') as month,
    t.country,
    COUNT(*) as trans_count,
    SUM(
        CASE
            WHEN t.state =  "approved" THEN 1
            ELSE 0  
        END
    ) as approved_count,
    SUM(t.amount) as trans_total_amount,
    SUM(
        CASE
            WHEN t.state = "approved" THEN t.amount
            ELSE 0  
        END
    ) as approved_total_amount
FROM Transactions as t
GROUP BY MONTH(t.trans_date), t.country, YEAR(t.trans_date)