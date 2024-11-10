{{ config(materialized='table', schema='core') }}

SELECT DISTINCT
    product_id,
    product_name,
    city AS product_origin_city,
    price
FROM {{ ref('stg_products') }}
