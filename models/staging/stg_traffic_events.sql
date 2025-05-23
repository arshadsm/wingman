with raw as (
  select * from {{ source('raw', 'traffic_events') }}
)

select
  event_id,
  ride_id,
  reported_by_user_id,
  timestamp as event_timestamp,
  latitude,
  longitude,
  lower(trim(event_type)) as event_type,
  severity,
  description
from raw
