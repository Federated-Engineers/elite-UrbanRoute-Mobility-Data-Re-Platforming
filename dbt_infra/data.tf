data "aws_ssm_parameter" "dbt_cloud_service_token" {
  name = "arn:aws:ssm:eu-central-1:049417293525:parameter/production/elite/dbt_cloud/urbanroute/service_token"
}

data "aws_ssm_parameter" "snowflake_password" {
  name            = "/staging/elite/snowflake/snowflake_password"
  with_decryption = true
}
