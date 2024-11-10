{{ config(materialized='table', schema='raw') }}

SELECT
    product_id,
    name,
    city,
    price
FROM {{ source('dbt_demo', 'products') }}
