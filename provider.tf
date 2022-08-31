provider "aws" {
	region = "ap-northeast-2"
}

terraform {
  backend "s3" {
    bucket    = "sulfur-tfstate"
    key       = "terraform/terraform.tfstate"
    region    = "ap-northeast-2"
    encrypt   = "true"
  }
}


#module settings
module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source = "./ec2"
}

module "rds" {
  source = "./rds"
}

#output settings
output "ec2" {  
  value = module.ec2  
}

output "vpc" {  
  value = module.vpc  
}

output "rds" {  
  value = module.rds  
}
