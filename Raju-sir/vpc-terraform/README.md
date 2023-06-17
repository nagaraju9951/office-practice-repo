# Terraform code for sample VPC

- ### Create sample VPC with terraform module

```bash
aws-vault exec my-aws -- terraform init
aws-vault exec my-aws -- terraform plan
aws-vault exec my-aws -- terraform apply
```

- ## Decommission sample VPC 

```bash
aws-vault exec ce-white -- terraform destroy
```

