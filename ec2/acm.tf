############################# create acm ################################
resource "aws_acm_certificate" "cert" {
  domain_name       = "sulfur12.shop"
  validation_method = "DNS"

  tags = {
    Name = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

############################# import cert ################################
data "aws_route53_zone" "cert" {
  name         = "sulfur12.shop"
  private_zone = false
}

############################# connect route53 cert ################################
resource "aws_route53_record" "cert" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

    allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.cert.zone_id
}

############################# Verification route53&acm ################################
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert : record.fqdn]
}