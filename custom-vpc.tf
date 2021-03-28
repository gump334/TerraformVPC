# AWS Custom VPC

provider "aws" {
  region = "us-east-2"
}
# VPC setup
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Custom VPC "
  }
}
#VPC public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Public"
  }
}
#VPC private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Private"
  }
}
#Elastic IP
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = "Internet_Gateway"
}

resource "aws_nat_gateway" "gw" {
  # ... other arguments ...
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.gw]
}
