provider "aws" {
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  tags = {
    Name    = "my_ubuntu"
    Owner   = "Nikita Grigorev"
    Project = "Terraform Lessons"
  }
}

resource "aws_instance" "my_amazon_linux" {
  ami           = "ami-0eb7496c2e0403237"
  instance_type = "t2.nano"
  tags = {
    Name    = "my_amazon_linux"
    Owner   = "Nikita Grigorev"
    Project = "Terraform Lessons"
  }
}
