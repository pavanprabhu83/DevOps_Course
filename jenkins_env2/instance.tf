resource "aws_instance" "webserver01" {
    ami = "ami-04e49d62cf88738f1"
    # ami = var.image_id

    instance_type = "t2.micro"

    # tags = var.default_tags

    tags = {
        Name = "Amazon Linux Machine"
        email = "123@gmail.com"
    }
    //key_name = "ap-south-1-terraform-demo"
    vpc_security_group_ids = [aws_security_group.mysg1.id]
}

resource "aws_iam_role" "session_manager_role" {
  name = "test_role2"

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
  name = "test_profile1"
  role = "${aws_iam_role.session_manager_role.name}"
}

resource "aws_iam_policy" "ssm_policy" {
  name        = "ssm_policy"
  path        = "/"
  description = "SSM policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "ssm:UpdateInstanceInformation",
                    "ssmmessages:CreateControlChannel",
                    "ssmmessages:CreateDataChannel",
                    "ssmmessages:OpenControlChannel",
                    "ssmmessages:OpenDataChannel"
                ],
                "Resource": "*"
            }
        ]
    }
  EOF
}

resource "aws_iam_role_policy_attachment" "ssm-policy" {
role       = aws_iam_role.session_manager_role.name
policy_arn = aws_iam_policy.ssm_policy.arn
    
}

resource "aws_security_group"  "mysg1" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = "home network"
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
            description = "home network"
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