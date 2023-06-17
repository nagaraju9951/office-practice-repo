
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

resource "aws_instance" "app02" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.appsg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "dev-sales-app02"
  }
}


resource "aws_instance" "master" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.appsg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "dev-sales-master"
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
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.appsg_name
  }
}

