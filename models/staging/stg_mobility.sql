select
    log_date,
    location_key,
    mobility_retail_and_recreation,
    mobility_grocery_and_pharmacy,
    mobility_parks,
    mobility_transit_stations,
    mobility_workplaces,
    mobility_residential
from {{ source('public_schema', 'raw_mobility_csv') }}