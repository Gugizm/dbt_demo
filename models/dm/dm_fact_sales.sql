{{ config(materialized='table', schema='dm') }}

SELECT
    sales.created_date,
    sales.quantity,
    sales.total_amount,
    customers.customer_id,
    products.product_id,
    channels.channel_id
FROM {{ ref('fact_sales') }} AS sales
LEFT JOIN {{ ref('dim_customers') }} AS customers ON sales.customer_id = customers.customer_id
LEFT JOIN {{ ref('dim_products') }} AS products ON sales.product_id = products.product_id
LEFT JOIN {{ ref('dim_channels') }} AS channels ON sales.channel_id = channels.channel_id
