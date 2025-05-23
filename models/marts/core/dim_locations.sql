select
  exit_lat as latitude,
  exit_lng as longitude,
  {{ dbt_utils.generate_surrogate_key(['exit_lat', 'exit_lng']) }} as location_key
from {{ ref('stg_participants') }}
where exit_lat is not null and exit_lng is not null
group by exit_lat, exit_lng
