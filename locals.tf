# Get the default caller identity, which corresponds to the Users account.
# This is needed to determine the Users account ID.
data "aws_caller_identity" "users" {
}

data "aws_caller_identity" "images_production" {
  provider = aws.images-production-ami
}

data "aws_caller_identity" "images_staging" {
  provider = aws.images-staging-ami
}

locals {
  # Toggle whether or not to create the parameterstorereadonly_role resources
  # based on whether or not the ssm_parameters variable is populated.
  create_parameterstorereadonly_role_resources = (length(var.ssm_parameters) > 0) ? 1 : 0

  # If var.ec2amicreate_role_description contains "%s", use format()
  # to replace the "%s" with var.user_name, otherwise just use
  # var.ec2amicreate_role_description as is
  ec2amicreate_role_description = length(regexall(".*%s.*", var.ec2amicreate_role_description)) > 0 ? format(var.ec2amicreate_role_description, var.user_name) : var.ec2amicreate_role_description

  # If var.ec2amicreate_role_name contains "%s", use format()
  # to replace the "%s" with var.user_name, otherwise just use
  # var.ec2amicreate_role_name as is
  ec2amicreate_role_name = length(regexall(".*%s.*", var.ec2amicreate_role_name)) > 0 ? format(var.ec2amicreate_role_name, var.user_name) : var.ec2amicreate_role_name

  # Grab all of the necessary account IDs
  images_production_account_id = data.aws_caller_identity.images_production.account_id

  images_staging_account_id = data.aws_caller_identity.images_staging.account_id

  users_account_id = data.aws_caller_identity.users.account_id
}
