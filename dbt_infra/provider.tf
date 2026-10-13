terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
      version = "~> 1.0"
    }

    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.17.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "dbtcloud" {
  host_url   = var.dbt_cloud_host_url
  account_id = var.dbt_cloud_account_id
  token      = data.aws_ssm_parameter.dbt_cloud_service_token.value
}

provider "aws" {
  region = "eu-central-1"
}

provider "snowflake" {

  preview_features_enabled = [
    "snowflake_storage_integration_aws_resource",
    "snowflake_stage_external_s3_resource",
    "snowflake_file_format_resource",
    "snowflake_table_resource",
    "snowflake_external_table_resource"
  ]
}
