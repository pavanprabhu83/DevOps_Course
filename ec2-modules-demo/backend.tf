terraform {
  backend "s3" {
    bucket = "devops-sept2024-terraform-backend-ec2"
    key    = "Dev/terraform.tfstate"
    region = "eu-west-1"
  }
}
