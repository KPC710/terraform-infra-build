data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_instance" "myec2Demo" {
  ami = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app.sh")
  key_name               = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.my-ssh-security-group.id, aws_security_group.my-ssh-web-security-group.id]
  # for_each = toset(data.aws_availability_zones.my_azones.names)
  for_each = toset(keys({for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
    az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key
  count                  = 2
  tags = {
    Name = "For Each EC2 Demo-${each.value}"
  }
}
