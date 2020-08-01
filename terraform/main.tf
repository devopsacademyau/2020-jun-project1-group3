# Variables for the entire stack goes here.

module "vpc" {
  source    = "./modules/vpc"
  CIDRBlock = var.CIDRBlock
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.repository_name
}