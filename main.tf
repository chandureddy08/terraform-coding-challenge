module "vpc" {
    source = "./vpc-module"
    vpc_cidr = var.vpc_cidr
    task_name = var.task_name
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    common_tags = var.common_tags
}