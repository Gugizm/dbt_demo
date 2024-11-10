{{ config(materialized='table', schema='core') }}

SELECT DISTINCT
    customer_id,
    first_name,
    last_name,
    email
FROM {{ ref('stg_customers') }}
