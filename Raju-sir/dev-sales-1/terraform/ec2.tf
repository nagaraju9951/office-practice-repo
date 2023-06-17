
resource "aws_instance" "app01" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.appsg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "dev-sales-app01"
  }
}



resource "aws_instance" "lb" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.lbsg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "dev-sales-lb"
  }
}


resource "aws_security_group" "lbsg" {
  vpc_id      =  var.vpc_id
  name = var.lbsg_name
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["3.221.51.151/32"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.lbsg_name
  }
}


resource "aws_security_group" "appsg" {
  vpc_id      =  var.vpc_id
  name = var.appsg_name
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["3.221.51.151/32"]
  }

   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.lbsg.id}"]
  }
   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = ["${aws_security_group.lbsg.id}"]
  }

  tags = {
    Name = var.appsg_name
  }
}