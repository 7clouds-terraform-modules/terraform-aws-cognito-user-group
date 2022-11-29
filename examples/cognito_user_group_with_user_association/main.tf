# Just for example
resource "aws_cognito_user_pool" "pool" {
  name = "mypool"
}

module "cognito_user" {
  source = "https://github.com/7clouds-terraform-modules/terraform-aws-cognito-user-and-group-association.git"

  USER_POOL_ID = aws_cognito_user_pool.pool.id
  USER_NAME = "your_username_here"
  USER_PASSWORD = "yourpasswordhere"
  ASSOCIATE_USER_TO_GROUP = true
  GROUP_NAME = module.aws_cognito_user_group.GROUP_NAME_LIST[0] #It would get "admin" for example
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

