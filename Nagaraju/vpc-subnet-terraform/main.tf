provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "our_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.our_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.our_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_az

  tags = {
    Name = var.private_subnet_name
  }
}

# Create internet gateway
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.our_vpc.id

  tags = {
    Name = var.igw_name
  }
}



