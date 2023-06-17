# S3 Bucket

This Terraform resource creates an S3 bucket with versioning enabled and a lifecycle policy that transitions objects to the Glacier storage class after 30 days.

## Usage

```
resource "aws_s3_bucket" "ce-bucket-tf" {
  bucket = var.bucket_name
  versioning {
      enabled = true
   }
  tags = {
    Name        = "my tf bucket"
  }

  lifecycle {
    rule {
      id      = "transition-to-glacier"
      status  = "Enabled"

      transition {
        days          = 30
        storage_class = "GLACIER"
      }
    }
  }
}

```




| Inputs       | Description                                | Type   | Default | Required |
|--------------|--------------------------------------------|--------|---------|----------|
| bucket_name  | The name of the S3 bucket to create.        | string | n/a     | yes      |

| Outputs      | Description               |
|--------------|---------------------------|
| bucket_name  | The name of the S3 bucket. |
| bucket_arn   | The ARN of the S3 bucket.  |


## Authors
Module managed by [Mohan Jaji](https://git.cloudavise.com/mohanjaji).

## Resources Created
- **'aws_s3_bucket.ce-bucket-tf'**: The S3 bucket resource.
- **'aws_s3_bucket_lifecycle_configuration.lifecycle'**: The S3 bucket lifecycle policy.

## Requirements
- Terraform version 1.3.3 or greater.
- An AWS account and credentials with permission to create S3 resources.

## Installation
1. Clone this repository to your local machine.
2. Run **'terraform init'** to initialize the module.
3. Modify the **'bucket_name'** variable in your Terraform configuration file as desired.
4. Run **'terraform apply'** to create the S3 bucket.

## Updating
To update the module to a newer version, pull the latest version of the repository and run **'terraform init'** to download any new dependencies.

## Removal
To remove the S3 bucket and all associated resources, run **'terraform destroy'**. Note that this will permanently delete all objects in the bucket, as well as the bucket itself.

## Contributing
Contributions are welcome! If you have an idea for how to improve this module, please create an issue or pull request on GitHub.

## Support
If you encounter any issues or have any questions about this module, please create an issue on GitHub.

## Resources
- [AWS S3 Bucket documentation](https://docs.aws.amazon.com/s3/index.html)
- [Terraform AWS S3 Bucket documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

