Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# 🚲 Ride Analytics dbt Project

This repository contains a modular and testable dbt project for analyzing ride participation data using Google BigQuery. It is designed following best practices for the modern data stack — including dimensional modeling, data quality testing, and scalable fact/dim layers.

---

## 📐 Project Structure

The project follows a layered architecture:


---

## 📊 Key Models

### `fact_ride_participation`
Tracks each user's participation in a ride, enriched with role, join time, and location information.

**Fields include:**
- `user_key`, `user_id`
- `ride_id`, `is_creator`
- `role`, `join_time`, `ride_duration_seconds`
- `join_date_key` → joins to `dim_date`
- `exit_location_key` → joins to `dim_locations`

---

## 🧱 Dimensions
- **`dim_date`**: Standard calendar date dimension
- **`dim_locations`**: Surrogate-keyed location dimension based on exit lat/lng
- **`int_dim_user`**: Intermediate user dimension with generated surrogate keys

---

## ✅ Tests

Includes dbt schema tests for:
- Uniqueness & not-null constraints
- Foreign key relationships between facts and dimensions

Run with:
```bash
dbt test
