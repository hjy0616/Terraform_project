data "terraform_remote_state" "vpc" {
  backend = "s3"
    config = {
      bucket = "sulfur-tfstate"
      key    = "terraform/terraform.tfstate"
     region = "ap-northeast-2"
  }
}