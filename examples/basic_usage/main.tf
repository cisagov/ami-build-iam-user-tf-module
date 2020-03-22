# Default AWS provider (ProvisionAccount for the Users account)
provider "aws" {
  region  = "us-east-1"
  profile = "cool-users-provisionaccount"
}

# ProvisionEC2AMICreateRoles AWS provider for the Images (Production) account
provider "aws" {
  region  = "us-east-1"
  profile = "cool-images-production-provisionec2amicreateroles"
  alias   = "images-production-ami"
}

# ProvisionEC2AMICreateRoles AWS provider for the Images (Staging) account
provider "aws" {
  region  = "us-east-1"
  profile = "cool-images-staging-provisionec2amicreateroles"
  alias   = "images-staging-ami"
}

# ProvisionParameterStoreReadRoles AWS provider for the
# Images (Production) account
provider "aws" {
  region  = "us-east-1"
  profile = "cool-images-production-provisionparameterstorereadroles"
  alias   = "images-production-ssm"
}

# ProvisionParameterStoreReadRoles AWS provider for the
# Images (Staging) account
provider "aws" {
  region  = "us-east-1"
  profile = "cool-images-staging-provisionparameterstorereadroles"
  alias   = "images-staging-ssm"
}

module "iam_user_with_ssm_read" {
  source = "../.."

  providers = {
    aws                       = aws
    aws.images-production-ami = aws.images-production-ami
    aws.images-staging-ami    = aws.images-staging-ami
    aws.images-production-ssm = aws.images-production-ssm
    aws.images-staging-ssm    = aws.images-staging-ssm
  }

  ssm_parameters = ["/example/parameter1", "/example/config"]
  user_name      = "test-ami-build-iam-user-tf-module"

  tags = {
    Team        = "VM Fusion - Development"
    Application = "ami-build-iam-user-tf-module testing"
  }
}
