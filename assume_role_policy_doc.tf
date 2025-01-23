# ------------------------------------------------------------------------------
# Create an IAM policy document that allows any user to assume the role with
# which this policy is associated.  The user must still be given permission to
# assume this role in the Users account.
#
# We do not restrict the users who can assume this role to only the AMI builder
# IAM user to allow admin users to assume this role for debugging and testing.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    principals {
      identifiers = [
        data.aws_caller_identity.users.account_id,
      ]
      type = "AWS"
    }
  }
}
