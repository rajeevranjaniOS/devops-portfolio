###############################################################
# Resource Moves
###############################################################

moved {

  from = aws_s3_bucket.portfolio_bucket

  to = module.s3.aws_s3_bucket.portfolio_bucket

}

moved {

  from = aws_s3_bucket_ownership_controls.portfolio

  to = module.s3.aws_s3_bucket_ownership_controls.portfolio

}

moved {

  from = aws_s3_bucket_public_access_block.portfolio

  to = module.s3.aws_s3_bucket_public_access_block.portfolio

}

moved {

  from = aws_s3_bucket_versioning.portfolio

  to = module.s3.aws_s3_bucket_versioning.portfolio

}

###############################################################
# CloudFront Resource Moves
###############################################################

moved {

  from = aws_cloudfront_origin_access_control.portfolio_oac

  to = module.cloudfront.aws_cloudfront_origin_access_control.portfolio_oac

}

moved {

  from = aws_cloudfront_distribution.portfolio_distribution

  to = module.cloudfront.aws_cloudfront_distribution.portfolio_distribution

}

moved {

  from = aws_s3_bucket_policy.portfolio_policy

  to = module.cloudfront.aws_s3_bucket_policy.portfolio_policy

}