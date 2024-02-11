terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Optional but recommended in production
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "ec2Demo" {
  ami           = "ami-0a3c3a20c09d6f377"
  instance_type = "t2.micro"
}



# Initialize Terraform
#  - terraform init

# Terraform Validate
#  - terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
#  - terraform plan

# Terraform Apply to Create EC2 Instance
#  - terraform apply 

# Destroy EC2 Instance
# - terraform destroy

# Delete Terraform files 
# - rm -rf .terraform*
# - rm -rf terraform.tfstate*
