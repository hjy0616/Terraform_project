# data "terraform_remote_state" "vpc" {
#   backend = "s3"
#     config = {
#       bucket = "sulfur-tfstate"
#       key    = "terraform/terraform.tfstate"
#      region = "ap-northeast-2"
#   }
# }

# data "terraform_remote_state" "ec2" {
#   backend = "s3"
#     config = {
#       bucket = "sulfur-tfstate"
#       key    = "terraform/terraform.tfstate"
#      region = "ap-northeast-2"
#   }
# }