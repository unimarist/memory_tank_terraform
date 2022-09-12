
resource "aws_subnet" "public_a" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = "10.0.0.0/24"

  availability_zone = "ap-northeast-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-1a-MemoryTank"
  }
}

resource "aws_subnet" "private_a" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "PrivateSubnet-1a-MemoryTank"
  }
} 

resource "aws_subnet" "public_c" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-northeast-1c"

  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-1c-MemoryTank"
  }
}

resource "aws_subnet" "private_c" {

  vpc_id = aws_vpc.vpc.id

  cidr_block = "10.0.3.0/24"

  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "PrivateSubnet-1c-MemoryTank"
  }
} 
