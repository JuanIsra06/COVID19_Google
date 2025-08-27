-- Vaccinations + outcomes for effectiveness analysis
select
    vacc.log_date,
    vacc.location_key,
    loc.country_name,
    loc.subregion1_name,
    vacc.cumulative_persons_vaccinated,
    vacc.cumulative_persons_fully_vaccinated,
    vacc.pct_population_vaccinated,
    vacc.pct_population_fully_vaccinated,
    epi.new_confirmed,
    epi.new_deceased,
    -- Ratio of deaths per 100k population
    case when loc.population > 0
         then epi.new_deceased * 100000.0 / loc.population
    end as deaths_per_100k
from {{ ref('int_vaccinations') }} vacc
left join {{ ref('int_epidemiology') }} epi
       on vacc.location_key = epi.location_key
      and vacc.log_date = epi.log_date
left join {{ ref('int_locations_dim') }} loc on vacc.location_key = loc.location_key