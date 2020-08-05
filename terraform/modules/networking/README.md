## Objectives:

- New VPC with a /16 CIDR
- 2 /24 public subnets(different AZs)
- 2 /24 private subnets(different AZs)
- 2 NACLs public/private (ALLOW ALL is not permitted)
- Internet Gateway in place

## Acceptance Criteria:

- Code is in Terraform and merged into master
- I can run instances in public and private Subnet
- I can't directly access the private instance from internet
- I can ssh the private instance from the public one
- No security groups or nacls have ALLOW ALL
- I can access the public one using ssh from my local machine through internet
- A README file is created documenting the VPC, the subnets and how to deploy the code


## TODO
- Still the instances in private subnet can't go out to internet through NGW.