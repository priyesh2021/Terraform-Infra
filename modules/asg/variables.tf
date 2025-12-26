variable "name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_types" {
  description = "Instance type for ASG."
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "on_demand_percentage" {
  type = number
  default = 30
}

variable "desired_capacity" {
  type = number
}

variable "min_capacity" {
  type = number
}

variable "max_capacity" {
  type = number
}

variable "target_group_arns" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}