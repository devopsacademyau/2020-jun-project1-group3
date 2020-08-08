variable "rds_endpoint" {
  type = string
}

variable "rds_database_name" {
  type = string
}

variable "rds_database_username" {
  type = string
}

variable "rds_database_password" {
  type = string
}

variable "db_parameter_name" {
  type    = string
  default = "/wordpress/WORDPRESS_DB_NAME"
}

variable "db_host_parameter_name" {
  type    = string
  default = "/wordpress/WORDPRESS_DB_HOST"
}

variable "db_user_parameter_name" {
  type    = string
  default = "/wordpress/WORDPRESS_DB_USER"
}

variable "db_pw_parameter_name" {
  type    = string
  default = "/wordpress/WORDPRESS_DB_PASSWORD"
}
