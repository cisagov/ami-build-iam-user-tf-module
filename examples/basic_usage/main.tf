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

# ProvisionEC2AMICreateRoles AWS provider for the Images account
provider "aws" {
  alias = "images-ami"
  default_tags {
    tags = local.tags
  }
  profile = "cool-images-provisionec2amicreateroles"
  region  = "us-east-1"
}

# ProvisionParameterStoreReadRoles AWS provider for the Images account
provider "aws" {
  alias = "images-ssm"
  default_tags {
    tags = local.tags
  }
  profile = "cool-images-provisionparameterstorereadroles"
  region  = "us-east-1"
}

module "iam_user_with_ssm_read" {
  source = "../.."

  providers = {
    aws            = aws
    aws.images-ami = aws.images-ami
    aws.images-ssm = aws.images-ssm
  }

  ssm_parameters = ["/example/parameter1", "/example/config"]
  user_name      = "test-ami-build-iam-user-tf-module"
}
