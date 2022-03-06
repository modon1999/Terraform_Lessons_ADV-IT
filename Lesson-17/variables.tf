variable "env" {
  default = "dev"
}

variable "prod_onwer" {
  default = "Nikita Grigorev"
}

variable "noprod_owner" {
  default = "Vika"
}

variable "ec2_size" {
  default = {
    "prod"    = "t2.small"
    "dev"     = "t2.micro"
    "staging" = "t2.nano"
  }
}

variable "allow_port_list" {
  default = {
    "prod" = ["80", "443"]
    "dev"  = ["80", "443", "8080", "22"]
  }
}
