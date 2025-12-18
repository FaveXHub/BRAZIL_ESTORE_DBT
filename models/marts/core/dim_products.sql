{{ config(materialized='table') }}

with products as (
    select * from {{ ref('stg_products') }}
)

select
    product_id,
    product_category_name,
    product_weight_g,
    -- Architect logic: Grouping dimensions for better filtering
    case 
        when product_weight_g > 5000 then 'Heavy'
        else 'Standard'
    end as shipping_weight_class
from products