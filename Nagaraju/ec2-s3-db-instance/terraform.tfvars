# for Ec2-instance
ami_id                  = "ami-00c39f71452c08778"
instance_type           = "t2.micro"
key_name                = "demokey"
sg_ids                  = ["sg-02e9238f2557e4bef"]
subnet_id               = "subnet-032fb21e1ee472561"
Environment             = "Development-snr"
Name                    = "ec2-1"

#for s3 bucket
bucket               = "my-s3-4-snr"
bucket-name          = "testing"
  
  # for rds 
  name       = "dell-subnet-groups-1"
  subnet_ids = ["subnet-061c5aa91120d6221", "subnet-032fb21e1ee472561"]
  identifier          = "delldb"
  engine              = "postgres"
  engine_version      = "12.7"
  instance_class      = "db.t3.micro"
  allocated_storage   =  12
  storage_type        = "gp2"
  storage_encrypted   =   true
  db_subnet_group_name = "dell-subnet-groups-1"
  db_name                = "ourdatabase"
  username            = "naga"
  password            = "password"
  parameter_group_name = "default.postgres12"
  region              = "us-east-1"
  publicly_accessible =   true
