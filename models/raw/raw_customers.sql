{{ config(materialized='table', schema='raw') }}

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM {{ source('dbt_demo', 'customers') }}
