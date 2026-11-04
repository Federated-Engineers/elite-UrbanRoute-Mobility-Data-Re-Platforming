{{ config(materialized='view') }}

with users as (
    select
        user_id
        , registration_date
        , user_segment
        , country_code
        , is_active
        , loaded_at
    from {{ source('postgres', 'users') }}
)

select *
from users
