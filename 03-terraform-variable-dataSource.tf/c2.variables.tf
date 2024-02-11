variable "aws_resgion" {
  description = "Region in which AWS resource to be created"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_key_pair" {
  description = "AWS key pair that associate with ec2"
  type        = string
  default     = "PraticeVM"
}