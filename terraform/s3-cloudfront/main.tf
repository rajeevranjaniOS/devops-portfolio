###############################################################
# S3 Module
###############################################################

module "s3" {

  source = "../modules/s3"

  bucket_name = var.bucket_name

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

}