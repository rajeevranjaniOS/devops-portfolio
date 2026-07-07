###############################################################
# Outputs
###############################################################

output "bucket_name" {

  description = "S3 Bucket Name"

  value = module.s3.bucket_name

}

output "cloudfront_domain_name" {

  description = "CloudFront URL"

  value = module.cloudfront.cloudfront_domain_name

}
###############################################################
# CloudWatch Outputs
###############################################################

output "dashboard_name" {

  value = module.cloudwatch.dashboard_name

}

output "alarm_4xx_name" {

  value = module.cloudwatch.alarm_4xx_name

}

output "alarm_5xx_name" {

  value = module.cloudwatch.alarm_5xx_name

}
output "distribution_id" {

  description = "CloudFront Distribution ID"

  value = module.cloudfront.distribution_id
}