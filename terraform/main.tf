# This will have all the code that utilize the modules.
module "vpc" {
  source    = "./modules/vpc"
  CIDRBlock = var.CIDRBlock
}

module "loadbalancer" {
  source        = "./modules/loadbalancer"
  #project       = "grp3wordpress"
  vpc_id        = module.vpc.vpc_id
  subnets       = module.vpc.public_subnets[*].id
  #https_enabled = true
}
