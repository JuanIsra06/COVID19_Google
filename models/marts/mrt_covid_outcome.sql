-- Daily outcomes: epidemiology + hospitalizations
select
    epi.log_date,
    epi.location_key,
    loc.country_name,
    loc.subregion1_name,
    loc.subregion2_name,
    -- Cases & deaths
    epi.new_confirmed,
    epi.cumulative_confirmed,
    epi.new_deceased,
    epi.cumulative_deceased,
    epi.daily_growth_rate_confirmed,
    -- Hospitalizations
    hosp.new_hospitalized_patients,
    hosp.current_hospitalized_patients,
    hosp.new_intensive_care_patients,
    hosp.current_intensive_care_patients,
    hosp.new_ventilator_patients,
    hosp.current_ventilator_patients
from {{ ref('int_epidemiology') }} epi
left join {{ ref('stg_hospitalizations') }} hosp
       on epi.location_key = hosp.location_key
      and epi.log_date = hosp.log_date
left join {{ ref('int_locations_dim') }} loc on epi.location_key = loc.location_key