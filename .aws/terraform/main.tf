resource "aws_iam_policy" "iam_policy" {
  name         = "dev-test-policy"
  description  = "AWS IAM Policy for testing"
  policy       = data.aws_iam_policy_document.role_policy.json
}

data "aws_iam_policy_document" "role_policy" {
  statement {
    sid       = "AllowCloudwatch"
    effect    = "Allow"
    resources = ["arn:aws:logs:*:*:*"]

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
  }
}