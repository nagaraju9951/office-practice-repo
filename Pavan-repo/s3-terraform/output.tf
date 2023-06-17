output "bucket_name" {
  value = aws_s3_bucket.ce-bucket-tf.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.ce-bucket-tf.arn
}

