module "qa_lambda" {
  source = "../../modules/lambda"

  function_name = "qa-demo-lambda"
  runtime       = "python3.10"
  handler       = "app.handler"
  timeout       = 15
  lambda_zip_path = "${path.module}/lambda_code/function.zip"

  lambda_role_arn = "arn:aws:iam::590183742092:role/common-lambda-execution-role"

  environment_variables = {
    ENV = "qa"
  }

  tags = var.tags
}