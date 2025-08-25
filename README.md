# COVID-19 Open Data – Snowflake + dbt Project

This repository contains a **dbt project** for modeling the [Google COVID-19 Open Data](https://health.google.com/covid-19/open-data/) in **Snowflake**.  
It transforms raw JSON/CSV files staged in Snowflake into a clean, documented data warehouse optimized for analytics.

---

## 📊 Data Sources

We are working with the following files from Google’s Open Data initiative:

- geography.json – Location hierarchy, ISO codes, region/subregion mapping  
- economy.json – Economic indicators by geography (e.g. GDP, income)  
- demographics.json – Population, age structure, and other demographic features  
- index.json – Metadata and index of locations  
- health.json – Healthcare system characteristics (beds, facilities, etc.)  
- epidemiology.csv – Confirmed cases and deaths by date and location  
- hospitalizations.csv – Hospital occupancy and critical care usage  
- lawatlas-emergency-declarations.csv – Government emergency declarations  
- mobility.csv – Community mobility indicators (retail, workplaces, residential, etc.)
