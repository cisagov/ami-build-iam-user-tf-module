# Create an AWS IAM user capable of building AMIs #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

## Requirements ##

No requirements.

## Providers ##

No provider.

## Inputs ##

No input.

## Outputs ##

| Name | Description |
|------|-------------|
| access_key | The IAM access key for the test-ami-build-iam-user-tf-module user. |
| ec2amicreate_role_production | The IAM role that allows creation of AMIs in Production by the test-ami-build-iam-user-tf-module user. |
| ec2amicreate_role_staging | The IAM role that allows creation of AMIs in Staging by the test-ami-build-iam-user-tf-module user. |
| user | The test-ami-build-iam-user-tf-module IAM user. |
