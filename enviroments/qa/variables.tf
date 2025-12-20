variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
variable "terraform_execution_role_arn" {
  type = string
}
variable "aws_region" {
  type = string
}
