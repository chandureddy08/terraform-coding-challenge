output "vpc_id" {
  value = aws_vpc.main.id
  description = "ID of the VPC to pass to create security group for EC2 instance"
}

output "public_subnet_id_one" {
  value       = aws_subnet.public[0].id
  description = "ID of the first public subnet to launch ec2 instance"
}