resource "snowflake_file_format" "json_data" {
  name        = "JSON_FORMAT"
  database    = snowflake_database.urban_route_db.name
  schema      = snowflake_schema.bronze_schema.name
  format_type = "JSON"
  comment     = "JSON file format for S3 ingestion"
}

resource "snowflake_file_format" "json_data_raw" {
  name        = "JSON_FORMAT"
  database    = snowflake_database.urban_route_db.name
  schema      = snowflake_schema.raw.name
  format_type = "JSON"
  comment     = "JSON file format for S3 ingestion"
}
