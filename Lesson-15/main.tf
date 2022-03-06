provider "aws" {}


resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "echo Terraform START: $(date) >> log.txt"
  }
}

resource "null_resource" "command2" {
  provisioner "local-exec" {
    command = "ping -c 5 www.google.com"
  }
}

resource "null_resource" "command3" {
  provisioner "local-exec" {
    command     = "print('Hello World!')"
    interpreter = ["python3", "-c"]
  }
}

resource "null_resource" "command4" {
  provisioner "local-exec" {
    command = "echo $NAME1 $NAME2 $NAME3 >> names.txt"
    environment = {
      NAME1 = "Nikita"
      NAME2 = "Vika"
      NAME3 = "Petya"
    }
  }
}

resource "aws_instance" "myserver" {
  ami           = "ami-0eb7496c2e0403237"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo Hello from AWS Instance Creations!"
  }
}

resource "null_resource" "command5" {
  provisioner "local-exec" {
    command = "echo Terraform START: $(date) >> log.txt"
  }
  depends_on = [null_resource.command1, null_resource.command2, null_resource.command3, null_resource.command4, aws_instance.myserver]
}
