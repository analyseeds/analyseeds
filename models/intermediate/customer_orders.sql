with 

orders as (

    select
        *
    from
        {{ref('stg_orders')}}
),

customer_orders as (
    select        
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(*) as num_orders
    from
        orders
    group by 1
)

select * from customer_orders