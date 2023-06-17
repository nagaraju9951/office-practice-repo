# ec2-terraform

- ## Create sample ec2 with terraform code

```bash
aws-vault exec my-aws -- terraform init
aws-vault exec my-aws -- terraform plan
aws-vault exec my-aws -- terraform apply
```

- ## Terminate ec2 instance

```bash
aws-vault exec ce-white -- terraform destroy
```
