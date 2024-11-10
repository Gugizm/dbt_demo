{{ config(materialized='view', schema="staging") }}

SELECT
    product_name,
    quantity,
    total_amount,
    sales_channel,
    customer_first_name,
    customer_last_name,
    customer_email,
    series_city,
    STRPTIME(created_date, '%Y-%m-%d') AS created_date,
    reseller_id,
    transaction_id
FROM {{ ref('raw_resellers_type1') }}
