variable "ec2-ami" {
    description = "create packer"
    default     = "ami-0bbee158770b57b35"
}

variable "az" {
    description = "availability_zones"
    type        = list(string)
    default     = ["ap-northeast-2a", "ap-northeast-2c" ]
}
