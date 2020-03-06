resource "aws_autoscaling_group" "default" {
  name                      = "terraform-ecs-wordpress"
  max_size                  = 1 
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.default.name}"
  vpc_zone_identifier       = ["subnet-0a59446d", "subnet-3af0e814"]
# target_group_arns         = ["${aws_lb_target_group.default.arn}"]
}
