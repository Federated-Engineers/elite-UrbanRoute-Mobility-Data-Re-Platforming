resource "snowflake_schema" "bronze_schema" {
  database = snowflake_database.urban_route_db.name
  name     = "BRONZE"
}

resource "snowflake_schema" "bronze_schema_tes" {
  database = snowflake_database.urban_route_db.name
  name     = "BRONZE_TEST"
}

resource "snowflake_schema" "raw" {
  database = snowflake_database.urban_route_db.name
  name     = "RAW"
}

resource "snowflake_schema" "silver" {
  database = snowflake_database.urban_route_db.name
  name     = "SILVER"
}

resource "snowflake_schema" "gold" {
  database = snowflake_database.urban_route_db.name
  name     = "GOLD"
}

resource "snowflake_schema" "dev" {
  database = snowflake_database.urban_route_test_db.name
  name     = "DEV"
}


