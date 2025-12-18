-- This test fails if any product has a category but NO English translation
SELECT
    product_id,
    product_category_name
FROM {{ ref('dim_products') }}
WHERE product_category_name IS NOT NULL 
  AND category_en = product_category_name -- This means COALESCE didn't find a match