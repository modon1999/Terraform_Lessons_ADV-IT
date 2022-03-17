#----------------------------------------------------------
# My Terraform
#
# Use Our Terraform Module to create AWS VPC Networks
#
# Made by Denis Astahov. Summer 2019
#----------------------------------------------------------
provider "aws" {
  region = var.region
}

module "vpc-default" {
  source = "../modules/aws_network"
  //  source               = "git@github.com:adv4000/terraform-modules.git//aws_network"
}

module "security_group_default" {
  source = "../modules/aws_security_group"
  vpc_id = module.vpc-default.vpc_id
}

module "server_default" {
  source                 = "../modules/aws_something"
  subnet_id              = module.vpc-default.public_subnet_ids[0]
  vpc_security_group_ids = [module.security_group_default.my_aws_security_group]
  user_data              = file("${path.module}/user_data.sh")
}

# module "vpc-dev" {
#   source = "../modules/aws_network"
#   //  source               = "git@github.com:adv4000/terraform-modules.git//aws_network"
#   env                  = "dev"
#   vpc_cidr             = "10.100.0.0/16"
#   public_subnet_cidrs  = ["10.100.1.0/24", "10.100.2.0/24"]
#   private_subnet_cidrs = []
# }
#
# module "vpc-prod" {
#   source = "../modules/aws_network"
#   // source               = "git@github.com:adv4000/terraform-modules.git//aws_network"
#   env                  = "prod"
#   vpc_cidr             = "10.10.0.0/16"
#   public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
#   private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24", "10.10.33.0/24"]
# }
#
# module "vpc-test" {
#   source = "../modules/aws_network"
#   // source               = "git@github.com:adv4000/terraform-modules.git//aws_network"
#   env                  = "staging"
#   vpc_cidr             = "10.10.0.0/16"
#   public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
#   private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24"]
# }
#===============================================
