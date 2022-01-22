SELECT      
    (salary * months) AS total_earnings,
    COUNT(*) AS total_count
FROM EMPLOYEE
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;