# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "ssm_parameters" {
  type        = list(string)
  description = "The AWS SSM parameters that the IAM user needs to be able to read (e.g. [\"/example/parameter1\", \"/example/config\"])."
}

variable "user_name" {
  type        = string
  description = "The name to associate with the AWS IAM user (e.g. test-ami-build-iam-user-tf-module)."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "ec2amicreate_policy_name" {
  type        = string
  description = "The name of the IAM policy in the Images account that allows all of the actions needed to create an AMI."
  default     = "EC2AMICreate"
}

variable "ec2amicreate_role_description" {
  type        = string
  description = "The description to associate with the IAM role that allows this IAM user to create AMIs.  Note that a \"%s\" in this value will get replaced with the user_name variable."
  default     = "Allows the %s IAM user to create AMIs."
}

variable "ec2amicreate_role_name" {
  type        = string
  description = "The name to assign the IAM role that allows allows this IAM user to create AMIs.  Note that a \"%s\" in this value will get replaced with the user_name variable."
  default     = "EC2AMICreate-%s"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
