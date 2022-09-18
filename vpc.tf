resource "aws_vpc" "vpc" {

 cidr_block = "10.0.0.0/16"

 tags = {
   Name = "Vpc-for-${var.app_name}"
 }

}
