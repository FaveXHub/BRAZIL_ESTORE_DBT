{{ config(materialized='view') }}

with orders as (
    select * from {{ ref('fct_orders') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
)

select
    c.customer_id,
    c.customer_city,
    sum(o.total_item_cost) as lifetime_value,
    case 
        when sum(o.total_item_cost) > 500 then 'VIP'
        when sum(o.total_item_cost) between 100 and 500 then 'Regular'
        else 'Low'
    end as customer_segment
from customers c
join orders o on c.customer_id = o.customer_id
group by 1, 2