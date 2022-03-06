#----------------------------------------------------------
# My Terraform
#
# Global Variables in Remote State on S3
#
# Made by Denis Astahov
#----------------------------------------------------------
provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "nikita-grigorev-project-kgb-terraform-state"
    key    = "globalvars/terraform.tfstate"
    region = "eu-central-1"
  }
}

#==================================================

output "company_name" {
  value = "ANDESA Soft International"
}

output "owner" {
  value = "Denis Astahov"
}

output "tags" {
  value = {
    Project    = "Assembly-2020"
    CostCenter = "R&D"
    Country    = "Canada"
  }
}
