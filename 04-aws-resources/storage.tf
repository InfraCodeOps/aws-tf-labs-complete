# Create a random string for uniquely identifying the bucket
resource "random_string" "storage-random" {
  length = 16
  special = false
  upper = false
}

# Create a bucket with the random string in it's identifier
resource "aws_s3_bucket" "infra-storage" {
  bucket = "${random_string.storage-random.result}-infra-storage"

  tags = {
    Name        = "Lab4 Bucket"
  }
}