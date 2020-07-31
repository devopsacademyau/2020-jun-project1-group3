variable "vpc_id" {
  description = "Vpc id"
  type        = string
}

variable "subnets" {
  description = "public subnets"
  type        = list(string)
}



