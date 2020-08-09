variable "vpc_id" {
  type        = string
  description = "VPC ID for the RDS cluster"
}

variable "rds_aurora_subnets" {
  type        = list(string)
  description = "List of subnets for RDS to be present"
}

# Variables with default values set

variable "engine" {
  type        = string
  description = "Aurora DB engine"
  default     = "aurora-mysql"
}

variable "engine_mode" {
  type        = string
  description = "Aurora DB engine mode"
  default     = "serverless"
}

variable "engine_version" {
  type        = string
  description = "Aurora DB engine version"
  default     = "5.7.mysql_aurora.2.03.2"
}

variable "db_name" {
  type    = string
  default = "wordpress"
}

variable "db_user" {
  type        = string
  description = "db_username for the application"
  default     = "admin"
}

variable "backup_retention_period" {
  type        = number
  description = "Reteintion days for backups"
  default     = 1
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Take snapshots before delete"
  default     = true
}

variable "aurora_port" {
  type    = number
  default = 3306
}

variable "auto_pause" {
  type    = bool
  default = true
}

variable "max_capacity" {
  type    = number
  default = 1
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "seconds_until_auto_pause" {
  type    = number
  default = 300
}

variable "timeout_action" {
  type    = string
  default = "ForceApplyCapacityChange"
}