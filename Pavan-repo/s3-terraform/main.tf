resource "aws_s3_bucket" "ce-bucket-tf" {
  bucket = var.bucket_name
  versioning {
      enabled = true
   }
  tags = {
    Name        = var.tag_name
  }

  lifecycle {
    rule {
      id      = var.id
      status  = "Enabled"

      transition {
        days          = 30
        storage_class = "GLACIER"
      }
    }
  }
}

