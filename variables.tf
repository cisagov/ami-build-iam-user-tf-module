# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "user_name" {
  description = "The name to associate with the AWS IAM user (e.g. test-ami-build-iam-user-tf-module)."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "additional_policy_arns" {
  default     = []
  description = "The list of additional IAM policy ARNs to attach to this IAM user (e.g. [\"arn:aws:iam::123456789012:policy/ReadFromMyBucket\", \"arn:aws:iam::123456789012:policy/ReadFromMyOtherBucket\"])."
  nullable    = false
  type        = list(string)
}

variable "ec2amicreate_policy_name" {
  default     = "EC2AMICreate"
  description = "The name of the IAM policy in the Images account that allows all of the actions needed to create an AMI."
  nullable    = false
  type        = string
}

variable "ec2amicreate_role_description" {
  default     = "Allows the %s IAM user to create AMIs."
  description = "The description to associate with the IAM role that allows this IAM user to create AMIs.  Note that a \"%s\" in this value will get replaced with the user_name variable."
  nullable    = false
  type        = string
}

variable "ec2amicreate_role_max_session_duration" {
  default     = 3600
  description = "The maximum session duration (in seconds) when assuming the IAM role that allows this IAM user to create AMIs."
  nullable    = false
  type        = number
}

variable "ec2amicreate_role_name" {
  default     = "EC2AMICreate-%s"
  description = "The name to assign the IAM role that allows this IAM user to create AMIs.  Note that a \"%s\" in this value will get replaced with the user_name variable."
  nullable    = false
  type        = string
}

variable "ec2amicreate_role_tags" {
  default = {
    "GitHub_Secret_Name"             = "BUILD_ROLE_TO_ASSUME",
    "GitHub_Secret_Terraform_Lookup" = "arn",
  }
  description = "Extra tags to apply to the IAM role that allows this IAM user to create AMIs."
  nullable    = false
  type        = map(string)
}

variable "ssm_parameters" {
  default     = []
  description = "The AWS SSM parameters that the IAM user needs to be able to read (e.g. [\"/example/parameter1\", \"/example/config\"])."
  nullable    = false
  type        = list(string)
}
