WITH raw_index AS (
  SELECT t.value AS row_data
  FROM {{ source('public_schema', 'raw_index_json') }},
       LATERAL FLATTEN(input => data:data) t
)
SELECT
  row_data[0]::STRING AS location_key,
  row_data[1]::STRING AS place_id,
  row_data[2]::STRING AS wikidata_id,
  row_data[3]::STRING AS datacommons_id,
  row_data[4]::STRING AS country_code,
  row_data[5]::STRING AS country_name,
  row_data[6]::STRING AS subregion1_code,
  row_data[7]::STRING AS subregion1_name,
  row_data[8]::STRING AS subregion2_code,
  row_data[9]::STRING AS subregion2_name,
  row_data[10]::STRING AS locality_code,
  row_data[11]::STRING AS locality_name,
  row_data[12]::STRING AS iso_3166_1_alpha_2,
  row_data[13]::STRING AS iso_3166_1_alpha_3,
  row_data[14]::NUMBER(2,0) AS aggregation_level
FROM raw_index