with

payments as (

    select
        *
    from
        {{ref('stg_payments')}}
),

final as (

    select
        payment_id,
        sum(payment_amount) as total_amount
    from 
        payments
    where
        payment_status = 'success'
    group by 1
)

select * from final

