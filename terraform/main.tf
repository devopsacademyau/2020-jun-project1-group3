# Variables for the entire stack goes here.

module "vpc" {
  source    = "./modules/vpc"
  CIDRBlock = var.CIDRBlock
}
  
  module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.repository_name
}

module "loadbalancer" {
  source        = "./modules/loadbalancer"
  #project       = "grp3wordpress"
  vpc_id        = module.vpc.vpc_id
  subnets       = module.vpc.public_subnets[*].id
  #https_enabled = true
 }

