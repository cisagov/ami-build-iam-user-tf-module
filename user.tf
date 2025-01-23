# ------------------------------------------------------------------------------
# Create an IAM user and an associated access key
# ------------------------------------------------------------------------------

# The IAM user being created
# TODO: Revert to using cisagov/ci-iam-user-tf-module after it has been updated
# to create single-environment IAM users.  For details, see:
# https://github.com/cisagov/ami-build-iam-user-tf-module/issues/63
resource "aws_iam_user" "build" {
  provider = aws

  name = var.user_name
}

# The IAM access key for the user
resource "aws_iam_access_key" "build" {
  provider = aws

  user = aws_iam_user.build.name
}
