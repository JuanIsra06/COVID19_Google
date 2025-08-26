select
    log_date,
    location_key,
    new_hospitalized_patients,
    cumulative_hospitalized_patients,
    current_hospitalized_patients,
    new_intensive_care_patients,
    cumulative_intensive_care_patients,
    current_intensive_care_patients,
    new_ventilator_patients,
    cumulative_ventilator_patients,
    current_ventilator_patients
from {{ source('public_schema', 'raw_hospitalizations_csv') }}