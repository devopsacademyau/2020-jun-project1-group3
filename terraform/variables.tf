# This will have all the code that utilize the modules.

variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "repository_name" {
  description = "the name of the ECR repository to be created."
  type        = string
  default     = "wp-project3"
}

variable "ssh_allowed_cidr" {
  type    = string
  default = "121.200.5.90/32"
}

variable "app_image" {
  type    = string
  default = "wp-project3"
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "domain_name" {
  type    = string
  default = "formterra.tk"
}

variable "hosted_zone_id" {
  type    = string
  default = "Z03893361UTFRYDKCLVMT"
}

variable "acm_cert_arn" {
  type    = string
  default = "arn:aws:acm:ap-southeast-2:907095435092:certificate/82cabd8b-119d-4776-b8d1-a1d163814e99"
}