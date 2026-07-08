###############################################################
# Local Values
###############################################################

locals {

  common_tags = {

    Project = var.project_name

    Environment = var.environment

    ManagedBy = "Terraform"

    Owner = "Rajeev Ranjan"

  }
  sns_topic_name = "${var.project_name}-${var.environment}-alerts"

  dashboard_name = "${var.project_name}-dashboard"

  alarm_4xx_name = "${var.project_name}-${var.environment}-4xx-alarm"

  alarm_5xx_name = "${var.project_name}-${var.environment}-5xx-alarm"

  web_acl_name = "${var.project_name}-${var.environment}-web-acl"

  ec2_role_name = "${var.project_name}-${var.environment}-ec2-role"

  policy_name = "${var.project_name}-${var.environment}-s3-readonly-policy"

}