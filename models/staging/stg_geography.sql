WITH raw_geo AS (
    SELECT t.value AS row_data
    FROM {{ source('public_schema', 'raw_geography_json') }},
        LATERAL FLATTEN(input => data:data) t
)
SELECT
    row_data[0]::STRING location_key,
	row_data[1]::NUMBER(32,2) openstreetmap_id,
	row_data[2]::NUMBER(32,2) latitude,
	row_data[3]::NUMBER(32,2) longitude,
	row_data[4]::NUMBER(32,2) elevation_m,
	row_data[5]::NUMBER(32,2) area_sq_km,
	row_data[6]::NUMBER(32,2) area_rural_sq_km,
	row_data[7]::NUMBER(32,2) area_urban_sq_km
FROM raw_geo