resource "aws_instance" "webserver01" {
    ami = data.aws_ami.ami_demo.image_id
    # ami = var.image_id

    instance_type = var.instance_type

    # tags = var.default_tags
    user_data = "${file("userdata.sh")}"  
    tags = var.default_tags
    //key_name = "ap-south-1-terraform-demo"
    vpc_security_group_ids = [aws_security_group.mysg.id]
}

resource "aws_iam_role" "ssm_role" {
  name = "ssm_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      Name = "EC2 ssm profile"
  }
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = "${aws_iam_role.ssm_role.name}"
}

resource "aws_iam_role_policy_attachment" "ssm-policy" {
role       = aws_iam_role.ssm_role.name
policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_security_group"  "mysg" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = "Pavans home network"
            from_port = 0
            protocol = "-1"
            to_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]

    ingress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = "Pavans home network"
            from_port = 0
            protocol = "-1"
            to_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
            }
        ]
}