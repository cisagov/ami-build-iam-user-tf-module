# IAM policy document that allows assumption of the EC2AMICreate
# role in the Images accounts (Production and Staging) for this user
data "aws_iam_policy_document" "assume_ec2amicreate_role_doc" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      aws_iam_role.ec2amicreate_role_production.arn,
      aws_iam_role.ec2amicreate_role_staging.arn
    ]
  }
}

# The IAM policy allowing this user to assume their custom
# EC2AMICreate role in the Images accounts (Production and Staging)
resource "aws_iam_user_policy" "assume_parameterstorereadonly" {
  name   = "Images-Assume${aws_iam_role.ec2amicreate_role_production.name}"
  user   = aws_iam_user.user.name
  policy = data.aws_iam_policy_document.assume_ec2amicreate_role_doc.json
}
