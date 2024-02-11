# code for provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
 
-------------------------------------------------------------
# code for main.tf
resource "aws_instance" "Demo-instance" {
  ami = "ami-05a5bb48beb785bf1"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "key1-ec2"
  security_groups = [aws_security_group.sg_1.name]

  tags = {
    Name = "HelloWorld"
  }
}
resource "aws_ebs_volume" "ebs1" {
  availability_zone = "ap-south-1a"
  size= 1
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs1.id
  instance_id = aws_instance.Demo-instance.id
}
resource "aws_key_pair" "key1" {
  key_name   = "key1-ec2"
  public_key = "ssh-rsa 
  
}
---------------------------------------------------------------------------
# code for security.tf
# add Inbond & outbound rule 
resource "aws_security_group" "sg_1" {
  name        = "add rule"
  description = "Allow port 80,22 & 443"

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
}
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "SG"
  }
}
