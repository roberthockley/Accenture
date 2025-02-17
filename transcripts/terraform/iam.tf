resource "aws_iam_policy" "bedrock_invoke" {
  name        = "Bedrock_Invoke"
  path        = "/"
  description = "Policy to allow a post to Bedrock and get results"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "Statement1",
        "Effect" : "Allow",
        "Action" : [
          "bedrock:InvokeModel",
          "bedrock:InvokeModelWithResponseStream",
          "connect:ListRealtimeContactAnalysisSegments"
        ],
        "Resource" : [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_cloudwatch" {
  name        = "Cloudwatch"
  path        = "/"
  description = "Policy to allow Lambda to write to Cloudwatch on each invokation"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "AllowLambdaLogging",
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:${var.environment.region}:${var.environment.account_id}:log-group:/aws/lambda/${aws_lambda_function.lambda_postcallsummary.function_name}:*"
      }
    ]
  })
}

resource "aws_iam_role" "iam_role_lambda_post_call_Summary" {
  name = "RoleForLambdaPostCallSummary"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_bedrock" {
  role       = aws_iam_role.iam_role_lambda_post_call_Summary.name
  policy_arn = aws_iam_policy.bedrock_invoke.arn
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_role_lambda_post_call_Summary.name
  policy_arn = aws_iam_policy.lambda_cloudwatch.arn
}

## Add other destinations when needed
