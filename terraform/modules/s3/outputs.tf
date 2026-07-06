###############################################################
# Outputs
###############################################################

output "bucket_id" {

  value = aws_s3_bucket.portfolio_bucket.id

}

output "bucket_arn" {

  value = aws_s3_bucket.portfolio_bucket.arn

}

output "bucket_name" {

  value = aws_s3_bucket.portfolio_bucket.bucket

}

output "bucket_regional_domain_name" {

  value = aws_s3_bucket.portfolio_bucket.bucket_regional_domain_name

}