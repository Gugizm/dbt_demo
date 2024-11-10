{{ config(materialized='table', schema="dm") }}

SELECT
    f.product_id,
    p.product_name,
    f.customer_id,
    c.first_name,
    c.last_name,
    COUNT(f.transaction_id) AS total_transactions,
    SUM(f.quantity) AS total_quantity_sold,
    SUM(f.total_amount) AS total_revenue

FROM {{ ref('fact_sales') }} AS f
JOIN {{ ref('dim_products') }} AS p ON f.product_id = p.product_id
JOIN {{ ref('dim_customers') }} AS c ON f.customer_id = c.customer_id

GROUP BY
    f.product_id, 
    p.product_name,
    f.customer_id,
    c.first_name,
    c.last_name
