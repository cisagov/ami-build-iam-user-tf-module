# ------------------------------------------------------------------------------
# Create the IAM role and policy that allow read-only access to the specified
# SSM Parameter Store parameters in the Images account.
# ------------------------------------------------------------------------------

module "parameterstorereadonly_role" {
  source = "github.com/cisagov/ssm-read-role-tf-module"
  count  = local.create_parameterstorereadonly_role_resources

  providers = {
    aws = aws.images-ssm
  }

  account_ids   = [local.users_account_id]
  entity_name   = aws_iam_user.build.name
  iam_usernames = [aws_iam_user.build.name]
  ssm_names     = var.ssm_parameters
}
