############################ import ami #######################################
# # packer 사용시 사용안함.
# data "aws_ami" "amazon" {
#     owners      = ["amazon"]
#     most_recent = true


#  filter {
#    name   = "owner-alias"
#    values = ["amazon"]
#  }


#  filter {
#    name   = "name"
#    values = ["amzn2-ami-hvm*"]
#  }
# }


# ############################ create aws_instance #######################################
# resource "aws_instance" "web" {
#     ami                         = var.ec2-ami #ceate packer ami.id
#     availability_zone           = var.az[0]
#     instance_type               = "t2.micro"
#     key_name                    = aws_key_pair.test_key.id
#     subnet_id                   = data.terraform_remote_state.vpc.outputs.vpc.public-subnet-a
#     vpc_security_group_ids      = [aws_security_group.sg-webserver.id]
#     associate_public_ip_address = true

#     user_data = <<-EOF
#         #!/bin/bash
#         sudo echo "health check1" > /var/www/html/healthy.html
#         EOF

#     tags = {
#         Name = "WebServer"
#     }
# }

# resource "aws_instance" "web1" {
#     ami                         = var.ec2-ami #ceate packer ami.id
#     availability_zone           = var.az[1]
#     instance_type               = "t2.micro"
#     key_name                    = aws_key_pair.test_key.id
#     subnet_id                   = data.terraform_remote_state.vpc.outputs.vpc.public-subnet-c
#     vpc_security_group_ids      = [aws_security_group.sg-webserver.id]
#     associate_public_ip_address = true

#     user_data =  <<-EOF
#         #!/bin/bash
#         sudo echo "health check2" > /var/www/html/healthy.html
#         EOF

#     tags = {
#         Name = "WebServer1"
#     }
# }