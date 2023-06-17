# Jenkins Pipeline for Building and Deploying a Docker Image to Amazon ECS

This repository contains a Jenkins pipeline script that builds a Docker image from a Dockerfile, pushes the image to Amazon ECR (Elastic Container Registry), and updates the Amazon ECS (Elastic Container Service) task definition to use the new image.

## Prerequisites

- An Amazon Web Services (AWS) account
- A Jenkins server
- An Amazon ECR repository
- An Amazon ECS task definition with a container that uses the ECR repository as its image

## Setup

1. Clone this repository to your Jenkins server.
2. In Jenkins, create a new pipeline project and configure the project to use the Jenkinsfile in this repository.
3. Set up the following environment variables in the Jenkins pipeline project:
   - `AWS_ACCESS_KEY_ID`: The access key for an AWS IAM user that has permissions to manage ECR and ECS resources.
   - `AWS_SECRET_ACCESS_KEY`: The secret access key for the same AWS IAM user.
   - `AWS_DEFAULT_REGION`: The AWS region in which your ECR and ECS resources are located.
   - `ECR_REGISTRY`: The ECR registry URL (e.g. `123456789012.dkr.ecr.us-east-1.amazonaws.com`).
   - `ECR_REPOSITORY`: The name of the ECR repository to which you want to push the Docker image.
   - `ECS_CLUSTER`: The name of the ECS cluster that the task definition belongs to.
   - `ECS_SERVICE`: The name of the ECS service that you want to update with the new task definition.
   - `ECS_TASK_DEFINITION`: The name of the existing task definition that you want to update with the new Docker image.

## Usage

1. Make changes to the Dockerfile or the application code as needed.
2. Push the changes to the Git repository that is connected to the Jenkins pipeline.
3. Jenkins will automatically start the pipeline, which will build a new Docker image and push it to ECR.
4. The pipeline will then update the ECS task definition to use the new Docker image.
5. The ECS service will automatically deploy the new task definition and start running the updated Docker container(s).
