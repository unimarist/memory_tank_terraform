resource "aws_lb" "web" {

  name = "ALB-${var.app_name}"
  load_balancer_type = "application"
  internal = false
  security_groups = [aws_security_group.alb_sg.id]
  subnets = [aws_subnet.public_a.id,aws_subnet.public_c.id]
  enable_deletion_protection = false
  tags = {
    Name = "ALB-${var.app_name}"
  }

}

resource "aws_lb_listener" "web" {

  load_balancer_arn = aws_lb.web.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
    target_group_arn = aws_lb_target_group.web.arn
  }

}

resource "aws_lb_target_group" "web" {

  name = "ALB-Target-${var.app_name}"
  vpc_id = aws_vpc.vpc.id
  port = 80
  protocol = "HTTP"

}

resource "aws_lb_target_group_attachment" "web" {

  target_group_arn = aws_lb_target_group.web.arn
  target_id = aws_instance.webap.id
  port = 80

}