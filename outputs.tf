output "access_key" {
  description = "The IAM access key associated with the IAM user created by this module."
  sensitive   = true
  value       = aws_iam_access_key.build
}

output "ec2amicreate_role" {
  description = "The IAM role that the CI user can assume to create AMIs."
  value       = aws_iam_role.ec2amicreate
}

output "user" {
  description = "The IAM user created by this module."
  value       = aws_iam_user.build
}
