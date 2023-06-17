
resource "aws_instance" "jenkins" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.jenkins_key_name
  vpc_security_group_ids = ["${aws_security_group.jenkinssg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "jenkins"
  }
}



resource "aws_instance" "nginx-server" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.webapp_key_name
  vpc_security_group_ids = ["${aws_security_group.webappsg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "webapp01"
  }
}


resource "aws_security_group" "jenkinssg" {
  vpc_id      =  var.vpc_id
  name = "jenkinssg"
  description = "Allows ssh and all egress traffic"
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
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "jenkinssg"
  }
}

resource "aws_security_group" "webappsg" {
  vpc_id      =  var.vpc_id
  name = "webappsg"
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["${aws_security_group.jenkinssg.id}"]
  }

  tags = {
    Name = "webappsg"
  }
}
