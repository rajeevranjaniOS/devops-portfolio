###############################################################
# IAM Role Name
###############################################################

output "role_name" {

  description = "IAM Role Name"

  value = aws_iam_role.portfolio_ec2_role.name

}

###############################################################
# IAM Role ARN
###############################################################

output "role_arn" {

  description = "IAM Role ARN"

  value = aws_iam_role.portfolio_ec2_role.arn

}

###############################################################
# IAM Policy ARN
###############################################################

output "policy_arn" {

  description = "IAM Policy ARN"

  value = aws_iam_policy.portfolio_s3_readonly.arn

}

###############################################################
# Instance Profile Name
###############################################################

output "instance_profile_name" {

  description = "IAM Instance Profile Name"

  value = aws_iam_instance_profile.portfolio.name

}