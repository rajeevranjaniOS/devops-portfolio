###############################################################
# Outputs
###############################################################

output "cloudfront_domain_name" {

  description = "CloudFront Domain Name"

  value = aws_cloudfront_distribution.portfolio_distribution.domain_name

}

output "distribution_id" {

  description = "CloudFront Distribution ID"

  value = aws_cloudfront_distribution.portfolio_distribution.id

}