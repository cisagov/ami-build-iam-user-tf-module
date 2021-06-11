locals {
  tags = {
    Team        = "VM Fusion - Development"
    Application = "ami-build-iam-user-tf-module testing"
  }
}

# Default AWS provider (ProvisionAccount for the Users account)
provider "aws" {
  default_tags {
    tags = local.tags
  }
  profile = "cool-users-provisionaccount"
  region  = "us-east-1"
}

# ProvisionEC2AMICreateRoles AWS provider for the Images (Production) account
provider "aws" {
  alias = "images-production-ami"
  default_tags {
    tags = local.tags
  }
  profile = "cool-images-production-provisionec2amicreateroles"
  region  = "us-east-1"
}

# ProvisionEC2AMICreateRoles AWS provider for the Images (Staging) account
provider "aws" {
  alias = "images-staging-ami"
  default_tags {
    tags = local.tags
  }
  profile = "cool-images-staging-provisionec2amicreateroles"
  region  = "us-east-1"
}

# ProvisionParameterStoreReadRoles AWS provider for the
# Images (Production) account
provider "aws" {
  alias = "images-production-ssm"
  default_tags {
    tags = local.tags
  }
  profile = "cool-images-production-provisionparameterstorereadroles"
  region  = "us-east-1"
}

# ProvisionParameterStoreReadRoles AWS provider for the
# Images (Staging) account
provider "aws" {
  alias = "images-staging-ssm"
  default_tags {
    tags = local.tags
  }
  profile = "cool-images-staging-provisionparameterstorereadroles"
  region  = "us-east-1"
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
}
