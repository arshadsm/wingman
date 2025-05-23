with raw as (
  select * from {{ source('raw', 'users') }}
)

select
  user_id,
  lower(trim(name)) as name,
  email,
  phone,
  home_lat,
  home_lng,
  preferences,
  created_at
from raw
