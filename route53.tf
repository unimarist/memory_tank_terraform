resource "aws_route53_zone" "mydomain" {
  
  name = var.domain_name

}

resource "aws_route53_record" "web" {

  zone_id = aws_route53_zone.mydomain.zone_id
  name = "www.${aws_route53_zone.mydomain.name}"
  type = "A"
  alias {
    name = aws_lb.web.dns_name
    zone_id = aws_lb.web.zone_id
    evaluate_target_health = true  
  }
    
}