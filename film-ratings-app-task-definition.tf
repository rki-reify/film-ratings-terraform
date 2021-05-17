data "aws_ecs_task_definition" "reify_interview_app" {
  task_definition = "${aws_ecs_task_definition.reify_interview_app.family}"
  depends_on = ["aws_ecs_task_definition.reify_interview_app"]
}

resource "aws_ecs_task_definition" "reify_interview_app" {
  family                = "reify_interview_app"
  container_definitions = <<DEFINITION
[
  {
    "name": "reify_interview_app",
    "image": "${var.reify_interview_app_image}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ],
    "environment": [
      {
        "name": "DB_HOST",
        "value": "${aws_lb.reify_interview_nw_load_balancer.dns_name}"
      },
      {
        "name": "DB_PASSWORD",
        "value": "${var.db_password}"
      }
    ],
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "reify_interview_app",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "ecs"
        }
    },
    "memory": 1024,
    "cpu": 256
  }
]
DEFINITION
}
