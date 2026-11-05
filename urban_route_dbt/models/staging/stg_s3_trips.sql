{{ config(materialized='view') }}

with trips as (
    select
        trip_id
        , user_id
        , vehicle_id
        , start_time
        , end_time
        , start_station_id
        , end_station_id
        , distance_meters
        , duration_seconds
    from {{ source('s3', 'trips') }}
)

select *
from trips

