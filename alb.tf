resource "aws_lb" "default" {
  name               = "terraform-ecs-wordpress"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.default_lb.id}"]
  subnets            = ["subnet-0a59446d", "subnet-3af0e814"]
  enable_deletion_protection = false
  tags = {
    Environment = "dev"
  }
}
resource "aws_lb_listener" "default" {
  load_balancer_arn = "${aws_lb.default.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.default.arn}"
  }
}
resource "aws_lb_target_group" "default" {
  name     = "terraform-ecs-wordpress"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-7490be0e"
}
