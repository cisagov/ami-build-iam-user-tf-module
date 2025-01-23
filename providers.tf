# This is the provider that is used to create the policy that can
# create AMIs inside the Images account.
provider "aws" {
  alias = "images-ami"
}

# This is the provider that is used to create the role and policy that
# can read Parameter Store parameters inside the Images account.
provider "aws" {
  alias = "images-ssm"
}
