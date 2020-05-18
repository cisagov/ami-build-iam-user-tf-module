output "access_key" {
  value       = module.ci_user.access_key
  description = "The IAM access key associated with the IAM user created by this module."
  sensitive   = true
}

output "ec2amicreate_role_production" {
  value       = module.ci_user.production_role
  description = "The IAM role that the CI user can assume in the production account to create AMIs."
}

output "ec2amicreate_role_staging" {
  value       = module.ci_user.staging_role
  description = "The IAM role that the CI user can assume in the staging account to create AMIs."
}

output "user" {
  value       = module.ci_user.user
  description = "The IAM user created by this module."
}
