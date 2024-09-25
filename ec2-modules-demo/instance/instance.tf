module "ec2_security" {
  source = "../security"
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
}