{{ config(materialized='table', schema='core') }}

SELECT DISTINCT
    channel_id,
    channel_name
FROM {{ ref('stg_channels') }}
