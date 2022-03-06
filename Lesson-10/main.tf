#-------------------------------------------------------
# My Terraform
#
# Find Latest AMI id of:
#       - Ubuntu 20.04
#       - Amazon Linux 2
#       - Windows Server 2022 base_instance_name
#
# Made be Nikita Grigorev
#-------------------------------------------------------

provider "aws" {}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "latest_windows_server" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }
}

output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu.name
}

output "latest_amazon_linux_ami_id" {
  value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_linux_ami_name" {
  value = data.aws_ami.latest_amazon_linux.name
}

output "latest_windows_server_ami_id" {
  value = data.aws_ami.latest_windows_server.id
}

output "latest_windows_server_ami_name" {
  value = data.aws_ami.latest_windows_server.name
}
