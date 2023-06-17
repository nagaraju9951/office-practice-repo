

variable "region" {
  description = "The AWS region to create the VPC and subnets in"
  default     = "us-east-1"
  }
  # for vpc
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  default     = "example-vpc"
}

# for public subnet

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_az" {
  description = "The availability zone for the public subnet"
  default     = "us-east-1a"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  default     = "public-subnet"
}

# for private subnet
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet_az" {
  description = "The availability zone for the private subnet"
  default     = "us-east-1b"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  default     = "private-subnet"
}

# for internet gate way
variable "igw_name" {
    description = "The name of internet gateway"
}



