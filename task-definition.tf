/*data "aws_ecs_task_definition" "default" {
  task_definition = "${aws_ecs_task_definition.default.family}"
}*/
resource "aws_ecs_task_definition" "default" {
    family                = "wordpress"
    container_definitions = <<DEFINITION
[
  {
    "name": "wordpress",
    "image": "310065639301.dkr.ecr.us-east-1.amazonaws.com/wordpress:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 0
      }
    ],
    "memory": 512,
    "cpu": 1024
  }
]
DEFINITION
}
