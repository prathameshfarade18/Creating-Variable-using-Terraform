  terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
    }
  }
}
variable "my_region" {
    type = string
}
variable "access_key" {
    type = string
}
variable "secret_key" {
    type = string
}
variable "my_ami" {
    type = string
}

provider "aws" {
   region = "ap-south-1"
   access_key = ""
   secret_key = ""
}
resource "aws_instance" "myec2" {

     ami = ""
     instance_type = "t2.micro"
     vpc_security_group_ids = [aws_security_group.mysg.id]
     count = 2
     tags = {
        Name = "myinstance ${count.index+1}"
          }
}
    resource "aws_security_group" "mysg" {
  name   = "my-sg1"
  vpc_id = ""

 
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
}
