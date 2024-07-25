terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}
#Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins-ec2" {
  ami                    = "ami-051f7e7f6c2f40dc1"
  instance_type          = "t2.micro"
  key_name        = "terraformkp"
  user_data = file("installjenkins.sh")
  tags = {
    Name = "Myawsproject"
  }
}