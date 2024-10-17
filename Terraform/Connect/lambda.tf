resource "aws_cloudwatch_log_group" "lambda_outages" {
  name = "/aws/lambda/${aws_lambda_function.lambda_outages.function_name}"
}

resource "aws_lambda_layer_version" "lambda_layer_ssm" {
  filename            = "ssm_layer.zip"
  layer_name          = "ssm"
  compatible_runtimes = ["nodejs20.x"]
}

resource "aws_lambda_function" "lambda_outages" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "outages.zip"
  function_name = "outages"
  role          = aws_iam_role.iam_role_lambda_ssm.arn
  handler       = "index.handler"
  publish       = true
  layers        = [aws_lambda_layer_version.lambda_layer_ssm.arn] 
  runtime     = "nodejs20.x"
  memory_size = "128"
  timeout     = "30"
  ephemeral_storage {
    size = 512 # Min 512 MB and the Max 10240 MB
  }
  environment {
    variables = {
    }
  }
}