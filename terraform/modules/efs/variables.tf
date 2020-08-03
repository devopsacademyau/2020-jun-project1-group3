variable "vpc_id" {
  type        = string
  description = "VPC for EFS"
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "efs_unique_name" {
  type        = string
  description = "Unique name of the EFS volume"
  default     = "wordpress"
}

variable "efs_encrypted" {
  type        = bool
  description = "EFS content should be encrypted or not"
  default     = false
}

variable "efs_performance_mode" {
  type        = string
  description = "EFS performance mode"
  default     = "generalPurpose"
}

variable "efs_throughput_mode" {
  type        = string
  description = "EFS throughput mode"
  default     = "bursting"
}

variable "efs_access_point_path" {
  type        = string
  description = "Root directory of the EFS access point path"
  default     = "/wordpress"
}

variable "efs_access_point_name" {
  type        = string
  description = "Name of the EFS access point"
  default     = "Wordpress"
}