
variable "region" {
  description = "Please enter AWS Region to deploy Server"
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "Enter Instance Type"
  default     = "t2.micro"
}

variable "allow_ports" {
  description = "List of Ports to open for Server"
  type        = list(any)
  default     = ["80", "443"]
}

variable "enable_detailed_monitoring" {
  type    = bool
  default = false
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map(any)
  default = {
    Owner       = "Nikita Grigorev"
    Project     = "Terraform Lessons"
    Environment = "development"
  }
}
