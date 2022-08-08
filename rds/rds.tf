# variable "storage" {

# }

variable "allocated_storage" { }

variable "engine_mysql" { }

variable "engine_version" { }

variable "instance_class" { }

variable "db_name" { }

variable "username" { }

variable "password" { }

variable "parameter_group_name" { }

resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine_mysql
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  publicly_accessible = true
}





# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   db_name                 = "mydb"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
#   publicly_accessible = true
# }
