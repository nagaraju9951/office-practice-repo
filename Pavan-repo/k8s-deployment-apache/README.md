# K8s Deployment with Ngnix image

This repository contains a Kubernetes deployment configuration for running a Pod using a locally built Docker image.

## Prerequisites

Before deploying the Pod, ensure that the following prerequisites are met:

- Docker is installed on the local machine.
- Minikube is installed on the local machine.
- `kubectl` command-line tool is installed on the local machine and is configured to access the Kubernetes cluster.


## Deploying the Pod

To create the Deployment using Ngnix image, run the following command:

```
kubectl apply -f ngnix-deployment.yaml
```
This will create a new deployment in the Kubernetes cluster using the ngnix image specified in the `ngnix-deployment.yaml` configuration file.

## Exposing the Deployment as a Service

To expose the Deployment as a service within the cluster, you can create a Kubernetes service using the following command:

```
kubectl apply -f service.yml
```


Once the service is created, you can access it using the IP address and port of the service. To get the IP address of the service, run the following command:

```
kubectl get svc <service-name>
```


## Configuration

The `ngnix-deployment.yaml` configuration file can be customized to specify the desired image name and version, as well as other deployment configuration options such as environment variables, replicas, ports, and volumes.


