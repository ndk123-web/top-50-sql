SELECT Employee.name
FROM Employee
WHERE Employee.id IN (
    SELECT Employee.managerId
    FROM Employee
    WHERE Employee.managerId IS NOT NULL
    GROUP BY Employee.managerId 
    HAVING COUNT(*) >= 5 
)