# This will have all the code that utilize the modules.

variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "CIDRBlock" {
  description = "VPC network"
  default     = "20.0.0.0/16"
}

variable "repository_name" {
  description = "the name of the ECR repository to be created."
  type        = string
  default     = "wp-project3"
}