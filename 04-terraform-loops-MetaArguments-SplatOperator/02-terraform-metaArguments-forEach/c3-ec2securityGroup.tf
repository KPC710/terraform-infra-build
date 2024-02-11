resource "aws_security_group" "my-ssh-security-group" {
  name        = "my-vpc-ssh"
  description = "Dev VPC ssh"

  tags = {
    Name = "vpc-ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  description       = "Allow port ssh 22"
  security_group_id = aws_security_group.my-ssh-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow_ssh_all_traffic_ipv4" {
  security_group_id = aws_security_group.my-ssh-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "my-ssh-web-security-group" {
  name        = "my-vpc-web"
  description = "Dev VPC web"

  tags = {
    Name = "my-vpc-web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_web_tls_ipv4" {
  description       = "Allow port 80"
  security_group_id = aws_security_group.my-ssh-web-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_web_http_tls_ipv4" {
  description       = "Allow port 443"
  security_group_id = aws_security_group.my-ssh-web-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_web_all_traffic_ipv4" {
  security_group_id = aws_security_group.my-ssh-web-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
