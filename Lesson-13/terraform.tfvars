# Auto Fill parameters for device

#File can be names as:
# terraform.tfvars
# prod.auto.tfvars
# dev.auto.tfvars
#
#Example command:
# terraform apply -var-file="prod.auto.tfvars"

region                     = "ca-central-1"
instance_type              = "t2.nano"
enable_detailed_monitoring = "false"
allow_ports                = ["80", "443", "22"]
common_tags = {
  Owner       = "Nikita Grigorev"
  Project     = "Terraform Lessons"
  Environment = "development"
}
