// Creates an AWS Lambda function with the specified properties
resource "aws_lambda_function" "InfraCodeDemo" {
  function_name = "lab4app-function"                // The name of the Lambda function
  handler       = "lab4app-function.lambda_handler" // Handler function name
  runtime       = "python3.8"                   // Runtime of the function
  role          = aws_iam_role.lambda_role.arn  // IAM role

  // Specifies the ZIP file that contains the code of the Lambda function
  filename = data.archive_file.lambda_zip.output_path

  // The tags of the Lambda function
  tags = {
    Name = "Lab4App-lambda"
  }
}

// Create a ZIP file that contains Python payload
data "archive_file" "lambda_zip" {
  type        = "zip"         // The type of the archive file
  source_file = "lab4app.py"  // The payload
  output_path = "lab4app.zip" // The output path of the archive file
}