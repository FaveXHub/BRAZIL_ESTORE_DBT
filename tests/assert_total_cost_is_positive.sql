-- Singular test: Total cost should never be negative
select
    order_id,
    total_item_cost
from {{ ref('fct_orders') }}
where total_item_cost < 0