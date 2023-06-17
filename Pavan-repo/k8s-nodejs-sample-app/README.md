# Kubernetes Node.js Sample App

This repository contains a Kubernetes deployment configuration for running a Pod using a Docker image from an Amazon ECR repository.

## Prerequisites

Before deploying the Pod, ensure that the following prerequisites are met:

- Docker is installed on the local machine.
- Minikube is installed on the local machine.
- `kubectl` command-line tool is installed on the local machine and is configured to access the Kubernetes cluster.

## Pulling the Docker Image from ECR

To use the Docker image from your ECR repository, follow these steps:

1. Configure your AWS CLI credentials using the `aws configure` command.

2. Create a Kubernetes secret that stores your ECR credentials by running the following command:

```
kubectl create secret docker-registry ecr-credentials
--docker-server=<account-id>.dkr.ecr.<region>.amazonaws.com
--docker-username=AWS
--docker-password=$(aws ecr get-login-password --region <region>)
--docker-email=<email>
```

Replace `<account-id>` with your AWS account ID, `<region>` with the AWS region where your ECR repository is located, and `<email>` with your email associated with the AWS account.

3. Update the `pod.yaml` configuration file to reference the created secret. In the `spec` section of the Pod definition, add the `imagePullSecrets` field:

```
spec:
  imagePullSecrets:
  - name: ecr-credentials
```
  
4. Deploy the Pod using the updated configuration file by running the following command:
  
```
  kubectl apply -f pod.yml
```
This will create a new Pod in the Kubernetes cluster using the Docker image from your ECR repository.

5. Expose the Pod as a service within the cluster using the desired configuration by running the following command:
```
kubectl apply -f service.yml

```

Once the service is created, you can access it using the IP address and port of the service. To get the IP address of the service, run the following command:

```
minikube service list

```

## Configuration
The pod.yaml configuration file can be customized to specify the desired image name and version, as well as other Pod configuration options such as environment variables, ports, and volumes.

