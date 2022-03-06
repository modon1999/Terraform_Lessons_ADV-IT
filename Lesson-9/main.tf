provider "aws" {}

data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current" {}
data "aws_region" "region" {}
data "aws_vpcs" "foo" {}
data "aws_vpc" "selected" {}

output "data_aws_availability_zones" {
  value = data.aws_availability_zones.working.names[1]
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "data_aws_region" {
  value = data.aws_region.region.name
}

output "data_aws_description" {
  value = data.aws_region.region.description
}

output "data_aws_vpcs" {
  value = data.aws_vpcs.foo.ids
}

output "data_aws_vpc" {
  value = data.aws_vpc.selected.id
}
