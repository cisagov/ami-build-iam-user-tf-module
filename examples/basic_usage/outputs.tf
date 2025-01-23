output "access_key" {
  description = "The IAM access key for the test-ami-build-iam-user-tf-module user."
  sensitive   = true
  value       = module.iam_user_with_ssm_read.access_key
}

output "ec2amicreate_role" {
  description = "The IAM role that allows creation of AMIs by the test-ami-build-iam-user-tf-module user."
  value       = module.iam_user_with_ssm_read.ec2amicreate_role
}

output "user" {
  description = "The test-ami-build-iam-user-tf-module IAM user."
  value       = module.iam_user_with_ssm_read.user
}
