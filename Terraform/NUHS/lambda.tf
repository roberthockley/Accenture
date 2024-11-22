resource "aws_cloudwatch_log_group" "lambda_transcribe" {
  name = "/aws/lambda/${aws_lambda_function.lambda_transcribe.function_name}"
  retention_in_days = 7
}

resource "aws_lambda_function" "lambda_transcribe" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "transcribe.zip"
  function_name = "transcribe"
  role          = aws_iam_role.iam_role_lambda_ssm.arn
  handler       = "index.handler"
  publish       = true
  layers        = [] 
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

resource "aws_lambda_permission" "allow_s3_to_invoke_lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_transcribe.function_name
  principal     = "s3.amazonaws.com"
  
  # Reference the ARN of the S3 bucket
  source_arn    = aws_s3_bucket.transcripts.arn
}