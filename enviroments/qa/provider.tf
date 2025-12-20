provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn     = var.terraform_execution_role_arn
    session_name = "terraform-session"
  }
}

