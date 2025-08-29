with source_hosp as (
    select
        date as log_date,
        location_key,
        new_hospitalized_patients,
        cumulative_hospitalized_patients,
        current_hospitalized_patients,
        new_intensive_care_patients,
        cumulative_intensive_care_patients,
        current_intensive_care_patients,
        new_ventilator_patients,
        cumulative_ventilator_patients,
        current_ventilator_patients,
        src_filename,
        src_file_last_modified
    from {{ source('public_schema', 'raw_hospitalizations_csv') }}
),
deduplicated as (
    select *
    from source_hosp
    qualify row_number() over(
        partition by log_date, location_key
        order by src_file_last_modified desc, src_filename desc
    ) = 1
)

select * from deduplicated