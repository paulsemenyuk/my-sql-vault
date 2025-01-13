-- Solution

SELECT
    FLOOR(COUNT(*) * 0.90) AS "Needed rations",
    FLOOR(COUNT(*) * 0.90) <= (SELECT amount FROM rations) AS "Has enough rations"
FROM player
WHERE status = 'alive'
AND IsInsider IS FALSE;
