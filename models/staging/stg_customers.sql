{{ config(materialized='view', schema='staging') }}

SELECT
    customer_id AS customer_id,
    first_name AS first_name,
    last_name AS last_name,
    LOWER(email) AS email
FROM {{ ref('raw_customers') }}
WHERE customer_id IS NOT NULL
