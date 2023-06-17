# Docker Compose Example

This is a simple example of using Docker Compose to build and run a Flask application with Redis.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. Clone the repository and change to the project directory:
```
git clone https://git.cloudavise.com/visops/t056/docker-compose.git
```

```
cd docker-compose
```

2. Build the Docker images and start the containers:
```
docker-compose up
```


3. Access the application in your web browser at http://localhost:5000/

4. To stop the containers, use the following command:
```
docker-compose down
```


## Files

- `app.py`: A simple Flask application that uses Redis to count the number of page views.
- `Dockerfile`: A Dockerfile for building the Flask application image.
- `requirements.txt`: A list of Python dependencies for the Flask application.
- `docker-compose.yml`: A Docker Compose file that defines the services for the Flask application and Redis.

## Services

### Web

The `web` service runs the Flask application and exposes port 5000.

### Redis

The `redis` service runs the Redis database.


