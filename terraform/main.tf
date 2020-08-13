# Main integration of all the terraform modules

module "networking" {
  source           = "./modules/networking"
  vpc_cidr         = var.vpc_cidr
  ssh_allowed_cidr = var.ssh_allowed_cidr
}

module "efs" {
  source              = "./modules/efs"
  vpc_id              = module.networking.vpc_id
  private_subnet_cidr = [for subnet in module.networking.private_subnets : subnet.cidr_block]
  private_subnet_ids  = [for subnet in module.networking.private_subnets : subnet.id]

}

module "rds_aurora" {
  source             = "./modules/rds-aurora"
  vpc_id             = module.networking.vpc_id
  rds_aurora_subnets = [for subnet in module.networking.private_subnets : subnet.id]
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.repository_name
}

module "ecs" {
  source                = "./modules/ecs"
  vpc_id                = module.networking.vpc_id
  efs_access_point      = module.efs.efs_access_point_id
  efs_id                = module.efs.efs_id
  public_subnets        = [for subnet in module.networking.public_subnets : subnet.id]
  private_subnets       = [for subnet in module.networking.private_subnets : subnet.id]
  app_image             = "${module.ecr.ecr.repository_url}:${var.image_tag}"
  rds_endpoint          = module.rds_aurora.rds_cluster_endpoint_param
  rds_database_name     = module.rds_aurora.rds_cluster_database_name_param
  rds_database_username = module.rds_aurora.rds_cluster_database_user_param
  rds_database_password = module.rds_aurora.rds_cluster_database_user_pw_param
  domain_name           = var.domain_name
  hosted_zone_id        = var.hosted_zone_id
  acm_cert_arn          = var.acm_cert_arn
}
