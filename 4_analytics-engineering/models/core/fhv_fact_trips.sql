{{
    config(
        materialized='table'
    )
}}

with FHV_rides_actual as (
    select *
    from {{ ref('stg_staging_FHV_rides_actual') }}
),
dim_zones as (
    select *
    from {{ ref('dim_zones') }}
    where borough != 'Unknown' 
)

select 
    FHV_rides_actual.tripid,
    FHV_rides_actual.dispatching_base_num, 
    FHV_rides_actual.pickup_locationid, 
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    FHV_rides_actual.dropoff_locationid,
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone,  
    FHV_rides_actual.pickup_datetime, 
    FHV_rides_actual.dropoff_datetime, 
    FHV_rides_actual.sr_flag, 
    FHV_rides_actual.affiliated_base_number
from FHV_rides_actual
inner join dim_zones as pickup_zone
on FHV_rides_actual.pickup_locationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on FHV_rides_actual.dropoff_locationid = dropoff_zone.locationid