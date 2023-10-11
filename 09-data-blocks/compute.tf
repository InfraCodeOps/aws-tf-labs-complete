# Query for t3 compatible Amazon Machine Image (AMI)
data "aws_ami" "latest_amz_linux_oregon" {
  # From 'amazon' as the owner
  owners = ["amazon"]

  # Match AMIs with names starting with 'amzn2-ami-hvm-2.0.*-gp2'
  # This matches Amazon Linux 2 HVM AMIs with GP2 root device type
  # 't3' instances are compatible with these
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-gp2"]
  }

  # Match AMIs with 'x86_64' architecture
  # 't3' instances are 'x86_64' architecture
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  # Match AMIs with 'ebs' as root device type
  # 't3' instances use 'ebs' as root device type
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  # Get the most recent AMI that matches the filters
  most_recent = true
}

output "ami_id" {
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