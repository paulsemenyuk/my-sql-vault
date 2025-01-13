-- Solution


-- Solution from ChatGPT

SELECT
  ROUND(
    100.0 *
    SUM(CASE WHEN c.country_id <> r.country_id THEN 1 ELSE 0 END)
    / COUNT(*)
  , 1) AS international_calls_pct
FROM phone_calls p
JOIN phone_info AS c
  ON p.caller_id = c.caller_id
JOIN phone_info AS rr
  ON p.receiver_id = r.caller_id;
