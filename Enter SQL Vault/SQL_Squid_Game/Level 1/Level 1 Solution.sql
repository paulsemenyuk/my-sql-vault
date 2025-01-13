-- Solution
-- 1. Retrieve the player_id, name, debt, age, vice, and family_connections of all alive players
-- with a debt greater than 400,000,000 and an age greater than 65 or a vice of 'Gambling' and
-- no family connections. Order the result set by player_id.

SELECT *
FROM player
WHERE status = 'alive'
    AND debt > 400000000
    AND (
        age > 65
        OR (vice = 'Gambling'
            AND has_close_family IS FALSE)
        )
ORDER BY player_id;
