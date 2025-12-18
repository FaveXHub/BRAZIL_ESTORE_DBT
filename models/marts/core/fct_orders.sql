{{
  config(
    materialized='incremental',
    unique_key='order_id'
  )
}}

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
    
    -- This filter only runs during incremental updates
    {% if is_incremental() %}
    WHERE order_purchase_timestamp > (SELECT MAX(order_purchase_timestamp) FROM {{ this }})
    {% endif %}
),

order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
)

SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    oi.product_id,
    (ZEROIFNULL(oi.price) + ZEROIFNULL(oi.freight_value)) AS total_item_cost
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id