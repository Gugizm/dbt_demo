{{ config(materialized='view', schema='staging') }}

SELECT
    channel_id AS channel_id,
    channel_name AS channel_name
FROM {{ ref('raw_channels') }}
WHERE channel_id IS NOT NULL
