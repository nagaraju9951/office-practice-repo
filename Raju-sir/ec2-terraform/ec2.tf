
resource "aws_instance" "test_ec201" {
  ami                    = var.ami_id
  instance_type          = var.inst_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.testsg.id}"]
  subnet_id              = var.subnet_id

  tags = {
    Name = "test_ec201"
  }
}


resource "aws_security_group" "testsg" {
  vpc_id      =  var.vpc_id
  name = var.testsg_name
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
   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.testsg_name
  }
}
