
resource "aws_instance" "sample-tf" {
ami                     = var.ami_id
instance_type           = var.instance_type
key_name                = var.key_name
vpc_security_group_ids  = var .sg_ids
subnet_id               = var.subnet_id
}


