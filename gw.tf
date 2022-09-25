
resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw-${var.app_name}"
  }
  
}

resource "aws_eip" "eip_for_ngw" {

    vpc = true
    tags = {
      name = "EIP-${var.app_name}-Ngw"
    }

}

resource "aws_nat_gateway" "ngw_pub_a" {

  allocation_id = aws_eip.eip_for_ngw.id
  subnet_id = aws_subnet.public_a.id
  tags = {
    Name = "ngw-${var.app_name}"
  }


}
