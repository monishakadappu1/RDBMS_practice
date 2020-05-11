SELECT 
    DATE_FORMAT(created_at,"%M %D %Y") as earliest_date
FROM users
ORDER BY created_at LIMIT 1;

-- wrong approach ,aggregate function conditions
SELECT 
    email,
    DATE_FORMAT(MIN(created_at),"%M %D %Y") as earliest_date
FROM users;

SELECT 
    *
FROM users
WHERE created_at = (SELECT MIN(created_at) FROM users);


SELECT
    DATE_FORMAT(created_at,"%M") AS month,
    COUNT(*) AS "count"
FROM users
GROUP BY month
ORDER BY count DESC;

SELECT
    COUNT(*) AS yahoo_users
FROM users
WHERE email LIKE '%@yahoo.com';

SELECT
    CASE
        WHEN email like '%gmail.com' THEN "Gmail"
        WHEN email like '%yahoo.com' THEN "Yahoo"
        WHEN email like '%hotmail.com' THEN "Hotmail"
        ELSE "others"
    END AS provider,
    COUNT(*) AS total_users
FROM users 
GROUP BY provider
ORDER BY total_users DESC;
