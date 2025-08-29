resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-vpc"
        }
)
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-igw"
        }
)
}