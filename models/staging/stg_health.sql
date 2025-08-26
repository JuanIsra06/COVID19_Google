WITH raw_health AS (
	SELECT t.value AS row_data
	FROM {{ source('public_schema', 'raw_health_json') }},
	   LATERAL FLATTEN(input => data:data) t
)
SELECT
	row_data[0] ::STRING AS location_key,
	row_data[1] ::NUMBER(32,2) AS life_expectancy,
	row_data[2] ::NUMBER(32,2) AS smoking_prevalence,
	row_data[3] ::NUMBER(32,2) AS diabetes_prevalence,
	row_data[4] ::NUMBER(32,2) AS infant_mortality_rate,
	row_data[5] ::NUMBER(32,2) AS adult_male_mortality_rate,
	row_data[6] ::NUMBER(32,2) AS adult_female_mortality_rate,
	row_data[7] ::NUMBER(32,2) AS pollution_mortality_rate,
	row_data[8] ::NUMBER(32,2) AS comorbidity_mortality_rate,
	row_data[9] ::NUMBER(32,2) AS hospital_beds_per_1000,
	row_data[10] ::NUMBER(32,2) AS nurses_per_1000,
	row_data[11] ::NUMBER(32,2) AS physicians_per_1000,
	row_data[12] ::NUMBER(32,2) AS health_expenditure_usd,
	row_data[13] ::NUMBER(32,2) AS out_of_pocket_health_expenditure_usd
FROM raw_health