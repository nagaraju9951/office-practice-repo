# docker-swarm demo

### 1. Terraform - IAC

- create demo ec2 instances

```bash
aws-vault exec my-aws -- terraform init
aws-vault exec my-aws -- terraform plan
aws-vault exec my-aws -- terraform apply
```

### 2. Install Docker in all nodes

- Install Docker in all webservers

```bash
ansible-playbook -i inventory install-docker.yaml
```

### 3. Create Docker Swarm cluster, and deploy sample applications

#### Create Docker swarm cluster in master node

```bash
docker swarm init
```

#### Join worker nodes to Docker swarm cluster

```bash
docker swarm join --token SWMTKN-1-2hyn8v3qytkz23vlsd9or92n9843ugyjy45qhqoknmibj9599c-bo27ga0u57qql3jijku4i5m09 10.7.2.102:2377
```

#### Create and manage services in Docker swarm clouster

```bash
docker node ls
docker service create   --name blue-service   --publish published=8081,target=8080  --replicas 6 ynraju4/srv-blue:6
docker ps
docker service rm green-service
docker ps
docker service scale green-service=4
```
