output "bucket_address" {
  value = aws_s3_bucket.infra-storage.bucket_domain_name
}