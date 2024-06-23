# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.labi.id

  tags = {
    Name = "abi-lu-igw"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.labi.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Associate Route Table with Public Subnets
resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.public-lu1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-b" {
  subnet_id      = aws_subnet.public-lu2.id
  route_table_id = aws_route_table.public.id
}

# Route Table for Private Subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.labi.id

  tags = {
    Name = "private-route-table"
  }
}

# Associate Route Table with Private Subnet
resource "aws_route_table_association" "private-a" {
  subnet_id      = aws_subnet.private-lu1.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private-b" {
  subnet_id      = aws_subnet.private-lu2.id
  route_table_id = aws_route_table.private.id
}
