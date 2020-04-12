output "access_key" {
  value       = module.iam_user_with_ssm_read.access_key
  description = "The IAM access key for the test-ami-build-iam-user-tf-module user."
  sensitive   = true
}

output "ec2amicreate_role_production" {
  value       = module.iam_user_with_ssm_read.ec2amicreate_role_production
  description = "The IAM role that allows creation of AMIs in Production by the test-ami-build-iam-user-tf-module user."
}

output "ec2amicreate_role_staging" {
  value       = module.iam_user_with_ssm_read.ec2amicreate_role_staging
  description = "The IAM role that allows creation of AMIs in Staging by the test-ami-build-iam-user-tf-module user."
}

output "user" {
  value       = module.iam_user_with_ssm_read.user
  description = "The test-ami-build-iam-user-tf-module IAM user."
}
