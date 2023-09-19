// Creates an IAM role to be used with our Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "InfraCodeDemo_lambda_role" // Specifies the name of the IAM role

  // Specifies the policy that grants AWS Lambda permission to assume the role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}