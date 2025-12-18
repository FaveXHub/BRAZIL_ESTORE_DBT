{{ config(materialized='table') }}

WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

translations AS (
    SELECT * FROM {{ ref('product_category_mapping') }}
)

SELECT
    p.product_id,
    p.product_category_name,
    COALESCE(t.product_category_name_english, p.product_category_name) AS category_en,
    p.product_weight_g,
    -- Architect logic: Grouping dimensions for better filtering
    CASE 
        WHEN p.product_weight_g > 5000 THEN 'Heavy'
        ELSE 'Standard'
    END AS shipping_weight_class,
    p.product_length_cm
FROM products p
LEFT JOIN translations t ON p.product_category_name = t.product_category_name