
terraform {
  backend "s3" {
    key            = "infrastructure/test/vpc/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "raju-us-east-1-tfstates"
    encrypt        = true
  }
}
