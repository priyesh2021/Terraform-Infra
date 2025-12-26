variable "name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "target_port" {
  type = number
  default = 80
}
variable "tags" {
  type = map(string)
}
variable "lb_type" {
  description = "Load Balancer Type"
  type = string
}
variable "protocol" {
  type = string
  default = "HTTP"
}
