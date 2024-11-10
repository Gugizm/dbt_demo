SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_revenue) AS total_revenue
FROM {{ ref('dm_reseller_sales') }} AS s
JOIN {{ ref('dim_customers') }} AS c ON s.customer_id = c.customer_id
GROUP BY
    c.customer_id, 
    c.first_name, 
    c.last_name
ORDER BY
    total_revenue DESC
LIMIT 10
