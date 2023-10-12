terraform {
  # your version might be different
  # The code below instructs Terraform 
  # to use v1.6.0 and above up to
  # but not including v2.0.0
  required_version = "~> 1.6"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # pinning to v5.x
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}