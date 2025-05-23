select
  user_key,
  natural_user_id as user_id,
  name,
  email,
  phone,
  home_lat,
  home_lng,
  preferences,
  created_at
from {{ ref('int_dim_user') }}
