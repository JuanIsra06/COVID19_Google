-- Normalize mobility % changes
select
    log_date,
    location_key,
    mobility_retail_and_recreation / 100 as mobility_retail_and_recreation,
    mobility_grocery_and_pharmacy / 100 as mobility_grocery_and_pharmacy,
    mobility_parks / 100 as mobility_parks,
    mobility_transit_stations / 100 as mobility_transit_stations,
    mobility_workplaces / 100 as mobility_workplaces,
    mobility_residential / 100 as mobility_residential
from {{ ref('stg_mobility') }}