
variable "name" { }
variable "cidr" { }
variable "azs" { }
variable "public_subnets" { }
variable "private_subnets" { }
variable "public_subnet_id" { }


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  public_subnets  =var.public_subnets
  private_subnets  = var.private_subnets
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

output "public_subnet_id" {
    value = aws_subnet.public_subnets.subnet.id
}