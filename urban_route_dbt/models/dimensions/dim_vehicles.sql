with vehicles as (

    select
        vehicle_id
        , vehicle_type
        , hardware_version
        , deployment_date
        , current_status
        , loaded_at
    from {{ ref('stg_postgres_vehicles') }}

)

select *
from vehicles

