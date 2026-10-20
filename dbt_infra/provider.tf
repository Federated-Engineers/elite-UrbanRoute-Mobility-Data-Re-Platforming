terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
      version = "~> 1.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "dbtcloud" {
  host_url               = var.dbt_cloud_host_url
  account_id             = var.dbt_cloud_account_id
  token                  = data.aws_ssm_parameter.dbt_cloud_service_token.value
  timeout_seconds        = 90
  max_retries            = 5
  retry_interval_seconds = 10
}

provider "aws" {
  region = "eu-central-1"
}
