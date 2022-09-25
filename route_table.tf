resource "aws_route_table" "public" {

  vpc_id = aws_vpc.vpc.id
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "public-route-${var.app_name}"
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

resource "aws_route_table" "private_a" {

  vpc_id = aws_vpc.vpc.id
  route {
    nat_gateway_id = aws_nat_gateway.ngw_pub_a.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "private-route-${var.app_name}"
  }
}

resource "aws_route_table_association" "private_a" {

  subnet_id = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_a.id
}