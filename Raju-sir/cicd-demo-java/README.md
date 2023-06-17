## CICD demo with sample java application


- ### Create EC2 Instances using Terraform

```bash
#Export AWS credentials
export AWS_ACCESS_KEY_ID=AKIAIOSFOD*********
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI********
export AWS_DEFAULT_REGION=us-east-1
#Run Terraform
terraform init
terraform plan
terraform apply
```

- ### Run Ansible Playbook for installing Jenkins

```bash
ansible-playbook -i Inventory install-jenkins.yaml
```

- ### Run Ansible Playbook for installing Tomcat

```bash
ansible-playbook -i Inventory install-tomcat
```

- ### Run Ansible Playbook for installing Docker

```bash
ansible-playbook -i Inventory install-docker.yaml
```

- ### Decommission EC2 Instances 

```bash
terraform destroy
```

