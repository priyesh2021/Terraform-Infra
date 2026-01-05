locals {
  lambdas = {
    user_service = {
      function_name = "qa-user-lambda"
      handler       = "app.handler"
      runtime       = "python3.10"
      zip_path      = "${path.module}/lambda_code/user/function.zip"
      timeout       = 10
      memory        = 128
    }

    order_service = {
      function_name = "qa-order-lambda"
      handler       = "app.handler"
      runtime       = "python3.10"
      zip_path      = "${path.module}/lambda_code/order/function.zip"
      timeout       = 15
      memory        = 256
    }

    payment_service = {
      function_name = "qa-payment-lambda"
      handler       = "app.handler"
      runtime       = "python3.10"
      zip_path      = "${path.module}/lambda_code/payment/function.zip"
      timeout       = 30
      memory        = 512
    }
  }
}

module "qa_lambda" {
  for_each = local.lambdas

  source = "../../modules/lambda"

  function_name = each.value.function_name
  runtime       = each.value.runtime
  handler       = each.value.handler

  lambda_zip_path = each.value.zip_path
  lambda_role_arn = "arn:aws:iam::590183742092:role/common-lambda-execution-role"

  timeout     = each.value.timeout
  memory_size = each.value.memory

  environment_variables = {
    ENV     = "qa"
    SERVICE = each.key
  }

  tags = var.tags
}
