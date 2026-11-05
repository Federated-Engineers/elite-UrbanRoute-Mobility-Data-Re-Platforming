{{ config(materialized='table') }}

with app_payments as (

    select
        payment_id
        , trip_id
        , user_id
        , payment_timestamp
        , 'postgres_app' as source_system
        , gross_amount_eur
        , discount_amount_eur
        , refund_amount_eur
        , net_amount_eur
    from {{ ref('stg_postgres_app_payments') }}

)

, manual_payments as (

    select
        payment_id
        , trip_id
        , user_id
        , payment_timestamp
        , 'google_sheets_manual' as source_system
        , gross_amount_eur
        , discount_amount_eur
        , refund_amount_eur
        , net_amount_eur
    from {{ ref('stg_gsheets_payments') }}

)

, all_payments as (

    select * from app_payments

    union all

    select * from manual_payments

)

select *
from all_payments

