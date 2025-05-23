-- models/marts/fact/fact_ride_participation.sql

with participants as (
  select *
  from {{ ref('stg_participants') }}
),

rides as (
  select ride_id, creator_user_id
  from {{ ref('stg_rides') }}
),

users as (
  select
    user_key,
    natural_user_id as user_id
  from {{ ref('int_dim_user') }}
),

dates as (
  select
    date_day as date_key
  from {{ ref('dim_date') }}
),

exit_locations as (
  select
    latitude,
    longitude,
    location_key
  from {{ ref('dim_locations') }}
)

select
  d.date_key as join_date_key,
  u.user_key,
  u.user_id,
  p.ride_id,
  case when r.creator_user_id = u.user_id then true else false end as is_creator,
  lower(p.role) as role,
  p.join_time,
  TIMESTAMP_DIFF(current_timestamp(), p.join_time, SECOND) as ride_duration_seconds,
  l.location_key as exit_location_key

from participants p
join users u on p.user_id = u.user_id
join rides r on p.ride_id = r.ride_id
join dates d on cast(p.join_time as date) = d.date_key
left join exit_locations l on p.exit_lat = l.latitude and p.exit_lng = l.longitude
