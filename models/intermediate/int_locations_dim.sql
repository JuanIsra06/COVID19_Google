select
    idx.location_key,
    idx.country_code,
    idx.country_name,
    idx.subregion1_code,
    idx.subregion1_name,
    idx.subregion2_code,
    idx.subregion2_name,
    idx.locality_name,
    geo.latitude,
    geo.longitude,
    geo.area_sq_km,
    demo.population,
    demo.population_density,
    demo.human_development_index,
    econ.gdp_usd,
    econ.gdp_per_capita_usd,
    health.life_expectancy,
    health.hospital_beds_per_1000,
    health.physicians_per_1000
from {{ ref('stg_index') }} idx
    left join {{ ref('stg_geography') }} geo using (location_key)
    left join {{ ref('stg_demographics') }} demo using (location_key)
    left join {{ ref('stg_economy') }} econ using (location_key)
    left join {{ ref('stg_health') }} health using (location_key)