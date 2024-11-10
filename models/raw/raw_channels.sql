{{ config(materialized='table', schema='raw') }}

SELECT
    channel_id,
    channel_name
FROM {{ source('dbt_demo', 'channels') }}
