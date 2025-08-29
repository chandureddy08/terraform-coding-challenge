# Terraform AWS Coding Challenge

## Overview

This Terraform project provisions an AWS Virtual Private Cloud (VPC) with public and private subnets distributed across multiple Availability Zones. It deploys an EC2 instance in a public subnet with an Nginx web server installed and running.

---

## Features

- Creates a VPC with CIDR block `10.0.0.0/16`
- Developed a reusable VPC module to clearly separate infrastructure components
- Creates three public and three private subnets, each in different Availability Zones
- Public subnets have internet access via an Internet Gateway
- Private subnets do NOT have direct internet connectivity, routed through a NAT Gateway