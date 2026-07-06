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