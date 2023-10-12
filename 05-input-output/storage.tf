# Create a random string for uniquely identifying the bucket
resource "random_string" "storage-random" {
  length = 8
  special = false
  upper = false
}

# Create a bucket with the random string in it's identifier
# Using parens allows for splitting expression into two lines
resource "aws_s3_bucket" "infra-storage" {
  # The expression assigned to bucket attribute needs to be on one line
  bucket = "${var.bucket_prefix}-${random_string.storage-random.result}-infra-store"
  tags = {
    Name        = "Lab5 Bucket"
  }
}

# locals {
#   bucket_name = (var.bucket_prefix == "" 
#               ? "hello-${formatdate("YYYYMMDDHHmmss", timestamp())}" 
#               : var.bucket_prefix)
# }