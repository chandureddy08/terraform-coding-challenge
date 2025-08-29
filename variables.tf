variable "region" {
    type = string
    default = "ca-west-1"
    description = "I chose this AWS region to deploy resources"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "The CIDR block for the VPC"
}

variable "task_name" {
    type = string
    default = "coding-challenge"
    description = "Prefix used to name all AWS resources useful in identify and filtering "
}

variable "public_subnet_cidrs" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    description = "List of CIDRs for public subnets"
}

variable "private_subnet_cidrs" {
    type = list(string)
    default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
    description = "List of CIDRs for private subnets"
}

variable "common_tags" {

    type = map(string)
    default = {
        Purpose = "Iac-test"
        Terraform = "true"
    }
    description = "Common tags to apply to all resources"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "Instance type for nginx server"
}