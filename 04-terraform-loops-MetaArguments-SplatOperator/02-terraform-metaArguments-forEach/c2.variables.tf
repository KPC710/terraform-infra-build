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

# instance type -List

variable "instance_type_list" {
  description = "EC2 instance type list"
  type        = list(string)
  default     = ["t3.micro", "t3.small"]
}

# instance type -map

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}
