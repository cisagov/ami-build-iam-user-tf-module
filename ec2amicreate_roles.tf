# ------------------------------------------------------------------------------
# Create the IAM role that allows creation of AMIs and read-only
# access to any specified SSM Parameter Store parameters in the
# Images accounts (Production and Staging).
# ------------------------------------------------------------------------------

# The Production role
resource "aws_iam_role" "ec2amicreate_role_production" {
  provider = aws.images-production-ami

  assume_role_policy   = data.aws_iam_policy_document.assume_role_doc.json
  description          = local.ec2amicreate_role_description
  max_session_duration = var.ec2amicreate_role_max_session_duration
  name                 = local.ec2amicreate_role_name
  tags = merge(var.tags,
    {
      "GitHub_Secret_Name"             = "BUILD_ROLE_TO_ASSUME_PRODUCTION",
      "GitHub_Secret_Terraform_Lookup" = "arn"
    }
  )
}

# Attach the Production EC2AMICreate policy to the Production EC2AMICreate role
resource "aws_iam_role_policy_attachment" "ec2amicreate_policy_attachment_production" {
  provider = aws.images-production-ami

  policy_arn = "arn:aws:iam::${local.images_production_account_id}:policy/${var.ec2amicreate_policy_name}"
  role       = aws_iam_role.ec2amicreate_role_production.name
}

# Attach the Production ParameterStoreReadOnly policy
# to the Production EC2AMICreate role
resource "aws_iam_role_policy_attachment" "parameterstorereadonly_policy_attachment_production" {
  provider = aws.images-production-ami

  policy_arn = module.parameterstorereadonly_role_production.policy.arn
  role       = aws_iam_role.ec2amicreate_role_production.name
}

# The Staging role
resource "aws_iam_role" "ec2amicreate_role_staging" {
  provider = aws.images-staging-ami

  assume_role_policy   = data.aws_iam_policy_document.assume_role_doc.json
  description          = local.ec2amicreate_role_description
  max_session_duration = var.ec2amicreate_role_max_session_duration
  name                 = local.ec2amicreate_role_name
  tags = merge(var.tags,
    {
      "GitHub_Secret_Name"             = "BUILD_ROLE_TO_ASSUME_STAGING",
      "GitHub_Secret_Terraform_Lookup" = "arn"
    }
  )
}

# Attach the Staging EC2AMICreate policy to the Staging EC2AMICreate role
resource "aws_iam_role_policy_attachment" "ec2amicreate_policy_attachment_staging" {
  provider = aws.images-staging-ami

  policy_arn = "arn:aws:iam::${local.images_staging_account_id}:policy/${var.ec2amicreate_policy_name}"
  role       = aws_iam_role.ec2amicreate_role_staging.name
}

# Attach the Staging ParameterStoreReadOnly policy
# to the Staging EC2AMICreate role
resource "aws_iam_role_policy_attachment" "parameterstorereadonly_policy_attachment_staging" {
  provider = aws.images-staging-ami

  policy_arn = module.parameterstorereadonly_role_staging.policy.arn
  role       = aws_iam_role.ec2amicreate_role_staging.name
}
