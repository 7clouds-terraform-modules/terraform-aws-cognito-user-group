output "GROUP_NAME_LIST" {
  description = "The group list for using as reference when associating an user to a group. Example for using it correctly as an output 'module.asYouAreCallingThisModule.GROUP_NAME_LIST[0]'"
  value = aws_cognito_user_group.this[*].name
}
