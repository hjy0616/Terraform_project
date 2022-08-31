resource "aws_vpc" "test-vpc" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags = {
        Name = "test-vpc"
    }
}

resource "aws_subnet" "subnet-test-public-2a" {
    vpc_id                  = aws_vpc.test-vpc.id
    cidr_block              = "10.0.20.0/24"
    availability_zone       = var.az[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "test-public-2a"
    }
}

resource "aws_subnet" "subnet-test-private-2a" {
    vpc_id                  = aws_vpc.test-vpc.id
    cidr_block              = "10.0.21.0/24"
    availability_zone       = var.az[0]
    map_public_ip_on_launch = false

    tags = {
        Name = "test-private-2a"
    }
}

resource "aws_subnet" "subnet-test-private-2c" {
    vpc_id                  = aws_vpc.test-vpc.id
    cidr_block              = "10.0.11.0/24"
    availability_zone       = var.az[1]
    map_public_ip_on_launch = false

    tags = {
        Name = "test-private-2c"
    }
}

resource "aws_subnet" "subnet-test-public-2c" {
    vpc_id                  = aws_vpc.test-vpc.id
    cidr_block              = "10.0.10.0/24"
    availability_zone       = var.az[1]
    map_public_ip_on_launch = true

    tags = {
        Name = "test-public-2c"
    }
}

# igw
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.test-vpc.id

    tags = {
        Name = "igw"
    }
}

#nat gateway / eip
# resource "aws_eip" "nat_c" {
#   vpc   = true

#   lifecycle {
#     create_before_destroy = true
#   }

#   tags = {
#       name = "NAT gateway"
#   }
# }

# resource "aws_eip" "nat_a" {
#   vpc   = true

#   lifecycle {
#     create_before_destroy = true
#   }
#     tags = {
#       name = "NAT gateway1"
#   }
# }
# ######################### create nat_gateway ############################
# resource "aws_nat_gateway" "nat_gateway_c" {
#   allocation_id = aws_eip.nat_c.id

#   subnet_id = aws_subnet.subnet-test-public-2c.id

#   tags = {
#     Name = "test-NAT-2c"
#   }
# }

# resource "aws_nat_gateway" "nat_gateway_a" {
#   allocation_id = aws_eip.nat_a.id

#   subnet_id = aws_subnet.subnet-test-public-2a.id

#   tags = {
#     Name = "test-NAT-2a"
#   }
# }

# ######################### create route table ###########################
# resource "aws_route_table" "test-private-2a" {
#     vpc_id     = aws_vpc.test-vpc.id

#     route {
#         cidr_block = "0.0.0.0/0"
#         nat_gateway_id = var.ngw[0]
#     }

#     tags = {
#         Name = "test-private-2a"
#     }
# }

# resource "aws_route_table" "test-private-2c" {
#     vpc_id     = aws_vpc.test-vpc.id

#     route {
#         cidr_block = "0.0.0.0/0"
#         nat_gateway_id = var.ngw[1]
#     }

#     tags = {
#         Name = "test-private-2c"
#     }
# }

resource "aws_route_table" "test-public-2a" {
    vpc_id     = aws_vpc.test-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "test-public-2a"
    }
}

resource "aws_route_table" "test-public-2c" {
    vpc_id     = aws_vpc.test-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "test-public-2c"
    }
}

#route_table_association private/public
# resource "aws_route_table_association" "as-test-private-2a" {
#     route_table_id = aws_route_table.test-private-2a.id
#     subnet_id = aws_subnet.subnet-test-private-2a.id
# }

# resource "aws_route_table_association" "as-test-private-2c" {
#     route_table_id = aws_route_table.test-private-2c.id
#     subnet_id = aws_subnet.subnet-test-private-2c.id
# }

resource "aws_route_table_association" "as-test-public-2a" {
    route_table_id = aws_route_table.test-public-2a.id
    subnet_id = aws_subnet.subnet-test-public-2a.id
}

resource "aws_route_table_association" "as-test-public-2c" {
    route_table_id = aws_route_table.test-public-2c.id
    subnet_id = aws_subnet.subnet-test-public-2c.id
}