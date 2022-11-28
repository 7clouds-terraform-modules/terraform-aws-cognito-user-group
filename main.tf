resource "aws_cognito_user_group" "this" {
  count = length(var.USER_GROUP_ATTRIBUTES_LIST)
  name         = lookup(element(var.USER_GROUP_ATTRIBUTES_LIST, count.index), "name")
  user_pool_id = var.USER_POOL_ID
  description  = lookup(element(var.USER_GROUP_ATTRIBUTES_LIST, count.index), "description")
  precedence   = lookup(element(var.USER_GROUP_ATTRIBUTES_LIST, count.index), "precedence")
  role_arn     = lookup(element(var.USER_GROUP_ATTRIBUTES_LIST, count.index), "role_arn")
}
