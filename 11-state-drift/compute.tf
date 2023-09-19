// Retrieve the most recent Amazon Linux AMI 

# data block to retrieve latest standard Amazon Linux AMI
data "aws_ami" "latest_amz_linux_oregon" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-2.0.202*-x86_64-ebs"]
  }
}

output "amidid" {
  value = data.aws_ami.latest_amz_linux_oregon.id
}


# Create an AWS instance with the retrieved AMI and instance type
resource "aws_instance" "amz-linux" {
  ami           = data.aws_ami.latest_amz_linux_oregon.id
  instance_type = "t3.nano"

  # Tag the instance with a fictitious name
  tags = {
    Name = "Infra-Amazon-Linux-Latest"
  }
}

output "instance_id" {
  value = aws_instance.amz-linux.id
}