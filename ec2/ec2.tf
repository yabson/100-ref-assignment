variable "instance_profile_name" {
  type = string
 }

variable "ami" {
  type = string
 }

variable "instance_type" { 
  type = string
}

variable "key_name" {
  type = string
}


resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type   
  associate_public_ip_address = "true"
  key_name = var.key_name
  iam_instance_profile = var.instance_profile_name

  tags = {
    Name = "web-server"
  }
}