resource "aws_alb" "reify_interview_alb_load_balancer" {
  name                = "film-ratings-alb-load-balancer"
  security_groups     = ["${aws_security_group.reify_interview_public_sg.id}"]
  subnets             = ["${aws_subnet.reify_interview_public_sn_01.id}", "${aws_subnet.reify_interview_public_sn_02.id}"]

  tags = {
    Name = "film-ratings-alb-load-balancer"
  }
}

resource "aws_alb_target_group" "reify_interview_app_target_group" {
  name                = "film-ratings-app-target-group"
  port                =  8080
  protocol            = "HTTP"
  vpc_id              = "${aws_vpc.reify_interview_vpc.id}"
  deregistration_delay = "10"

  health_check {
    healthy_threshold   = "2"
    unhealthy_threshold = "6"
    interval            = "30"
    matcher             = "200,301,302"
    path                = "/"
    protocol            = "HTTP"
    timeout             = "5"
  }

  stickiness {
    type  = "lb_cookie"
  }

  tags = {
    Name = "film-ratings-app-target-group"
  }
}

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = "${aws_alb.reify_interview_alb_load_balancer.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.reify_interview_app_target_group.arn}"
    type             = "forward"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_film_rating_app" {
  autoscaling_group_name = "film-ratings-autoscaling-group"
  alb_target_group_arn   = "${aws_alb_target_group.reify_interview_app_target_group.arn}"
  depends_on = [ "aws_autoscaling_group.film-ratings-autoscaling-group" ]
}
