resource "aws_vpc" "infra-vpc" {
  cidr_block = "10.0.0.0/16"
}

# create a collection of CIDR values
variable "subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

# create subnets for each of the CIDR values 
resource "aws_subnet" "subnets" {
  # count meta-argument and length() function
  count                   = length(var.subnet_cidrs)
  vpc_id                  = aws_vpc.infra-vpc.id
  cidr_block              = var.subnet_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-${count.index}"
    Environment = "lab6"
  }
}