module "instance" {
  source = "s3::https://pvn-devops-course-modules.s3.eu-west-1.amazonaws.com/instance.gz"
  instance_type = var.instance_type
  default_tags = var.default_tags
}