# Just for example
resource "aws_cognito_user_pool" "pool" {
  name = "mypool"
}


module "cognito_user" {
  source = "../.."

  USER_POOL_ID = aws_cognito_user_pool.pool.id
  USER_GROUP_ATTRIBUTES_LIST = [
    {
        name         = "admin"
        description  = "test"
        precedence   = 0
        role_arn     = null
    },
    {
        name         = "write"
        description  = "test"
        precedence   = 1
        role_arn     = null
    },
    {
        name         = "read"
        description  = "test"
        precedence   = 2
        role_arn     = null
    }    
  ]
}
