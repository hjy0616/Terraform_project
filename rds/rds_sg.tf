# resource "aws_security_group" "sg-aurora" {
#   name        = "aurora"
#   description = "test Aurora SG"
#   vpc_id      = data.terraform_remote_state.vpc.outputs.vpc.vpc_id
  
#   # Not using 3306 for mysql is recommended
#   ingress {
#     from_port = 3306
#     to_port   = 3306
#     protocol  = "tcp"
#     security_groups = [data.terraform_remote_state.ec2.outputs.ec2.sg-web]
#     description = "Aurora whitelist from services."
#   }

#     egress {
#         from_port       = 0
#         to_port         = 0
#         protocol        = "-1"
#         cidr_blocks     = ["0.0.0.0/0"]
#     }
# }

# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [
#     data.terraform_remote_state.vpc.outputs.vpc.private-subnet-a, 
#     data.terraform_remote_state.vpc.outputs.vpc.private-subnet-c
#     ]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }