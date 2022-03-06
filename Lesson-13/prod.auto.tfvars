# Auto Fill parameters for device

#File can be names as:
# terraform.tfvars
# prod.auto.tfvars
# dev.auto.tfvars
#
#Example command:
# terraform apply -var-file="prod.auto.tfvars"

region                     = "ca-central-1"
instance_type              = "t2.micro"
enable_detailed_monitoring = "true"
allow_ports                = ["80", "443", "22", "8888"]
common_tags = {
  Owner       = "Nikita Grigorev"
  Project     = "Terraform Lessons"
  Environment = "development"
}
