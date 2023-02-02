# ------------------------------------------------------------------------------
# Create the IAM roles and policies that allow read-only access
# to the specified SSM Parameter Store parameters in the
# Images accounts (Production and Staging).
# ------------------------------------------------------------------------------

module "parameterstorereadonly_role_production" {
  source = "github.com/cisagov/ssm-read-role-tf-module"
  count  = local.create_parameterstorereadonly_role_resources

  providers = {
    aws = aws.images-production-ssm
  }

  account_ids   = [local.users_account_id]
  entity_name   = module.ci_user.user.name
  iam_usernames = [module.ci_user.user.name]
  ssm_names     = var.ssm_parameters
}

module "parameterstorereadonly_role_staging" {
  source = "github.com/cisagov/ssm-read-role-tf-module"
  count  = local.create_parameterstorereadonly_role_resources

  providers = {
    aws = aws.images-staging-ssm
  }

  account_ids   = [local.users_account_id]
  entity_name   = module.ci_user.user.name
  iam_usernames = [module.ci_user.user.name]
  ssm_names     = var.ssm_parameters
}
