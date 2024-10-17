resource "aws_iam_role" "iam_role_lambda_ssm" {
  name = "RoleForLamdaOutages"
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

resource "aws_iam_role_policy_attachment" "lambda_ssm" {
  role       = aws_iam_role.iam_role_lambda_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_connect" {
  role       = aws_iam_role.iam_role_lambda_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonConnect_FullAccess"
}