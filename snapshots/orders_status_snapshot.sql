{% snapshot orders_status_snapshot %}

{{
    config(
      target_database='BRAZIL_ESTORE',
      target_schema='SNAPSHOTS',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='order_purchase_timestamp',
    )
}}

select * from {{ ref('stg_orders') }}

{% endsnapshot %}