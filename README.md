# ami-build-iam-user-tf-module #

[![GitHub Build Status](https://github.com/cisagov/ami-build-iam-user-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/ami-build-iam-user-tf-module/actions)

A Terraform module for creating an IAM user suitable for building
Amazon Machine Images (AMIs).

## Usage ##

```hcl
module "example" {
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
```

## Examples ##

* [Create an AWS IAM user capable of building AMIs](https://github.com/cisagov/ami-build-iam-user-tf-module/tree/develop/examples/default_vpc)

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| additional_policy_arns_production | The list of additional Production IAM policy ARNs to attach to this IAM user (e.g. ["arn:aws:iam::111111111111:policy/ReadFromMyBucket", "arn:aws:iam::111111111111:policy/ReadFromMyOtherBucket"]). | list(string) | `[]` | no |
| additional_policy_arns_staging | The list of additional Staging IAM policy ARNs to attach to this IAM user (e.g. ["arn:aws:iam::222222222222:policy/ReadFromMyBucket", "arn:aws:iam::222222222222:policy/ReadFromMyOtherBucket"]). | list(string) | `[]` | no |
| ec2amicreate_policy_name | The name of the IAM policy in the Images account that allows all of the actions needed to create an AMI. | string | `EC2AMICreate` | no |
| ec2amicreate_role_description | The description to associate with the IAM role that allows this IAM user to create AMIs.  Note that a "%s" in this value will get replaced with the user_name variable. | string | `Allows the %s IAM user to create AMIs` | no |
| ec2amicreate_role_max_session_duration | The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to create AMIs. | number | `3600` | no |
| ec2amicreate_role_name | The name to assign the IAM role that allows allows this IAM user to create AMIs.  Note that a "%s" in this value will get replaced with the user_name variable. | string | `EC2AMICreate-%s` | no |
| ssm_parameters | The AWS SSM parameters that the IAM user needs to be able to read (e.g. ["/example/parameter1", "/example/config/*"]). | list(string) | | yes |
| user_name | The name to associate with the AWS IAM user (e.g. test-molecule-iam-user-tf-module) | string | | yes |
| tags | Tags to apply to all AWS resources created | map(string) | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| access_key | The IAM access key associated with the IAM user created by this module. |
| user | The IAM user created by this module. |

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
