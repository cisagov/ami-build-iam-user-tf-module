# This is the default provider that is used to create resources inside
# the Users account
provider "aws" {
}

# This is the provider that is used to create the policy that can
# create AMIs inside the Images Production account
provider "aws" {
  alias = "images-production-ami"
}

# This is the provider that is used to create the policy that can
# create AMIs inside the Images Staging account
provider "aws" {
  alias = "images-staging-ami"
}

# This is the provider that is used to create the role and policy that can
# read Parameter Store parameters inside the Images Production account
provider "aws" {
  alias = "images-production-ssm"
}

# This is the provider that is used to create the role and policy that can
# read Parameter Store parameters inside the Images Staging account
provider "aws" {
  alias = "images-staging-ssm"
}
