-- Clean and enhance epidemiology data
select
    log_date,
    location_key,
    new_confirmed,
    new_deceased,
    new_recovered,
    new_tested,
    cumulative_confirmed,
    cumulative_deceased,
    cumulative_recovered,
    cumulative_tested,
    -- Derived metrics
    case when lag(cumulative_confirmed) over (partition by location_key order by log_date) > 0
         then new_confirmed / nullif(lag(cumulative_confirmed) over (partition by location_key order by log_date),0)
    end as daily_growth_rate_confirmed
from {{ ref('stg_epidemiology') }}