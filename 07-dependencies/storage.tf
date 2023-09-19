resource "aws_s3_bucket" "infra-bucket" {
  # Ensure the bucket name is unique globally
  # You will need to change the name below
  bucket = "wa49tz-infra-ops-bucket"
  tags = {
    Name        = "My Infra bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "my-bucket-object" {
#   depends_on = [ aws_s3_bucket.infra-bucket ]
  bucket = aws_s3_bucket.infra-bucket.id # implicit dependency
  key    = "index.html"
  source = "lab7.txt"
  tags = {
    Name        = "My S3 bucket file"
    Environment = "Dev"
    etag        = filemd5("lab7.txt")
  }
}