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