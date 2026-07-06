###############################################################
# S3 Bucket
###############################################################

resource "aws_s3_bucket" "portfolio_bucket" {

  bucket = var.bucket_name

  tags = var.common_tags

}

###############################################################
# Bucket Ownership Controls
###############################################################

resource "aws_s3_bucket_ownership_controls" "portfolio" {

  bucket = aws_s3_bucket.portfolio_bucket.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

###############################################################
# Block Public Access
###############################################################

resource "aws_s3_bucket_public_access_block" "portfolio" {

  bucket = aws_s3_bucket.portfolio_bucket.id

  block_public_acls       = true

  block_public_policy     = true

  ignore_public_acls      = true

  restrict_public_buckets = true

}

###############################################################
# Bucket Versioning
###############################################################

resource "aws_s3_bucket_versioning" "portfolio" {

  bucket = aws_s3_bucket.portfolio_bucket.id

  versioning_configuration {

    status = "Enabled"

  }

}