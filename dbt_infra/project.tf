resource "dbtcloud_project" "urban_route_project" {
  name                     = "urban_route_dbt"
  description              = "Urban Route analytics, dbt models on snowflake"
  dbt_project_subdirectory = "urban_route_dbt"
}

