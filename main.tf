module "iam" {
    source = "./iam"
    test_role_name = var.test_role_name
    s3_access_policy = var.s3_access_policy
    webserver_profile = var.webserver_profile
}

module "ec2" {
    source = "./ec2"
    instance_profile_name = module.iam.instance_profile
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    
}

module "s3" {
    source = "./s3"
    bucket_name = var.bucket
    tags = var.tags
    
}
module "rds" {
    source = "./rds"
    allocated_storage = var.allocated_storage
    engine_mysql = var.engine_mysql
    engine_version = var.engine_version
    instance_class =var.instance_class
    db_name = var.db_name
    username = var.username
    password = var.password
    parameter_group_name = var.parameter_group_name
}

module "vpc" {
    source = "./vpc"
    name = var.name
    cidr = var.cidr
    azs = var.azs
    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
}
