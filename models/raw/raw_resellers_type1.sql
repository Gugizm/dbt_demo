{{ config(materialized='table', schema="raw") }}

SELECT
    "Product name" AS product_name,
    "Quantity" AS quantity,
    "Total amount" AS total_amount,
    "Sales Channel" AS sales_channel,
    "Customer First Name" AS customer_first_name,
    "Customer Last Name" AS customer_last_name,
    "Customer Email" AS customer_email,
    "Series City" AS series_city,
    "Created Date" AS created_date,
    "Reseller ID" AS reseller_id,
    "Transaction ID" AS transaction_id
FROM {{ source('dbt_demo', 'resellers_type1') }}
