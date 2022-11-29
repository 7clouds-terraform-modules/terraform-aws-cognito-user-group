# Cognito User Group Module by 7Clouds

Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%! Check it out at <https://seventechnologies.cloud>

Please rank this repo 5 starts if you like our job!

## Usage

This module deploys cognito user groups and outputs them as a list to be used as reference when you need to associate users to it with terraform. It requires an existing cognito user pool at least, the resource needs it's ID. All other attributes are within a list variable and may be considered dynamic, including the 'role_arn'.

For more information about cognito's user groups role arn, you may check on [AWS Documentation](https://docs.aws.amazon.com/cognito/latest/developerguide/role-based-access-control.html)

Considering our module's main, it's important to use the variable 'USER_GROUP_ATTRIBUTES_LIST' as follows:

```hcl
  USER_GROUP_ATTRIBUTES_LIST = [
    {
        name         = "Place your group name here" # required
        description  = "Place your description here" # might be null
        precedence   = Must be number or null 
        role_arn     = "Place your role arn for this group here" # might be null
    }  
  ]
```

## Example

```hcl
module "cognito_user" {
  source = "./"

  USER_POOL_ID = "your_user_pool_id_here"
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
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_user_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_USER_GROUP_ATTRIBUTES_LIST"></a> [USER\_GROUP\_ATTRIBUTES\_LIST](#input\_USER\_GROUP\_ATTRIBUTES\_LIST) | Attributes list for each cognito user group resource | `list(any)` | n/a | yes |
| <a name="input_USER_POOL_ID"></a> [USER\_POOL\_ID](#input\_USER\_POOL\_ID) | A list with the User Pool Id's | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_GROUP_NAME_LIST"></a> [GROUP\_NAME\_LIST](#output\_GROUP\_NAME\_LIST) | The group list for using as reference when associating an user to a group with Terraform |
<!-- END_TF_DOCS -->