# ------------------------------------------------------------------------------
# Create an IAM policy document that allows the user created by this module
# to assume the role that this policy is associated with.
# ------------------------------------------------------------------------------

# Policy allowing role to be assumed by this user
data "aws_iam_policy_document" "assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    principals {
      type = "AWS"
      identifiers = [
        aws_iam_user.user.arn
      ]
    }
  }
}
