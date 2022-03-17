output "my_server_ip" {
  value = aws_instance.my_webserver.public_ip
}
