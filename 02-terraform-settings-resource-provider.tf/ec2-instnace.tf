resource "aws_instance" "ec2Demo" {
  ami           = "ami-0a3c3a20c09d6f377"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/app.sh")
  tags = {
    "Name" = "ec2Demo"
  }
}