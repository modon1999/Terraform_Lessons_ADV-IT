#-------------------------------------------------------
# Build WebServer during Bootstrap
#-------------------------------------------------------

provider "aws" {
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-0eb7496c2e0403237"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Nikita",
    l_name = "Grigorev",
    names  = ["Vasya", "John", "Vika"]
  })

  tags = {
    Name    = "my_webserver"
    Owner   = "Nikita Grigorev"
    Project = "Terraform Lessons"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My First SecurityGroup by Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
