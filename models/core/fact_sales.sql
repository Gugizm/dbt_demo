{{ config(materialized='table', schema='core') }}

SELECT 
    r.transaction_id,
    r.created_date,
    p.product_id,
    c.customer_id,
    ch.channel_id,
    r.quantity,
    r.total_amount
FROM {{ ref('stg_resellers_type1') }} AS r
JOIN {{ ref('stg_products') }} AS p ON r.product_name = p.product_name
JOIN {{ ref('stg_customers') }} AS c ON r.customer_email = c.email
JOIN {{ ref('stg_channels') }} AS ch ON r.sales_channel = ch.channel_name
