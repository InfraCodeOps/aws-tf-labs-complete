resource "aws_iam_user" "users" {
  for_each = { for user in local.userinfo : user.email => user }
  name = each.value.name
}

output "user_names" {
  value = values(aws_iam_user.users)[*].id
}