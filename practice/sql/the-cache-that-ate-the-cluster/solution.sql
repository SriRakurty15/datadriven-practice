SELECT user_id,
       SUM(total_amount) AS total_spend,
       COUNT(transaction_id)    AS txn_count,
       100.0 * SUM(total_amount)
             / NULLIF((SELECT SUM(total_amount) FROM transactions), 0) AS pct_of_total
FROM transactions
GROUP BY user_id;
