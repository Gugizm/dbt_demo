{{ config(materialized='view', schema="staging") }}

SELECT
    transaction_date,
    reseller_id,
    product_name,
    quantity,
    total_amount,
    sales_channel,
    customer_email,
    customer_first_name,
    customer_last_name,
    STRPTIME(date_created, '%Y-%m-%d') AS date_created,
    series_city,
    STRPTIME(created_date, '%Y-%m-%d') AS created_date,
    transaction_id
FROM {{ ref('raw_resellers_type2') }}
