output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main_igw.id
}

output "public_ip_lb" {
  value = aws_instance.lb.public_ip
}

output "private_ip_lb" {
  value = aws_instance.lb.private_ip
}

output "instance_id_lb" {
  value = aws_instance.lb.id
}

output "public_ip_app" {
  value = aws_instance.app_inst.public_ip
}

output "private_ip_app" {
  value = aws_instance.app_inst.private_ip
}

output "instance_id_app" {
  value = aws_instance.app_inst.id
}
