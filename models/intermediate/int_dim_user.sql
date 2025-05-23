with stg as (
  select * from {{ ref('stg_users') }}
)

select
  row_number() over (order by user_id) as user_key,
  user_id as natural_user_id,
  name,
  email,
  phone,
  home_lat,
  home_lng,
  preferences,
  created_at
from stg
