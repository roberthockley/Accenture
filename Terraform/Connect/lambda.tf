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
  function_name = var.lambda_functions.lambda_spvTransferCall_name
  role          = var.input.iam_role_lambda_outages
  handler       = "index.handler"
  publish       = true
  layers        = [var.input.lambda_layer_ssm] #[var.input.lambda_layer_call_service, var.lambda_layers.lambda_insights]
  #source_code_hash = data.archive_file.lambda.output_base64sha256
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