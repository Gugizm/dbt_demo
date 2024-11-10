{{ config(materialized='view', schema='staging') }}

SELECT
    product_id AS product_id,
    name AS product_name,
    city AS city,
    price AS price
FROM {{ ref('raw_products') }}
WHERE product_id IS NOT NULL