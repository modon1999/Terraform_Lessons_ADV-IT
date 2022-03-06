#----------------------------------------------------------
# My Terraform
#
# Terraform Loops: Count and For if
#
# Made by Denis Astahov
#----------------------------------------------------------
provider "aws" {}


resource "aws_iam_user" "user1" {
  name = "pushkin"
}

resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name  = element(var.aws_users, count.index)
}

#----------------------------------------------------------------

resource "aws_instance" "servers" {
  count         = 3
  ami           = "ami-0eb7496c2e0403237"
  instance_type = "t2.micro"
  tags = {
    Name = "Server Number ${count.index + 1}"
  }
}
