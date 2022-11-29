output "GROUP_NAME_LIST" {
  description = "The group list for using as reference when associating an user to a group with Terraform"
  value = aws_cognito_user_group.this[*].name
}
