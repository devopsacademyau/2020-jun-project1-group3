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

module "loadbalancer" {
  source = "./modules/loadbalancer"
  #project       = "grp3wordpress"
  vpc_id  = module.networking.vpc_id
  subnets = [for subnet in module.networking.private_subnets : subnet.id]
  #https_enabled = true
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.repository_name
}

# module "ecs" {
#   source = "./modules/ecs"

# }
