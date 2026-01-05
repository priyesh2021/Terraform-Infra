variable "function_name" {
  type = string
}

variable "runtime" {
  type = string
}

variable "handler" {
  type = string
}

variable "lambda_zip_path" {
  type = string
}

# variable "layer_zip_path" {
#   type = string
# }

variable "timeout" {
  type = string
}

variable "memory_size" {
  type      = number
  default   = 128
}

variable "environment_variables" {
  type = map(string)
  default = {}
}

variable "lambda_role_arn" {
  description = "Existing IAM role ARN for Lambda execution"
  type        = string
}

variable "tags" {
  type = map(string)
}