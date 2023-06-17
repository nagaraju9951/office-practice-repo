# for ec2
variable "ami_id" {}
variable "instance_type"{}
variable "key_name" {}
variable "sg_ids" {}
variable "subnet_id" {}
variable "region" {}
variable "Name" {}
variable "Environment" {}

# s3
variable "bucket" {}
variable "bucket-name" {}

# for rds
variable "name"{}
variable "subnet_ids" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "allocated_storage" {}
variable "storage_type" {}
variable "storage_encrypted" {}
variable "db_subnet_group_name" {}
variable "db_name" {}
variable "password" {}
variable "username" {}
variable "parameter_group_name" {}
variable "publicly_accessible" {}
variable "identifier" {}

