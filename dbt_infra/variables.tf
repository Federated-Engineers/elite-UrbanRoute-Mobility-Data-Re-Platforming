variable "dbt_cloud_host_url" {
  type        = string
  description = "API endpoint for the dbt Cloud cell this account lives on"
  default     = "https://sm343.us1.dbt.com/api"
}

variable "dbt_cloud_account_id" {
  type        = number
  description = "dbt Cloud account identifier"
  default     = 70506183168865

}

variable "github_installation_id" {
  type        = number
  description = "Installation id of the dbt Cloud GitHub App on github repository"
  default     = 150067907
}

variable "github_remote_url" {
  type        = string
  description = "SSH remote for the github repository"
  default     = "git@github.com:Federated-Engineers/elite-UrbanRoute-Mobility-Data-Re-Platforming.git"
}

variable "snowflake_account" {
  type        = string
  description = "Snowflake account identifier, organization-account"
  default     = "LZWZHVW-IH64623"
}

variable "snowflake_prod_database" {
  type        = string
  description = "Snowflake database the production jobs build into"
  default     = "URBAN_ROUTE_DB"
}

variable "snowflake_prod_warehouse" {
  type        = string
  description = "Snowflake warehouse the production jobs run on"
  default     = "DBT_WH"
}

variable "snowflake_prod_role" {
  type        = string
  description = "Snowflake role the production jobs assume"
  default     = "DBT_ROLE"
}

variable "dbt_version" {
  type        = string
  description = "dbt release track used by the deployment environments"
  default     = "latest"
}

variable "snowflake_dbt_cloud_user" {
  type        = string
  description = "Snowflake service user the scheduled production job authenticates as"
  default     = "DBT_USER"
}

variable "snowflake_dbt_ci_user" {
  type        = string
  description = "Snowflake service user the Slim CI job authenticates as"
  default     = "DBT_CI_USER"
}

variable "snowflake_ci_role" {
  type        = string
  description = "Snowflake role the CI job assumes; reads production, writes only to pull request schemas"
  default     = "DBT_CI_ROLE"
}

variable "dbt_prod_schema" {
  type        = string
  description = "Fallback schema for production models that declare no custom schema"
  default     = "GOLD"
}

variable "dbt_ci_schema" {
  type        = string
  description = "Placeholder schema for CI. dbt Cloud overrides this per pull request"
  default     = "DBT_CLOUD_CI"
}

variable "dbt_threads" {
  type        = number
  description = "Threads used by the dbt Cloud jobs"
  default     = 8
}

