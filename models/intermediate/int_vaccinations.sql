-- Vaccination progress per location
select
    log_date,
    location_key,
    new_persons_vaccinated,
    cumulative_persons_vaccinated,
    new_persons_fully_vaccinated,
    cumulative_persons_fully_vaccinated,
    new_vaccine_doses_administered,
    cumulative_vaccine_doses_administered,
    -- Derived coverage metrics
    case when demog.population > 0
         then cumulative_persons_vaccinated / demog.population
    end as pct_population_vaccinated,
    case when demog.population > 0
         then cumulative_persons_fully_vaccinated / demog.population
    end as pct_population_fully_vaccinated
from {{ ref('stg_vaccinations') }} vacc
left join {{ ref('stg_demographics') }} demog using(location_key)