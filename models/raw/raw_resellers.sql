{{ config(materialized='table', schema='raw') }}

SELECT
    reseller_id,
    reseller_name,
    commission_pct
FROM {{ source('dbt_demo', 'resellers') }}
