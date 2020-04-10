# ------------------------------------------------------------------------------
# Attach additional policies to the IAM role that allows creation of AMIs and
# read-only access to any specified SSM Parameter Store parameters in the
# Images accounts (Production and Staging).
# ------------------------------------------------------------------------------

# Attach additional policies to the Production EC2AMICreate role
resource "aws_iam_role_policy_attachment" "additional_policy_production" {
  for_each = toset(var.additional_policy_arns_production)

  provider = aws.images-production-ami

  policy_arn = each.value
  role       = aws_iam_role.ec2amicreate_role_production.name
}

# Attach additional policies to the Staging EC2AMICreate role
resource "aws_iam_role_policy_attachment" "additional_policy_staging" {
  for_each = toset(var.additional_policy_arns_staging)

  provider = aws.images-staging-ami

  policy_arn = each.value
  role       = aws_iam_role.ec2amicreate_role_staging.name
}
