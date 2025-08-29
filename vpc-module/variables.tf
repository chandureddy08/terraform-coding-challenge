variable "task_name" {
    type = string
    description = "I generally give project name here but in this context I'm using task name"
}

variable "vpc_cidr" {
    type = string
    description = "The CIDR block for the VPC"
}

variable "common_tags" {
    type = map(string)
    default = {}
    description = "Common tags to apply to all resources"
}

variable "public_subnet_cidrs" {
    type = list(string)
    description = "List of CIDRs for public subnets should be 3"
    validation {
      condition = length(var.public_subnet_cidrs) == 3
      error_message = "Please provide 3 valid subnet CIDR"
    }
}

variable "private_subnet_cidrs" {
  type = list(string)
  description = "List of CIDRs for private subnets should be 3"
  validation {
    condition = length(var.private_subnet_cidrs)  == 3
    error_message = "Please provide 3 valid subnet CIDR"
  }
}