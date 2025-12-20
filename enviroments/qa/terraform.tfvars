aws_region = "ap-south-1"

terraform_execution_role_arn = "arn:aws:iam::590183742092:role/terraform-execution-role"

environment = "qa"
vpc_cidr    = "10.10.0.0/16"

public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets = ["10.10.11.0/24", "10.10.12.0/24"]

azs = ["ap-south-1a", "ap-south-1b"]

tags = {
  Environment = "qa"
  Project     = "terraform-demo"
  Owner       = "devops"
}
