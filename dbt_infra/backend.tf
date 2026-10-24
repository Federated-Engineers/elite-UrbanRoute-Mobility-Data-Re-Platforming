terraform {
  backend "s3" {
    bucket = "federated-engineers-production-elite-urban-route-tfstate-v2"
    key    = "urban-route/dbt_infra/terraform.tfstate"
    region = "eu-central-1"
  }
}
