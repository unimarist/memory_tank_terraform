#resource "aws_acm_certificate" "cert" {

#  domain_name = var.domain_name
#  subject_alternative_names = ["*.${var.domain_name}"]
#  validation_method = "DNS"
#  tags = {
#    name = "sslcertification"
#  }

#}

#resource "aws_acm_certificate_validation" "cert" {

#  certificate_arn = aws_acm_certificate.cert.arn
#  validation_record_fqdns = [aws_route53_record.cert_validation.fqdn]

#}

#resource "aws_route53_record" "cert_validation" {

#  zone_id = aws_route53_zone.mydomain.zone_id
#  name    = aws_acm_certificate.cert.domain_validation_options[0].resource_record_name
#  type    = aws_acm_certificate.cert.domain_validation_options[0].resource_record_type
#  records = [aws_acm_certificate.cert.domain_validation_options[0].resource_record_value]
#  ttl = 60

#}

#resource "aws_lb_listener" "web_443" {

#  load_balancer_arn = aws_lb.web.arn
#  port = "443"
#  protocol = "HTTPS"
#  certificate_arn = aws_acm_certificate.cert.arn
#  default_action {
#    type = "forward"
#    target_group_arn = aws_lb_target_group.web.arn
#  }

#}
