// Lets create networking part of our environment: VPC, subnets and security groups
# VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.99.0.0/16"

  tags = {
    Name = "main"
  }
}

# Subnet
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.99.1.0/24"

  tags = {
    Name = "Main"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main"
  }
}

# Route table
resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "main"
  }
}

# Making Subnet public
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.r.id}"
}