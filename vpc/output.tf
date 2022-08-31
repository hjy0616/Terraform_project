output "vpc_id" {
    value       = aws_vpc.test-vpc.id
}

#public subnet
output "public-subnet-a" {
    value       = aws_subnet.subnet-test-public-2a.id
}

output "public-subnet-c" {
    value       = aws_subnet.subnet-test-public-2c.id
}

#private subnet
output "private-subnet-a" {
    value       = aws_subnet.subnet-test-private-2a.id
}

output "private-subnet-c" {
    value       = aws_subnet.subnet-test-private-2c.id
}
