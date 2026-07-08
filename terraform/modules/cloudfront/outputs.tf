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
output "distribution_arn" {

  description = "CloudFront Distribution ARN"

  value = aws_cloudfront_distribution.portfolio_distribution.arn

}