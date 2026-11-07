{{ config(materialized='table') }}

with fact_trips as (

    select
        trip_id
        , vehicle_id
        , start_time
    from {{ ref('fact_trips') }}

)

, dim_vehicles as (

    select
        vehicle_id
        , vehicle_type
    from {{ ref('dim_vehicles') }}

)

, fact_payments as (

    select
        trip_id
        , gross_amount_eur
        , discount_amount_eur
        , refund_amount_eur
        , net_amount_eur
    from {{ ref('fact_payments') }}

)

, payments_by_trip as (

    select
        trip_id
        , sum(gross_amount_eur) as gross_amount_eur
        , sum(discount_amount_eur) as discount_amount_eur
        , sum(refund_amount_eur) as refund_amount_eur
        , sum(net_amount_eur) as net_amount_eur
    from fact_payments
    group by trip_id

)

, daily_trips as (

    select
        v.vehicle_type
        , to_date(t.start_time) as date_
        , count(distinct t.trip_id) as total_trips
    from fact_trips as t
    left join dim_vehicles as v
        on t.vehicle_id = v.vehicle_id
    group by
        to_date(t.start_time)
        , v.vehicle_type

)

, daily_revenue as (

    select
        v.vehicle_type
        , to_date(t.start_time) as date_
        , sum(coalesce(p.gross_amount_eur, 0)) as total_gross_revenue_eur
        , sum(coalesce(p.refund_amount_eur, 0)) as total_refunds_eur
        , sum(coalesce(p.net_amount_eur, 0)) as total_net_revenue_eur
    from fact_trips as t
    left join dim_vehicles as v
        on t.vehicle_id = v.vehicle_id
    left join payments_by_trip as p
        on t.trip_id = p.trip_id
    group by
        to_date(t.start_time)
        , v.vehicle_type

)

select
    t.date_
    , t.vehicle_type
    , t.total_trips
    , r.total_gross_revenue_eur
    , r.total_refunds_eur
    , r.total_net_revenue_eur
from daily_trips as t
left join daily_revenue as r
    on
        t.date_ = r.date_
        and t.vehicle_type = r.vehicle_type
