# for vpc
output "vpc_id" {
  value = aws_vpc.our_vpc.id
}
# for public subnet
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
# for private subnet
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

#for output 
output "igw_id" {
  value = aws_internet_gateway.example_igw.id
}
