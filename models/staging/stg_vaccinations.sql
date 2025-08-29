with source_vacc as (
    select
        date as log_date,
        location_key,
        new_persons_vaccinated,
        cumulative_persons_vaccinated,
        new_persons_fully_vaccinated,
        cumulative_persons_fully_vaccinated,
        new_vaccine_doses_administered,
        cumulative_vaccine_doses_administered,
        new_persons_vaccinated_pfizer,
        cumulative_persons_vaccinated_pfizer,
        new_persons_fully_vaccinated_pfizer,
        cumulative_persons_fully_vaccinated_pfizer,
        new_vaccine_doses_administered_pfizer,
        cumulative_vaccine_doses_administered_pfizer,
        new_persons_vaccinated_moderna,
        cumulative_persons_vaccinated_moderna,
        new_persons_fully_vaccinated_moderna,
        cumulative_persons_fully_vaccinated_moderna,
        new_vaccine_doses_administered_moderna,
        cumulative_vaccine_doses_administered_moderna,
        new_persons_vaccinated_janssen,
        cumulative_persons_vaccinated_janssen,
        new_persons_fully_vaccinated_janssen,
        cumulative_persons_fully_vaccinated_janssen,
        new_vaccine_doses_administered_janssen,
        cumulative_vaccine_doses_administered_janssen,
        new_persons_vaccinated_sinovac,
        total_persons_vaccinated_sinovac,
        new_persons_fully_vaccinated_sinovac,
        total_persons_fully_vaccinated_sinovac,
        new_vaccine_doses_administered_sinovac,
        total_vaccine_doses_administered_sinovac,
        src_filename,
        src_file_last_modified
    from {{ source('public_schema', 'raw_vaccinations_csv') }}
),
deduplicated as (
    select *
    from source_vacc
    qualify row_number() over(
        partition by log_date, location_key
        order by src_file_last_modified desc, src_filename desc
    ) = 1
)

select * from deduplicated
