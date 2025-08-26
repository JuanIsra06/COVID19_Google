WITH raw_demographics AS (
  SELECT t.value AS row_data
  FROM {{ source('public_schema', 'raw_demographics_json') }},
       LATERAL FLATTEN(input => data:data) t
)
SELECT
	row_data[0]::STRING AS location_key,
	row_data[1]::NUMBER(32,2) AS population,
	row_data[2]::NUMBER(32,2) AS population_male,
	row_data[3]::NUMBER(32,2) AS population_female,
	row_data[4]::NUMBER(32,2) AS population_rural,
	row_data[5]::NUMBER(32,2) AS population_urban,
	row_data[6]::NUMBER(32,2) AS population_largest_city,
	row_data[7]::NUMBER(32,2) AS population_clustered,
	row_data[8]::NUMBER(32,2) AS population_density,
	row_data[9]::NUMBER(32,2) AS human_development_index,
	row_data[10]::NUMBER(32,2) AS population_age_00_09,
	row_data[11]::NUMBER(32,2) AS population_age_10_19,
	row_data[12]::NUMBER(32,2) AS population_age_20_29,
	row_data[13]::NUMBER(32,2) AS population_age_30_39,
	row_data[14]::NUMBER(32,2) AS population_age_40_49,
	row_data[15]::NUMBER(32,2) AS population_age_50_59,
	row_data[16]::NUMBER(32,2) AS population_age_60_69,
	row_data[17]::NUMBER(32,2) AS population_age_70_79,
	row_data[18]::NUMBER(32,2) AS population_age_80_and_older
FROM raw_demographics