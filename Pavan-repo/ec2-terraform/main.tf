resource "aws_instance" "ec2-instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = var.security_group
    subnet_id = var.subnet_id[0]
    key_name = var.key_pair_name
    associate_public_ip_address = true
    
tags = {
    name = var.instance_name
    }
}