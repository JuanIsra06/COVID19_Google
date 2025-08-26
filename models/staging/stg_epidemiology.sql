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
    cumulative_tested
from {{ source('public_schema', 'raw_epidemiology_csv') }}