output "region" {
  value = "${var.region}"
}

output "reify_interview_vpc_id" {
  value = "${aws_vpc.reify_interview_vpc.id}"
}

output "reify_interview_public_sn_01_id" {
  value = "${aws_subnet.reify_interview_public_sn_01.id}"
}

output "reify_interview_public_sn_02_id" {
  value = "${aws_subnet.reify_interview_public_sn_02.id}"
}

output "reify_interview_public_sg_id" {
  value = "${aws_security_group.reify_interview_public_sg.id}"
}

output "ecs-service-role-arn" {
  value = "${aws_iam_role.ecs-service-role.arn}"
}

output "ecs-instance-role-name" {
  value = "${aws_iam_role.ecs-instance-role.name}"
}

output "app-alb-load-balancer-name" {
  value = "${aws_alb.reify_interview_alb_load_balancer.name}"
}

output "app-alb-load-balancer-dns-name" {
  value = "${aws_alb.reify_interview_alb_load_balancer.dns_name}"
}

output "nw-lb-load-balancer-dns-name" {
  value = "${aws_lb.reify_interview_nw_load_balancer.dns_name}"
}

output "nw-lb-load-balancer-name" {
  value = "${aws_lb.reify_interview_nw_load_balancer.name}"
}

output "film-ratings-app-target-group-arn" {
  value = "${aws_alb_target_group.reify_interview_app_target_group.arn}"
}

output "film-ratings-db-target-group-arn" {
  value = "${aws_lb_target_group.reify_interview_db_target_group.arn}"
}

output "mount-target-dns" {
  description = "Address of the mount target provisioned"
  value = "${aws_efs_mount_target.filmdbefs-mnt.0.dns_name}"
}
