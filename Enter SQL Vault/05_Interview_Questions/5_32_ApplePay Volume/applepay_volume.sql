-- Solution with ILIKE

SELECT
  merchant_id,
  SUM (CASE
    WHEN payment_method ILIKE 'apple pay'  -- also
    then transaction_amount
    else 0
    end) as volume
FROM transactions
GROUP BY merchant_id
ORDER BY volume DESC
;
