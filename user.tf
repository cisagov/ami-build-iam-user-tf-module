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

  role_description = local.ec2amicreate_role_description
  role_max_session_duration = var.ec2amicreate_role_max_session_duration
  role_name        = local.ec2amicreate_role_name
  user_name        = var.user_name
  tags             = var.tags
}
