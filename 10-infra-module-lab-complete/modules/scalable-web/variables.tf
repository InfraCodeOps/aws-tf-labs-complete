variable "app-name" {
  type = string
  description = "The name of the application"
}

variable "region" {
  type = string
  default = "us-west-2"
  description = "Region where the resources will be created"
}

variable "num-replicas" {
  type = number
  default = 2
  description = "Number of replicas to create. Must be 2 or 3"
  validation {
    condition = var.num-replicas ==2 || var.num-replicas ==3
    error_message = "Number of replicas must be 2 or 3"
  }
}

# Variable deciding if the app is public or private
variable "associate_public_ip" {
  type = bool
  default = false
  description = "Associate public IP addresses with web app the instances? Default is false"
}

# Variable for ec2 instance type
variable "instance_type" {
  type = string
  default = "t3.nano"
  description = "Instance type for the web app instances"

  # contraint making sure it is t3.nano, t3.micro, or t3.small
  validation {
    condition = contains(["t3.nano", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Instance type must be t3.nano, t3.micro, or t3.small"
  }
}