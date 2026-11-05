{{ config(materialized='view') }}

with manual_payments as (

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
        , notes
        , loaded_at
    from {{ source('google_sheets', 'payments') }}
)

select *
from manual_payments

