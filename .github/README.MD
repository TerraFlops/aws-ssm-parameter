# Terraflops Terraform Module
 
### AWS SSM Parameter

This module can be used to create one or more SSM parameters

#### Example usage

```hcl-terraform
# Create string parmeters
module "application_ssm_parameters" {
  for_each = {
    "/Application/Env/APP_DEBUG" = "true"
    "/Application/Env/APP_ENV" = "dev"
    "/Application/Env/CORS_ALLOW_ORIGIN" = "*"
    "/Application/Env/DB_DATABASE" = "example"
    "/Application/Env/DB_HOST" = "database.example.com"
    "/Application/Env/DB_PORT" = "3306"
    "/Application/Env/DB_USERNAME" = "application_user"
  }
  source = "git::https://github.com/TerraFlops/aws-ssm-parameter?ref=v1.0"
  secure = false
  name = each.key
  value = each.value
}

# Create SecureString parameters
module "application_ssm_parameters_secure" {
  for_each = {
    "/Application/Env/DB_PASSWORD" = random_password.database_application_password.result
  }
  source = "git::https://github.com/TerraFlops/aws-ssm-parameter.git?ref=v1.0"
  secure = true
  name = each.key
  value = each.value
}

# Create random password for application database
resource "random_password" "database_application_password" {
  length = 32
  special = false
}
```
