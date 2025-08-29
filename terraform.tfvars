# For user(your) convenience to override default values. It does NOT contain any sensitive information and is safe to commit.
region = "ca-west-1"
vpc_cidr = "10.0.0.0/16"
task_name = "coding-challenge"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
instance_type = "t3.micro"