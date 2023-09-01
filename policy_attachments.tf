# Attach the Production EC2AMICreate policy to the Production
# EC2AMICreate role
resource "aws_iam_role_policy_attachment" "ec2amicreate_policy_attachment_production" {
  provider = aws.images-production-ami

  policy_arn = "arn:aws:iam::${local.images_production_account_id}:policy/${var.ec2amicreate_policy_name}"
  role       = module.ci_user.production_role.name
}

# Attach the Production ParameterStoreReadOnly policy to the
# Production EC2AMICreate role
resource "aws_iam_role_policy_attachment" "parameterstorereadonly_policy_attachment_production" {
  count    = local.create_parameterstorereadonly_role_resources
  provider = aws.images-production-ami

  policy_arn = module.parameterstorereadonly_role_production[0].policy.arn
  role       = module.ci_user.production_role.name
}

# Attach the Staging EC2AMICreate policy to the Staging EC2AMICreate
# role
resource "aws_iam_role_policy_attachment" "ec2amicreate_policy_attachment_staging" {
  provider = aws.images-staging-ami

  policy_arn = "arn:aws:iam::${local.images_staging_account_id}:policy/${var.ec2amicreate_policy_name}"
  role       = module.ci_user.staging_role.name
}

# Attach the Staging ParameterStoreReadOnly policy to the Staging
# EC2AMICreate role
resource "aws_iam_role_policy_attachment" "parameterstorereadonly_policy_attachment_staging" {
  count    = local.create_parameterstorereadonly_role_resources
  provider = aws.images-staging-ami

  policy_arn = module.parameterstorereadonly_role_staging[0].policy.arn
  role       = module.ci_user.staging_role.name
}
