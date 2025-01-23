# Attach the EC2AMICreate policy to the EC2AMICreate role
resource "aws_iam_role_policy_attachment" "ec2amicreate_policy_attachment" {
  provider = aws.images-ami

  policy_arn = "arn:aws:iam::${local.images_account_id}:policy/${var.ec2amicreate_policy_name}"
  role       = aws_iam_role.ec2amicreate.name
}

# Attach the ParameterStoreReadOnly policy to the EC2AMICreate role
resource "aws_iam_role_policy_attachment" "parameterstorereadonly_policy_attachment" {
  count    = local.create_parameterstorereadonly_role_resources
  provider = aws.images-ami

  policy_arn = module.parameterstorereadonly_role[0].policy.arn
  role       = aws_iam_role.ec2amicreate.name
}
