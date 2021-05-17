resource "aws_ecs_service" "reify_interview_app_service" {
  name            = "reify_interview_app_service"
  iam_role        = "${aws_iam_role.ecs-service-role.name}"
  cluster         = "${aws_ecs_cluster.reify_interview_ecs_cluster.id}"
  task_definition = "${aws_ecs_task_definition.reify_interview_app.family}:${max("${aws_ecs_task_definition.reify_interview_app.revision}", "${data.aws_ecs_task_definition.reify_interview_app.revision}")}"
  desired_count   = "${var.desired_capacity}"
  deployment_minimum_healthy_percent = "50"
  deployment_maximum_percent = "100"
  lifecycle {
    ignore_changes = ["task_definition"]
  }

  load_balancer {
    target_group_arn  = "${aws_alb_target_group.reify_interview_app_target_group.arn}"
    container_port    = 3000
    container_name    = "reify_interview_app"
  }
}
