resource "aws_instance" "webserver01" {
    ami = "ami-04e49d62cf88738f1"
    # ami = var.image_id

    instance_type = "t2.medium"

    # tags = var.default_tags

    tags = {
        Name = "Jenkins Machine"
        email = "123@gmail.com"
    }
    //key_name = "ap-south-1-terraform-demo"
    vpc_security_group_ids = [aws_security_group.mysg.id]
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

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
      tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.test_role.name}"
}

resource "aws_iam_role_policy_attachment" "ssm-policy" {
role       = aws_iam_role.test_role.name
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