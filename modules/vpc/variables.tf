variable "vpc_cidr" {
    description = "CIDR block for the VPC."
    type        = string
}

variable "public_subnets" {
    description = "Public Subnet CIDR"
    type        = list(string)
}

variable "private_subnets" {
   description = "Private Subnet CIDR"
    type        = list(string) 
}

variable "azs" {
    description = "Availibility Zones"
    type        = list(string)
}

variable "tags" {
    description = "Common tags"
    type        = map(string)
}
