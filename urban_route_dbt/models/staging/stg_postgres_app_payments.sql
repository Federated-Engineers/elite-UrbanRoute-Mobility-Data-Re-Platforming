{{ config(materialized='view') }}
with app_payments as (

    select
        payment_id
        , trip_id
        , user_id
        , payment_timestamp
        , source_system
        , gross_amount_eur
        , discount_amount_eur
        , refund_amount_eur
        , net_amount_eur
        , loaded_at
    from {{ source('postgres', 'app_payments') }}
)

select *
from app_payments
