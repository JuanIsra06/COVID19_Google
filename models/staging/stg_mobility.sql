with source_mobility as (
    select
        date as log_date,
        location_key,
        mobility_retail_and_recreation,
        mobility_grocery_and_pharmacy,
        mobility_parks,
        mobility_transit_stations,
        mobility_workplaces,
        mobility_residential,
        src_filename,
        src_file_last_modified
    from {{ source('public_schema', 'raw_mobility_csv') }}
),
deduplicated as (
    select *
    from source_mobility
    qualify row_number() over(
        partition by log_date, location_key
        order by src_file_last_modified desc, src_filename desc
    ) = 1
)

select * from deduplicated