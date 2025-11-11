resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr
    enable_dns_support   = true
    enable_dns_hostnames = true
 # tags = {
  #  Name = var.vpc_name
  #}
  
}

resource "aws_subnet" "demo_vpc_private_subnet" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.demo_vpc_private_subnet[0]
  availability_zone = var.availability_zone[0]
 tags = {
    Name = "${var.clucter_name}-private-${count.index + 1}"
    "kubernetes.io/cluster/${var.clucter_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"

  }
 }

resource "aws_subnet" "demo_vpc_public_subnet" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = var.demo_vpc_public_subnet[0]
  availability_zone = var.availability_zone[0]
 tags = {
    Name = "${var.clucter_name}-public-${count.index + 1}"
    "kubernetes.io/cluster/${var.clucter_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_internet_gateway" "demo_vpc_igt" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = "${var.clucter_name}-igw"
  }
  
}

resource "aws_eip" "nat" {
  count = length(var.demo_vpc_public_subnet_cidr[0])
  domain = "vpc"
  tags = {
    Name = "${var.clucter_name}-nat-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "main" {
  count = length(var.demo_vpc_public_subnet_cidr[0])
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.demo_vpc_public_subnet[count.index].id
  tags = {
    Name = "${var.clucter_name}-nat-gw-${count.index + 1}"
  }
  
}

resource "aws_route_table" "demo_vpc_public_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_vpc_igt.id
  }
  tags = {
    Name = "${var.clucter_name}-public-rt"
  }
  
}

resource "aws_route_table" "demo_vpc_private_subnet" {
  count = length(var.demo_vpc_private_subnet)
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }
  tags = {
    Name = "${var.clucter_name}-private-rt-${count.index + 1}"
    
  }
  
}

resource "aws_route_table_association" "demo_vpc_public_rta" {
  count = length(var.demo_vpc_public_subnet)
  subnet_id      = aws_subnet.demo_vpc_public_subnet[0].id
  route_table_id = aws_route_table.demo_vpc_public_rt.id
  
}

resource "aws_route_table_association" "demo_vpc_private_rta" {

  count = length(var.demo_vpc_private_subnet)
  subnet_id      = aws_subnet.demo_vpc_private_subnet[count.index].id
  route_table_id = aws_route_table.demo_vpc_private_subnet[count.index].id 
  
}