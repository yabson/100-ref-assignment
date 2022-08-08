variable "bucket" {
default = "iyabo-234567678"
}
        

variable "tags" {
    default = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

variable "test_role_name" {
 default = "assignment_webserver_role"   
}

variable "s3_access_policy" {
 default = "assignment_webserver_s3_access_p0licy"   
}

variable "webserver_profile" {
    default = "assignment_webserver_profile"
}

variable "ami" { 
    default = "ami-090fa75af13c156b4"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
    default = "mynewkey"
}

variable "allocated_storage" {
    default = 10
}

variable "engine_mysql" {
    default = "mysql"
}

variable "engine_version" {
    default = "5.7"
}  

variable "instance_class" {
    default = "db.t2.micro"
}

variable "db_name" {
    default = "mydb"
}
variable "username" {
    default = "foo"
}

variable "password" {
    default = "foobarbaz"
}
variable "parameter_group_name" {
    default = "default.mysql5.7"
}

variable "name" {
default = "my_vpc"
}

variable "cidr" {
default = "10.0.0.0/16"
}

variable "azs" {
default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
