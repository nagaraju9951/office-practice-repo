resource "aws_instance" "lb" {
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.lb_security_group.id]
    subnet_id = aws_subnet.public_subnet_1.id
    key_name = var.key_pair_name
    associate_public_ip_address = true

    user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get upgrade -y
        EOF
    
tags = {
    name = var.lb_instance_name
    }
}
resource "aws_instance" "app_inst" {
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.app_security_group.id]
    subnet_id = aws_subnet.public_subnet_2.id
    key_name = var.key_pair_name
    associate_public_ip_address = true

    user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get upgrade -y
        EOF
    
tags = {
    name = var.app_instance_name
    }
}
resource "aws_security_group" "lb_security_group" {
  name = "lb_sg"
  description = "Security Group for load balancer"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "Allow incoming HTTP traffic from anywhere"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow incoming HTTPS traffic from anywhere"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "Allow incoming SSH traffic from myip"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["49.204.239.163/32"]
  }

 egress {
  description = "Allow all outgoing traffic to anywhere"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

}
resource "aws_security_group" "app_security_group" {
  name = "app_sg"
  description = "Security Group for application"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "Allow incoming HTTP traffic from load balancer"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.lb_security_group.id]
  }

  ingress {
    description = "Allow incoming HTTPS traffic from load balancer"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_groups = [aws_security_group.lb_security_group.id]
  }

    ingress {
    description = "Allow incoming SSH traffic from myip"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["49.204.239.163/32"]
  }

 egress {
  description = "Allow all outgoing traffic to anywhere"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}
