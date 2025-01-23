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
    aws.images-ami = aws.images-ami
    aws.images-ssm = aws.images-ssm
  }

  ssm_parameters = ["/example/parameter1", "/example/config"]
  user_name      = "test-ami-build-iam-user-tf-module"
}
```

## Examples ##

- [Basic usage](https://github.com/cisagov/ami-build-iam-user-tf-module/tree/develop/examples/basic_usage)

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | >= 1.1 |
| aws | >= 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | >= 4.9 |
| aws.images-ami | >= 4.9 |
| aws.images-ssm | >= 4.9 |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| parameterstorereadonly\_role | github.com/cisagov/ssm-read-role-tf-module | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_access_key.build](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_role.ec2amicreate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ec2amicreate_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.parameterstorereadonly_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.build](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.assume_ec2amicreate_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_caller_identity.images](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_ec2amicreate_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_policy\_arns | The list of additional IAM policy ARNs to attach to this IAM user (e.g. ["arn:aws:iam::123456789012:policy/ReadFromMyBucket", "arn:aws:iam::123456789012:policy/ReadFromMyOtherBucket"]). | `list(string)` | `[]` | no |
| ec2amicreate\_policy\_name | The name of the IAM policy in the Images account that allows all of the actions needed to create an AMI. | `string` | `"EC2AMICreate"` | no |
| ec2amicreate\_role\_description | The description to associate with the IAM role that allows this IAM user to create AMIs.  Note that a "%s" in this value will get replaced with the user\_name variable. | `string` | `"Allows the %s IAM user to create AMIs."` | no |
| ec2amicreate\_role\_max\_session\_duration | The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to create AMIs. | `number` | `3600` | no |
| ec2amicreate\_role\_name | The name to assign the IAM role that allows this IAM user to create AMIs.  Note that a "%s" in this value will get replaced with the user\_name variable. | `string` | `"EC2AMICreate-%s"` | no |
| ec2amicreate\_role\_tags | Extra tags to apply to the IAM role that allows this IAM user to create AMIs. | `map(string)` | ```{ "GitHub_Secret_Name": "BUILD_ROLE_TO_ASSUME", "GitHub_Secret_Terraform_Lookup": "arn" }``` | no |
| ssm\_parameters | The AWS SSM parameters that the IAM user needs to be able to read (e.g. ["/example/parameter1", "/example/config"]). | `list(string)` | `[]` | no |
| user\_name | The name to associate with the AWS IAM user (e.g. test-ami-build-iam-user-tf-module). | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| access\_key | The IAM access key associated with the IAM user created by this module. |
| ec2amicreate\_role | The IAM role that the CI user can assume to create AMIs. |
| user | The IAM user created by this module. |
<!-- END_TF_DOCS -->

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
