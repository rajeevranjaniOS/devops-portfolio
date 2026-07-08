###############################################################
# S3 Module
###############################################################

module "s3" {

  source = "../modules/s3"

  bucket_name = var.bucket_name

  common_tags = local.common_tags

}

module "iam" {

  source = "../modules/iam"

  role_name = local.ec2_role_name

  policy_name = local.policy_name

  bucket_arn = module.s3.bucket_arn

  common_tags = local.common_tags

}

###############################################################
# WAF Module
###############################################################

module "waf" {

  source = "../modules/waf"

  providers = {

    aws = aws.use1

  }

  web_acl_name = local.web_acl_name


  common_tags = local.common_tags

}


###############################################################
# CloudFront Module
###############################################################

module "cloudfront" {

  source = "../modules/cloudfront"

  project_name = var.project_name

  common_tags = local.common_tags

  bucket_id = module.s3.bucket_id

  bucket_arn = module.s3.bucket_arn

  bucket_regional_domain_name = module.s3.bucket_regional_domain_name

  web_acl_arn = module.waf.web_acl_arn

}
###############################################################
# SNS Module
###############################################################

module "sns" {

  source = "../modules/sns"

  providers = {

    aws = aws.use1

  }

  topic_name = local.sns_topic_name

  email_endpoint = var.alert_email

  common_tags = local.common_tags

}
###############################################################
# CloudWatch Module
###############################################################

module "cloudwatch" {

  source = "../modules/cloudwatch"

  providers = {

    aws = aws.use1

  }

  dashboard_name = local.dashboard_name

  distribution_id = module.cloudfront.distribution_id

  sns_topic_arn = module.sns.topic_arn

  alarm_4xx_name = local.alarm_4xx_name

  alarm_5xx_name = local.alarm_5xx_name

}
