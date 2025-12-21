variable "name" {
  description = "Name Prefix for Instance"
  type = string
}
variable "ami_id" {
  description = "AMI ID"
  type = string
}
variable "instance_type" {
  description = "EC2 Instance type"
  default = "t2.micro"
  type = string
}
variable "subnet_id" {
  description = "subnet_id"
  type = string
}
variable "security_group_id" {
  description = "Security Group IDS"
  type = list(string)
}
variable "associate_public_ip" {
  description = "Assign Public IP"
  type = string
}
variable "tags" {
  description = "Common tag"
  type = map(string)
}