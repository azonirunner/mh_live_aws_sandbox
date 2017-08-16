provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket     = "mhickie-aws-sandbox-data"
    key        = "infra/terraform/mhickie-dev/global/iam/service_role.state"
    region     = "us-west-2"
    encrypt    = true
    lock_table = "tf-state-lock"
  }
}
