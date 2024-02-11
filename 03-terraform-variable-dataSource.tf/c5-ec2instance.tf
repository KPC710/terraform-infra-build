resource "aws_instance" "myec2Demo" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app.sh")
  key_name               = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.my-ssh-security-group.id, aws_security_group.my-ssh-web-security-group.id]
  tags = {
    Name = "EC2 Demo"
  }
}