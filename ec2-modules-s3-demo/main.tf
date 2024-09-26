module "instance" {
  source = "./instance"
  instance_type = var.instance_type
  default_tags = var.default_tags
}