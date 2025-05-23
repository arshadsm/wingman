with raw as (
  select * from {{ source('raw', 'participants') }}
)

select
  ride_id,
  user_id,
  join_time,
  exit_lat,
  exit_lng,
  role
from raw
