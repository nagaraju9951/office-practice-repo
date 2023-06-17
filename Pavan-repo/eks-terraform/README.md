# Terraform Configuration for Amazon EKS Cluster

This Terraform configuration sets up an Amazon EKS cluster with the necessary IAM roles and security group.

## Prerequisites

- AWS CLI configured with appropriate credentials.
- Terraform CLI installed.

## Configuration

1. Update the `terraform.tfvars` file or the variables directly in the `.tf` file with the desired values for the following variables:

   - `subnet_id_1`: ID of the first subnet where the EKS cluster will be deployed.
   - `subnet_id_2`: ID of the second subnet where the EKS cluster will be deployed.
   - `vpc_id`: ID of the VPC where the EKS cluster will be created.

2. Update the `output.tf` file to define the desired outputs from the EKS cluster. Add or modify the output variables as needed.


## Usage

1. Set the necessary variables in `terraform.tfvars` or update the variables directly in the `.tf` file.

2. Initialize the Terraform configuration:

```
terraform init
```

3. Review the execution plan:

```
terraform plan
```

4. Apply the Terraform configuration:

```
terraform apply
```

Make sure to confirm the execution by typing `yes` when prompted.

5. Once the provisioning is complete, the Amazon EKS cluster will be created along with the required IAM roles and security group.

## Customization

- Modify the EKS cluster name, region, version, VPC configuration, subnet IDs, and security group as needed.
- Adjust the IAM role names and policies attached to the roles by modifying the `aws_iam_role` and `aws_iam_role_policy_attachment` resources.

## Clean Up

To remove the created resources and clean up the environment, run:

```
terraform destroy
```

Confirm the execution by typing `yes` when prompted.

## Limitations

- Make sure you have the necessary permissions to create IAM roles, security groups, and EKS resources.
- Ensure that the IAM user or role executing Terraform has sufficient privileges to create and manage the resources.

