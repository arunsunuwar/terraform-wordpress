terraform {
  backend "s3" {
    bucket = "terraform-arun"
    key    = "terraform/dev/ecs-wordpress"
    region = "us-east-1"
    profile = "arun"
  }
}
