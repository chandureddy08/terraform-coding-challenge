module "vpc" {
    source = "./vpc-module"
    vpc_cidr = var.vpc_cidr
    task_name = var.task_name
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    common_tags = var.common_tags
}

resource "aws_security_group" "nginx" {
  name        = "${var.task_name}-nginx-sg"
  description = "Allow HTTP access"
  vpc_id      = module.vpc.vpc_id
  
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-nginx-sg"
        }
    )
}

resource "aws_instance" "nginx" {
    ami = data.aws_ami.rhel9.id
    instance_type = var.instance_type
    user_data = file("nginx.sh")
    subnet_id = module.vpc.public_subnet_id_one
    vpc_security_group_ids = [aws_security_group.nginx.id]
    associate_public_ip_address = true

    tags = merge(
        var.common_tags,
        {
            Name = "${var.task_name}-ec2"
        }
    )
}