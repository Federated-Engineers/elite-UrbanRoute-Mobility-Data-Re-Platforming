with users as (

    select
        user_id
        , registration_date
        , user_segment
        , country_code
        , is_active
        , loaded_at
    from {{ ref('stg_postgres_users') }}

)

select *
from users
