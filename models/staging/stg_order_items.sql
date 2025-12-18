SELECT
    order_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value,
    -- Architect logic: Combine price and freight for Total Cost
    (price + freight_value) AS total_item_cost
FROM {{ source('brazil_estore_raw','order_items') }}