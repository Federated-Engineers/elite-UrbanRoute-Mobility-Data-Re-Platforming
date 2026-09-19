resource "snowflake_grant_ownership" "transfer_ownership_to_airflow" {
  account_role_name = snowflake_account_role.airflow_role.name

  on {
    object_type = "EXTERNAL TABLE"
    object_name = snowflake_external_table.trips_ext.fully_qualified_name
  }

  outbound_privileges = "COPY"
}

resource "snowflake_grant_privileges_to_account_role" "airflow_stage_grant" {
  account_role_name = snowflake_account_role.airflow_role.name
  privileges        = ["USAGE"]

  on_schema_object {
    object_type = "STAGE"
    object_name = snowflake_stage_external_s3.urban_route_stage.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_file_format_usage" {
  account_role_name = snowflake_account_role.airflow_role.name
  privileges        = ["USAGE"]

  on_schema_object {
    object_type = "FILE FORMAT"
    object_name = snowflake_file_format.json_data.fully_qualified_name
  }
}
