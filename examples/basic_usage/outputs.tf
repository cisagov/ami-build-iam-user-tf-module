output "access_key" {
  value       = module.iam_user_with_ssm_read.access_key
  description = "The IAM access key for the test-ami-build-iam-user-tf-module user."
  sensitive   = true
}

output "user" {
  value       = module.iam_user_with_ssm_read.user
  description = "The test-ami-build-iam-user-tf-module IAM user."
}
