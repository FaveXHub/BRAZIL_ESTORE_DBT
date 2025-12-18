# BRAZIL_ESTORE_DBT
An end-to-end Analytics Engineering project using dbt and Snowflake to transform raw Brazilian E-commerce data into a clean Star Schema for business intelligence 

## Project Overview
​Modern Data Stack (MDS) implementation for the Brazil E-commerce dataset using Snowflake and dbt Cloud. This project transforms raw data into a Star Schema (Fact and Dimensions) designed for high-performance analytics.

## Technical Architecture
​- Modeling Strategy: Medallion Architecture (Staging -> Marts/Core -> Marketing).
​- Materializations: Used Incremental Materialization for the fct_orders table to optimize Snowflake compute costs.
- ​Data Quality: Implemented Schema Tests (unique, not_null, accepted_values) to ensure 100% data integrity.
​
## Lineage Graph
​- check lineage_graph.png file in the repo
​
## Skills Demonstrated
- ​SQL (CTEs, Joins, Window Functions).
- ​dbt Core (Jinja, Macros, Incremental logic).
- ​Data Warehousing (SCD, Fact/Dim modeling, Star Schema).