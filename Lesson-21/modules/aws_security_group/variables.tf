variable "env" {
  default = "dev"
}

variable "vpc_id" {
  description = "VPC for Security Group"
  type        = string
}

variable "allow_ports" {
  description = "List of Ports to open for Server"
  type        = list(any)
  default     = ["80", "443"]
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
