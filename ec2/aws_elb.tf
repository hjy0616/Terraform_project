# ###################### Target-group ################################
# resource "aws_lb_target_group" "external" {
#   name                 = "external"
#   port                 = 80
#   protocol             = "HTTP"
#   vpc_id               = data.terraform_remote_state.vpc.outputs.vpc.vpc_id
  
#   #health check setting 
#   health_check {
#     interval            = 15
#     port                = 80
#     path                = "/healthy.html"
#     timeout             = 3
#     healthy_threshold   = 3
#     unhealthy_threshold = 2
#     matcher             = "200"
#   }

#   tags = {
#     name = "external_lb"
#   }
# # }
# ###################### Target-group connect ec2 ################################
# resource "aws_lb_target_group_attachment" "i-1" {
#   target_group_arn = aws_lb_target_group.external.arn
#   target_id        = aws_instance.web.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "i-2" {
#   target_group_arn = aws_lb_target_group.external.arn
#   target_id        = aws_instance.web.id
#   port             = 443
# }

# resource "aws_lb_target_group_attachment" "i-3" {
#   target_group_arn = aws_lb_target_group.external.arn
#   target_id        = aws_instance.web1.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "i-4" {
#   target_group_arn = aws_lb_target_group.external.arn
#   target_id        = aws_instance.web1.id
#   port             = 443
# }

# ###################### For external LB ################################
# resource "aws_lb" "external" {
#   name     = "external"
#   subnets  = [
#     data.terraform_remote_state.vpc.outputs.vpc.public-subnet-a,
#     data.terraform_remote_state.vpc.outputs.vpc.public-subnet-c
#   ]
#   internal = false

#   security_groups = [
#     aws_security_group.sg-ALB.id
#   ]

#   load_balancer_type = "application"

#   tags = {
#    name = "external_lb"
#   }
# }

# #################### Listener for HTTP service ###########################
# resource "aws_lb_listener" "external_443" {
#   load_balancer_arn = aws_lb.external.arn
#   port              = "443"
#   protocol          = "HTTPS"

#   # If you want to use HTTPS, then you need to add certificate_arn here.
#   certificate_arn = aws_acm_certificate.cert.arn

#   default_action {
#     target_group_arn = aws_lb_target_group.external.arn
#     type             = "forward"
#   }
# }


# #################### Listener for HTTP service ###########################
# resource "aws_lb_listener" "external_80" {
#   load_balancer_arn = aws_lb.external.arn
#   port              = "80"
#   protocol          = "HTTP"
  
#   # This is for redirect 80. 
#   # This means that it will only allow HTTPS(443) traffic
#   default_action {
#     type = "redirect"

#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       # 301 -> Permanant Movement
#       status_code = "HTTP_301"
#     }
#   }
# }

########################### Route 53 create ##############################
resource "aws_route53_zone" "sulfur12" {
  name = "sulfur12.shop"
}

# ########################### Route53 Record ###############################
# resource "aws_route53_record" "external_dns" {
#   zone_id        = aws_route53_zone.sulfur12.zone_id
#   name           = aws_route53_zone.sulfur12.name
#   type           = "A"
#   set_identifier = "ap-northeast-2"

#   latency_routing_policy {
#     region = "ap-northeast-2"
#   }

#   alias {
#     name                   = aws_lb.external.dns_name
#     zone_id                = aws_lb.external.zone_id
#     evaluate_target_health = true
#   }
# }