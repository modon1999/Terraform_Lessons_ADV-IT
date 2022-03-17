variable "ami" {
  description = "Common Tags to apply to all resources"
  type        = string
  default     = "ami-0dcc0ebde7b2e00db"
}

variable "instance_type" {
  description = "Common Tags to apply to all resources"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Common Tags to apply to all resources"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Common Tags to apply to all resources"
  type        = list(string)
}

variable "user_data" {
  description = "Common Tags to apply to all resources"
  type        = string
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
