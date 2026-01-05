resource "aws_lambda_function" "this" {
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler

  role = var.lambda_role_arn

  filename          = var.lambda_zip_path
  source_code_hash  = filebase64sha256(var.lambda_zip_path)


  timeout       = var.timeout
  memory_size   = var.memory_size

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}