resource "random_string" "hello-random" {
  length = 8

  # this means that the random string
  # will not contain special characters
  special = false
}

# Output variable that shows the value
# of the random string
output "random_string" {
  value = random_string.hello-random.result
}

# Local file to understand terraform local resource creation
resource "local_file" "hello-file" {
  # The expression assigned to content needs to be on one line
  content  = "This is a terraform-created file with a random name: ${random_string.hello-random.result}"
  # The expression asssigned to filename needs to be on one line
  filename = "${random_string.hello-random.result}.txt"
}