resource "aws_route_table" "public" {

  vpc_id = aws_vpc.vpc.id

  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "public-route-MemoryTank"
  }
}

resource "aws_route_table_association" "public_a" {

  subnet_id = aws_subnet.public_a.id

  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_c" {

  subnet_id = aws_subnet.public_c.id

  route_table_id = aws_route_table.public.id
}