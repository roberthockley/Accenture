resource "aws_cloudwatch_log_group" "lambda_postcallsummary" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_postcallsummary.function_name}"
  retention_in_days = 7
}

resource "aws_lambda_layer_version" "lambda_layer_postcallsummary" {
  filename            = "postcallsummary_layer.zip"
  layer_name          = "postcallsummary_layer"
  description = "Bedrock Connect ContactLens @aws-sdk ^3.741.0"
  compatible_runtimes = ["nodejs20.x", "nodejs22.x"]
}

resource "aws_lambda_function" "lambda_postcallsummary" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_postcallsummary.zip"
  function_name = "PostCallSummary"
  role          = aws_iam_role.iam_role_lambda_post_call_Summary.arn
  handler       = "index.handler"
  publish       = true
  layers        = [aws_lambda_layer_version.lambda_layer_postcallsummary.arn]
  runtime       = "nodejs20.x"
  memory_size   = "128"
  timeout       = "30"
  ephemeral_storage {
    size = 512 # Min 512 MB and the Max 10240 MB
  }
  environment {
    variables = {
      Connect_Instance = "${var.connect.instance}"
    }
  }
}

resource "aws_lambda_permission" "allow_eventbridge_invoke_lambda_postcallsummary" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_postcallsummary.function_name
  principal     = "events.amazonaws.com"

  # Reference the ARN of the EventBridge Rule
  source_arn = aws_cloudwatch_event_rule.postcallsummary.arn
}
