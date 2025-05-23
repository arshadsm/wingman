-- models/core/dim_date.sql
{{ dbt_utils.date_spine(
    start_date="cast('2022-01-01' as date)",
    end_date="cast('2026-12-31' as date)",
    datepart="day"
) }}
