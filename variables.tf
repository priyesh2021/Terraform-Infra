variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "terraform_execution_role_arn" {
  description = "IAM role ARN that Terraform assumes"
  type        = string
}
