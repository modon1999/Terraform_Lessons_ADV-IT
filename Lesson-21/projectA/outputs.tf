
output "prod_public_subnet_ids" {
  value = module.vpc-default.public_subnet_ids
}

output "prod_private_subnet_ids" {
  value = module.vpc-default.private_subnet_ids
}

output "dev_public_subnet_ids" {
  value = module.vpc-default.public_subnet_ids
}

output "dev_private_subnet_ids" {
  value = module.vpc-default.private_subnet_ids
}

output "security_group_default_id" {
  value = module.security_group_default.my_aws_security_group
}

output "my_server_ip" {
  value = module.server_default.my_server_ip
}
