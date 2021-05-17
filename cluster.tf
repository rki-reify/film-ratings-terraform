resource "aws_ecs_cluster" "reify_interview_ecs_cluster" {
  name = "${var.ecs_cluster}"
}
