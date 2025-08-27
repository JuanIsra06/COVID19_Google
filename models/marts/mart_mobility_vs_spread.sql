-- Mobility + spread indicators
select
    mob.log_date,
    mob.location_key,
    loc.country_name,
    mob.mobility_retail_and_recreation,
    mob.mobility_workplaces,
    mob.mobility_transit_stations,
    mob.mobility_residential,
    epi.new_confirmed,
    epi.daily_growth_rate_confirmed
from {{ ref('int_mobility') }} mob
left join {{ ref('int_epidemiology') }} epi
       on mob.location_key = epi.location_key
      and mob.log_date = epi.log_date
left join {{ ref('int_locations_dim') }} loc on epi.location_key = loc.location_key