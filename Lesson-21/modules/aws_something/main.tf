resource "aws_instance" "my_webserver" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = var.user_data
  tags                   = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} MyWebserver" })
}
