with raw as (
  select * from {{ source('raw', 'rides') }}
)

select
  ride_id,
  creator_user_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  start_time,
  estimated_end_time,
  route_polyline,
  is_open_to_join,
  created_at
from raw
