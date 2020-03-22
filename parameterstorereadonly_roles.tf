# ------------------------------------------------------------------------------
# Create the IAM roles and policies that allow read-only access
# to the specified SSM Parameter Store parameters in the
# Images accounts (Production and Staging).
# ------------------------------------------------------------------------------

module "parameterstorereadonly_role_production" {
  source = "github.com/cisagov/ssm-read-role-tf-module"

  providers = {
    aws = aws.images-production-ssm
  }

  account_ids  = [local.users_account_id]
  iam_username = var.user_name
  ssm_names    = var.ssm_parameters
  user         = var.user_name
}

module "parameterstorereadonly_role_staging" {
  source = "github.com/cisagov/ssm-read-role-tf-module"

  providers = {
    aws = aws.images-staging-ssm
  }

  account_ids  = [local.users_account_id]
  iam_username = var.user_name
  ssm_names    = var.ssm_parameters
  user         = var.user_name
}
