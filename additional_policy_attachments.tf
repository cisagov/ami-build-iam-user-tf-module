# ------------------------------------------------------------------------------
# Attach additional policies to the IAM role that allows creation of
# AMIs and read-only access to any specified SSM Parameter Store
# parameters in the Images account.
# ------------------------------------------------------------------------------

# Attach additional policies to the EC2AMICreate role
resource "aws_iam_role_policy_attachment" "additional_policy" {
  for_each = toset(var.additional_policy_arns)

  provider = aws.images-ami

  policy_arn = each.value
  role       = aws_iam_role.ec2amicreate.name
}
