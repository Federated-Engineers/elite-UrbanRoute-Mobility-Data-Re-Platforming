{{ config(materialized='view') }}
with vehicles as (

    select
        vehicle_id
        , vehicle_type
        , hardware_version
        , deployment_date
        , current_status
        , loaded_at
    from {{ source('postgres', 'vehicles') }}
)

select *
from vehicles
