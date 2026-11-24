SELECT
    d.device_type,
    COUNT(DISTINCT s.user_id) AS distinct_users
FROM user_sessions AS s
LEFT JOIN devices AS d
       ON d.device_id = s.device_id
GROUP BY d.device_type
ORDER BY d.device_type ;
