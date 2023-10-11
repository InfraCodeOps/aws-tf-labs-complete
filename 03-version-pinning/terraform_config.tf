terraform {
  # your version might be different
  required_version = "~> 1.6.1"
  
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
