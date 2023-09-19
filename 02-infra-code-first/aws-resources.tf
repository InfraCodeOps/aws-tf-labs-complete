# Definition of VPC resource within AWS
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc-${random_string.hello-random.result}"
  }
}