# REQUIRED
variable "USER_POOL_ID" {
  description = "A list with the User Pool Id's"
  type = string
}

variable "USER_GROUP_ATTRIBUTES_LIST" {
  description = "Attributes list for each cognito user group resource"
  type = list(any)
}
