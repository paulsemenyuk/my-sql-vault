--Sulution

SELECT DISTINCT T1.user_id
FROM transactions AS T1
INNER JOIN transactions AS T2
  ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
INNER JOIN transactions AS T3
  ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
ORDER BY T1.user_id;


-- Solution by ChatGPT

WITH daily_purchases AS (
    SELECT
        user_id,
        CAST(transaction_date AS DATE) AS tx_date
    FROM transactions
    GROUP BY
        user_id,
        CAST(transaction_date AS DATE)
),
date_ordered AS (
    SELECT
        user_id,
        tx_date,
        LAG(tx_date) OVER (PARTITION BY user_id ORDER BY tx_date)  AS prev_date,
        LAG(tx_date, 2) OVER (PARTITION BY user_id ORDER BY tx_date) AS prev_date_2
    FROM daily_purchases
)
SELECT DISTINCT user_id
FROM date_ordered
WHERE
      -- day difference from previous day is 1
      (DATEDIFF(day, prev_date, tx_date) = 1)
  AND -- day difference from two days prior is 2
      (DATEDIFF(day, prev_date_2, tx_date) = 2)
ORDER BY user_id;
