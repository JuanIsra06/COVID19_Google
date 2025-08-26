WITH raw_economy AS (
  SELECT t.value AS row_data
  FROM {{ source('public_schema', 'raw_economy_json') }},
       LATERAL FLATTEN(input => data:data) t
)
SELECT
  row_data[0]::STRING AS location_key,
  row_data[1]::NUMBER(32,2) AS gdp_usd,
  row_data[2]::NUMBER(32,2) AS gdp_per_capita_usd,
  row_data[3]::NUMBER(32,2) AS human_capital_index
FROM raw_economy