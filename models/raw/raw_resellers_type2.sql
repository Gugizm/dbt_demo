{{ config(materialized='table', schema='raw') }}

SELECT
    "date" AS transaction_date,
    "reseller-id" AS reseller_id,
    "productName" AS product_name,
    "qty" AS quantity,
    "totalAmount" AS total_amount,
    "salesChannel" AS sales_channel,
    "customer"."email" AS customer_email,
    "customer"."firstname" AS customer_first_name,
    "customer"."lastname" AS customer_last_name,
    "dateCreated" AS date_created,
    "seriesCity" AS series_city,
    "Created Date" AS created_date,
    "transactionID" AS transaction_id
FROM {{ source('dbt_demo', 'resellers_type2') }}
