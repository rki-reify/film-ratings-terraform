resource "aws_autoscaling_group" "film-ratings-autoscaling-group" {
    name                        = "film-ratings-autoscaling-group"
    max_size                    = "${var.max_instance_size}"
    min_size                    = "${var.min_instance_size}"
    desired_capacity            = "${var.desired_capacity}"
    vpc_zone_identifier         = ["${aws_subnet.reify_interview_public_sn_01.id}", "${aws_subnet.reify_interview_public_sn_02.id}"]
    launch_configuration        = "${aws_launch_configuration.ecs-launch-configuration.name}"
    health_check_type           = "ELB"
  }
