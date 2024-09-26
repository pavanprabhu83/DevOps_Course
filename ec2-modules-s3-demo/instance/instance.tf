module "ec2_security" {
  source = "s3::https://pvn-devops-course-modules.s3.eu-west-1.amazonaws.com/security.zip"
}

module "ec2_iam" {
  source = "s3::https://pvn-devops-course-modules.s3.eu-west-1.amazonaws.com/iam.zip"
}

resource "aws_instance" "webserver01" {
  ami = data.aws_ami.ami_demo.image_id
  # ami = var.image_id

  instance_type = var.instance_type

  # tags = var.default_tags
  user_data = "${file("userdata.sh")}"  
  tags = var.default_tags
  //key_name = "ap-south-1-terraform-demo"
  vpc_security_group_ids = [module.ec2_security.security_group_id]
  iam_instance_profile = module.ec2_iam.iam_instance_profile_name
}