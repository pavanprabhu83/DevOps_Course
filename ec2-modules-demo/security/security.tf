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
