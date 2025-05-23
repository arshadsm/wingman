with raw as (
  select * from {{ source('raw', 'community_posts') }}
)

select
  post_id,
  posted_by_user_id,
  lower(trim(title)) as title,
  description,
  origin_lat,
  origin_lng,
  destination_lat,
  destination_lng,
  available_seats,
  departure_time,
  is_active,
  created_at
from raw
