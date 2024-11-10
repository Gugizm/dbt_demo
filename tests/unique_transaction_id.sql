SELECT transaction_id
FROM {{ ref('raw_resellers_type1') }}
GROUP BY transaction_id
HAVING COUNT(*) > 1