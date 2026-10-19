terraform {
  backend "s3" {
    bucket = "federated-engineers-production-elite-urban-route-tfstate-v3"
    key    = "urban-route/production/terraform.tfstate"
    region = "eu-central-1"
  }
}

