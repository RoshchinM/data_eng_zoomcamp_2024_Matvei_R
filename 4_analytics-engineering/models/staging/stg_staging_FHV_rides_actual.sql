with 

source as (

    select * from {{ source('staging', 'FHV_rides_actual') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key(['dispatching_base_num', 'pickup_datetime']) }} as tripid,
        dispatching_base_num,
        pickup_datetime,
        dropoff_datetime,
        {{ dbt.safe_cast("pulocationid", api.Column.translate_type("integer")) }} as pickup_locationid,
        {{ dbt.safe_cast("dolocationid", api.Column.translate_type("integer")) }} as dropoff_locationid,
        sr_flag,
        affiliated_base_number
     from {{ source('staging','FHV_rides_actual') }}
    where pulocationid is not null
    and dolocationid is not null
)

select * from renamed
where EXTRACT(YEAR FROM pickup_datetime) = 2019

