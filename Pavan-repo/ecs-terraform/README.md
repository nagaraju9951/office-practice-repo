# Terraform AWS ECS Cluster and Service

This is a Terraform project that creates an AWS ECS cluster, task execution role with required policies, a task definition with Apache2 as a container image, and an ECS service.

## Prerequisites

- AWS account
- AWS CLI installed
- Terraform installed

## Getting Started

1. Clone the repository.
2. Navigate to the project directory.
3. Run `terraform init` to initialize the Terraform backend.
4. Run `terraform plan` to see the resources that will be created.
5. Run `terraform apply` to create the resources.
6. Once the resources are created, navigate to the Amazon ECS console to verify that the service is running.

## Cleanup

To remove the resources created by this project, run `terraform destroy`.

## Variables

This project uses the following variables:

| Variable | Default | Description |
| --- | --- | --- |
| region | us-east-1 | The AWS region to create the resources in. |
| vpc_id | N/A | The ID of the VPC to create the resources in. |
| subnets | N/A | A list of IDs of the subnets to create the resources in. |
| security_groups | N/A | A list of IDs of the security groups to create the resources in. |

These variables can be set in a `terraform.tfvars` file or passed in via the command line.

## Author

This project was created by [Mohan Jaji](https://git.cloudavise.com/mohanjaji).
