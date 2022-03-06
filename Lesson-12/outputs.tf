output "my_server_ip" {
  value = aws_eip.my_static_ip.public_ip
}

output "my_instance_id" {
  value = aws_instance.my_webserver.id
}

output "my_aws_security_group" {
  value = aws_security_group.my_webserver.id
}
