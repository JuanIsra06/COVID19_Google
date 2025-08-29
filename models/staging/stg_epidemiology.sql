with source_epidemiology as (
    select
        date as log_date,
        location_key,
        new_confirmed,
        new_deceased,
        new_recovered,
        new_tested,
        cumulative_confirmed,
        cumulative_deceased,
        cumulative_recovered,
        cumulative_tested,
        src_filename,
        src_file_last_modified
    from {{ source('public_schema', 'raw_epidemiology_csv') }}
),
deduplicated as (
    select *
    from source_epidemiology
    qualify row_number() over(
        partition by log_date, location_key
        order by src_file_last_modified desc, src_filename desc
    ) = 1
)

select * from deduplicated
