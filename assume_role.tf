# IAM policy document that allows assumption of the AMI creation role
data "aws_iam_policy_document" "assume_ec2amicreate_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    effect = "Allow"

    resources = [
      aws_iam_role.ec2amicreate.arn,
    ]
  }
}

# The IAM policy that allows assumption of the AMI creation role
resource "aws_iam_user_policy" "assume_ec2amicreate_role" {
  name   = "Assume${aws_iam_role.ec2amicreate.name}"
  policy = data.aws_iam_policy_document.assume_ec2amicreate_role_doc.json
  user   = aws_iam_user.build.name
}
