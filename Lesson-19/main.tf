#----------------------------------------------------------
# My Terraform
#
# Provision Resources in Multiply AWS Regions / Accounts
#
# Made by Nikita Grigorev
#----------------------------------------------------------

# provider "aws" { // This is example to use Another AWS Account
#   alias      = "ANOTHER_AWS_ACCOUNT"
#   region     = "ca-central-1"
#   access_key = "xxxxxxxxxxxx"
#   secret_key = "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
#
#   assume_role {
#     role_arn     = "arn:aws:iam::1234567890:role/RemoteAdministrators"
#     session_name = "TERRAFROM_SESSION"
#   }
# }

provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  region = "eu-west-3"
  alias  = "Paris"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "London"
}

#=================================================

data "aws_ami" "default_latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "london_latest_amazon_linux" {
  provider    = aws.London
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "paris_latest_amazon_linux" {
  provider    = aws.Paris
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "my_default_server" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.default_latest_amazon_linux.id
  tags = {
    Name = "Default Server"
  }
}

resource "aws_instance" "my_paris_server" {
  provider      = aws.Paris
  instance_type = "t2.micro"
  ami           = data.aws_ami.paris_latest_amazon_linux.id
  tags = {
    Name = "Paris Server"
  }
}

resource "aws_instance" "my_london_server" {
  provider      = aws.London
  instance_type = "t2.micro"
  ami           = data.aws_ami.london_latest_amazon_linux.id
  tags = {
    Name = "London Server"
  }
}
