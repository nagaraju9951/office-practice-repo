# Create an ECS cluster
resource "aws_ecs_cluster" "demo_cluster" {
  name = "demo_cluster"
}

# Create a task execution role with required policies
resource "aws_iam_role" "task_execution_role" {
  name = "task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "task_execution_role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.task_execution_role.name
}

# Create an ECS task definition with Apache2 as a container image
resource "aws_ecs_task_definition" "demo_task_definition" {
  family                   = "demo_task"
  container_definitions    = jsonencode([{
    name            = "apache2"
    image           = "httpd:latest"
    essential       = true
    portMappings    = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
  memory          = 512
  cpu             = 256
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  execution_role_arn       = aws_iam_role.task_execution_role.arn
}


# Create an ECS service
resource "aws_ecs_service" "demo_service" {
  name            = "demo_service"
  cluster         = aws_ecs_cluster.demo_cluster.id
  task_definition = aws_ecs_task_definition.demo_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true

    subnets         = ["subnet-05a0d2e4eac48df49", "subnet-0db7d403b4dba1fa6"]
    security_groups = ["sg-0fbd952e613f632a0"]
  }
}
