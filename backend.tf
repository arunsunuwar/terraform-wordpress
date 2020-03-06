terraform {
  backend "s3" {
    bucket = "terraform-wordpress"
    key    = "terraform/dev/ecs-wordpress"
    region = "us-east-1"
    profile = "arun"
  }
}
