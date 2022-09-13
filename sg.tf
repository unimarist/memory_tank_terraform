resource "aws_security_group" "web_sg" {

 vpc_id = aws_vpc.vpc.id
 tags = {
   Name = "web-sg-MemoryTank"
 }

}

resource "aws_security_group_rule" "egress_web_sg" {

  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id

}

resource "aws_security_group_rule" "ingress_web_sg_22" {

 type = "ingress"
 from_port = "22"
 to_port = "22"
 protocol = "tcp"
 cidr_blocks = [var.web_sg_22_cidr_block]
 security_group_id = aws_security_group.web_sg.id

}

resource "aws_security_group_rule" "ingress_web_sg_80" {

 type = "ingress"
 from_port = "80"
 to_port = "80"
 protocol = "tcp" 
 source_security_group_id = aws_security_group.alb_sg.id
 security_group_id = aws_security_group.web_sg.id

}

resource "aws_security_group_rule" "ingress_web_sg_443" {

 type = "ingress"
 from_port = "443"
 to_port = "443"
 protocol = "tcp" 
 source_security_group_id = aws_security_group.alb_sg.id
 security_group_id = aws_security_group.web_sg.id
 
}

resource "aws_security_group" "alb_sg" {

 vpc_id = aws_vpc.vpc.id
 tags = {
   Name = "alb-sg-MemoryTank"
 }

}

resource "aws_security_group_rule" "egress_alb_sg" {

  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id

}

resource "aws_security_group_rule" "ingress_alb_sg_80" {

 type = "ingress"
 from_port = "80"
 to_port = "80"
 protocol = "tcp" 
 cidr_blocks = ["0.0.0.0/0"]
 security_group_id = aws_security_group.alb_sg.id

}

resource "aws_security_group_rule" "ingress_alb_sg_443" {

 type = "ingress"
 from_port = "443"
 to_port = "443"
 protocol = "tcp" 
 cidr_blocks = ["0.0.0.0/0"]
 security_group_id = aws_security_group.alb_sg.id

}

resource "aws_security_group" "private_sg" {

 vpc_id = aws_vpc.vpc.id
 tags = {
   Name = "private-sg-MemoryTank"
 }

}

resource "aws_security_group_rule" "egress_private_sg" {

  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_sg.id

}

resource "aws_security_group_rule" "ingress_private_sg_3306" {

 type = "ingress"
 from_port = "3306"
 to_port = "3306"
 protocol = "tcp" 
 source_security_group_id = aws_security_group.web_sg.id
 security_group_id = aws_security_group.private_sg.id
 
}