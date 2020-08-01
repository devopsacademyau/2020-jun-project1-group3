variable "vpc_id" {
  type        = string
  description = "VPC ID to deploy RDS cluster"
}

variable "rds_aurora_subnets" {
  type        = list(string)
  description = "List of subnets for RDS to be present"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "VPC security groups to be associated with the RDS cluster"
}

# Variables with default values set
variable "engine_version" {
  type        = string
  description = "Aurora DB engine version"
  default     = "5.7.mysql_aurora.2.03.2"
}

variable "database_name" {
  type    = string
  default = "auroradefault"
}

variable "backup_retention_period" {
  type        = number
  description = "Reteintion days for backups"
  default     = 1
}

variable "instance_type" {
  type        = string
  description = "Underlying instance types for the RDS cluster"
  default     = "db.t2.small"
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}
