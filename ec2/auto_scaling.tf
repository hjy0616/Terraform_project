# ########################## create launch template ##########################
# resource "aws_launch_template" "web" {
#   name = "web"

#   ebs_optimized = true

#   image_id = var.ec2-ami

#   instance_type = "t2.micro"

#   key_name = "test"

#   vpc_security_group_ids = [aws_security_group.sg-webserver.id]

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "launch-test"
#     }
#   }

#   tags = {
#     Name = "test"
#   }
# }


# ######################## auto-scaling setting ##########################
# resource "aws_autoscaling_group" "bar" {
#   desired_capacity   = 1
#   max_size           = 2
#   min_size           = 1
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   vpc_zone_identifier       = [
#     data.terraform_remote_state.vpc.outputs.vpc.public-subnet-a, 
#     data.terraform_remote_state.vpc.outputs.vpc.public-subnet-c
#     ]

#   initial_lifecycle_hook {
#     name                 = "foobar"
#     default_result       = "CONTINUE"
#     heartbeat_timeout    = 60
#     lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

#         notification_metadata = <<-EOF
#         {
#             "foo": "bar"
#         }
#         EOF
#     
#     instance_refresh = {
#       strategy = "Rolling"
#       preferences = {
#         min_healthy_percentage = 50
#     }
#     triggers = ["tag"]
#   }
# }

#   launch_template {
#     id      = aws_launch_template.web.id
#     version = "${aws_launch_template.web.latest_version}"
#   }
# }
# ############################# attachment ###############################
# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = aws_autoscaling_group.bar.id
#   elb                    = aws_lb.external.id
# }
