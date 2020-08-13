# Read availability zones
data "aws_availability_zones" "aws_az" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = "true"
  tags = {
    "Name" = "${var.project}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.project}-igw"
  }
}

# Elastic IPs for the NAT gateways
resource "aws_eip" "nat_eip" {
  count      = length(data.aws_availability_zones.aws_az.names)
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    "Name" = "${var.project}-nat-eip-${count.index}"
  }
}

resource "aws_subnet" "public_subnet" {
  count = length(data.aws_availability_zones.aws_az.names)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone       = data.aws_availability_zones.aws_az.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-public-${data.aws_availability_zones.aws_az.names[count.index]}"
  }
}

# First two netnum values are used for public subnets.
resource "aws_subnet" "private_subnet" {
  count             = length(data.aws_availability_zones.aws_az.names)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 6)
  availability_zone = data.aws_availability_zones.aws_az.names[count.index]
  tags = {
    Name = "${var.project}-private-${data.aws_availability_zones.aws_az.names[count.index]}"
  }
}

# Create NAT Gateways in all the public subnets
resource "aws_nat_gateway" "nat_gw" {
  count         = length(data.aws_availability_zones.aws_az.names)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    "Name" = "${var.project}-nat-gw-${count.index}"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "${var.project}-public-rt"
  }
}

# Need one per private subnet to route each outbound
# traffic to its own NAT gateway
resource "aws_route_table" "private_route_table" {
  count  = length(data.aws_availability_zones.aws_az.names)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw[count.index].id
  }
  tags = {
    "Name" = "${var.project}-private-rt-${count.index}"
  }
}

resource "aws_route_table_association" "public" {
  count = length(data.aws_availability_zones.aws_az.names)

  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private" {
  count = length(data.aws_availability_zones.aws_az.names)

  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}

resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [for subnet in aws_subnet.private_subnet : subnet.id]

  # TODO: need to lock down this
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    "Name" = "${var.project}-private-nacl"
  }
}

resource "aws_network_acl" "public_nacl" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [for subnet in aws_subnet.public_subnet : subnet.id]

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = -1
    rule_no    = 400
    action     = "allow"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 500
    action     = "allow"
    cidr_block = var.ssh_allowed_cidr
    from_port  = 22
    to_port    = 22
  }

  # egress {
  #   protocol   = "tcp"
  #   rule_no    = 100
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 443
  #   to_port    = 443
  # }

  # egress {
  #   protocol   = "tcp"
  #   rule_no    = 200
  #   action     = "allow"
  #   cidr_block = "0.0.0.0/0"
  #   from_port  = 1024
  #   to_port    = 65535
  # }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    "Name" = "${var.project}-public-nacl"
  }
}



