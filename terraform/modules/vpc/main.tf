# VPC
resource "aws_vpc" "labi" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# Subnets
resource "aws_subnet" "public-lu1" {
  vpc_id                  = aws_vpc.labi.id
  cidr_block              = var.public_subnet_cidr_a
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "public-lu1"
  }
}


resource "aws_subnet" "public-lu2" {
  vpc_id                  = aws_vpc.labi.id
  cidr_block              = var.public_subnet_cidr_b
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone2

  tags = {
    Name = "public-lu2"
  }
}

resource "aws_subnet" "private-lu1" {
  vpc_id            = aws_vpc.labi.id
  cidr_block        = var.private_subnet_cidr_a
  availability_zone = var.availability_zone

  tags = {
    Name = "private-lu1"
  }
}

resource "aws_subnet" "private-lu2" {
  vpc_id            = aws_vpc.labi.id
  cidr_block        = var.private_subnet_cidr_b
  availability_zone = var.availability_zone2

  tags = {
    Name = "private-lu2"
  }
}