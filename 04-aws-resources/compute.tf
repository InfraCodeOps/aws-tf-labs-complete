resource "aws_instance" "lab4vm" {
  # your AMI might be different
  ami           = "ami-0c2caccf78f4fa033"
  instance_type = "t3.nano"

  // Tag the instance with a fictitious name
  tags = {
    Name = "Lab4VM"
  }
}