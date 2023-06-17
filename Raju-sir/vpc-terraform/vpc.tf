module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-01"
  cidr = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]


  tags = {
    Environment = "test"
  }
}