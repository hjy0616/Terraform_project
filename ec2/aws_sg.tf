# resource "aws_security_group" "sg-webserver" {
#     name        = "webserver"
#     description = "sg-webserver"
#     vpc_id      = data.terraform_remote_state.vpc.outputs.vpc.vpc_id

#     ingress {
#         from_port       = 80
#         to_port         = 80
#         protocol        = "tcp"
#         cidr_blocks     = ["0.0.0.0/0"]
#         ipv6_cidr_blocks     = ["::/0"]
#     }

#     ingress {
#         from_port       = 22
#         to_port         = 22
#         protocol        = "tcp"
#         cidr_blocks     = ["211.210.199.148/32"]
#     }

#     ingress {
#         from_port       = 3306
#         to_port         = 3306
#         protocol        = "tcp"
#         cidr_blocks     = ["0.0.0.0/0"]
#         self            = false
#     }

#     ingress {
#         from_port       = 443
#         to_port         = 443
#         protocol        = "tcp"
#         cidr_blocks     = ["0.0.0.0/0"]
#         ipv6_cidr_blocks     = ["::/0"]
#     }


#     egress {
#         from_port       = 0
#         to_port         = 0
#         protocol        = "-1"
#         cidr_blocks     = ["0.0.0.0/0"]
#     }
# }

# resource "aws_security_group" "sg-ALB" {
#     name        = "ALB"
#     description = "sg-ALB"
#     vpc_id      = data.terraform_remote_state.vpc.outputs.vpc.vpc_id

#     ingress {
#         from_port       = 80
#         to_port         = 80
#         protocol        = "tcp"
#         cidr_blocks     = ["0.0.0.0/0"]
#         ipv6_cidr_blocks     = ["::/0"]
#     }

#     ingress {
#         from_port       = 443
#         to_port         = 443
#         protocol        = "tcp"
#         cidr_blocks     = ["0.0.0.0/0"]
#         ipv6_cidr_blocks     = ["::/0"]
#     }


#     egress {
#         from_port       = 0
#         to_port         = 0
#         protocol        = "-1"
#         cidr_blocks     = ["0.0.0.0/0"]
#     }
# }