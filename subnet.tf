
resource "aws_subnet" "public_a" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = "10.0.0.0/24"

  availability_zone = "ap-northeast-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-1a-${var.app_name}"
  }
}

resource "aws_subnet" "private_a" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "PrivateSubnet-1a-${var.app_name}"
  }
} 

