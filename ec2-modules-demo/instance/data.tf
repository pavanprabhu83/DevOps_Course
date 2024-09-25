data "aws_ami" "ami_demo" {
    most_recent      = true
    owners           = ["361769589266"]

    tags = {
        environment = "used for ec2 build"
        team = "platform"
    }

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}