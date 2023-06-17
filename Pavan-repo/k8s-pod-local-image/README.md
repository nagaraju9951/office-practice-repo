# K8s Pod Local Image

This repository contains a Kubernetes deployment configuration for running a Pod using a locally built Docker image.

## Prerequisites

Before deploying the Pod, ensure that the following prerequisites are met:

- Docker is installed on the local machine.
- Minikube is installed on the local machine.
- `kubectl` command-line tool is installed on the local machine and is configured to access the Kubernetes cluster.

## Building the Docker Image

To build the Docker image locally, run the following command:

```
docker build -t <image-name>:<tag> .

```

Replace `<image-name>` and `<tag>` with the desired name and version for the Docker image.

## Loading the Docker Image into Minikube

To use the locally built Docker image in Minikube, you need to load it into the Minikube Docker daemon by running the following command:

```
minikube image load <image-name>:<tag>
```

## Deploying the Pod

To deploy the Pod using the locally built Docker image, run the following command:

```
kubectl apply -f pod.yaml
```
This will create a new Pod in the Kubernetes cluster using the Docker image specified in the `pod.yaml` configuration file.

## Exposing the Pod as a Service

To expose the Pod as a service within the cluster, you can create a Kubernetes service using the following command:

```
kubectl expose pod <pod-name> --type=LoadBalancer --name=<service-name> --port=<port> --target-port=<target-port>
```

Replace `<pod-name>` with the name of the Pod you just created, `<service-name>` with the name of the service you want to create, `<port>` with the port you want to expose the service on, and `<target-port>` with the port on which your application is listening.

Once the service is created, you can access it using the IP address and port of the service. To get the IP address of the service, run the following command:

```
minikube service list
```


## Configuration

The `pod.yaml` configuration file can be customized to specify the desired image name and version, as well as other Pod configuration options such as environment variables, ports, and volumes.


