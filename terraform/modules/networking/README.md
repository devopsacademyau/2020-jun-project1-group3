# Networking Module

## Parameters
### Inputs
- vpc_cidr
- ssh_allowed_cidr
- project

### Outputs
- vpc_id
- private_subnets
- public_subnets

## VPC
| Region         |  CIDR         |
|----------------|:--------------|
| ap-southeast-2 |  10.0.0.0/16  |

## Private Subnets
| AZ              |  CIDR         | NAME
|-----------------|:--------------|-------------------------------------|
| ap-southeast-2a |  10.0.6.0/24  | pj-01-gp-03-private-ap-southeast-2a |
| ap-southeast-2b |  10.0.7.0/24  | pj-01-gp-03-private-ap-southeast-2b |
| ap-southeast-2c |  10.0.8.0/24  | pj-01-gp-03-private-ap-southeast-2c |

## Public Subnets
| AZ              |  CIDR         | NAME
|-----------------|:--------------|-------------------------------------|
| ap-southeast-2a |  10.0.0.0/24  | pj-01-gp-03-public-ap-southeast-2a  |
| ap-southeast-2b |  10.0.1.0/24  | pj-01-gp-03-public-ap-southeast-2b  |
| ap-southeast-2c |  10.0.2.0/24  | pj-01-gp-03-public-ap-southeast-2c  |
