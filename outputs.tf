output "access_key" {
  value       = aws_iam_access_key.key
  description = "The IAM access key associated with the IAM user created by this module."
  sensitive   = true
}

output "ec2amicreate_role_production" {
  value       = aws_iam_role.ec2amicreate_role_production
  description = "The IAM role that allows creation of AMIs in Production by the IAM user created by this module."
}

output "ec2amicreate_role_staging" {
  value       = aws_iam_role.ec2amicreate_role_staging
  description = "The IAM role that allows creation of AMIs in Staging by the IAM user created by this module."
}

output "user" {
  value       = aws_iam_user.user
  description = "The IAM user created by this module."
}
