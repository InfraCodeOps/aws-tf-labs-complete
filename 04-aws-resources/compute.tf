resource "aws_instance" "lab4vm" {

  # retrieve the AMI using the following bash command:
  # aws ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.*-gp2' 'Name=architecture,Values=x86_64' 'Name=root-device-type,Values=ebs' --query 'sort_by(Images, &CreationDate)[-1].ImageId' --region us-west-2
  # your AMI might be different
  ami           = "ami-0044a0897b53acfb6"
  instance_type = "t3.nano"

  // Tag the instance with a fictitious name
  tags = {
    Name = "Lab4VM"
  }
}