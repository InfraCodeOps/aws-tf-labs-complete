
# Decode CSV file into list of user records
locals {
  userinfo = csvdecode(file("${path.module}/users.csv"))
}

# For each user record, creates an AWS instance
# The 'for' expression builds a map where the key is the user's email and the value is the user record
resource "aws_instance" "infra-vms" {
  for_each = { for user in local.userinfo : user.email => user }

  # Specifies Amazon Machine Image ID
  # the following ami only works for us-west-2
  ami           = "ami-0044a0897b53acfb6"
  
  # Specifies instance type
  instance_type = "t3.nano"

  # Assigns VM name from user record
  tags = {
    Name = "${each.value.name}"
  }
}

# Outputs list of VM identifiers
# Returns a list of IDs from aws_instance.infra-vms.
output "vm_ids" {
  value = values(aws_instance.infra-vms)[*].id
}

# Returns a map where keys are the instance names
# and values are their respective IDs.
output "vm_names_ids" {
  value = { for i, j in aws_instance.infra-vms : i => j.id }
}
