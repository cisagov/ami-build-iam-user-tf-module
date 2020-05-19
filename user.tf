# ------------------------------------------------------------------------------
# Create an IAM user and an associated access key
# ------------------------------------------------------------------------------

module "ci_user" {
  source = "github.com/cisagov/ci-iam-user-tf-module"

  providers = {
    aws            = aws
    aws.production = aws.images-production-ami
    aws.staging    = aws.images-staging-ami
  }

  production_role_tags = {
    "GitHub_Secret_Name"             = "BUILD_ROLE_TO_ASSUME_PRODUCTION",
    "GitHub_Secret_Terraform_Lookup" = "arn",
  }
  role_description          = local.ec2amicreate_role_description
  role_max_session_duration = var.ec2amicreate_role_max_session_duration
  role_name                 = local.ec2amicreate_role_name
  staging_role_tags = {
    "GitHub_Secret_Name"             = "BUILD_ROLE_TO_ASSUME_STAGING",
    "GitHub_Secret_Terraform_Lookup" = "arn",
  }
  user_name = var.user_name
  tags      = var.tags
}
