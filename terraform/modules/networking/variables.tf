variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "ssh_allowed_cidr" {
  type        = string
  description = "SSH allowed only from this CIDR"
}

variable "project" {
  type    = string
  default = "pj-01-gp-03"
}

# Using this count to create subnets
variable "number_of_subnets" {
  type        = number
  description = "Desired number of subnets."
  default     = 2
}
