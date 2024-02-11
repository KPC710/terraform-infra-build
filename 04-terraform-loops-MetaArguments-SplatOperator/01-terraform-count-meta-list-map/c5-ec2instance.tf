resource "aws_instance" "myec2Demo" {
  ami = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  # instance_type = var.instance_type_list[0]
  # instance_type = var.instance_type_map["dev"]
  user_data              = file("${path.module}/app.sh")
  key_name               = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.my-ssh-security-group.id, aws_security_group.my-ssh-web-security-group.id]
  count                  = 2
  tags = {
    Name = "EC2 Demo-${count.index}"
  }
}
