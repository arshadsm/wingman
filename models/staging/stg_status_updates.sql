with raw as (
  select * from {{ source('raw', 'status_updates') }}
)

select
  update_id,
  ride_id,
  user_id,
  timestamp as update_timestamp,
  latitude,
  longitude,
  speed,
  lower(trim(event)) as event_type
from raw
