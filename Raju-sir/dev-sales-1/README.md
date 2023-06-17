# dev-sales-1 Environment Deplotment

### 1. Terraform - IAC

- create demo ec2 instances

```bash
aws-vault exec my-aws -- terraform init
aws-vault exec my-aws -- terraform plan
aws-vault exec my-aws -- terraform apply
```

### 2. Install Ansible role with Ansible Galaxy

- Install role for Docker Installation

```bash
cd ansible
mkdir roles
ansible-galaxy install -p ./roles -r requirements.yaml
```

### 3. Install Docker and Deploy SalesApp

- Install Docker in all webservers

```bash
ansible-playbook -i inventory install-docker.yaml
```

- Build Doker SalesApp image, and run SalesApp container

```bash
ansible-playbook -i inventory deploy-webapp.yaml
```

### 4. Install and Configure HAProxy

- install HAProxy in loadbalancer

```bash
ansible-playbook -i inventory install-haproxy.yaml
```

- Configure HAProxy in loadbalancer

```bash
ansible-playbook -i inventory configure-haproxy.yaml
```

### 5. Destroy ec2 instances

```bash
aws-vault exec my-aws -- terraform destroy
```
