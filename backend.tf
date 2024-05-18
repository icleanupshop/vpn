terraform {
  backend "s3" {
    region         = "eu-west-2"
    dynamodb_table = "vpn-terraform-state-lock"

    bucket = "vpn-master-terraform-state"
    key    = "infrastructure/master/terraform.tfstate"

  }
}