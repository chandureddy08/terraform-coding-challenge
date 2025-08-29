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

resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    map_public_ip_on_launch = true
    availability_zone = local.az_names[count.index]
    cidr_block = var.public_subnet_cidrs[count.index]
    tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-public-${local.az_names[count.index]}"
        }
    )
}

resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    availability_zone = local.az_names[count.index]
    cidr_block = var.private_subnet_cidrs[count.index]
    tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-private-${local.az_names[count.index]}"
        }
    )
}

resource "aws_eip" "eip" {
    domain = "vpc"
    tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-eip"
        }
    )
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.public[0].id
    depends_on = [ aws_eip.eip ]
    tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-nat-gw"
        }
    )
}