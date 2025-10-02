with

customers as (

    select
        *
    from
        {{ref('stg_customers')}}
),

customer_orders as (
    select
        *
    from 
        {{ref('customer_orders')}}
),

final as (

    select
        a.customer_id,
        a.first_name,
        a.last_name,
        b.first_order_date,
        b.last_order_date,
        b.num_orders
    from
        customers as a left join customer_orders as b
        using(customer_id)   
)

select * from final