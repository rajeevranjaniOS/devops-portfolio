###############################################################
# Outputs
###############################################################

output "bucket_name" {

  description = "S3 Bucket Name"

  value = aws_s3_bucket.portfolio_bucket.bucket

}

output "cloudfront_domain_name" {

  description = "CloudFront URL"

  value = aws_cloudfront_distribution.portfolio_distribution.domain_name

}