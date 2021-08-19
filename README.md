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
}
```

## Examples ##

- [Basic usage](https://github.com/cisagov/ami-build-iam-user-tf-module/tree/develop/examples/basic_usage)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.images-production-ami | ~> 3.38 |
| aws.images-staging-ami | ~> 3.38 |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| ci\_user | github.com/cisagov/ci-iam-user-tf-module |  |
| parameterstorereadonly\_role\_production | github.com/cisagov/ssm-read-role-tf-module |  |
| parameterstorereadonly\_role\_staging | github.com/cisagov/ssm-read-role-tf-module |  |

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_role_policy_attachment.additional_policy_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.additional_policy_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2amicreate_policy_attachment_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2amicreate_policy_attachment_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.parameterstorereadonly_policy_attachment_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.parameterstorereadonly_policy_attachment_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.images_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.images_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_policy\_arns\_production | The list of additional Production IAM policy ARNs to attach to this IAM user (e.g. ["arn:aws:iam::123456789012:policy/ReadFromMyBucket", "arn:aws:iam::123456789012:policy/ReadFromMyOtherBucket"]). | `list(string)` | `[]` | no |
| additional\_policy\_arns\_staging | The list of additional Staging IAM policy ARNs to attach to this IAM user (e.g. ["arn:aws:iam::123456789012:policy/ReadFromMyBucket", "arn:aws:iam::123456789012:policy/ReadFromMyOtherBucket"]). | `list(string)` | `[]` | no |
| ec2amicreate\_policy\_name | The name of the IAM policy in the Images account that allows all of the actions needed to create an AMI. | `string` | `"EC2AMICreate"` | no |
| ec2amicreate\_role\_description | The description to associate with the IAM role that allows this IAM user to create AMIs.  Note that a "%s" in this value will get replaced with the user\_name variable. | `string` | `"Allows the %s IAM user to create AMIs."` | no |
| ec2amicreate\_role\_max\_session\_duration | The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to create AMIs. | `number` | `3600` | no |
| ec2amicreate\_role\_name | The name to assign the IAM role that allows allows this IAM user to create AMIs.  Note that a "%s" in this value will get replaced with the user\_name variable. | `string` | `"EC2AMICreate-%s"` | no |
| ssm\_parameters | The AWS SSM parameters that the IAM user needs to be able to read (e.g. ["/example/parameter1", "/example/config"]). | `list(string)` | n/a | yes |
| user\_name | The name to associate with the AWS IAM user (e.g. test-ami-build-iam-user-tf-module). | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| access\_key | The IAM access key associated with the IAM user created by this module. |
| ec2amicreate\_role\_production | The IAM role that the CI user can assume in the production account to create AMIs. |
| ec2amicreate\_role\_staging | The IAM role that the CI user can assume in the staging account to create AMIs. |
| user | The IAM user created by this module. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
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
