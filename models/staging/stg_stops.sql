with raw as (
  select * from {{ source('raw', 'stops') }}
)

select
  stop_id,
  ride_id,
  location_name,
  latitude,
  longitude,
  arrival_time,
  departure_time,
  is_agreed_stop
from raw
