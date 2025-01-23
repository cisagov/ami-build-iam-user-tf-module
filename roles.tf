# The AMI creation role
resource "aws_iam_role" "ec2amicreate" {
  provider = aws.images-ami

  assume_role_policy   = data.aws_iam_policy_document.assume_role_doc.json
  description          = local.ec2amicreate_role_description
  max_session_duration = var.ec2amicreate_role_max_session_duration
  name                 = local.ec2amicreate_role_name
  tags                 = var.ec2amicreate_role_tags
}
